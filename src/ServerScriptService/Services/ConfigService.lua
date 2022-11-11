local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local ConfigService = Knit.CreateService { 
    Name="ConfigService",
    Client={}
}
ConfigService.AppName="Doors_of_Perception"
-- ConfigService.StoreName="dop_store"

return ConfigService