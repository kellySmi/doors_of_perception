local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local ProximityPService = Knit.CreateService { Name="ProximityPService", Client = {} }
local ProximityPromptService = game:GetService("ProximityPromptService")
ProximityPromptService.Enabled = true
local prompts = script.Parent.Parent.Prompts
local function onPromptTriggered(promptObject, player)
	local promptService = require(prompts:WaitForChild(promptObject.Name..'s',10))
	promptService.route(promptObject,player)
end
local function onPromptHoldBegan(promptObject, player)
end
local function onPromptHoldEnded(promptObject, player)
end
-- Connect prompt events to handling functions
ProximityPromptService.PromptTriggered:Connect(onPromptTriggered)
ProximityPromptService.PromptButtonHoldBegan:Connect(onPromptHoldBegan)
ProximityPromptService.PromptButtonHoldEnded:Connect(onPromptHoldEnded)

return ProximityPService