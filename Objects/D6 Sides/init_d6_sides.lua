local init_d6_sides = function(base_file_path)
	local d6_side_metafiles = NFS.getDirectoryItems(base_file_path.."/d6_side LuaList")
	local d6_sides_to_inject = {}
	local order_list = NFS.load(base_file_path.."/d6_sides_config.lua")()
	
	--assemble list of d6_sides_to_inject
	for _, metafile in ipairs(d6_side_metafiles) do
		local d6_side_files = NFS.getDirectoryItems(base_file_path.."/d6_side LuaList/"..metafile)
		for _, file in ipairs(d6_side_files) do
			if string.find(file, ".lua") then
				local d6_side = NFS.load(base_file_path.."/d6_side LuaList/"..metafile.."/"..file)()
				d6_side.order = order_list[d6_side.key].order
				d6_side["upgrade_level"] = order_list[d6_side.key].upgrade_level
				d6_sides_to_inject[#d6_sides_to_inject+1] = d6_side
			end
		end
	end

	table.sort(d6_sides_to_inject, function(a, b) return a.order < b.order end)

	local curr_d6_side_order = 1
	for _, d6_side in pairs(d6_sides_to_inject) do
		d6_sides_to_inject[curr_d6_side_order]:register(d6_side.order)
		print("Registered D6 Side: "..d6_side.key)
		curr_d6_side_order = curr_d6_side_order + 1
	end

end

return {init_func = init_d6_sides}