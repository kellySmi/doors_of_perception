local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local PlayerInfo = Knit.CreateService { Name="PlayerInfo", Client = {}}

function PlayerInfo.Client:HandleEvent(player, event)
    if event.action == "info_button_clicked" then
        self.Server:infoButtonEvent(player)
    elseif event.action == "bag_button_clicked" then
        self.Server:backPackButtonEvent(player)
    end
end
function PlayerInfo:backPackButtonEvent(player)
    local playerGui = player:WaitForChild('PlayerGui',10)
    local PlayeInfoGui = playerGui:WaitForChild("BagContents",10)
	local frame = PlayeInfoGui:WaitForChild("Frame",10)
	local BagInfoContainer = frame:WaitForChild("BagInfo",10)

    local backsackData = PlayerInfo.PlayerSrvc.Client:GetPlayerData(player)['backsack']
    local newStr = "BackSack Contents \n"

    for i,v in pairs(backsackData) do
        -- if type(v) == "number" or type(v) == "string" then
             if v then
                 newStr ..= i .. " : " .. v .. "\n"
            end
            
        -- end
        -- if type(v) == "table" and v then
            -- newStr ..= i .. "\n"
            -- for _, vv in pairs(v) do
            --     newStr  ..=  "  -> ".._ .. " : " .. vv .. "\n"
            -- end
        -- end
    end
    BagInfoContainer.Text = newStr
    frame.Visible = not frame.Visible
end

function PlayerInfo:infoButtonEvent(player)
    local playerGui = player:WaitForChild('PlayerGui',10)
    local PlayeInfoGui = playerGui:WaitForChild("PlayerInfo",10)
	local frame = PlayeInfoGui:WaitForChild("Frame",10)
	local playerInfoContainer = frame:WaitForChild("PlayerInfo",10)

    local playerData = PlayerInfo.PlayerSrvc.Client:GetPlayerData(player)
    local newStr = ""
    for i,v in pairs(playerData) do
        if type(v) == "number" or type(v) == "string" then
            if not v then
                v = "0"
            end
            newStr ..= i .. " : " .. v .. "\n"
        end
        if type(v) == "table" and v then
            newStr ..= i .. "\n"
            for _, vv in pairs(v) do
                newStr  ..=  "  -> ".._ .. " : " .. vv .. "\n"
            end
        end
    end
    playerInfoContainer.Text = newStr
    frame.Visible = not frame.Visible
end
function PlayerInfo.KnitStart()
    PlayerInfo.PlayerSrvc = Knit.GetService("PlayerService")
end
return PlayerInfo