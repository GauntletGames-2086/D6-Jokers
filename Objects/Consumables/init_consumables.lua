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

	--""""borrowing"""" the reserve button from Cryptid
	local G_UIDEF_use_and_sell_buttons_ref=G.UIDEF.use_and_sell_buttons
	function G.UIDEF.use_and_sell_buttons(card)
		if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
			if card.config.center.d6_consumable then
				return {
					n=G.UIT.ROOT, config = {padding = -0.1,  colour = G.C.CLEAR}, nodes={
					{n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.7*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_reserve_card'}, nodes={
						{n=G.UIT.T, config={text = "RESERVE",colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
					}},
					{n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, maxw = 0.9*card.T.w - 0.15, minh = 0.1*card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'Do you know that this parameter does nothing?', func = 'can_use_consumeable'}, nodes={
						{n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
					}},
					{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
					{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
					{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
					{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
					-- Betmma can't explain it, _Mathisfun can't explain it, neither can I
				}}
			end
		end
		return G_UIDEF_use_and_sell_buttons_ref(card)
	end

	G.FUNCS.can_reserve_card = function(e)
		if #G.consumeables.cards < G.consumeables.config.card_limit then 
			e.config.colour = G.C.RED
			e.config.button = 'reserve_card'
		else
		  e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		  e.config.button = nil
		end
	end

	G.FUNCS.reserve_card = function(e)
		local c1 = e.config.ref_table
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.1,
			func = function()
			c1.area:remove_card(c1)
			c1:add_to_deck()
			if c1.children.price then c1.children.price:remove() end
			c1.children.price = nil
			if c1.children.buy_button then c1.children.buy_button:remove() end
			c1.children.buy_button = nil
			remove_nils(c1.children)
			G.consumeables:emplace(c1)
			G.GAME.pack_choices = G.GAME.pack_choices - 1
			if G.GAME.pack_choices <= 0 then
				G.FUNCS.end_consumeable(nil, delay_fac)
			end
			return true
			end
		}))
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