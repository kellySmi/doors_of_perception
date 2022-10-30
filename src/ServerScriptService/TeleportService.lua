local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local TeleportService = Knit.CreateService { Name="TeleportService", Client = {} }
-- local DStoreService = game:GetService("DataStoreService")
-- local dStore = DStoreService:GetDataStore("TeleportAllocation")
-- local repStore = game:GetService("ReplicatedStorage")
-- local telePortSound = repStore:WaitForChild('TeleportSound')
local TeleDict = {A1={telePad="B1", vect={x=3,y=0,z=0}},
	A2={telePad="B2", vect={x=3,y=0,z=0}}, 
	A3={telePad="A4", vect={x=0,y=0,z=0}}, 
	A4={telePad="A3", vect={x=3,y=0,z=0}}, 
	B1={telePad="A2", vect={x=3,y=0,z=0}}, 
	B2={telePad="C1", vect={x=3,y=0,z=0}},
	B3={telePad="C2", vect={x=3,y=0,z=0}}, 
	C1={telePad="B3", vect={x=3,y=0,z=0}},
	C2={telePad="D1", vect={x=3,y=0,z=0}}, 
D1={telePad="A1", vect={x=3,y=0,z=0}}}


function TeleportService.getTeleportId(origId) 
	return TeleDict[origId]['telePad']
end

function TeleportService.teleportPlayer(p,tele,origId)
	
	p.Character:MoveTo(tele.CFrame.p+Vector3.new(TeleDict[origId]['vect']['x'],TeleDict[origId]['vect']['y'],TeleDict[origId]['vect']['z'])) 
end

function TeleportService.init()
	-- this will initialize all doors and teleporters in the game
end

-- local function has_value (tab, val)
-- 	for index, value in ipairs(tab) do
-- 		if value == val then
-- 			return true
-- 		end
-- 	end

-- 	return false
-- end

function TeleportService.FindTele(tag)
	local tele = nil 
	local function scan(p) 
		for _,v in pairs(p:GetChildren()) do 
			if ((v.Name == "Telepad") and (v:findFirstChild("Tag"))) then 
				if (v.Tag.Value == tag) then 
					tele = v 
					-- telePortSound:Play()
					break 
				end 
			end 
			if (#v:GetChildren() > 0) then scan(v) end 
		end 
	end 
	-- scan(game:service("Workspace")) 
	return tele 
end

return TeleportService
