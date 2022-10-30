local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

-- -- Load all services within 'Services':
Knit.AddControllers(script.Parent.Controllers)

-- -- Load all services (the Deep version scans all descendants of the passed instance):
-- -- Knit.AddServicesDeep(script.Parent.OtherServices)

 Knit.Start():andThen(function()
	print("we cliented it up.")
    -- print(Knit.Player)
   -- local PlayerController = Knit.Controllers.PlayerController
    -- PlayerController.init()
end):catch(warn)