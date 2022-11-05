local RepStorage = game:GetService("ReplicatedStorage")

local Knit = require(RepStorage.Packages.Knit)
local DoorController = Knit.CreateController { Name="DoorControler"}
-- local Signal = require(Knit.Util.Signal)
-- DoorController.Touched = Signal.new()

function DoorController.KnitInit()
    -- print("Door ctrlr has started")
    local DoorService = Knit.GetService("DoorService")
    DoorService:SpawnAllDoors():catch(warn)
end

-- DoorController.Touched:Connect(function() 
--     print("Touch me please.")
-- end)

return DoorController
