local RepStorage = game:GetService("ReplicatedStorage")
local Knit = require(RepStorage.Packages.Knit)
local DoorService = Knit.CreateService { Name="DoorService", Client = {} }
-- A door entry must have the key which is the door id, 
-- a target which is the door id which this door transports to
-- a position to place the door
-- private indicates if this door can be used by the public 1=private 0=public
-- offset is the teleport offset to allow a better transport
-- angle is in radians and we only rotate on the y axis for doors, as we don't need any wierd doors, yet
-- 
DoorService.DoorDict = { 
    X6 = { target="X5", position={x=1169.221, y=1212.727, z=377.013}, private=0, description="start door 1", offset={x=-5,y=0,z=0}},
    X5 = { target="X6", position={x=927.212, y=1209.468, z=445.66},  private=0, description="start door 2", offset={x=0,y=0,z=-5}, angle={x=0, y=90, z=0}},
    
    Z1 = { target="Y1", position={x=1090.101, y=1210.814, z=478.263}, private=1, description="Admin door 1", offset={x=0,y=0,z=5}, angle={x=0, y=15, z=0}},
    Y1 = { target="Z2", position={x=798.287, y=1659.879, z=1234.709}, private=1, description="Rainbow Bridge", offset={x=0,y=0,z=5}},
    Z2 = { target="Z3", position={x=410.506, y=1619.023, z=4611.756}, private=1, description="FunLand 1", offset={x=0,y=0,z=5}},
    Z3 = { target="Z4", position={x=-3083.764, y=1536.487, z=5423.168}, private=1, description="Sand Castle Funland", offset={x=0,y=0,z=-5}, angle={x=0, y=45, z=0}},
    Z4 = { target="Z1", position={x=2726.198, y=1631.364, z=5331.252}, private=1, description="Red Rocks Cave Funland", offset={x=0,y=0,z=-5}}, -- , angle={x=0, y=45, z=0}

    X1 = { target="X11",position={ x=1019.936, y=1266.362, z=99.810 }, private=1, description="Door on a rock", offset={x=0,y=0,z=-5}},
    X2 = { target="X7", position={ x=318.584, y=1213.058, z=482.235}, private=1, description="Elevtor bottom level 1A", offset={x=0,y=0,z=-5}},
    X3 = { target="X1", position={ x=1097.711, y=1168.817, z=955.421},  private=1,description="black rock mt ", offset={x=0,y=0,z=-5}},
    X4 = { target="X2", position={x=1044.109, y=1170.882, z=941.384}, private=1, description="maze exit door", offset={x=0,y=0,z=-5}},
    X7 = { target="X2", position={x=280.96, y=1350.581, z=483.554},  private=1,description="Elevator top level 1A ", offset={x=0,y=0,z=-5}},
    -- X8 = { target="X10", position={x=1001.743, y=1430.925, z=516.507}, private=1, description="Wall Door 1", offset={x=0,y=0,z=-5} },-- angle={x=0, y=86.21, z=0}},
    -- X9 = { target="X10", position={x=1012.721, y=1432.326, z=502.744}, private=1, description="Wall Door 2", offset={x=0,y=0,z=-5}, angle={x=0, y=90, z=0}},
    -- X10 = { target="X9", position={x=939.874, y=1420.31, z=510.312},  private=1, description="Wall Door 3", offset={x=0,y=0,z=-5}}, -- angle={x=0, y=41.47, z=0}}
    X11 = { target="X12", position={x=1119.099, y=1211.995, z=-400.203}, private=0, description="Corner Main Meadow", offset={x=0,y=0,z=-5}},
    X12 = { target="X13", position={x=-338.169, y=762.24, z=103.752}, private=0, description="Snow Mt ridge", offset={x=0,y=0,z=-5}},
    X13 = { target="X14", position={x=500.191, y=1744.482, z=-367.215}, private=1, description="Top of main Rock mt", offset={x=0,y=0,z=-5}, angle={x=0, y=45, z=0}},
    X14 = { target="X15", position={x=-1113.939, y=342.013, z=400.879 }, private=1, description="Top of Level D", offset={x=0,y=0,z=-5}},
    X15 = { target="X16", position={x=-377.001, y=38.6, z=390.869}, private=1, description="Valley level C", offset={x=0,y=0,z=-5}},
    X16 = { target="X17", position={x=-53.396, y=7.624, z=-20.298}, private=1, description="Castle Basement level C", offset={x=0,y=0,z=-5}},
    X17 = { target="X11", position={x=-353.443, y=585.883, z=456.396}, private=1, description="Sub Terrain level B", offset={x=0,y=0,z=-5}},
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
        if door.angle then   -- this sets the rotation of the door
            newDoor:PivotTo(CFrame.new(door['position']['x'],door['position']['y'],door['position']['z'])  * CFrame.Angles(0,math.rad(door['angle']['y']),0))
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
        -- SetPlayer door counter 
        local playerData = DoorService.PlayerSrvc.Client:GetPlayerData(player)
        table.insert(playerData.doors, {doorId = tag})
        DoorService.PlayerSrvc.Client:SavePlayerData(player, playerData)
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
    DoorService.PlayerSrvc = Knit.GetService("PlayerService")
end
return DoorService