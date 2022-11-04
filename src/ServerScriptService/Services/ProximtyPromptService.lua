local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local ProximityPService = Knit.CreateService { Name="ProximityPService", Client = {} }
local ProximityPromptService = game:GetService("ProximityPromptService")
ProximityPromptService.Enabled = true

-- Detect when prompt is triggered
local function onPromptTriggered(promptObject, player)
	print("I have been prompted!!")
	print(player.Name)
	print(promptObject.Name)
	-- if promptObject.Name =='GoldPrompt'  then
	-- 	local ppart = promptObject.Parent
	-- 	if ppart.Transparency > 0 then
	-- 		ppart.Transparency = 0
	-- 	else
	-- 		ppart.Transparency = 1
	-- 	end
	-- elseif promptObject.Name == 'RubyPrompt' then
	-- 	local ppart = promptObject.Parent
	-- 	ppart.BrickColor = BrickColor.new("Pastel Blue")
		
	-- end
end
-- Detect when prompt hold begins
local function onPromptHoldBegan(promptObject, player)
	-- print("I have been prompted!!")
	-- print(promptObject.Name)
	
end
-- Detect when prompt hold ends
local function onPromptHoldEnded(promptObject, player)
end
-- Connect prompt events to handling functions
ProximityPromptService.PromptTriggered:Connect(onPromptTriggered)
ProximityPromptService.PromptButtonHoldBegan:Connect(onPromptHoldBegan)
ProximityPromptService.PromptButtonHoldEnded:Connect(onPromptHoldEnded)

return ProximityPService