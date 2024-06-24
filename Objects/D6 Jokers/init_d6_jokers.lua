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
			d6_joker["order"] = (order_list[d6_joker.key] and order_list[d6_joker.key].order) or #order_list
			if not order_list[d6_joker.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..d6_joker.key) end
			d6_jokers_to_inject[#d6_jokers_to_inject+1] = d6_joker
		end
	end

	--Sort by order
	table.sort(d6_jokers_to_inject, function(a, b) return a.order < b.order end)

	--Register the joker (in the sorted order)
	local curr_d6_joker_order = 1
	for _, d6_joker in pairs(d6_jokers_to_inject) do
		d6_jokers_to_inject[curr_d6_joker_order]:register(d6_joker.order)
		curr_d6_joker_order = curr_d6_joker_order + 1
	end

	--D6 Jokers pool
	SMODS.Obj_Pool{
		key = "d6_jokers",
		get_obj_pool = function(self, _type, _rarity, _legendary, _append)
			--create the pool
			G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
			local _pool, _pool_to_check, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, _append, 0

			local rarity = _rarity or pseudorandom('rarity'..G.GAME.round_resets.ante..(_append or '')) 
			rarity = (_legendary and 4) or (rarity > 0.95 and 3) or (rarity > 0.7 and 2) or 1
			_pool_to_check, _pool_key = G.P_JOKER_RARITY_POOLS[rarity], 'D6 Joker'..rarity

			local _starting_pool = {}
			for k, v in pairs(_pool_to_check) do
				if v.d6_joker or v.name == "Oops! All 6s" then _starting_pool[#_starting_pool+1] = v end
			end

			--cull the pool
			for k, v in ipairs(_starting_pool) do
				local add = true
				
				if G.GAME.used_jokers[v.key] or v.rarity == 4 then
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
				_pool[#_pool + 1] = "j_dsix_basic_die"
			end
			
			return _pool, _pool_key
		end,
	}

	SMODS.Obj_Pool{
		key = "impure_die",
		get_obj_pool = function(self, _type, _rarity, _legendary, _append)
			--create the pool
			G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
			local _pool, _pool_to_check, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, _append, 0

			_pool_to_check, _pool_key = G.P_JOKER_RARITY_POOLS[4], 'Impure Die'

			local _starting_pool = {}
			for k, v in pairs(_pool_to_check) do
				if v.impure then _starting_pool[#_starting_pool+1] = v end
			end

			--cull the pool
			for k, v in ipairs(_starting_pool) do
				local add = true
				
				if G.GAME.used_jokers[v.key] or G.GAME.used_jokers[v.pure_upgrade] then
					add = nil
				end
		
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
				_pool[#_pool + 1] = "j_dsix_impure_gutless_die"
			end
			
			return _pool, _pool_key
		end,
	}
end

return {init_func = init_d6_jokers}