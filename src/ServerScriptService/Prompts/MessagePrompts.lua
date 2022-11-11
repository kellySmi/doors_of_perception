local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local messSvc = Knit.GetService("MessageService")
local MessagePrompts = { Name="MessagePrompts" }
MessagePrompts.MesageDict = {
    MazeKeeperDude={
        messages = {
            { 
                text="Congratulations, You made it through the maze.",
                waitTime=2
            },
            { 
                text="I will give you this key I found in the maze.",
                waitTime=4
            },
            { 
                text="And now you have to find you way up the mountain to the tower.",
                waitTime=4
            },
            { 
                text="Good Luck.",
                waitTime=2
            }
        }
    },
    MtTowerDude={ 
        messages= {
            { 
                text="Welcome to the Mountain Tower",
                waitTime=4
            } ,
            { 
                text="If you make it to the top there is a bridge to another world.",
                waitTime=4
            },
            { 
                text="The bridge can convey motion if you find the clue.",
                waitTime=4
            },
            { 
                text="Good Luck.",
                waitTime=4
            }  
        }
    }
}
function MessagePrompts.route(promptObject, player)
    MessagePrompts.displayMessage(promptObject, player)

end

function MessagePrompts.displayMessage(promptObject,player)
        promptObject.Enabled = false
        local msgs = MessagePrompts.MesageDict[promptObject.Parent.Name]['messages']
        local labelOpts = { TextSize="20" } -- ,  FontFace = Font.fromName("LuckiestGuy")}
        local playerGui = player:WaitForChild('PlayerGui',10)
        for i, msg in pairs(msgs) do  -- iterate thru MessageDict
            messSvc.Client:displayMessage(msg.text,playerGui,labelOpts,msg.waitTime)
        end
        promptObject.Enabled = true
end


return MessagePrompts