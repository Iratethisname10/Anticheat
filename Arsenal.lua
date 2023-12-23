local old

old = hookfunction(spawn, newcclosure(function(f)
	local Constants = getconstants(f)
	if table.find(Constants, "BeanBoozled") then
		return
	end

	return old(f)
end))