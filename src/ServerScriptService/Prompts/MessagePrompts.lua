local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
-- local messSvc = Knit:GetService("MessageService")
local MessagePrompts = { Name="MessagePrompts" }

function MessagePrompts.route(promptObject, player)
    MessagePrompts.mazeMessage(promptObject,player)
end

function MessagePrompts.mazeMessage(promptObject,player)
   -- local proximityprompt = script.Parent:WaitForChild("ProximityPrompt",10)
  --  local SSStorage = game:GetService("ServerScriptService")
  --  local messSvc = require(SSStorage:WaitForChild("MessageService"))

 --   proximityprompt.Triggered:Connect(function(player)
        -- show screen gui 
        -- size, ZIndex, TextSize, TextWrapped, FontFace.Style, ont
        local labelOpts = { TextSize="20" }
        local playerGui = player:WaitForChild('PlayerGui',10)
        -- messSvc.displayMessage("Congratulations, You maade it through the maze.",playerGui,labelOpts,2)
        -- wait(2)
        -- messSvc.displayMessage("I will give you this key I found in the maze.",playerGui,labelOpts,4)
        -- wait(3)
        -- messSvc.displayMessage("And now you have to find you way up the mountain to the tower.",playerGui,labelOpts,4)
        -- wait(3)
        -- messSvc.displayMessage("Good Luck.",playerGui,labelOpts,2)
    
        -- return true;
 --   end)
end
return MessagePrompts
