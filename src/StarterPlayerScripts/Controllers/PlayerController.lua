local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerController = Knit.CreateController { Name="PlayerController"}
local PlayerService = game:GetService("Players")
local player = PlayerService.LocalPlayer
PlayerController.playerData = { coins=0, doorsFound={}, backsack={}}

player.CharacterAdded:Connect(function(player)
--   local humanoid = player:WaitForChild("Humanoid")
-- -- -- 	-- Change movement parameters
--     humanoid.WalkSpeed = 50
--     humanoid.JumpHeight = 2
  -- print("Player all loaded up")
  local PlayerSrvc = Knit.GetService("PlayerService")
  -- local playerData = 
  PlayerSrvc:GetPlayerData(player):andThen(function (playerData) 
    -- print(playerData)
    playerData.coins = playerData.coins +  10

    -- add 10 coins for testing 

    local pgui  = Knit.Player:WaitForChild("PlayerGui")
    local recScoreGui = pgui:WaitForChild("RecScore")
    recScoreGui.ScoreFrame.ScoreLabel.Text = playerData.coins
    --       --  print("money has been added")
   -- if playerData then
      PlayerSrvc:SavePlayerData(playerData):andThen(function() 
        PlayerController.playerData = playerData
      end):catch(warn)
      
   -- end
  end):catch(warn)
end)
player.CharacterRemoving:Connect(function (player)
  local PlayerSrvc = Knit.GetService("PlayerService")
  -- local playerData = 
  PlayerSrvc:SavePlayerData(player):andThen(function (playerData) 
   -- print(playerData)
    -- if playerData then
    --   -- set player data on player 
    -- end
  end):catch(warn)
end)
function PlayerController.KnitInit()
  --  print("player knitInited on player ctrlr")
end
function PlayerController.initPlayer()
   --  print(Knit.player)
end
return PlayerController