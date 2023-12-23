local old

old = hookmetamethod(game, "__namecall", function(...)
	local Self, Key = ...
	if Self.Name == "" or Self.Name == "RemoteEvent" and Self.Parent.Name == "Security" and Self.ClassName == "RemoteEvent" then
		return
	end
	return old(...)
end)