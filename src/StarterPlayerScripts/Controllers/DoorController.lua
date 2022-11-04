local RepStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Knit = require(RepStorage.Packages.Knit)
local DoorController = Knit.CreateController { Name="DoorControler"}

function DoorController.KnitInit()
    -- print("Door ctrlr has started")
    local DoorService = Knit.GetService("DoorService")
    DoorService:SpawnAllDoors():andThen(function()
       -- print("complete")
    end)
-- put a door at this position ->  998.99, 1210.482, -150.02


end



return DoorController
