-- Maze controller class
local Players = game:GetService("Players")
local RepStore = game:GetService("ReplicatedStorage")
local Knit = require(RepStore.Packages.Knit)
local MazeController =  Knit.CreateController { Name="MazeController" }
local levelA = game.Workspace:WaitForChild("Level A",10)
local MazeEntTriggerPart = levelA:WaitForChild("MazeEntranceTriggerPlate",10)
local MazeExitTriggerPart = levelA:WaitForChild("MazeExitTriggerPlate",10)
local RESET_TIME = 5
local mazeAudio = RepStore.aMazingSound


function MazeController.route(route,part)
    if(route == 'entranceTriggered') then 
        MazeController.triggerMazeEnter(part)
    end

    -- playEntMessage(player)
    -- -- if player.CameraMode ~= Enum.CameraMode.LockFirstPerson then
    -- player.CameraMode = Enum.CameraMode.LockFirstPerson
    -- local character = r
    -- local humanoid = character:WaitForChild('Humanoid',10)
    -- if humanoid then
    --     humanoid.Jump = false
    -- end
    -- local charWalkSound = player.Character.HumanoidRootPart:WaitForChild("Running",10) -- Running.
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

local function playEntMessage(player)
    local labelOpts = {TextSize="20" } -- ,  FontFace= Font.fromName("LuckiestGuy")}
   -- local playerGui = player:WaitForChild('PlayerGui',10)
    -- MazeController.ScreenGUIController:displayMessageGui("Welcome to the Maze of Wonder")
    -- MazeController.ScreenGUIController:displayMessageGui("When you reach the end of the maze") 
    -- MazeController.ScreenGUIController:displayMessageGui("You will be placed in first person mode until you exit the maze.")
    -- MazeController.ScreenGUIController:displayMessageGui("Watch out for the top of the maze it kill hurt you")
    -- MazeController.ScreenGUIController:displayMessageGui("Good Luck.")
    MazeController.MessageSvc:displayMessage("Welcome to the Maze of Wonder",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("When you reach the end of the maze",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("You will be placed in first person mode until you exit the maze.",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("Watch out for the top of the maze it kill hurt you",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("Good Luck.",labelOpts,3)
end
local function playExitMessage(player)
    local labelOpts = {TextSize="20" } -- ,  FontFace= Font.fromName("LuckiestGuy")}
    MazeController.MessageSvc:displayMessage("You Made It thru the hard part.",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("Now walk on the top of the maze walls.",labelOpts,5)
    task.wait(4)
    MazeController.MessageSvc:displayMessage("Follow the markings.",labelOpts,5)
    task.wait(4)
    -- MazeController.MessageSvc:displayMessage("Watch out for the top of the maze it kill hurt you",labelOpts,5)
    -- task.wait(4)
    MazeController.MessageSvc:displayMessage("Good Luck.",labelOpts,3)
end
function MazeController.triggerMazeEnter()
    local player = Players.LocalPlayer
    playEntMessage(player)
    local charWalkSound = player.Character.HumanoidRootPart:WaitForChild("Running",10)
    charWalkSound.Volume = 0
    player.CameraMode = Enum.CameraMode.LockFirstPerson
    local humanoid = player.Character:WaitForChild('Humanoid',10)
    if humanoid then
        humanoid.Jump = false
    end
    mazeAudio:Play()
    task.wait(RESET_TIME) 
end
function MazeController.triggerMazeExit()
    local player = Players.LocalPlayer
    playExitMessage(player)
    local charWalkSound = player.Character.HumanoidRootPart:WaitForChild("Running",10)
    charWalkSound.Volume = 0
    player.CameraMode = Enum.CameraMode.Classic
    mazeAudio:Stop()
    task.wait(RESET_TIME) 
end
function MazeController.KnitStart()
    --  print("player knitInited on player ctrlr")
    MazeEntTriggerPart.Touched:Connect(function(part)
        --  MazeController.route('entranceTriggered', part)
         MazeController.triggerMazeEnter(part)
    end)
    MazeExitTriggerPart.Touched:Connect(function(part)
        MazeController.triggerMazeExit(part)
    end)
    --player.CameraMode = Enum.CameraMode.Classic	
    MazeController.MessageSvc = Knit.GetService("MessageService")
  --   MazeController.ScreenGUIController = Knit.GetController("ScreenGUIController")
end

return MazeController
