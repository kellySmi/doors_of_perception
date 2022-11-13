-- Maze controller class
local Players = game:GetService("Players")
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local MazeController =  Knit.CreateController { Name="MazeController" }
-- local MazeEntPart = game.Workspace:WaitForChild("MazeEntranceTriggerPlate",10)
function MazeController.route(route,part)
    if(route == 'entranceTriggered') then 
        MazeController.triggerMazeEnter(part)
    end
    -- local playerName = playerPart.Parent.Name
    -- local player = players:WaitForChild(playerName,10)
    -- playEntMessage(player)
    -- -- if player.CameraMode ~= Enum.CameraMode.LockFirstPerson then
    -- player.CameraMode = Enum.CameraMode.LockFirstPerson
    -- local character = player.Character
    -- local humanoid = character:WaitForChild('Humanoid',10)
    -- if humanoid then
    --     humanoid.Jump = false
    -- end
    -- local charWalkSound = character.HumanoidRootPart:WaitForChild("Running",10) -- Running.
    -- if charWalkSound then
    --     charWalkSound.Volume = 0
    -- end
    -- task.wait(RESET_TIME) 
        -- mazeAudio:Play()
    --else
    --	if player then
    --		player.CameraMode = Enum.CameraMode.Classic
    --	end
    --	-- mazeAudio:Stop()
    --end
    
end
function MazeController.triggerMazeEnter(part)
     local playerName = part.Parent.Name
    local player = Players.LocalPlayer
    -- playEntMessage(player)
    -- -- if player.CameraMode ~= Enum.CameraMode.LockFirstPerson then
    -- player.CameraMode = Enum.CameraMode.LockFirstPerson
    -- local character = player.Character
    -- local humanoid = character:WaitForChild('Humanoid',10)
    -- if humanoid then
    --     humanoid.Jump = false
    -- end
end
function MazeController.KnitInit()
    --  print("player knitInited on player ctrlr")
    -- MazeEntPart.Touched:Connect(function(part)
    --     MazeController.route('entranceTriggered', part)
    -- end
end

return MazeController
