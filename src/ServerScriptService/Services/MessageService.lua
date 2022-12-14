local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local MessageService =  Knit.CreateService { Name="MessageService", Client = {} }

-- local StarterGui = game:WaitForChild("StarterGui",10)
-- local PlayerGui = StarterGui:WaitForChild("playerGui",10)
local LabelOpts = {TextSize="20",  FontFace = Enum.Font.LuckiestGuy}

function MessageService.Client:displayMessage(player, messageText, labelOpts, waitTime)
	-- if not playerGui then 
	local playerGui = player:WaitForChild('PlayerGui',10)
	--- end
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
