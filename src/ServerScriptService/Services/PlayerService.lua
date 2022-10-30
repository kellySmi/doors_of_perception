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

function PlayerService.clone()
    --- you have to set Archivable to true to clone a player
    -- game.Workspace.YourUsernameHere.Archivable = true
    -- copy = game.Workspace.YourUsernameHere:clone()
    -- game.Workspace.YourUsernameHere.Archivable = false
    
    -- copy.Parent = game.Workspace
    
    -- copy.Name = "Test"
    
    -- copy:MoveTo(Vector3.new(0, 0, 0))
end
return PlayerService