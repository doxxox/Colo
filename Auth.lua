local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local HttpService = game:GetService("HttpService")

-- Key System (Example Keys)
local validKeys = {
    "5f4dcc3b5aa765d61d8327deb882cf99",
    "e99a18c428cb38d5f260853678922e03",
    "ab56b4d92b40713acc5af89985d1f17b",
    "a6a8f4e9e2b7368c57df5c5df34678f3",
    "6a09cbf4b2568c7a2b8c8a450c8f2f72",
    "2b2b8356d2a5e6a8ac61eaa41011b89f",
    "e5b92f325c524bfe8b0f7b2e28e579f4",
    "be3d0e4a5f5a4409a69c2a4559fa1ef7",
    "783c634c8e3d1063d5d44e91b78b232d",
    "869212de084c1c8c2b0fa2349566a14a",
    "314e28f5ed6a3d8e3d02c301f13984a9",
    "9b8b3f7f5e585801ae26b4e9f4d06fe2",
    -- Add more valid keys as needed...
}

-- Store HWID (in reality, it would be encrypted or stored securely)
local hwidKey = HttpService:GenerateGUID(false) -- Unique identifier for the player's device
local storedHWID = ""  -- Replace with your method of storing the HWID on your server

-- UI Creation
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "Selfies"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 360, 0, 420)
frame.Position = UDim2.new(0, 30, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
frame.Name = "Selfies"
frame.ClipsDescendants = true

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "Selfies"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.GothamBlack
title.TextSize = 20

local uiCorner2 = Instance.new("UICorner", title)
uiCorner2.CornerRadius = UDim.new(0, 12)

-- Key Validation
local function askForKey()
    local userKey = game:GetService("GuiService"):PromptInput("Enter your admin key:", "", 16)
    return userKey
end

local function validateKey(key)
    for _, validKey in pairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

local function askForHWID()
    -- This function could be extended to compare against a stored HWID in your database
    -- For now, we simulate an HWID check.
    if hwidKey == storedHWID then
        return true
    end
    return false
end

local function unlockAdminPanel()
    local userKey = askForKey()
    if not validateKey(userKey) then
        warn("Invalid key!")
        return
    end

    if not askForHWID() then
        warn("HWID mismatch!")
        return
    end

    -- Proceed to show the admin panel if both checks pass
    print("Key and HWID validated successfully!")
    showAdminPanel()
end

-- Function to show the admin panel
local function showAdminPanel()
    local aimlockEnabled = false
    local espEnabled = false
    local speed = false

    -- Create Toggle Functions
    local function createToggle(name, order, callback)
        local toggle = Instance.new("TextButton", frame)
        toggle.Size = UDim2.new(1, -30, 0, 35)
        toggle.Position = UDim2.new(0, 15, 0, 60 + (order * 40))
        toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        toggle.TextColor3 = Color3.new(1, 1, 1)
        toggle.Font = Enum.Font.Gotham
        toggle.TextSize = 14
        toggle.Text = "☐ " .. name
        toggle.AutoButtonColor = false
        local toggled = false

        local uiCorner = Instance.new("UICorner", toggle)
        uiCorner.CornerRadius = UDim.new(0, 8)

        toggle.MouseButton1Click:Connect(function()
            toggled = not toggled
            toggle.Text = (toggled and "☑ " or "☐ ") .. name
            callback(toggled)
        end)
    end

    -- Aimlock Toggle
    createToggle("Aimlock (Hold)", 0, function(state)
        aimlockEnabled = state
    end)

    -- ESP Toggle
    createToggle("ESP", 1, function(state)
        espEnabled = state
    end)

    -- Speed Boost Toggle
    createToggle("Speed Boost", 2, function(state)
        speed = state
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = state and 50 or 16
        end
    end)
end

-- Call to unlock Admin Panel
unlockAdminPanel()

-- Credits
local credits = Instance.new("TextLabel", frame)
credits.Text = "Made by @godbleeds | Selfies"
credits.Position = UDim2.new(0.5, -100, 1, -25)
credits.Size = UDim2.new(0, 200, 0, 20)
credits.BackgroundTransparency = 1
credits.TextColor3 = Color3.fromRGB(150, 150, 150)
credits.Font = Enum.Font.Gotham
credits.TextSize = 12
credits.TextScaled = false
credits.TextXAlignment = Enum.TextXAlignment.Center
