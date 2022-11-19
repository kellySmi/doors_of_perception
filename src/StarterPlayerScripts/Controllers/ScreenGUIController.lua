local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local ScreenGUIController = Knit.CreateController { Name="ScreenGUIController"}
local Players = game:GetService("Players")
local Roact = require(ReplicatedStorage.Packages.roact)
local PlayerGui = game:WaitForChild("StarterGui")
local LabelOpts = {TextSize="20"}  -- , FontFace = Font:fromEnum(Enum.Font.LuckiestGuy) }

function ScreenGUIController.ShowGUI()
    -- this will show a screen GUI and update the value
     local sg = Roact.createElement("ScreenGui", {}, {
        ScoreFrame = Roact.createElement("Frame",{Name="ScoreFame"}, {
            UICorners = Roact.createElement("UICorner",{}, {}),
            ScoreLabel = Roact.createElement("TextLabel", {},{
    --         Size = UDim2.new(0, 400, 0, 300),
                Text = ""
            })
        })
    })
    Roact.mount(sg, Players.LocalPlayer.PlayerGui)
end

function ScreenGUIController:createDoorScoreGUI() 

end
function ScreenGUIController.KnitInit() 
    -- local app = Roact.createElement("ScreenGui", {}, {
    --     HelloWorld = Roact.createElement("TextLabel", {
    --         Size = UDim2.new(0, 400, 0, 300),
    --         Text = "Hello, Roact!"
    --     })
    -- })
    -- Roact.mount(app, Players.LocalPlayer.PlayerGui)
end
return ScreenGUIController