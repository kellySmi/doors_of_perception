local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local MoneyController = Knit.CreateController { Name="MoneyController"}

function MoneyController.KnitInit()
    local MoneyService = Knit.GetService("MoneyService")
    MoneyService:GetMoney():andThen(function(money)
         -- set money in player gui
         local pgui  = Knit.Player:WaitForChild("PlayerGui")
        local scoreGui = pgui:WaitForChild("Score")
        scoreGui.ScoreFrame.ScoreLabel.Text = money
    end)
end

return MoneyController