-- -- Bank Service Object
-- BankService = {}
-- local DataStoreService = game:GetService("DataStoreService")
-- -- BankService constructor
-- function BankService:new()
--   local o = {}
--   o.datastore = DataStoreService:GetDataStore("PlayerBanks")
--   self.__index = self
--   return setmetatable(o, self)
-- end

-- function BankService:GetPlayerBalance(playerId)
--   local balance = 0

--   -- get player bank from data store
--   local success, playerBank = pcall(function()
--     return self.datastore:GetAsync("player_bank_" .. playerId)
--   end)
--   if success then
--     balance = playerBank.Balance
--   else
--     error({ msg = "Error - failed to get bank balance for player:" .. playerId, code = BankServiceErrors.BalanceRetrievalError })
--   end

--   return balance
-- end

-- -- deduct player balance after purchase
-- function BankService:DeductPlayerBalance(playerId, cost)
--   local balance = self:GetPlayerBalance(playerId)

--   local success, playerBank = pcall(function()
--     return self.datastore:GetAsync("player_bank_" .. playerId)
--   end)

--   if success and balance > 0 then
--     balance = playerBank.Balance - cost
--     playerBank.Balance = balance
--     local withDrawalSuccess, withdrawalError = pcall(function()
--       return self:datastore:SetAsync("player_bank_" .. playerId, playerBank)
--     end)
--     if not withDrawalSuccess then
--       error({ msg = "Error - failed to deduct cost of " .. cost .. " for player " .. playerId, code = BankServiceErrors.DeductionError })  
--     end
--   else
--     error({ msg = "player has a zero balance - " .. playerId, code = BankServiceErrors.NoFundsError })
--   end

--   return balance
-- end

-- -- update player balance with deposit
-- function BankService:DepositPlayerBalance(playerId, deposit)
--   local balance = self:GetPlayerBalance(playerId)

--   local success, playerBank = pcall(function()
--     return self.datastore:GetAsync("player_bank_" .. playerId)
--   end)

--   if success then
--     balance = playerBank.Balance + deposit
--     playerBank.Balance = balance
--     local depositSuccess, withdrawalError = pcall(function()
--       return self:datastore:SetAsync("player_bank_" .. playerId, playerBank)
--     end)
--     If not depositSuccess then
--       error({msg = "Failed to set updated balance from deposit for " .. playerId .. " deposit: " .. deposit, code = BankServiceErrors.UpdateBalanceError })
--     end
--   else
--     error({ msg = "Error - unable to deposit " .. deposit .. " for player " .. playerId, code = BankServiceErrors.DepositError })
--   end

--   return balance
-- end