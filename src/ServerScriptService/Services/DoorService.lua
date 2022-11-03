local RepStorage = game:GetService("ReplicatedStorage")
local Knit = require(RepStorage.Packages.Knit)
local DoorService = Knit.CreateService { Name="DoorService", Client = {} }
-- local DoorDict = {A1={telePad="B1", position={x=998.99, y=1210.482, z=-150.02}, description="", offset={x=3,y=0,z=0}},
-- 	A2={telePad="B2", position={x=318.453, y=1222.899, z=482.438}  description="" offset={x=3,y=0,z=0}}, 
-- 	A3={telePad="A4", position={318.584, 1223.158, 482.245} description="Elevtor door level 1A" offset={x=0,y=0,z=0}}, 
-- 	A4={telePad="A3", position={280.96, 1350.581, 483.554} description="Elevtor door 1B" vect={x=3,y=0,z=0}}, 
-- 	B1={telePad="A2", position={720.01, 1205.67, 359.673}, vect={x=3,y=0,z=0}}, 
-- 	B2={telePad="C1", vect={x=3,y=0,z=0}},
-- 	B3={telePad="C2", vect={x=3,y=0,z=0}}, 
-- 	C1={telePad="B3", vect={x=3,y=0,z=0}},
-- 	C2={telePad="D1", vect={x=3,y=0,z=0}}, 
-- D1={telePad="A1", vect={x=3,y=0,z=0}}}
DoorService.DoorDict = { 
    X1 = { target="X3", position = { x=1019.936, y=1266.362, z=99.810 }, description="Door on a rock", offset={x=0,y=0,z=0}},
    X2 = { target="X1", position={ x=318.584, y=1223.158, z=482.245}, description="Elevtor door level 1A", offset={x=0,y=0,z=0}},
    X3 = { target="X2", position={ x=720.01, y=1205.67, z=359.673}, description="", offset={x=3,y=0,z=0}}
}

function DoorService.Client:SpawnAllDoors()
    -- return the dict for all the doors
    for i, door in pairs(self.Server.DoorDict) do
        -- local newDoor  = RepStorage.NewDoor:clone()
        local newDoor  = RepStorage.Door:clone()
        local tag = Instance.new("StringValue")
        tag.Value = i
        tag.Parent = newDoor
        newDoor:PivotTo(CFrame.new(door['position']['x'],door['position']['y'],door['position']['z']))
       -- newDoor.Frame.Position = newDoor.Frame.Position + Vector3.new(door['position']['x'],door['position']['y'],door['position']['z'])
		-- newDoor.Frame.Anchored = true
        newDoor.Name = "generated_door_".. i
        newDoor.Parent = game.Workspace
    end
end
function DoorService.Client:findTarget(id)
    return self.Server.DoorDict[id]['target']
end

function DoorService.Client:sendPlayer(player,doorId, dest)

    player.Character:MoveTo(dest.CFrame.p+Vector3.new(self.Server.DoorDict[doorId]['offset']['x'],self.Server.DoorDict[doorId]['offset']['y'],self.Server.DoorDict[doorId]['offset']['z'])) 
end

function DoorService:KnitStart()
    -- print("Service Started up")
end
return DoorService