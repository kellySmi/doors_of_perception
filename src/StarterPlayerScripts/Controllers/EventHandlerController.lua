
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local EventHandler = Knit.CreateController { Name="EventHandlerService" }
local TestButton = game:GetService("StarterGui").PlayerInfoButton.Frame.Button
TestButton.MouseButton1Click:Connect( function()
    print("Button clicked!")
-- refresh with latest player data

    -- playerInfoContents.Frame.Visible = not playerInfoContents.Frame.Visible;
end)
function EventHandler.KnitStart()
    
   -- TestButton.Activated:Connect(function()
        print("Action!!")
    -- end)
end
return EventHandler
