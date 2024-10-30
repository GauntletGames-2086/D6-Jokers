local init_d6_sides = function(base_file_path)
	local d6_side_metafiles = NFS.getDirectoryItems(SMODS.current_mod.path.."/"..base_file_path.."/d6_side LuaList")
	local d6_sides_to_inject = {}
	local order_list = assert(SMODS.load_file(base_file_path.."/d6_sides_config.lua"))()

	--assemble list of d6_sides_to_inject
	for _, metafile in ipairs(d6_side_metafiles) do
		local d6_side_files = NFS.getDirectoryItems(SMODS.current_mod.path.."/"..base_file_path.."/d6_side LuaList/"..metafile)
		for _, file in ipairs(d6_side_files) do
			if string.find(file, ".lua") then
				local d6_side = assert(SMODS.load_file(base_file_path.."/d6_side LuaList/"..metafile.."/"..file))()
				if not d6_side then break end
				d6_side.order = (order_list[d6_side.key] and order_list[d6_side.key].order) or #order_list
				d6_side["upgrade_level"] = (order_list[d6_side.key] and order_list[d6_side.key].upgrade_level) or 1
				if not order_list[d6_side.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..d6_side.key) end
				d6_sides_to_inject[#d6_sides_to_inject+1] = d6_side
			end
		end
	end

	table.sort(d6_sides_to_inject, function(a, b) return a.order < b.order end)

	local curr_d6_side_order = 1
	for _, d6_side in pairs(d6_sides_to_inject) do
		d6_sides_to_inject[curr_d6_side_order]:register(d6_side.order)
		curr_d6_side_order = curr_d6_side_order + 1
	end
end

return {init_func = init_d6_sides}