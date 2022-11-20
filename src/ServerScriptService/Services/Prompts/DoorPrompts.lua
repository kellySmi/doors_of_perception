-- file to handle all of the door prompts
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local DoorPrompts = Knit.CreateService { Name="DoorPrompts", Client = {}}

function DoorPrompts.route(promptObject, player)
    DoorPrompts.openCloseDoor(promptObject,player)
end

function DoorPrompts.openCloseDoor(promptObject,player)
    local frame = promptObject.Parent
    local openSound = frame:WaitForChild("DoorOpen",5)
    local closeSound = frame:WaitForChild("DoorClose",5)
    local model = frame.Parent
    local frameClose = model:WaitForChild("DoorFrameClose",5)
    local frameOpen = model:WaitForChild("DoorFrameOpen",5)
    local tweenService = game:GetService("TweenService")
	local tpOn = true
	-- local timer = 20 -- the time between allowing door porting
	if 	promptObject.ActionText == "Close" then
		-- closing door here
		DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
	else
		local playerId = player.UserId
		local tag = model.Telepad.Tag.Value
		-- open door
		local doorConfig = DoorPrompts.DoorService.DoorDict[tag]
		if doorConfig.private == 1 then 
			local userAuth = DoorPrompts.AuthService.checkUser(playerId)
			if userAuth then
				DoorPrompts.openDoor(promptObject,openSound,frame,tweenService,frameOpen)
				frame.Touched:Connect(function()
					-- get part side touched
					if tpOn then
						DoorPrompts.DoorService.Client:thresholdCrossed(player,tag)
						DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
						tpOn = false
						-- task.wait(5)
						-- frame.CanTouch = true
					end
					-- repeat task.wait() until game.Players:GetPlayerFromCharacter(h.Parent):DistanceFromCharacter(frame.Position) > 7
				end)
			end
		else
			DoorPrompts.openDoor(promptObject,openSound,frame,tweenService,frameOpen)
				frame.Touched:Connect(function()
					-- get part side touched
					if tpOn then
						DoorPrompts.DoorService.Client:thresholdCrossed(player,tag)
						DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
						tpOn = false
					end
				end)
		end
	    
		
	
	end
end

function DoorPrompts.openDoor(promptObject,openSound,frame,tweenService,frameOpen)

	promptObject.ActionText = "Close"
	openSound:Play()
	frame.CanCollide = false
	tweenService:Create(frame,TweenInfo.new(.35),{CFrame = frameOpen.CFrame}):Play()
end
function DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
	promptObject.ActionText = "Open"
	closeSound:Play()
	frame.CanCollide = true
	tweenService:Create(frame,TweenInfo.new(.35),{CFrame = frameClose.CFrame}):Play()
	frame.Touched:Connect(function() end)
end
function DoorPrompts.KnitStart()
	DoorPrompts.AuthService = Knit.GetService("AuthorizeService")
	DoorPrompts.DoorService = Knit.GetService("DoorService")
end
return DoorPrompts