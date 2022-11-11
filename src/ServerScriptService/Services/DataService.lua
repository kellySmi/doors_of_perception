local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local DataService = Knit.CreateService {Name="DataService"}
local DataStoreService = game:GetService("DataStoreService")
DataService.DataStore = nil
-- local configuration = script:FindFirstChildWhichIsA("Configuration", true)
-- local storeName =  configuration:FindFirstChild("StoreName").Value

function DataService.AddData(scope, userId, data)
	local ds = DataService.DataStore
	if not ds then
		ds = DataStoreService:GetDataStore(scope)
	end
	local success, errorMessage = pcall(function()
		DataService.DataStore:SetAsync(userId, data)
	end)
	if not success then
		print(errorMessage)
		return false
	else
		return true
	end
end 

function DataService.UpdateData(scope, userId, data)
	if not DataService.DataStore then
		DataService.DataStore = DataStoreService:GetDataStore(scope)
	end
	local success, errorMessage = pcall(function()
		DataService.DataStore:SetAsync(userId, data)
	end)
	if not success then
		print(errorMessage)
		return false
	else
		return true
	end
end
-- function DataService.incrementData( scope, userId, data)
-- 	local dataStore = DataStoreService:GetDataStore(scope)
-- 	-- local currData = PlayerData.getData(storeName, scope, userId, data)
-- 	-- if currData then
	
-- 		local success, newData = pcall(function()
-- 			return dataStore:IncrementAsync(userId,data)
-- 		end)
-- 		if success then
-- 			print(newData)
-- 			return newData
-- 		else
-- 			return false
-- 		end
-- 	-- else
-- 	-- 	DataService.addUpdateData(storeName, scope, userId, data, true)
-- 	-- 	-- return PlayerData.incrementData(storeName, scope, userName, data)
-- 	-- end
-- end

-- function DataService.RemoveData(storeName, scope, userId, data)
-- 	local dataStore = DataStoreService:GetDataStore(storeName, scope)
-- 	-- remove data
-- 	local success, removedValue = pcall(function()
-- 		return dataStore:RemoveAsync(userId)
-- 	end)

-- 	if success then
-- 		print(removedValue)
-- 		return true
-- 	else
-- 		return false
-- 	end
	
-- end

-- function DataService.getData(storeName, scope, userId, callBackFn)
-- 	local dataStore = DataStoreService:GetDataStore(storeName, scope)
-- 	local success, currentData = pcall(function()
-- 		return dataStore:GetAsync(userId)
-- 	end)
-- 	if success then
-- 		callBackFn(currentData)
-- 	else
-- 		callBackFn(false)
-- 	end
-- end
function DataService.GetData(scope, userId)
	if not DataService.DataStore then
		DataService.DataStore = DataStoreService:GetDataStore(scope)
	end
	local success, currentData = pcall(function()
		return DataService.DataStore:GetAsync(userId)
	end)
	if success then
		return currentData
	else
		return false
	end
end
-- function DataService.getAllData(storeName, scope, callBackFn)
-- 	local dataStore = DataStoreService:GetDataStore(storeName, scope)
-- 	local success, currentData = pcall(function()
-- 		return dataStore:GetAsync()
-- 	end)
-- 	if success then
-- 		callBackFn(currentData)
-- 	else
-- 		callBackFn(false)
-- 	end
-- end
-- function DataService.GetAllData(storeName, scope)
-- 	local dataStore = DataStoreService:GetDataStore(storeName, scope)
-- 	local success, currentData = pcall(function()
-- 		return dataStore:GetAsync()
-- 	end)
-- 	if success then
-- 		return currentData
-- 	else
-- 		return false
-- 	end
-- end
function DataService:KnitStart()
	-- print("it has begun")
   --  DataService.DataStore = Knit.GetService("DataService")
    -- PlayerService.ConfigService = Knit.GetService("ConfigService")
    -- print(ConfigService.StoreName)
    -- local PointsService = Knit.GetService("PointsService")
    -- PointsService.PointsChanged:Connect(function(player, points)
    --     print("Points changed for " .. player.Name .. ":", points)
    -- end)
end
return DataService
