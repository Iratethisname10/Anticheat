for _, v in next, getreg() do
	if type(v) == "function" then

		local info = getinfo(v)

		if info and info.name and info.name == "kick" then
			hookfunction(info.func, function(...) end)
		end
	end
end