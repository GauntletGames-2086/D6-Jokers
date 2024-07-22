-- D6-Jokers: Override
local tarot_info = SMODS.Consumable({
	key = "override",
	set = "Spectral",
	loc_txt = {},
	pos = {x=0, y=0},
	cost = 4,
	discovered = true,
	config = {extra = {selected_d6_face = 1, local_d6_sides = {}}},
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "nothing_side",
		[5] = "nothing_side",
		[6] = "nothing_side"
	},
	set_ability = function(self, card, initial, delay_sprites)
		for i = 1, #card.config.center.d6_sides do
			card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = self.d6_sides[i]}}) 
		end
		card.ability.extra.selected_d6_face = math.clamp(1, math.round(pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
		local _pool, _pool_key = SMODS.Obj_Pools["d6_sides"]:get_obj_pool("D6 Side")
		for i = 1, #card.ability.extra.local_d6_sides do
			local selected_d6_side = pseudorandom_element(_pool, pseudoseed("override".._pool_key))
			card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = selected_d6_side}})
		end
	end,
	loc_vars = function(self, info_queue, card)
		local total_die_faces = {}
		for _, v in ipairs(card.ability.extra.local_d6_sides) do
			if not total_die_faces[v.key] then total_die_faces[v.key] = v end
		end
		total_die_faces[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key] = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]
		for k, v in pairs(total_die_faces) do
			local d6_side_config = SMODS.D6_Sides[k]
			local loc_vars
			if d6_side_config.loc_vars and type(d6_side_config.loc_vars) == "function" then loc_vars = d6_side_config:loc_vars(info_queue, card, v) end
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
			--sendInfoMessage("Override being handled")
			local selected_d6_face_key = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key
			for i = 1, #selected_card.ability.extra.local_d6_sides do
				if i == card.ability.extra.selected_d6_face then 
					if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key].remove_from_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key].remove_from_deck) == "function" then
						SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key]:remove_from_deck(selected_card, from_debuff, {from_roll = true}, selected_card.ability.extra.local_d6_sides[i])
					end
					selected_card.ability.extra.local_d6_sides[i] = copy_table(card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
					if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key].add_to_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key].add_to_deck) == "function" then
						SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[i].key]:add_to_deck(selected_card, from_debuff, {from_roll = true}, selected_card.ability.extra.local_d6_sides[i])
					end
				else
					selected_card.ability.extra.local_d6_sides[i] = copy_table(card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
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