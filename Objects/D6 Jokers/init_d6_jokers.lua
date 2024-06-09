local init_d6_jokers = function(base_file_path)
	local d6_joker_files = NFS.getDirectoryItems(base_file_path.."/d6_joker LuaList")
	local d6_jokers_to_inject = {}
	local order_list = NFS.load(base_file_path.."/d6_jokers_config.lua")()

	--assemble list of d6_jokers_to_inject
	for k, file in pairs(d6_joker_files) do
		if string.find(file, ".lua") then
			local d6_joker = NFS.load(base_file_path.."/d6_joker LuaList/"..file)()
			if not d6_joker.config["extra"] then d6_joker.config.extra = {} end
			d6_joker.config.extra["local_d6_sides"] = {}
			d6_joker["order"] = order_list[d6_joker.key].order
			d6_jokers_to_inject[#d6_jokers_to_inject+1] = d6_joker
		end
	end

	table.sort(d6_jokers_to_inject, function(a, b) return a.order < b.order end)
	local curr_d6_joker_order = 1
	for _, d6_joker in pairs(d6_jokers_to_inject) do
		d6_jokers_to_inject[curr_d6_joker_order]:register(d6_joker.order)
		print("d6_joker.order: "..tostring(d6_joker.order))
		curr_d6_joker_order = curr_d6_joker_order + 1
	end

end

return {init_func = init_d6_jokers}