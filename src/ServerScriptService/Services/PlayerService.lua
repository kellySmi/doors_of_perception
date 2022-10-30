local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerService = Knit.CreateService { Name="PlayerService", Client = {} }

function PlayerService.init()
    -- load the players saved checkpoints, money and items from the data store
    
end
function PlayerService:KnitStart()
    -- local PointsService = Knit.GetService("PointsService")
    -- PointsService.PointsChanged:Connect(function(player, points)
    --     print("Points changed for " .. player.Name .. ":", points)
    -- end)
end
return PlayerService