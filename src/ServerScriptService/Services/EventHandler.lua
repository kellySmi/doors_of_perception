local RepStorage = game:GetService("ReplicatedStorage")
local Knit = require(RepStorage.Packages.Knit)
local EventHandler = Knit.CreateService { Name="EventHandler", Client = {} }
local RESET_TIME = 2

-- the event will have a String for eventSvc that will be the service name and the 
function EventHandler.Client:HandleEvent(player,event)
    local eventService = Knit.GetService(event.eventSvc)
	eventService.Client:HandleEvent(player,event)
	task.wait(RESET_TIME)
end
return EventHandler
