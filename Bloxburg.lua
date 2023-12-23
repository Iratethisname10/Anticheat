local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local framework = require(ReplicatedStorage.Framework)

local network

framework = getupvalue(framework, 3)

network = framework.net

hookfunction(getfenv(network.FireServer).i, function() end)