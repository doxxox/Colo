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
    "51e102c4ea27366eb77e0a7c59558e89",
    "a1fe04f49a0e06c125fa42fef3d2879b",
    "b8583bb6b4532bc5fc057109542557d1",
    "dc897376f50db849576d2d3eb1e44b0f",
    "674e431d22f29c2ca358517aaad6ad0e",
    "ab828ea0e29a330e2ff435b5c8c23a16",
    "244f7c7c44b0454f94087e2fc82d6b4e",
    "c0916583a8f09ac1b60b1b1a6d60c93c",
    "e590e9e11bc27c92b58a9cfb2a287533",
    "fe0cbe2e245a69494530f7633c4375a9",
    "08c9687078fe410ab22d345d64956d67",
    "54da5a8e2138a459c8c4a79944a28c50",
    "fb83db33b1f20a538b0b38d1d729e6e4",
    "7c599e1e85b0560a7da83a34f544f4e6",
    "3ca5a7776e72277f420ab58f20913a35",
    "e4e153b1997b3023ffecad828aeb9084",
    "95ad6825c0c3ad26d3579d06c01673e6",
    "91b5c97d85e2e5f0c022c8289b0d9689",
    "216ac312b54a564fa9b313e3b4742a96",
    "c46b831ebfe300338a30a7bb7dff6032",
    "db61c739d85b5955d687b9254c4761a8",
    "9ccf0e69a390dd39c1d660f604b1a4c2",
    "1c8570400ed8269b5f8a4d54c5cf5207",
    "afed7599f7c9ecad2b66f57bb0c3e8d3",
    "ab587be2577f6a84edbe0a6c77b75ab8",
    "29b6a8b4d9dfe8cd3d5f4d19c1a321e1",
    "2db5cbaf5cb71b013f6a8a167afdf6a9",
    "f1f5b877c4566f85e0cde7a3824f3a4a",
    "a3f572bc079b455d013f7d5f1df556e6",
    "76ed517ff177fe9c89a6ff9de2047dbd",
    "a4652183c88c857db0bb491aaf594bcf",
    "2b84e3154386b5d5e2a6ccf85d7b0a6f",
    "d4fbbf23046f0747031bc8019b381a7e",
    "762e8d1bb7a51bb97fe9d8e9f6b2a4f0",
    "c8d30613b8f03e0848e46316f07a0f65",
    "f96efde68e899167064f3b0ed3ad539b",
    "8bba0d237b74f33d2339a40e0c8758a7",
    "6b08e5f60392679f211b561cf1cc59d9",
    "35d21db98311b5fdd5f4e88da7998d91",
    "eab109fb4b63d9efaddbb4c6f5e9b99d",
    "47463b2c57e98bc7fbdba1fe07b60911",
    "c5ed9074d0f3f9989d450ae0ec255345",
    "6b0f1db201fbbd4c3760c9c89cd8cce2",
    "627d35718a0e3fc31c35da0f85e5a8f0",
    "defe329129c4397a42f410d23ff52dbe",
    "f88534e2bb4045b599d14f3e3c90f1c2",
    "f9bc0c167fb40577d8990d31b96da9d3",
    "8e9a98f03f18c12584f87e75a86a2649",
    "f2bc96855e4b6311c45dffb1d727f295",
    "f84c77b8f7407736d774de82397a53e9",
    "cbe75b56cb94a4cb4c5f957d72b94d30",
    "f622b1edc9112ff5a0f0295e8c76476c",
    "9172be43d4359b4bc79570ffbe262b44",
    "05324cc47ea62c6850345b59c45761fe",
    "c20f6c88f897542f45924472d74e5f9f",
    "f3b01d4b75d8d436705254f4735db0b4",
    "19e28b3cc992f96f06acfa16036fc000",
    "b573e1f3a625409fa3fe3fa87891e48d",
    "4c968c1d6aeea8c3be9fbcdbd03d1bb9",
    "8207cfb743f7bc5638c545ae039a8267",
    "2d8a3e9d8a1e2b78a2d6530f717d9677",
    "cfd19df62f22be9d1c59ea59f394b86e",
    "b22d322b16eaf75b2595e3ae731536a4",
    "3ffbed56a64cf7fa49d890e63c842a85",
    "d778fcb5289d93087055c5e4b7b3a156",
    "ab9937e4c31408ecf9acb07494bbcc1d",
    "5ef56d02160ed1ef5b10647a3147b564",
    "bd74ff72b4979119b7ff963038eb6bcf",
    "a036f357f87e2140a43fae0c22167c99"
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
