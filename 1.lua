script_key = "UWO3LF4Y5KCJHMVW433O77X2ZLR7L5XF67F35KNXXI"
getgenv().Shutdown = true -- shutdown server it fail hop
getgenv().Configs = {
    ["Team"] = "Pirates",
    ["Gun Farm"] = false, -- get Banned Fast Farm level
    ["FPS Boost"] = {
        ["Enable"] = true, -- tween?
        ["FPS Cap"] = 15, --FPS  recommend 15-20
    },
    ["Farm Boss Drops"] = {
        ["Enable"] = false,
        ["When x2 Exp Expired"] = false
    },
    ["Hop Player Near"] = false,
    ["Skull Guitar"] = false, -- Farm SG First
    ["Find Fruit"] = true, -- Will find 1m+ fruit BUT HOP GAME broken idk why
    ["Cursed Dual Katana"] = false, --  Finish  cdk
    ["Switch Melee"] = true, -- that farm all mastery idk why him add shjt
    ["Eat Fruit"] = "Magma-Magma", -- leave blank for none, put the fruit name like this example: Smoke Fruit, T-Rex Fruit, ...
    ["Lock Fragment"] = 20000, --idk why it put number >0 then broken
    ["Buy Stuffs"] = true -- buso, geppo, soru, ken haki
}
repeat task.wait(1) pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/verudous/Xero-Hub/refs/heads/main/kaitun.lua"))()end) until getgenv().Check_Execute
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Codexbucaccho/scripts/refs/heads/main/new.lua"))()
