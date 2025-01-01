repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
spawn(function()
while true do wait(300)
Messages = "buy nick at sokiimarket ⊙ com"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Messages, "All")
end
end)
-- Buyer Perm key KAITUN
script_key = "R2C2TNM7XKIJTGEM433O77X27TR4V7X26DF35KNXXI"
getgenv().Configs = {
    ["Team"] = "Pirates",
    ["Gun Farm"] = false, -- Fast farm level, BUT FARMING MELEE VERY SLOW GODHUMAN
    ["FPS Boost"] = {
        ["Enable"] = false,
        ["FPS Cap"] = 15, --FPS u want 
    },
    ["Farm Boss Drops"] = {
        ["Enable"] = false,
        ["When x2 Exp Expired"] = false
    },
    ["Hop Player Near"] = false,
    ["Skull Guitar"] = false, -- Farm SG Last
    ["Find Fruit"] = true, -- Will find 1m+ fruit to UNLOCK SWAN DOOR TO ACCESS THIRD SEA
    ["Cursed Dual Katana"] = false --Farm CDK First
}
repeat task.wait(6) pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/verudous/Xero-Hub/refs/heads/main/kaitun.lua"))()end) until getgenv().Check_Execute
