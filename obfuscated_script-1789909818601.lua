local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Killer Stairs | MMP",
   LoadingTitle = "Killer Stairs Script",
   LoadingSubtitle = "by MMP",
   ShowText = "MMP",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateSection("Teleportation")

MainTab:CreateButton({
   Name = "Teleport",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       
       local killerTP = workspace:FindFirstChild("killerTP")
       if killerTP then
           character:MoveTo(killerTP.Position + Vector3.new(0, 3, 0))
           
           Rayfield:Notify({
               Title = "Notification",
               Content = "Teleported!",
               Duration = 3,
               Image = 4483362458,
           })
       end
   end,
})

MainTab:CreateSection("Speed Hack")

MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       local humanoid = character:FindFirstChildOfClass("Humanoid")
       
       if humanoid then
           humanoid.WalkSpeed = Value
       end
   end,
})

MainTab:CreateSection("Credits")
MainTab:CreateLabel("Script Made by MMP")

-- Local Player Tab
local LocalPlayerTab = Window:CreateTab("Player", 4483362458)

LocalPlayerTab:CreateSection("Emotes")

LocalPlayerTab:CreateButton({
   Name = "E Dance",
   Callback = function()
       local TextChatService = game:GetService("TextChatService")
       local ReplicatedStorage = game:GetService("ReplicatedStorage")
       
       -- Check for modern TextChatService
       if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
           local generalChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
           if generalChannel then
               generalChannel:SendAsync("/e dance")
           end
       else
           -- Fallback for legacy chat systems
           local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
           if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
               chatEvent.SayMessageRequest:FireServer("/e dance", "All")
           end
       end
   end,
})

-- Shortcut Tab
local ShortcutTab = Window:CreateTab("Shortcuts", 4483362458)

ShortcutTab:CreateSection("External Scripts & Utilities")

ShortcutTab:CreateButton({
   Name = "Open Infinite Yield",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
       
       Rayfield:Notify({
           Title = "Notification",
           Content = "Infinite Yield Loaded!",
           Duration = 3,
           Image = 4483362458,
       })
   end,
})

ShortcutTab:CreateButton({
   Name = " Open Mini Teleport Window",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()

       -- Prevent duplicate GUIs
       if player.PlayerGui:FindFirstChild("KillerStairGui") then
           player.PlayerGui.KillerStairGui:Destroy()
       end

       -- Create ScreenGui
       local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
       gui.Name = "KillerStairGui"
       gui.ResetOnSpawn = false

       -- Main frame
       local frame = Instance.new("Frame", gui)
       frame.Size = UDim2.new(0, 200, 0, 130)
       frame.Position = UDim2.new(0.5, -100, 0.4, 0)
       frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
       frame.BorderSizePixel = 0
       frame.Active = true
       frame.Draggable = true
       frame.ClipsDescendants = true

       -- UI corner
       local corner = Instance.new("UICorner", frame)
       corner.CornerRadius = UDim.new(0, 8)

       -- UI stroke
       local stroke = Instance.new("UIStroke", frame)
       stroke.Color = Color3.fromRGB(255, 255, 255)
       stroke.Thickness = 2

       -- Title label
       local title = Instance.new("TextLabel", frame)
       title.Size = UDim2.new(1, -60, 0, 40)
       title.Position = UDim2.new(0, 10, 0, 0)
       title.BackgroundTransparency = 1
       title.Text = "Killer Stairs"
       title.Font = Enum.Font.Arcade
       title.TextSize = 18
       title.TextColor3 = Color3.fromRGB(255, 255, 255)
       title.TextXAlignment = Enum.TextXAlignment.Left

       -- Container frame for body content
       local content = Instance.new("Frame", frame)
       content.Size = UDim2.new(1, 0, 1, -40)
       content.Position = UDim2.new(0, 0, 0, 40)
       content.BackgroundTransparency = 1

       -- Instant Win button
       local button = Instance.new("TextButton", content)
       button.Size = UDim2.new(0.8, 0, 0, 40)
       button.Position = UDim2.new(0.1, 0, 0.1, 0)
       button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
       button.Text = "Teleport"
       button.Font = Enum.Font.Arcade
       button.TextSize = 20
       button.TextColor3 = Color3.fromRGB(255, 255, 255)

       local btnCorner = Instance.new("UICorner", button)
       btnCorner.CornerRadius = UDim.new(0, 6)

       local btnStroke = Instance.new("UIStroke", button)
       btnStroke.Color = Color3.fromRGB(255, 255, 255)

       -- Credit
       local credit = Instance.new("TextLabel", content)
       credit.Size = UDim2.new(1, 0, 0, 20)
       credit.Position = UDim2.new(0, 0, 1, -20)
       credit.BackgroundTransparency = 1
       credit.Text = "Made by MMP"
       credit.Font = Enum.Font.Arcade
       credit.TextSize = 14
       credit.TextColor3 = Color3.fromRGB(255, 255, 255)

       -- Close Button
       local closeBtn = Instance.new("TextButton", frame)
       closeBtn.Size = UDim2.new(0, 25, 0, 25)
       closeBtn.Position = UDim2.new(1, -28, 0, 7)
       closeBtn.BackgroundTransparency = 1
       closeBtn.Text = "X"
       closeBtn.Font = Enum.Font.Arcade
       closeBtn.TextSize = 18
       closeBtn.TextColor3 = Color3.fromRGB(255, 70, 70)

       -- Minimize / Maximize Button
       local minimizeBtn = Instance.new("TextButton", frame)
       minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
       minimizeBtn.Position = UDim2.new(1, -50, 0, 7)
       minimizeBtn.BackgroundTransparency = 1
       minimizeBtn.Text = "-"
       minimizeBtn.Font = Enum.Font.Arcade
       minimizeBtn.TextSize = 22
       minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

       -- Functionality (Teleports without sending notification)
       button.MouseButton1Click:Connect(function()
           local killerTP = workspace:FindFirstChild("killerTP")
           if killerTP then
               character:MoveTo(killerTP.Position + Vector3.new(0, 3, 0))
           end
       end)

       closeBtn.MouseButton1Click:Connect(function()
           gui:Destroy()
       end)

       local isMinimized = false
       minimizeBtn.MouseButton1Click:Connect(function()
           isMinimized = not isMinimized
           if isMinimized then
               content.Visible = false
               frame.Size = UDim2.new(0, 200, 0, 40)
               minimizeBtn.Text = "+"
           else
               content.Visible = true
               frame.Size = UDim2.new(0, 200, 0, 130)
               minimizeBtn.Text = "-"
           end
       end)

       -- Rayfield notification when opening mini window
       Rayfield:Notify({
           Title = "Notification",
           Content = "Window Loaded!",
           Duration = 2,
           Image = 4483362458,
       })
   end,
})
