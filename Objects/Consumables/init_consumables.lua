local init_consumables = function(base_file_path)
	local consumable_metafiles = NFS.getDirectoryItems(base_file_path.."/consumables LuaList")
	local consumables_to_inject = {}
	local order_list = NFS.load(base_file_path.."/consumables_config.lua")()

	--assemble list of consumables_to_inject
	for _, metafile in ipairs(consumable_metafiles) do
		local consumable_files = NFS.getDirectoryItems(base_file_path.."/consumables LuaList/"..metafile)
		for _, file in ipairs(consumable_files) do
			if string.find(file, ".lua") then
				local f, err = NFS.load(base_file_path.."/consumables LuaList/"..metafile.."/"..file)
				if err then 
					sendErrorMessage("Couldn't load object from D6 Jokers: "..err)
					sendErrorMessage("Object path: "..tostring(base_file_path.."/consumables LuaList/"..metafile.."/"..file)) 
				else
					local consumable = f()
					consumable["order"] = (order_list[consumable.key] and order_list[consumable.key].order) or #order_list
					if not order_list[consumable.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..consumable.key) end
					consumables_to_inject[#consumables_to_inject+1] = consumable
				end
			end
		end
	end

	table.sort(consumables_to_inject, function(a, b) return a.order < b.order end)

	local curr_consumable_order = 1
	for _, consumable in pairs(consumables_to_inject) do
		consumables_to_inject[curr_consumable_order]:register(consumable.order)
		curr_consumable_order = curr_consumable_order + 1
	end

	--D6 Consumables pool
	SMODS.Obj_Pool{
		key = "d6_consumables",
		get_obj_pool = function(self, _type, _rarity, _legendary, _append)
			--create the pool
			G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
			local _pool, _pool_to_check, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, _append, 0

			local consumable_type = pseudorandom('consumable_type'..G.GAME.round_resets.ante..(_append or ''))
			consumable_type = (consumable_type > 0.75 and "Spectral") or "Tarot" --25% chance of Spectral card
			_pool_to_check, _pool_key = G.P_CENTER_POOLS[consumable_type], _type..(_append or '')

			local _starting_pool = {}
			for k, v in pairs(_pool_to_check) do
				if v.d6_consumable then _starting_pool[#_starting_pool+1] = v end
			end

			--cull the pool
			for k, v in ipairs(_starting_pool) do
				local add = true
				
				if G.GAME.used_jokers[v.key] then
					add = nil
				end
		
				if v.no_pool_flag and G.GAME.pool_flags[v.no_pool_flag] then add = nil end
				if v.yes_pool_flag and not G.GAME.pool_flags[v.yes_pool_flag] then add = nil end

				if add then
					_pool[#_pool+1] = v.key
				end
			end
		
			for k,v in pairs(_pool) do
				_pool_size = _pool_size + 1
			end
		
			--if pool is empty
			if _pool_size == 0 then
				_pool = EMPTY(G.ARGS.TEMP_POOL)
				_pool[#_pool + 1] = "c_dsix_the_die_wielder"
			end

			return _pool, _pool_key
		end,
	}
end

return {init_func = init_consumables}