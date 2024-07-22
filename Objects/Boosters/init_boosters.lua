local init_boosters = function(base_file_path)
	local booster_files = assert(NFS.getDirectoryItems(SMODS.current_mod.path..base_file_path.."/booster LuaList"))
	local boosters_to_inject = {}
	local order_list = assert(SMODS.load_file(base_file_path.."/boosters_config.lua"))()

	--assemble list of boosters_to_inject
	for k, file in pairs(booster_files) do
		if string.find(file, ".lua") then
			local booster = assert(SMODS.load_file(base_file_path.."/booster LuaList/"..file))()
			if not booster then break end
			booster["order"] = (order_list[booster.key] and order_list[booster.key].order) or #order_list
			if not order_list[booster.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..booster.key) end
			boosters_to_inject[#boosters_to_inject+1] = booster
		end
	end

	--Sort by order
	table.sort(boosters_to_inject, function(a, b) return a.order < b.order end)

	--Register the joker (in the sorted order)
	local curr_booster_order = 1
	for _, booster in pairs(boosters_to_inject) do
		boosters_to_inject[curr_booster_order]:register(booster.order)
		curr_booster_order = curr_booster_order + 1
	end
end

return {init_func = init_boosters}