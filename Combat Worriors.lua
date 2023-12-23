local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local main = require(ReplicatedStorage.Framework.Nevermore)
local ac

local setidentity = set_thread_identity or setidentity or setthreadidentity or function() end

local get = function(thing)
	local modules = getupvalue(rawget(main, "_require"), 2)

	if typeof(modules) ~= "table" then return end
	if getmetatable(modules) then return end

	while true do
		for i, v in next, modules do
			if typeof(v) == "Instance" and i == thing then
				setidentity(2)
				local result = {getrenv().require(v)}
				setidentity(7)

				return unpack(result)
			end
		end
		task.wait()
	end
end

ac = get("AntiCheatHandlerClient")

local old

local hook = function(self, name, ...) if name == 'BAC' then return end end

old = hookfunction(rawget(Network, 'FireServer'), function(...)
	return hook(...)
end)

hookfunction(ac.punish, function() end)