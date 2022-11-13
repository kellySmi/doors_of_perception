local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

-- Load all services within 'Services':
Knit.AddServices(script.Parent.Services)

-- Load all services (the Deep version scans all descendants of the passed instance):
Knit.AddServicesDeep(script.Parent.Prompts)

Knit.Start():catch(warn)