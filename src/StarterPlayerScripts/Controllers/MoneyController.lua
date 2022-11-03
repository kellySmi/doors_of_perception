local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local MoneyController = Knit.CreateController { Name="MoneyController"}

function MoneyController.KnitInit()
    local MoneyService = Knit.GetService("MoneyService")
    MoneyService:GetMoney():andThen(function(money)
         -- set money in player gui
         local pgui  = Knit.Player:WaitForChild("PlayerGui")
        local recScoreGui = pgui:WaitForChild("RecScore")
        recScoreGui.ScoreFrame.ScoreLabel.Text = money
      --  print("money has been added")
    end)
end

return MoneyController