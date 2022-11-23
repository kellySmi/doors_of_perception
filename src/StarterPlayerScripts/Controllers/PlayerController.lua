local RepStore = game:GetService("ReplicatedStorage")
local Knit = require(RepStore.Packages.Knit)
local PlayerController = Knit.CreateController { Name="PlayerController"}
local PlayerService = game:GetService("Players")
local player = PlayerService.LocalPlayer
local starterGui = game:GetService("StarterGui")
local playerInfoButton = starterGui.PlayerInfoButton.Frame.Button
local playerInfoContents = starterGui.PlayerInfo

PlayerController.playerData = { coins=0, doorsFound={}, backsack={}, lastConnectDate={}, lastSpawnPt="Start" }

-- this is the rb system initialization function for all the player stuff
player.CharacterAdded:Connect(function()
  local PlayerSrvc = Knit.GetService("PlayerService")
  player.CameraMode = Enum.CameraMode.Classic
  ---local playerData = PlayerSrvc:GetPlayerData(player) -- :andThen(function (playerData) 
	PlayerSrvc:GetPlayerData(player):andThen(function (playerData) 
    local pgui  = Knit.Player:WaitForChild("PlayerGui")
    local recScoreGui = pgui:WaitForChild("RecScore")
    recScoreGui.ScoreFrame.ScoreLabel.Text = playerData.coins
    -- if playerData.lastSpawnPt ~= player.Team.Name then 
    --   player.Team.Name = playerData.lastSpawnPt
    -- end
   -- if playerUpdated then
    ---  PlayerSrvc:SavePlayerData(playerData) -- :andThen(function() 
    PlayerController.playerData = playerData
      -- end):catch(warn)    
   -- end
    -- local humanoid = player:WaitForChild("Humanoid",10)
    -- humanoid.WalkSpeed = 50
    -- humanoid.JumpHeight = 2
  -- print(playerData)
  end):catch(warn)
  
    
end)

-- this is the rb system exit function for all the player stuff
player.CharacterRemoving:Connect(function (player)
  PlayerController.SavePlayerData(PlayerController.playerData)
end)
-- this handles the player info button 
playerInfoButton.MouseButton1Click:Connect( function()
	print("Button clicked!")
  -- refresh with latest player data

	playerInfoContents.Frame.Visible = not playerInfoContents.Frame.Visible;
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