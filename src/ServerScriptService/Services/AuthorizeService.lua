local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local AuthorizeService = Knit.CreateService { Name="AuthorizeService", Client = {} }

local authUsers={[3274436688]=true}
function AuthorizeService.checkUser(userId)
	return authUsers[userId]
end
return AuthorizeService