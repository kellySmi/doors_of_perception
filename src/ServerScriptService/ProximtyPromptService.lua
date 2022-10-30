local ProximityPromptService = game:GetService("ProximityPromptService")
-- Detect when prompt is triggered
local function onPromptTriggered(promptObject)
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
end
-- Detect when prompt hold ends
local function onPromptHoldEnded(promptObject, player)
end
-- Connect prompt events to handling functions
ProximityPromptService.PromptTriggered:Connect(onPromptTriggered)
ProximityPromptService.PromptButtonHoldBegan:Connect(onPromptHoldBegan)
ProximityPromptService.PromptButtonHoldEnded:Connect(onPromptHoldEnded)
