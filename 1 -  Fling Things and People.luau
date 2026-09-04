--[[\
    LUNX CHEATS - open source
]]--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local guiParent = (gethui and gethui()) or CoreGui

if guiParent:FindFirstChild("LUNX_NoticeGui") then
    guiParent.LUNX_NoticeGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LUNX_NoticeGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 220)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(60, 60, 75)
uiStroke.Thickness = 1.5
uiStroke.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -30, 0, 40)
titleLabel.Position = UDim2.new(0, 15, 0, 12)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = ""
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

local descLabel = Instance.new("TextLabel")
descLabel.Name = "DescLabel"
descLabel.Size = UDim2.new(1, -30, 0, 140)
descLabel.Position = UDim2.new(0, 15, 0, 55)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.Text = ""
descLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
descLabel.TextSize = 14
descLabel.TextWrapped = true
descLabel.TextXAlignment = Enum.TextXAlignment.Left
descLabel.TextYAlignment = Enum.TextYAlignment.Top
descLabel.Parent = mainFrame

local currentStage = 0
local connection

local function showFirstScreen()
    currentStage = 1
    titleLabel.Text = "Information"
    descLabel.Text = "This script/cheat has been moved to another location. You can find it by joining our Discord server.\n\n[Press the Enter key to copy our Discord link and exit this information screen]"
end

local function showSecondScreen()
    currentStage = 2
    
    titleLabel.Text = "Important Notice"
    descLabel.Text = "You need to stay active in our Discord server by chatting and following the rules. If you don't keep our Discord server active, you might be accidentally kicked as a bot, so be careful.\n\nAlso, a <u>KEY system</u> will be added soon, so make sure to stay in our Discord server accordingly."
    descLabel.RichText = true
    
    task.delay(10, function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
        if connection then
            connection:Disconnect()
        end
    end)
end

local function playIntro()
    currentStage = 0
    titleLabel.Text = ""
    descLabel.Text = ""
    
    local introLabel = Instance.new("TextLabel")
    introLabel.Size = UDim2.new(1, 0, 1, 0)
    introLabel.BackgroundTransparency = 1
    introLabel.Font = Enum.Font.GothamBold
    introLabel.Text = "LUNX"
    introLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    introLabel.TextSize = 48
    introLabel.TextXAlignment = Enum.TextXAlignment.Center
    introLabel.TextYAlignment = Enum.TextYAlignment.Center
    introLabel.Parent = mainFrame
    
    task.delay(2, function()
        if introLabel and introLabel.Parent then
            introLabel:Destroy()
        end
        showFirstScreen()
    end)
end

connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
        if currentStage == 1 then
            if setclipboard then
                setclipboard("discord.gg/aUGb8NzvAV")
            end
            
            showSecondScreen()
        end
    end
end)

playIntro()
