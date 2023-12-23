local ReplicatedStorage = game:GetService("ReplicatedStorage")

local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent

local badRemotes = {"CHECKER_1", "TeleportDetect", "OneMoreTime"}

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
	local args = {...}
   
	if getnamecallmethod() == "FireServer" and self == MainEvent and tablefind(badRemotes, args[2]) then
		return
	end

	if not checkcaller() and getfenv(2).crash then
		getfenv(2).crash = function() end
		setfenv(2, getfenv(2))
	end

	return old(self, ...)
end)

local old2
old2 = hookmetamethod(game, "__newindex", function(t, k, v)
    if not checkcaller() and t:IsA("Humanoid") and k == "WalkSpeed" or k == "JumpPower" then
        return
    end

    return old2(t, k, v)
end)