local tarot_info = SMODS.Consumable({
	key = "override",
	set = "Spectral",
	loc_txt = {},
	pos = {x=0, y=0},
	cost = 4,
	discovered = true,
	config = {extra = {selected_d6_face = 1}},
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "nothing_side",
		[5] = "nothing_side",
		[6] = "nothing_side"
	},
	inject = function(self)
		-- call the parent function to ensure all pools are set
		self.super.inject(self)
		if not self.config["extra"] then self.config.extra = {} end
		self.config.extra["local_d6_sides"] = copy_table(self.d6_sides)
	end,
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.extra.selected_d6_face = pseudorandom("d6_consumable"..self.key, 1, 6)
		local _pool, _pool_key = SMODS.Obj_Pools["d6_sides"]:get_obj_pool("D6 Side")
		if not card.ability.extra.local_d6_sides then card.ability.extra.local_d6_sides = copy_table(self.d6_sides) end
		for i = 1, #card.ability.extra.local_d6_sides do
			card.ability.extra.local_d6_sides[i] = pseudorandom_element(_pool, pseudoseed("override".._pool_key))
		end
	end,
	loc_vars = function(self, info_queue, card)
		local total_die_faces = {}
		for _, v in ipairs(card.ability.extra.local_d6_sides) do
			if not total_die_faces[v] then total_die_faces[v] = 1
			else total_die_faces[v] = total_die_faces[v] + 1 end
		end
		for k, v in pairs(total_die_faces) do
			local d6_side_config = SMODS.D6_Side:get_obj(k)
			local loc_vars
			if d6_side_config.loc_vars and type(d6_side_config.loc_vars) == "function" then loc_vars = d6_side_config:loc_vars(info_queue, card) end
			info_queue[#info_queue+1] = {key = k, set = "Other", vars = loc_vars and loc_vars.vars or {}}
		end
	end,
	calculate = function(self, card, context)
		if not card.debuff then 
			--D6 Joker logic without setting effects
			if context.setting_blind and not card.getting_sliced and not context.blueprint_card then
				card.ability.extra.selected_d6_face = pseudorandom("d6_consumable"..card.config.center.key, 1, 6)
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='d6_joker_roll',vars={card.ability.extra.selected_d6_face}}, colour = G.C.BLUE})

				if #SMODS.find_card("j_oops") > 0 and card.ability.extra.selected_d6_face ~= 6 then 
					local oops_card = nil
					for i, v in ipairs(G.jokers.cards) do
						if v.config.center_key == "j_oops" then oops_card = v; break end 
					end
					card_eval_status_text(oops_card, 'extra', nil, nil, nil, {message = localize('k_oops'), colour = G.C.GREEN})
					card.ability.extra.selected_d6_face = 6
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='d6_joker_roll',vars={card.ability.extra.selected_d6_face}}, colour = G.C.BLUE})
				end
			end
		end
	end,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker then 
				d6_joker_selected = true 
			end
		end
		return d6_joker_selected
	end,
	use = function(self, card, area, copier)
		local selected_card = nil
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true then selected_card = v end
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			sendInfoMessage("Override being handled")
			local selected_d6_face_key = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]
			for i = 1, #selected_card.ability.extra.local_d6_sides do
				if i == card.ability.extra.selected_d6_face then 
					if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]].remove_from_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]].remove_from_deck) == "function" then
						SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]]:remove_from_deck(selected_card, from_debuff, {from_roll = true})
					end
					selected_card.ability.extra.local_d6_sides[i] = selected_d6_face_key
					if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]].add_to_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]].add_to_deck) == "function" then
						SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i]]:add_to_deck(selected_card, from_debuff, {from_roll = true})
					end
				else
					selected_card.ability.extra.local_d6_sides[i] = selected_d6_face_key
				end
			end
            return true end }))
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Consumable.super.register(self)
		end
	end,
	d6_consumable = true,
	order = 1,
})

return tarot_info