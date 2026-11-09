--[[
	당구 통합 도우미 — WindUI 연동
	Core: preview + auto (pasted)
	UI: https://github.com/Footagesus/WindUI/releases/latest/download/main.lua
]]

local env = getgenv()
if env.BilliardsSuite then env.BilliardsSuite.Stop() end

-- ─── WindUI ───────────────────────────────────────────────────
local urls = {
	ilikedisui = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
}

local WindUI
do
	local ok, lib = pcall(function()
		return loadstring(game:HttpGet(urls.ilikedisui))()
	end)
	if ok and type(lib) == "table" and type(lib.CreateWindow) == "function" then
		WindUI = lib
	end
end
if not WindUI then
	error("[당구 도우미] WindUI 로드 실패")
end

-- ─── Preview ─────────────────────────────────────────────────
local function startPreview()
	local env = getgenv()
	if env.BilliardsPath then env.BilliardsPath.Stop() end

	local modules = game:GetService("ReplicatedStorage"):WaitForChild("Billiards", 10)
	assert(modules, "당구 모듈을 찾지 못했습니다.")

	local preview = require(modules:WaitForChild("ShotPreview", 10))
	local geometry = require(modules:WaitForChild("TableGeometry", 10))
	local guides = require(modules:WaitForChild("GuideLines", 10))
	local originalShow = guides.Show
	local showWrapper
	local original = preview.Predict
	assert(type(original) == "function", "예상 경로 API가 변경되었습니다.")

	local runService = game:GetService("RunService")
	local folder = Instance.new("Folder")
	folder.Name = "BilliardsPathFolder"
	folder.Parent = workspace

	local state = {Enabled = true, Calls = 0, Segments = 0, Error = nil, HoldUntil = 0}
	local pool = {}
	local targetTransforms = {}
	local lastCall = 0
	local lastBuild = -math.huge
	local alive = true
	local busy = false
	local wrapper
	local heartbeat

	local function getBallColor(index, isPool, totalBalls)
		if isPool then
			if index == 1 then return Color3.fromRGB(255, 255, 255) end
			local n = ((index - 2) % 8) + 1
			local poolColors = {
				Color3.fromRGB(255, 220, 0),
				Color3.fromRGB(30, 140, 255),
				Color3.fromRGB(230, 30, 50),
				Color3.fromRGB(140, 50, 220),
				Color3.fromRGB(255, 130, 0),
				Color3.fromRGB(40, 160, 90),
				Color3.fromRGB(140, 30, 30),
				Color3.fromRGB(20, 20, 20),
			}
			return poolColors[n] or Color3.fromRGB(255, 255, 255)
		else
			if totalBalls == 3 then
				if index == 1 then return Color3.fromRGB(255, 220, 0) end
				if index == 2 then return Color3.fromRGB(230, 30, 50) end
				return Color3.fromRGB(230, 30, 50)
			else
				if index == 1 then return Color3.fromRGB(255, 255, 255) end
				if index == 2 then return Color3.fromRGB(255, 220, 0) end
				if index == 3 then return Color3.fromRGB(230, 30, 50) end
				return Color3.fromRGB(230, 30, 50)
			end
		end
	end

	local function hide()
		for _, part in ipairs(pool) do
			part.Transparency = 1
		end
		state.Segments = 0
		targetTransforms = {}
	end

	local function segment(a, b, colour, count)
		local length = (b - a).Magnitude
		if length < 0.012 or count >= 1200 then
			return count
		end
		count = count + 1
		local part = pool[count]
		if not part then
			part = Instance.new("Part")
			part.Name = "PathPart"
			part.Anchored = true
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.CastShadow = false
			part.Parent = folder
			pool[count] = part
		end

		part.Material = Enum.Material.Neon
		part.Transparency = 0.03
		part.Size = Vector3.new(0.025, 0.025, length)

		local targetCFrame = CFrame.lookAt((a + b) / 2, b)
		targetTransforms[count] = targetCFrame
		if not part.Parent then
			part.CFrame = targetCFrame
		end

		part.Color = colour
		return count
	end

	local function findGeometry(config)
		local views = workspace:FindFirstChild("BilliardsView")
		if not views then return nil end
		local chosen, best = nil, nil
		local camera = workspace.CurrentCamera
		for _, part in ipairs(views:GetDescendants()) do
			if part.Name == "PlayArea" and part:IsA("BasePart") then
				local mismatch = math.abs(part.Size.X / config.VisualScale - config.Width)
					+ math.abs(part.Size.Z / config.VisualScale - config.Height)
				if mismatch < 0.03 then
					local distance = camera and (camera.Focus.Position - part.Position).Magnitude or 0
					if not best or distance < best then
						chosen, best = part, distance
					end
				end
			end
		end
		if not chosen then return nil end
		return geometry.Configure(table.clone(config), chosen)
	end

	local function build(physics, balls, cueIndex, direction, power, spinX, spinY, boost, isPoolMode)
		local config = physics.Config
		local geo = findGeometry(config)
		if not geo then
			hide()
			state.Error = "PlayArea not found"
			return
		end
		local copies, paths = {}, {}
		for i, ball in ipairs(balls) do
			copies[i] = table.clone(ball)
			paths[i] = {ball.p}
		end
		local cue = copies[cueIndex]
		if not cue or cue.pocketed then hide() return end
		local reach = physics.Reach and physics.Reach(copies, cueIndex, direction) or boost or 1
		physics.Strike(cue, direction, math.clamp(power, 0, 1), spinX, spinY, reach)

		local started = os.clock()
		local dt = config.Step * 0.35
		local steps = math.min(math.ceil(35 / dt), 3500)
		local simulated = 0

		for step = 1, steps do
			physics.Step(copies, dt)
			simulated = step * dt
			local moving = false
			for i, ball in ipairs(copies) do
				if not ball.pocketed then
					if step % 2 == 0 or step == steps then
						local path = paths[i]
						if (ball.p - path[#path]).Magnitude > 0.00015 then
							path[#path + 1] = ball.p
						end
					end
					if ball.v.Magnitude > 0.00005 or (physics.Slip and physics.Slip(ball).Magnitude > 0.00005) then
						moving = true
					end
				end
			end
			if not moving or os.clock() - started > 0.07 then
				for i, ball in ipairs(copies) do
					if not ball.pocketed then
						local path = paths[i]
						if (ball.p - path[#path]).Magnitude > 0.00015 then
							path[#path + 1] = ball.p
						end
					end
				end
				break
			end
		end

		local count = 0
		local totalBalls = #balls
		for pass = 1, 2 do
			for i, path in ipairs(paths) do
				if (pass == 1 and i == cueIndex) or (pass == 2 and i ~= cueIndex) then
					local colour = getBallColor(i, isPoolMode, totalBalls)
					for j = 2, #path do
						local lift = Vector3.new(0, 0.025, 0)
						count = segment(geo:World(path[j - 1]) + lift, geo:World(path[j]) + lift, colour, count)
					end
				end
			end
		end
		for i = count + 1, #pool do
			pool[i].Transparency = 1
			targetTransforms[i] = nil
		end
		state.Segments = count
		state.SimulatedSeconds = simulated
		state.Error = nil
	end

	wrapper = function(physics, balls, cueIndex, direction, power, spinX, spinY, ...)
		local result = original(physics, balls, cueIndex, direction, power, spinX, spinY, ...)
		if alive then
			lastCall = os.clock()
			state.Calls = state.Calls + 1
			if state.Enabled and not busy and lastCall >= state.HoldUntil and lastCall - lastBuild >= 0.01 then
				lastBuild = lastCall
				busy = true
				local _, selectedPower = ...
				local isPool = (cueIndex == 1 and #balls > 4)
				local ok, err = pcall(build, physics, balls, cueIndex, direction, selectedPower or power, spinX, spinY, nil, isPool)
				busy = false
				if not ok then
					hide()
					state.Error = tostring(err)
				end
			end
		end
		return result
	end

	function state.SetEnabled(value)
		state.Enabled = value == true
		if not state.Enabled then state.HoldUntil = 0 hide() end
	end

	function state.DrawPlan(physics, balls, cueIndex, plan, isPoolMode)
		if not alive or not state.Enabled then return false end
		local direction = Vector3.new(math.cos(plan.angle), 0, math.sin(plan.angle))
		local drawBalls = balls
		if plan.cue then
			drawBalls = table.clone(balls)
			drawBalls[1] = table.clone(balls[1])
			drawBalls[1].p = Vector3.new(plan.cue[1], 0, plan.cue[2])
			drawBalls[1].pocketed = nil
		end
		local ok, err = pcall(build, physics, drawBalls, cueIndex, direction, plan.power, plan.side, plan.top, plan.BreakBoost, isPoolMode)
		if not ok then state.Error = tostring(err) hide() return false end
		lastCall = os.clock()
		state.HoldUntil = lastCall + 1.2
		return true
	end

	function state.Stop()
		if not alive then return end
		alive = false
		if preview.Predict == wrapper then preview.Predict = original end
		if guides.Show == showWrapper then guides.Show = originalShow end
		if heartbeat then heartbeat:Disconnect() end
		folder:Destroy()
		if env.BilliardsPath == state then env.BilliardsPath = nil end
	end

	preview.Predict = wrapper
	showWrapper = function(self, ...)
		local shown = originalShow(self, ...)
		if alive and shown then
			lastCall = os.clock()
			if state.Enabled and state.OnPoolGuide and lastCall >= state.HoldUntil and lastCall - lastBuild >= 0.01 then
				lastBuild = lastCall
				local data = ...
				local ok, err = pcall(state.OnPoolGuide, data)
				if not ok then state.Error = tostring(err) end
			end
		end
		return shown
	end
	guides.Show = showWrapper

	heartbeat = runService.RenderStepped:Connect(function(dt)
		if not state.Enabled or (os.clock() > state.HoldUntil and os.clock() - lastCall > 0.4) then
			hide()
		else
			for i, part in ipairs(pool) do
				local target = targetTransforms[i]
				if target and part.Transparency < 1 then
					part.CFrame = part.CFrame:Lerp(target, math.clamp(dt * 90, 0.8, 1))
				end
			end
		end
	end)

	env.BilliardsPath = state
	return state
end

-- ─── Auto ────────────────────────────────────────────────────
local function startAuto(preview)
	local env = getgenv()
	local modules = game:GetService("ReplicatedStorage"):WaitForChild("Billiards", 10)
	assert(modules, "당구 모듈을 찾지 못했습니다.")
	local basePhysics = require(modules:WaitForChild("Physics", 10))
	local poolPhysics = require(modules:WaitForChild("PoolPhysics", 10))
	local cueMotion = require(modules:WaitForChild("CueMotion", 10))
	local geometry = require(modules:WaitForChild("TableGeometry", 10))
	local matchClass = require(modules:WaitForChild("Match", 10))

	if env.BilliardsAuto then env.BilliardsAuto.Stop() end
	local player = game:GetService("Players").LocalPlayer
	local runService = game:GetService("RunService")

	local state = {
		Enabled = false, Status = "대기 중", ShotsSent = 0,
		ShotsAccepted = 0, Error = nil, LastPlan = nil, Thinking = false,
		ThinkSeconds = 2.0, Level = 6, StrongPlay = true, SmoothCue = true,
		SmoothCuePreference = true, AimSeconds = 0.08, HumanThinking = false,
		Style = "maximum", StyleName = "Max",
	}

	local alive, generation = true, 0
	local remote, snapshot, listener, heartbeat
	local statusPara, modePara, statsPara
	state.Preview = preview
	state.Version = "2026_WINDUI"
	state.Standalone = true
	state.Window = nil

	local attempted, pending, plannedKey, readyAt
	local lastTick, lastSync = 0, -math.huge
	local tablePhysics, physicsRemote, physicsThree

	local function key(s)
		return table.concat({tostring(s.round), tostring(s.turnId), tostring(s.shots), tostring(s.turn)}, ":")
	end

	local function myTurn(s)
		if s.turnPlayerId ~= nil then return s.turnPlayerId == player.UserId end
		if s.doubles then return false end
		return s.seats and s.seats[s.turn] == player.UserId
	end

	local function ready(s)
		if not s or s.phase ~= "playing" or not myTurn(s) then return false end
		if s.LocalMoving or s.moving or s.striking or s.opening or s.openingWaiting or s.cleaning then return false end
		if s.winner ~= 0 or s.stale or not s.balls or not s.balls[s.PoolMode and 1 or s.turn] then return false end
		local now = workspace:GetServerTimeNow()
		return now >= (s.busyUntil or 0) and now + 0.05 < (s.turnDeadline or 0)
	end

	local function setParagraph(para, title, desc)
		if not para then return end
		pcall(function()
			if type(para.SetTitle) == "function" and title then para:SetTitle(title) end
			if type(para.SetDesc) == "function" and desc then para:SetDesc(desc)
			elseif type(para.SetDescription) == "function" and desc then para:SetDescription(desc) end
		end)
	end

	local function setStatus(text)
		if state.Status == text then return end
		state.Status = text
		setParagraph(statusPara, "상태", text)
	end

	local function physicsFor(s, selectedRemote)
		if s.PoolMode then return poolPhysics end
		local three = s.threeBall == true or (s.rules and s.rules.threeBall == true)
		if tablePhysics and physicsRemote == selectedRemote and physicsThree == three then return tablePhysics end
		local physical = selectedRemote:FindFirstChild("Table")
		physical = physical and physical.Value
		assert(physical, "Table not found")
		local size = physical:GetAttribute("TableSize")
		local viewName = three and size ~= "중대" and "DaedaeView" or "ViewTable"
		local views = workspace:FindFirstChild("BilliardsView")
		local view = views and views:FindFirstChild(viewName)
		local area = view and view:FindFirstChild("PlayArea", true)
		assert(area and area:IsA("BasePart"), "PlayArea not found")
		local physics = basePhysics.ForTable(three)
		geometry.Configure(physics.Config, area)
		tablePhysics, physicsRemote, physicsThree = physics, selectedRemote, three
		return physics
	end

	local function normalizePlanSpin(plan)
		plan.side = math.clamp(tonumber(plan.side) or 0, -0.65, 0.65)
		plan.top = math.clamp(tonumber(plan.top) or 0, -0.65, 0.65)
		local magnitude = math.sqrt(plan.side * plan.side + plan.top * plan.top)
		if magnitude > 0.65 then plan.side, plan.top = plan.side * 0.65 / magnitude, plan.top * 0.65 / magnitude end
		return plan
	end

	function state.BuildShotCandidates(s, selectedRemote)
		local list, seen = {}, {}
		local function add(p)
			if not p then return end
			local angle = math.atan2(math.sin(p.angle), math.cos(p.angle))
			local power = math.clamp(p.power, s.PoolMode and 0.05 or cueMotion.MinPower, 1)
			local side, top = math.clamp(p.side or 0, -0.65, 0.65), math.clamp(p.top or 0, -0.65, 0.65)
			local tag = string.format("%.5f:%.4f:%.3f:%.3f", angle, power, side, top)
			if seen[tag] then return end
			seen[tag] = true
			table.insert(list, {angle = angle, power = power, side = side, top = top, cue = p.cue})
		end

		local steps = 400
		for i = 0, steps - 1 do
			local angle = i * math.pi * 2 / steps
			for _, power in ipairs({0.2, 0.4, 0.6, 0.8, 1.0}) do
				for _, spin in ipairs({{0, 0}, {0.3, 0.3}, {-0.3, 0.3}, {0, 0.5}, {0, -0.5}}) do
					add({angle = angle, power = power, side = spin[1], top = spin[2]})
				end
			end
		end
		return list
	end

	function state.PlanSnapshot(s, selectedRemote, cancelled)
		assert(s and s.balls and s.turn, "No state")
		local started = os.clock()
		local deadline = started + state.ThinkSeconds
		local function hardCancel() return not alive or (cancelled and cancelled()) end
		local function exhausted() return hardCancel() or os.clock() >= deadline end

		local candidates = state.BuildShotCandidates(s, selectedRemote)
		local finalists = {}

		for _, shot in ipairs(candidates) do
			if exhausted() then break end
			if s.PoolMode then
				table.insert(finalists, {Plan = shot, Value = 1000 - shot.power})
			else
				local physics = physicsFor(s, selectedRemote)
				local test = matchClass.new(#s.balls == 3, physics)
				test.balls = {}
				for i, ball in ipairs(s.balls) do test.balls[i] = table.clone(ball) end
				test.turn = s.turn
				test.scores = {s.scores and s.scores[1] or 0, s.scores and s.scores[2] or 0}
				local scoreBefore = test.scores[s.turn]
				if test:Shoot(shot.angle, shot.power, shot.side, shot.top) then
					for _ = 1, 120 do
						test:Step(physics.Config.Step)
						if not test.moving then break end
					end
					shot.VerifiedScore = test.scores[s.turn] - scoreBefore
					shot.VerifiedFoul = test.shot and test.shot.foul == true or false
					if not shot.VerifiedFoul and shot.VerifiedScore >= 0 then
						table.insert(finalists, {Plan = shot, Value = (test.winner == s.turn and 500000 or 0) + shot.VerifiedScore * 8000})
					end
				end
			end
		end

		if hardCancel() or #finalists == 0 then return nil, "No valid shot" end
		table.sort(finalists, function(a, b) return a.Value > b.Value end)
		return finalists[1].Plan
	end

	local cueStandModule = require(modules:WaitForChild("CueStand", 10))
	local originalCueNew = cueStandModule.new
	local cueNewWrapper
	local cueRecords = {}

	local function attachCue(stand, config, pool)
		if type(stand) ~= "table" or type(stand.place) ~= "function" then return end
		local record = {Stand = stand, Config = config, Pool = pool, Original = stand.place}
		stand.place = function(seat, frame, hidden, ...)
			return record.Original(seat, frame, hidden, ...)
		end
		table.insert(cueRecords, record)
	end

	local function discoverCues()
		pcall(function()
			for _, signal in ipairs({runService.RenderStepped, runService.Heartbeat}) do
				for _, connection in ipairs(getconnections(signal)) do
					local fn = connection.Function
					if type(fn) == "function" then
						local ok, values = pcall(debug.getupvalues, fn)
						if ok then
							for _, value in pairs(values) do
								if type(value) == "table" then
									attachCue(value.stand or value, value.config, true)
								end
							end
						end
					end
				end
			end
		end)
	end

	cueNewWrapper = function(options, ...)
		local stand = originalCueNew(options, ...)
		attachCue(stand, nil, true)
		return stand
	end
	cueStandModule.new = cueNewWrapper
	discoverCues()

	function state.SetEnabled(value)
		if not alive then return end
		state.Enabled = value == true
		generation = generation + 1
		state.Error = nil
		if state.Enabled then plannedKey, readyAt = nil, nil end
		setStatus(state.Enabled and "자동 플레이 대기 중" or "자동 플레이 중지")
	end

	function state.Stop()
		if not alive then return end
		alive = false
		state.Enabled = false
		generation = generation + 1
		if listener then listener:Disconnect() end
		if heartbeat then heartbeat:Disconnect() end
		if cueStandModule.new == cueNewWrapper then cueStandModule.new = originalCueNew end
		if preview then preview.Stop() end
		if state.Window then
			pcall(function()
				if type(state.Window.Destroy) == "function" then state.Window:Destroy() end
			end)
		end
		if env.BilliardsAuto == state then env.BilliardsAuto = nil end
		if env.BilliardsSuite == state then env.BilliardsSuite = nil end
	end

	local function tick()
		if not alive or os.clock() - lastTick < 0.02 then return end
		lastTick = os.clock()
		local events = modules:FindFirstChild("TableEvents")
		local name = player:GetAttribute("BilliardsMatch")
		local poolEvents = modules:FindFirstChild("PocketBallEvents")
		local selectedRemote = type(name) == "string" and ((poolEvents and poolEvents:FindFirstChild(name)) or (events and events:FindFirstChild(name))) or nil

		if selectedRemote ~= remote then
			remote = selectedRemote
			if remote then
				if listener then listener:Disconnect() end
				listener = remote.OnClientEvent:Connect(function(kind, payload)
					if kind == "state" and type(payload) == "table" then
						snapshot = payload.slim and snapshot or payload
						state.Snapshot = snapshot
					end
				end)
				remote:FireServer("sync")
			end
		end

		if snapshot then
			local three = snapshot.threeBall == true or (snapshot.rules and snapshot.rules.threeBall == true)
			local mode = snapshot.PoolMode and "포켓볼(8볼)" or (three and "3구" or "4구")
			setParagraph(modePara, "모드", mode)
			setParagraph(statsPara, "통계", string.format("타격 %d · 경로 %d", state.ShotsSent, preview.Segments or 0))
		end

		if not state.Enabled or not snapshot or not ready(snapshot) then
			if state.Enabled and snapshot and snapshot.phase == "finished" then
				setStatus("경기 종료")
			elseif state.Enabled then
				setStatus("내 차례 · 공 정지 대기")
			end
			return
		end
		local shotKey = key(snapshot)
		if attempted == shotKey or plannedKey == shotKey or state.Thinking then return end

		plannedKey = shotKey
		state.Thinking = true
		setStatus("각도·힘·회전 계산 중")

		task.spawn(function()
			local ok, plan = pcall(state.PlanSnapshot, snapshot, remote, function() return not state.Enabled end)
			state.Thinking = false
			if not ok or not plan then
				setStatus(ok and "유효 타격 없음" or ("계산 오류"))
				return
			end

			state.LastPlan = plan
			if preview.Enabled then
				preview.DrawPlan(physicsFor(snapshot, remote), snapshot.balls, snapshot.PoolMode and 1 or snapshot.turn, plan, snapshot.PoolMode == true)
			end

			attempted = shotKey
			normalizePlanSpin(plan)
			remote:FireServer("shoot", {
				turnId = snapshot.turnId,
				angle = plan.angle,
				power = plan.power,
				side = plan.side,
				top = plan.top,
				cue = plan.cue,
				impactAt = workspace:GetServerTimeNow() + 0.02,
			})
			state.ShotsSent = state.ShotsSent + 1
			setStatus(string.format("타격 전송 %d회", state.ShotsSent))
		end)
	end

	-- ─── WindUI Window ────────────────────────────────────────
	local okUI, uiErr = pcall(function()
		local Window = WindUI:CreateWindow({
			Title = "당구 도우미",
			Icon = "target",
			Author = "포켓볼 · 3구 · 4구",
			Folder = "BilliardsSuite",
			Size = UDim2.fromOffset(520, 440),
			Theme = "Dark",
			Transparent = true,
			ToggleKey = Enum.KeyCode.RightControl,
			HideSearchBar = true,
		})
		state.Window = Window

		local Tab = Window:Tab({ Title = "메인", Icon = "house" })

		local info = Tab:Section({ Title = "상태", Opened = true })
		modePara = info:Paragraph({ Title = "모드", Desc = "경기 입장 대기" })
		statusPara = info:Paragraph({ Title = "상태", Desc = state.Status })
		statsPara = info:Paragraph({ Title = "통계", Desc = "타격 0 · 경로 0" })

		local play = Tab:Section({ Title = "플레이", Opened = true })
		play:Toggle({
			Title = "자동 플레이",
			Desc = "내 차례에 자동 타격",
			Value = false,
			Callback = function(v)
				state.SetEnabled(v == true)
			end,
		})
		play:Toggle({
			Title = "예상 경로 표시",
			Desc = "공 궤적 네온 경로",
			Value = true,
			Callback = function(v)
				preview.SetEnabled(v == true)
			end,
		})
		play:Slider({
			Title = "계산 시간",
			Desc = "ThinkSeconds",
			Value = state.ThinkSeconds,
			Min = 0.5,
			Max = 8,
			Step = 0.5,
			Callback = function(v)
				state.ThinkSeconds = tonumber(v) or state.ThinkSeconds
			end,
		})

		local tools = Tab:Section({ Title = "도구", Opened = true })
		tools:Button({
			Title = "경기 상태 동기화",
			Icon = "refresh-cw",
			Callback = function()
				if remote then
					lastSync = os.clock()
					remote:FireServer("sync")
					setStatus("동기화 요청")
					pcall(function()
						WindUI:Notify({ Title = "당구", Content = "sync 요청됨", Duration = 2 })
					end)
				else
					setStatus("경기 없음")
				end
			end,
		})
		tools:Button({
			Title = "완전히 종료",
			Icon = "power",
			Callback = function()
				state.Stop()
			end,
		})

		pcall(function()
			Window:OnDestroy(function()
				state.Stop()
			end)
		end)
	end)
	if not okUI then
		warn("[당구 도우미] WindUI 창 오류: " .. tostring(uiErr))
	end

	heartbeat = runService.RenderStepped:Connect(function()
		pcall(tick)
	end)

	env.BilliardsAuto = state
	env.BilliardsSuite = state
	setStatus("준비 완료 · 자동 플레이를 켜세요")
	print("당구 도우미 준비 완료 (WindUI)")
	return state
end

local preview = startPreview()
local ok, suite = pcall(startAuto, preview)
if not ok then
	preview.Stop()
	error(suite)
end
return suite
