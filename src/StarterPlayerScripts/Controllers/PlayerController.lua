local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerController = Knit.CreateController { Name="PlayerController"}
local PlayerService = game:GetService("Players")
local player = PlayerService.LocalPlayer

PlayerController.playerData = { coins=0, doorsFound={}, backsack={}, lastConnectDate="", lastSpawnPt="Start" }

player.CharacterAdded:Connect(function()

  local PlayerSrvc = Knit.GetService("PlayerService")
  PlayerSrvc:GetPlayerData(player):andThen(function (playerData) 
    -- print(playerData)
   -- playerData.coins = playerData.coins +  10
   -- check last connect date if over 24 hrs give daily 10 coins 
   -- local playerUpdated = false
   
    -- if playerData.lastConnectDate and (dt - 24) > playerData.lastConnectDate then

    -- end
    local pgui  = Knit.Player:WaitForChild("PlayerGui")
    local recScoreGui = pgui:WaitForChild("RecScore")
    recScoreGui.ScoreFrame.ScoreLabel.Text = playerData.coins
    -- if playerData.lastSpawnPt ~= player.Team.Name then 
    --   player.Team.Name = playerData.lastSpawnPt
    -- end
   -- if playerUpdated then
      -- PlayerSrvc:SavePlayerData(playerData):andThen(function() 
      --   PlayerController.playerData = playerData
      -- end):catch(warn)    
   -- end
    -- local humanoid = player:WaitForChild("Humanoid",10)
    -- humanoid.WalkSpeed = 50
    -- humanoid.JumpHeight = 2
  end):catch(warn)
end)


player.CharacterRemoving:Connect(function (player)
  -- local playerData = 
  -- PlayerSrvc:SavePlayerData(playerData):andThen(function (playerData) 
  --   print(playerData)
  --   -- if playerData then
  --   --   -- set player data on player 
  --   -- end
  -- end):catch(warn)
end)
function PlayerController.SavePlayerData(playerData)
  local PlayerSrvc = Knit.GetService("PlayerService")
	PlayerSrvc:SavePlayerData(playerData):andThen(function() 
		PlayerController.playerData = playerData
	end):catch(warn)
end
function PlayerController.KnitInit()
  --  print("player knitInited on player ctrlr")
end
return PlayerController