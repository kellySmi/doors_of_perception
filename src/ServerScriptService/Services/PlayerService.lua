local repStore = game:GetService("ReplicatedStorage")
local Knit = require(repStore.Packages.Knit)
local numerics = require(repStore.Packages.numerics)
local PlayerService = Knit.CreateService( { Name="PlayerService", Client = {} } )
local playerData = { coins=0, doors={}, backsack={}, lastConnectDate="", lastSpawnPt="Start"}

function PlayerService:initPlayer(player)
    -- load the players blank  checkpoints, money and items    
    
    self.DataService:AddData('player',player.UserId, playerData)
    return playerData
end

function PlayerService.Client:GetPlayerData(player)
    local storedPlayerData = self.Server.DataService.GetData('player', player.UserId)
    if storedPlayerData then 
        -- self.Server.playerData = storedPlayerData
        -- check last connect time
        -- if not storedPlayerData.lastConnectDate then
        storedPlayerData.lastConnectDate = DateTime.now() -- :FormatUniversalTime()
        -- else
        --     if self.Server:CheckConnectTime(storedPlayerData.lastConnectDate) then 
        --         storedPlayerData.coins += 10 -- = storedPlayerData.coins + 10
        --     end
        -- end
        return storedPlayerData
    else
        return self.Server:initPlayer(player)
    end
 --   end):catch(warn)
    
end
-- internal function to check if the last connect time was more than 24 hours from the current time
-- function PlayerService:CheckConnectTime(lastTime) 
--    -- local dt = DateTime.now()
--     local offset24Hours = 60 * (60 * 24)
--     local dtn = numerics.SecondsToClock(offset24Hours)
--     -- local dtn = tonumber(dt,10)
--    -- local lt = tonumber(lastTime,10)
--     print(dtn)
--     return dtn > lastTime
-- end
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