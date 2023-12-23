local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local de = ReplicatedStorage.Events.DataEvent

local oldNamecall

local hook = function(remote, action, ...)
	if remote == de and string.lower(action) == "banme" then
		return
	end

	return oldNamecall(remote, action, ...)
end

oldNamecall = hookmetamethod(game, '__namecall', function(self, ...)
	local method = getnamecallmethod()

	if method == "fireServer" or method == "FireServer" and self:IsA("RemoteEvent") and self == de then
		return hook(self, ...)
	end

	return oldNamecall(self, ...)
end)