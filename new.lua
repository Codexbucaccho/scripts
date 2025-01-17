repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local checkRadius = 100
local positionCheckDelay = 180
local checkDelay = 10
local lastPosition = nil
local timeStuck = 0

-- Tự động gửi tin nhắn chat
spawn(function()
    while true do 
        task.wait(300)
        local Messages = "buy nick at sokiimarket ⊙ com"
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Messages, "All")
    end
end)

return -- End.

local function hopToServer()
    local success = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local response = HttpService:JSONDecode(game:HttpGet(url))
        local bestServer = nil
        for _, server in ipairs(response.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                if not bestServer or server.playing < bestServer.playing then
                    bestServer = server
                end
            end
        end
        if bestServer then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, bestServer.id, LocalPlayer)
        else
            TeleportService:Teleport(game.PlaceId)
        end
    end)
    if not success then
        TeleportService:Teleport(game.PlaceId)
    end
end

local function isNearPlayer()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = player.Character.HumanoidRootPart.Position
            local myPosition = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position
            if myPosition and (playerPosition - myPosition).Magnitude <= checkRadius then
                return true
            end
        end
    end
    return false
end

-- Kiểm tra kẹt vị trí
local function checkStuck()
    local myPosition = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position
    if myPosition then
        if lastPosition and (myPosition - lastPosition).Magnitude < 1 then
            timeStuck = timeStuck + checkDelay
            if timeStuck >= positionCheckDelay then
                hopToServer()
            end
        else
            timeStuck = 0
        end
        lastPosition = myPosition
    end
end

-- Vòng lặp chính
while true do
    -- Nếu phát hiện người chơi gần, đổi server
    if isNearPlayer() then
        task.wait(math.random(60, 120)) -- Chờ ngẫu nhiên 60-120 giây
        hopToServer()
        break
    end

    -- Kiểm tra kẹt vị trí
    checkStuck()
    task.wait(checkDelay)
end
