local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local CoinController = Knit.CreateController { Name="CoinController"}

function CoinController.KnitStart()
    local CoinService = Knit.GetService("CoinService")
    CoinService:GetCoin():andThen(function(coins)
        -- set money in player gui
        --  local pgui  = Knit.Player:WaitForChild("PlayerGui")
        -- local recScoreGui = pgui:WaitForChild("RecScore")
        -- recScoreGui.ScoreFrame.ScoreLabel.Text = money
      --  print("money has been added")

    end)
end

return CoinController