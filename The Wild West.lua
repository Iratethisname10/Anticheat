local old

old = hookmetamethod(game, '__newindex', function(self, p, v)
	if self:IsA("Terrain") and p == "Color" and string.find(debug.traceback(), "Environment") then
		return
	end

	return old(self, p, v)
end)