local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerController = Knit.CreateController { Name="PlayerController"}
-- local PlayerService = game:GetService("Players")
-- local player = PlayerService.LocalPlayer

-- player.CharacterAdded:Connect(function(character)

-- 	local humanoid = character:WaitForChild("Humanoid")


-- 	-- Change movement parameters

-- 	humanoid.WalkSpeed = 50

-- 	humanoid.JumpHeight = 2

-- end)
function PlayerController.KnitInit()
    print("knit inited on player ctrlr")
end
function PlayerController.initPlayer()
    print(Knit.player)
end
return PlayerController