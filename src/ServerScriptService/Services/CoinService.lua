local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local CoinService = Knit.CreateService {
    Name="CoinService",
    Client = {},
    _CoinsPerPlayer = {},
    _StartingMoney = 10
}

function CoinService:GetCoin(player)
    -- Do some sort of data fetch
    local money = self._CoinsPerPlayer[player] or self._StartingMoney  -- playerDataStore:GetAsync("money")
    return money
end

function CoinService:GiveCoin(player, amount)
    -- Do some sort of data fetch
    local money = self:GetCoin(player)
    money += amount
    self._CoinsPerPlayer[player] = money
    -- playerDataStore:SetAsync("money", money)
end

function CoinService.Client:GetCoin(player)
    -- We already wrote this method, so we can just call the other one.
    -- 'self.Server' will reference back to the root CoinService.
    return self.Server:GetCoin(player)
end

function CoinService:KnitStart()
   --  print("Service Started up")
end

function CoinService.KnitEnd()
    print("Money Service Ended")
end
return CoinService