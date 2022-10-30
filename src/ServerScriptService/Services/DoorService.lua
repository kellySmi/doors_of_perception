local RepStorage = game:GetService("ReplicatedStorage")
local Knit = require(RepStorage.Packages.Knit)
local DoorService = Knit.CreateService { Name="DoorService", Client = {} }
-- local DoorDict = {A1={telePad="B1", position={x=998.99, y=1210.482, z=-150.02}, vect={x=3,y=0,z=0}},
-- 	A2={telePad="B2",  vect={x=3,y=0,z=0}}, 
-- 	A3={telePad="A4", vect={x=0,y=0,z=0}}, 
-- 	A4={telePad="A3", vect={x=3,y=0,z=0}}, 
-- 	B1={telePad="A2", vect={x=3,y=0,z=0}}, 
-- 	B2={telePad="C1", vect={x=3,y=0,z=0}},
-- 	B3={telePad="C2", vect={x=3,y=0,z=0}}, 
-- 	C1={telePad="B3", vect={x=3,y=0,z=0}},
-- 	C2={telePad="D1", vect={x=3,y=0,z=0}}, 
-- D1={telePad="A1", vect={x=3,y=0,z=0}}}
DoorService.DoorDict = { A1 = { telePad="B1", position = { x=1019.936, y=1262.662, z=99.810 }, offset={x=0,y=-5,z=0}} }

function DoorService.Client:GetAllDoors()
    -- return the dict for all the doors
    for i, door in pairs(self.Server.DoorDict) do
        local newDoor  = RepStorage.NewDoor:clone()
        
        newDoor.Position = newDoor.Position + Vector3.new(door['position']['x'],door['position']['y'],door['position']['z'])
        newDoor.Anchored = true
        newDoor.Name = "sweet_door_".. i
    -- print(i)
        -- print(door)
        newDoor.Parent = game.Workspace
    end
end
function DoorService:KnitStart()
    -- print("Service Started up")
end
return DoorService