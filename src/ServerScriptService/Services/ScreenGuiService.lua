local repStore = game:GetService("ReplicatedStorage")
local Knit = require(repStore.Packages.Knit)
local ScreenGuiService = Knit.CreateService( { Name="ScreenGuiService", Client = {
    TeleportUIChanged = Knit.CreateSignal() -- Create the signal batman
} } )

function ScreenGuiService:CreateTelportGui(player)
    local sg = Instance.new("ScreenGui")
    sg.Name = "TeleportGui"
    local fr = Instance.new("Frame")
    fr.Position = UDim2.new(0.277, 0,0.068, 0)
    fr.Size = UDim2.new(0, 557,0, 192)
    fr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    fr.BackgroundTransparency = .7
    fr.Parent = sg

    local tl = Instance.new("TextLabel")
    tl.Text = "Please pick a target"
    tl.Parent = fr
    tl.TextColor3 =  Color3.fromRGB(255, 255, 255)
    tl.Position = UDim2.new(0,0,0,0)
    tl.Size = UDim2.new(0, 200,0,50)
    tl.BackgroundTransparency = 1

    -- list from DoorService.DoorDict
    local lL = Instance.new("TextLabel")
    lL.Position = UDim2.new(0, 0,0.26, 0)
    lL.Size = UDim2.new(0, 557,0, 129)
    lL.TextColor3 =  Color3.fromRGB(255, 255, 255)
    lL.BackgroundTransparency = .5
    lL.Parent = fr

    local tBox = Instance.new("TextBox") 
    tBox.Position = UDim2.new(0.923, 0,0,0)
    tBox.Size = UDim2.new(0, 43,0, 50)
    tBox.BackgroundTransparency = 1
    tBox.TextColor3 =  Color3.fromRGB(255, 255, 255)
    tBox.Text = ""
    tBox.Parent = fr

    local tButt = Instance.new("TextButton") 
    tButt.Position = UDim2.new(0.79, 0,0,0)
    tButt.Size = UDim2.new(0, 66, 0, 50)
    tButt.BackgroundTransparency = 1
    tButt.TextColor3 =  Color3.fromRGB(255, 255, 255)
    tButt.Text = "Set & Open"
    tButt.Parent = fr
    tButt.MouseButton1Click:Connect(function()
    -- print(player:WaitForChild("PlayerGui",10).TeleportGui.Frame.TextBox.Text)
        self.Client.TeleportUIChanged:Fire(player)
       lL.Text = "yahoo!"
       tBox.Text = "Sorry Reset"
        fr.Visible = false
    end)
    sg.Parent = player.PlayerGui
end
return ScreenGuiService