local init_consumables = function(base_file_path)
	local consumable_metafiles = assert(NFS.getDirectoryItems(SMODS.current_mod.path..base_file_path.."/consumables LuaList"))
	local consumables_to_inject = {}
	local order_list = assert(SMODS.load_file(base_file_path.."/consumables_config.lua"))()

	--assemble list of consumables_to_inject
	for _, metafile in ipairs(consumable_metafiles) do
		local consumable_files = assert(NFS.getDirectoryItems(SMODS.current_mod.path..base_file_path.."/consumables LuaList/"..metafile))
		for _, file in ipairs(consumable_files) do
			if string.find(file, ".lua") then
				local consumable = assert(SMODS.load_file(base_file_path.."/consumables LuaList/"..metafile.."/"..file))()
				if not consumable then break end
				consumable["order"] = (order_list[consumable.key] and order_list[consumable.key].order) or #order_list
				if not order_list[consumable.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..consumable.key) end
				consumables_to_inject[#consumables_to_inject+1] = consumable
			end
		end
	end

	table.sort(consumables_to_inject, function(a, b) return a.order < b.order end)

	local curr_consumable_order = 1
	for _, consumable in pairs(consumables_to_inject) do
		consumables_to_inject[curr_consumable_order]:register(consumable.order)
		curr_consumable_order = curr_consumable_order + 1
	end
end

return {init_func = init_consumables}