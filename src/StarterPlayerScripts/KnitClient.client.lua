local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

Knit.AddControllers(script.Parent.Controllers)

Knit.Start():andThen(function()
	print("client start up.")
    -- print(Knit.Player)
  -- local PlayerController = Knit.Controllers.PlayerController
   -- PlayerController.initPlayer():andThen(function()end)
   -- Client-side code

-- Don't want to use promises? When you start Knit on the client,
-- set the ServicePromises option to false:
end):catch(warn)