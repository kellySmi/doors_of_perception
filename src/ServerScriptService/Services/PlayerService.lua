local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerService = Knit.CreateService( { Name="PlayerService", Client = {} } )
-- local playerData = { coins=0, doorsFound={}, backsack={}}

function PlayerService:initPlayer(player)
    -- load the players blank  checkpoints, money and items    
    local playerData = { coins=0, doors={}, backsack={}}
    self.DataService:AddData('player',player.UserId, playerData)
    return playerData
end

function PlayerService.Client:GetPlayerData(player)
    local storedPlayerData = self.Server.DataService.GetData('player', player.UserId) -- :andThen(function(storedPlayerData) 
    if storedPlayerData then 
        -- self.Server.playerData = storedPlayerData
        return storedPlayerData
    else
        return self.Server:initPlayer(player)
    end
 --   end):catch(warn)
    
end

function PlayerService.Client:SavePlayerData(player, playerData)
    self.Server.DataService.UpdateData('player', player.UserId, playerData)
    
end

function PlayerService:KnitStart()
    PlayerService.DataService = Knit.GetService("DataService")
    PlayerService.ConfigService = Knit.GetService("ConfigService")
    -- print(ConfigService.StoreName)
    -- local PointsService = Knit.GetService("PointsService")
    -- PointsService.PointsChanged:Connect(function(player, points)
    --     print("Points changed for " .. player.Name .. ":", points)
    -- end)
end

return PlayerService