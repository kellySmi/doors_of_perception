-- file to handle all of the door prompts
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local AuthService = Knit.GetService("AuthorizeService")
local DoorService = Knit.GetService("DoorService")
local DoorPrompts = { Name="DoorPrompts"}

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

	if 	promptObject.ActionText == "Close" then
		-- closing door here
		DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
		frame.Touched:Connect(function()
			print("touched when closed")
			return 
		end)
	else
		local playerId = player.UserId
		local tag = model.Telepad.Tag.Value
		frame.Touched:Connect(function() 
			DoorService.Client:thresholdCrossed(player,tag)
			DoorPrompts.closeDoor(promptObject,closeSound,frame,tweenService,frameClose)
		end)
	-- open door
	    local userAuth = AuthService.checkUser(playerId)
	 	if userAuth then
			DoorPrompts.openDoor(promptObject,openSound,frame,tweenService,frameOpen)
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
end

return DoorPrompts