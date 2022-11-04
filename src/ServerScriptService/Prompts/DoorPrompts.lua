-- file to handle all of the door prompts

local DoorPrompts = { Name="DoorPrompts"}

function DoorPrompts.route(promptObject, player)
    DoorPrompts.openCloseDoor(promptObject,player)
end

function DoorPrompts.openCloseDoor(promptObject,player)
    print("inside the Door Prompt Open close func")
    local frame = promptObject.Parent
    local openSound = frame:WaitForChild("DoorOpen",5)
    local closeSound = frame:WaitForChild("DoorClose",5)
    local model = frame.Parent
    local frameClose = model:WaitForChild("DoorFrameClose",5)
    local frameOpen = model:WaitForChild("DoorFrameOpen",5)
    local tweenService = game:GetService("TweenService")

-- local SSStorage = game:GetService("ServerScriptService")
-- local AuthService = require(SSStorage:WaitForChild('AuthService'))



	if 	promptObject.ActionText == "Close" then
		-- closing door here
		promptObject.ActionText = "Open"
		closeSound:Play()
		frame.CanCollide = true
		tweenService:Create(frame,TweenInfo.new(.35),{CFrame = frameClose.CFrame}):Play()
	else
	   -- local playerName = part.Character.name
	-- 	--opening 
	    -- local userAuth = AuthService.checkUser(playerName)
	-- 	if userAuth then
			promptObject.ActionText = "Close"
	 		openSound:Play()
	 		frame.CanCollide = false
			tweenService:Create(frame,TweenInfo.new(.35),{CFrame = frameOpen.CFrame}):Play()
	-- 	end
	end

end

return DoorPrompts