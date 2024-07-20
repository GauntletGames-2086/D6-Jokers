local init_d6_jokers = function(base_file_path)
	local d6_joker_files = NFS.getDirectoryItems(base_file_path.."/d6_joker LuaList")
	local d6_jokers_to_inject = {}
	local order_list = NFS.load(base_file_path.."/d6_jokers_config.lua")()

	--assemble list of d6_jokers_to_inject
	for k, file in pairs(d6_joker_files) do
		if string.find(file, ".lua") then
			local f, err = NFS.load(base_file_path.."/d6_joker LuaList/"..file)
			if err then sendErrorMessage("Couldn't load object from D6 Jokers: "..err); sendErrorMessage("Object path: "..tostring(base_file_path.."/d6_joker LuaList/"..file)) else
				local d6_joker = f()
				d6_joker["order"] = (order_list[d6_joker.key] and order_list[d6_joker.key].order) or #order_list
				if not order_list[d6_joker.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..d6_joker.key) end
				d6_jokers_to_inject[#d6_jokers_to_inject+1] = d6_joker
			end
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

	-- JokerDisplay support
	if _G["JokerDisplay"] then
		for _, d6_joker in pairs(d6_jokers_to_inject) do
			JokerDisplay.Definitions[d6_joker.key] = {
				calc_function = function (card)
					if card.ability.extra then
						local side_key = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]
						if side_key ~= card.joker_display_values.d6_side then
							card.joker_display_values.d6_side = side_key
							card.children.joker_display:remove_text()
							card.children.joker_display_small:remove_text()
							card.children.joker_display:remove_reminder_text()
							card.children.joker_display:remove_extra()
							if JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
								if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
									JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].text then
									card.children.joker_display:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
									card.children.joker_display_small:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].reminder_text then
									local reminder_text_config = JokerDisplay.D6_Side_Definitions[side_key].reminder_text_config or {}
									reminder_text_config.colour = reminder_text_config.colour or G.C.UI.TEXT_INACTIVE
        							reminder_text_config.scale = reminder_text_config.scale or 0.3
									card.children.joker_display:add_reminder_text(JokerDisplay.D6_Side_Definitions[side_key].reminder_text, reminder_text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].extra then
									card.children.joker_display:add_extra(JokerDisplay.D6_Side_Definitions[side_key].extra, JokerDisplay.D6_Side_Definitions[side_key].extra_config)
								end
							end
							if side_key then
								local name_config = JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] and JokerDisplay.D6_Side_Definitions[side_key].name_config or { }
								name_config.colour = name_config.colour or G.C.ORANGE
								name_config.scale = name_config.scale or 0.3
								card.children.joker_display:add_extra({{{ text = G.localization.descriptions["D6 Side"][side_key].label or "" },}}, name_config)
							end
						elseif JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
							if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
								JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
							end
						end
					end
				end
			}
		end
	end
end

return {init_func = init_d6_jokers}