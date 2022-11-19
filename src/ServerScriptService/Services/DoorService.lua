local RepStorage = game:GetService("ReplicatedStorage")
local Knit = require(RepStorage.Packages.Knit)
local DoorService = Knit.CreateService { Name="DoorService", Client = {} }
DoorService.DoorDict = {  -- orientation is in radians and we only rotate on the y axis for now
    X1 = { target="X3", position = { x=1019.936, y=1266.362, z=99.810 }, description="Door on a rock", offset={x=0,y=0,z=0}},
    X2 = { target="X7", position={ x=318.584, y=1213.058, z=482.235}, description="Elevtor bottom level 1A", offset={x=0,y=0,z=-5}},
    X3 = { target="X1", position={ x=1097.711, y=1168.817, z=955.421}, description="test door", offset={x=0,y=0,z=0}},
    X4 = { target="X2", position={x=1044.109, y=1170.882, z=941.384}, description="maze exit door", offset={x=0,y=0,z=0}},
    X5 = { target="X6", position={x=927.212, y=1209.468, z=445.66}, description="start door 2", offset={x=0,y=0,z=-5}, orientation={x=0, y=90, z=0}},
    X6 = { target="X5", position={x=1169.221, y=1212.727, z=377.013}, description="start door 1", offset={x=-5,y=0,z=0}},
    X7 = { target="X2", position={x=280.96, y=1350.581, z=483.554}, description="Elevator top level 1A ", offset={x=0,y=0,z=-5}},
    X8 = { target="X10", position={x=1001.743, y=1430.925, z=516.507}, description="Wall Door 1", offset={x=0,y=0,z=-5} },-- orientation={x=0, y=86.21, z=0}},
    X9 = { target="X10", position={x=1012.721, y=1432.326, z=502.744}, description="Wall Door 2", offset={x=0,y=0,z=-5}, orientation={x=0, y=90, z=0}},
    X10 = { target="X9", position={x=939.874, y=1420.31, z=510.312}, description="Wall Door 3", offset={x=0,y=0,z=-5}} --, orientation={x=0, y=41.47, z=0}}
}

function DoorService.Client:SpawnAllDoors()
    -- return the dict for all the doors
    for i, door in pairs(self.Server.DoorDict) do
        -- local newDoor  = RepStorage.NewDoor:clone()
        local newDoor  = RepStorage.Door:clone()
        local tag = Instance.new("StringValue")
        tag.Value = i
        tag.Name = "Tag"
        tag.Parent = newDoor.Telepad
        if door.orientation then   -- this sets the rotation of the door
            newDoor:PivotTo(CFrame.new(door['position']['x'],door['position']['y'],door['position']['z'])  * CFrame.Angles(0,math.rad(door['orientation']['y']),0)) -- * CFrame.new(door['orientation']['x'], , door['orientation']['z']))
        else
            newDoor:PivotTo(CFrame.new(door['position']['x'],door['position']['y'],door['position']['z']))
        end
        newDoor.Name = "generated_door_".. i
        newDoor.Parent = game.Workspace
    end
end
function DoorService.Client:findTarget(id)
    return self.Server.DoorDict[id]['target']
end

function DoorService.Client:thresholdCrossed(player,tag)
-- get destination
    self.Server.FindDestinationTeleport(self.Server.DoorDict[tag]['target'], function(tele) 
        local dest = tele
        self.Server:sendPlayer(player,dest,tag)
    end)
end

function DoorService:sendPlayer(player, dest, tag)
    
    local newDest = dest.CFrame.p + Vector3.new(self.DoorDict[tag]['offset']['x'],self.DoorDict[tag]['offset']['y'],self.DoorDict[tag]['offset']['z']) 
    player.Character:MoveTo(newDest)
    task.wait(5)
end
-- this function will recursively scan the workspace for parts named Telepad 
-- that have a stringValue element named Tag. The value of tag is the telepad id 
-- it will return the value in a callback function if one is provided, otherwise it will be returned 
function DoorService.FindDestinationTeleport(tag: string, callBackFn)
	local tele = nil 
	local function scan(p) 
		for _,v in pairs(p:GetChildren()) do 
			if ((v.Name == "Telepad") and (v:findFirstChild("Tag"))) then 
				if (v.Tag.Value == tag) then 
					tele = v
					break 
				end 
			end 
			if (#v:GetChildren() > 0) then scan(v) end 
		end 
	end 
	scan(game:GetService("Workspace")) 
    if callBackFn then
	    callBackFn(tele)
    end
    return tele
end

function DoorService:KnitStart()
    -- print("Service Started up")
end
return DoorService