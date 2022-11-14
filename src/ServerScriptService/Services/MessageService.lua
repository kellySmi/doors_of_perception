local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local MessageService =  Knit.CreateService { Name="MessageService", Client = {} }

local PlayerGUi = game:WaitForChild("StarterGui")
local LabelOpts = {TextSize="20",  FontFace= Font.fromName("LuckiestGuy")}

function MessageService.Client:displayMessage(messageText,playerGui, labelOpts, waitTime)
	if not playerGui then 
		playerGui = PlayerGUi
	end
	if not labelOpts then 
		labelOpts = LabelOpts
	end
	local messageSGUi = playerGui:WaitForChild("MessageModal")
	local messFrame = messageSGUi:WaitForChild("Frame")
	local messLabel = messFrame:WaitForChild("TextLabel")
	
	if labelOpts then
		for k,v in labelOpts do
			if k then
				messLabel[k] = v
			end
		end
	end
	if messageText then
		messLabel.Text = messageText
	else
		messLabel.Text = "A place holder"
	end
	
	messFrame.Visible = true
	if(waitTime) then
		wait(waitTime)
	else
		wait(5) -- default time to wait 10 secs
	end
	messFrame.Visible = false
	messLabel.Text = ""
end

function MessageService:KnitStart()
    -- print("Service Started up")
end
return MessageService
