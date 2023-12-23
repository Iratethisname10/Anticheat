local badRemotes = {
	"Player Chat Mute Report",
	"Get Player Stance Speed",
	"Force Charcter Save",
	"Sync Near Chunk Loot",
	"Resync Character Physics",
	"Zombie State Resync Attempt",
	"Firearm Ammo Sync"
}

local ReplicatedFirst = cloneref(game:GetService("ReplicatedFirst"))
local network = ReplicatedFirst.Framework.Libraries.Network

network.Send = function(self, remote, ...)
	if table.find(badRemotes, remote) then
		return
	end
end