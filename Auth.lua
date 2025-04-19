local HttpService = game:GetService("HttpService")
local inputKey = "your-input-key"  -- The key entered by the user
local keyList = HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/doxxox/Colo/main/keys.json"))

if keyList[inputKey] == game.Players.LocalPlayer.UserId then
    -- Allow access, load the main script from GitHub
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURUSERNAME/RiotLoader/main/Script.lua"))()
else
    -- Deny access
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Unauthorized",
        Text = "Invalid key or HWID.",
        Duration = 5
    })
end
