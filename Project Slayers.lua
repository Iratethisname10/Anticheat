local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local mod = require(ReplicatedStorage.Modules.Server.Skills_Modules_Handler)

hookfunction(mod.Kick, function(...) end)