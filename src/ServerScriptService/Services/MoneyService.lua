-- local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local MoneyService = Knit.CreateService {
    Name="MoneyService",
    Client = {},
    _MoneyPerPlayer = {},
    _StartingMoney = 10
}

function MoneyService:GetMoney(player)
    -- Do some sort of data fetch
    local money = self._MoneyPerPlayer[player] or self._StartingMoney  -- playerDataStore:GetAsync("money")
    return money
end

function MoneyService:GiveMoney(player, amount)
    -- Do some sort of data fetch
    local money = self:GetMoney(player)
    money += amount
    self._MoneyPerPlayer[player] = money
    -- playerDataStore:SetAsync("money", money)
end

function MoneyService.Client:GetMoney(player)
    -- We already wrote this method, so we can just call the other one.
    -- 'self.Server' will reference back to the root MoneyService.
    return self.Server:GetMoney(player)
end

function MoneyService:KnitStart()
    print("Money Service Started up")
end

function MoneyService.KnitEnd()
    print("Money Service Initialized")
end
return MoneyService