local d6_side_info = SMODS.D6_Side({
	key = "chaos_side",
	loc_txt = {},
	config = {selected_die_key = "mult_side"},
	atlas = "d6_side_chaos",
	icon_pos = {x=0, y=4},
	upgrade = "chaos_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		if not G.jokers then return {vars = {localize("k_na")}} end
		local selected_d6_side_config = SMODS.D6_Sides[d6_side.extra.selected_die_key]
		local loc_vars
		if selected_d6_side_config.loc_vars and type(selected_d6_side_config.loc_vars) == "function" then loc_vars = selected_d6_side_config:loc_vars(info_queue, card, d6_side) end
		--sendInfoMessage(d6_side.extra.selected_die_key)
		info_queue[#info_queue+1] = {key = d6_side.extra.selected_die_key, set = "Other", vars = loc_vars and loc_vars.vars or {}}
		return {vars = {localize{type = 'name_text', key = d6_side.extra.selected_die_key, set = 'Other'}}}
	end,
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		local viable_die_sides = {}
		for k, v in pairs(G.P_D6_SIDES) do
			if k ~= self.key and k ~= "chaos_plus_side" and not (v.curse or v.pure) and not v.special then viable_die_sides[#viable_die_sides+1] = k end
		end
		d6_side.extra.selected_die_key = pseudorandom_element(viable_die_sides, pseudoseed("chaos_selected_die"))
		local dummy_config = copy_table(SMODS.D6_Sides[d6_side.extra.selected_die_key].config)
		for k, v in pairs(dummy_config) do
			d6_side.extra[k] = v
		end
		if SMODS.D6_Sides[d6_side.extra.selected_die_key].add_to_deck and type(SMODS.D6_Sides[d6_side.extra.selected_die_key].add_to_deck) == "function" then
			SMODS.D6_Sides[d6_side.extra.selected_die_key]:add_to_deck(card, from_debuff, {from_chaos = true}, d6_side)
		end
	end,
	calculate = function(self, card, context, d6_side)
		if SMODS.D6_Sides[d6_side.extra.selected_die_key].calculate and type(SMODS.D6_Sides[d6_side.extra.selected_die_key].calculate) == "function" then
			local o = SMODS.D6_Sides[d6_side.extra.selected_die_key]:calculate(card, context, d6_side)
			if o then return o end
		end
	end,
	calc_dollar_bonus = function(self, card, d6_side)
		if SMODS.D6_Sides[d6_side.extra.selected_die_key].calc_dollar_bonus and type(SMODS.D6_Sides[d6_side.extra.selected_die_key].calc_dollar_bonus) == "function" then
			local o = SMODS.D6_Sides[d6_side.extra.selected_die_key]:calc_dollar_bonus(card, d6_side)
			if o then return o end
		end
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		if SMODS.D6_Sides[d6_side.extra.selected_die_key].remove_from_deck and type(SMODS.D6_Sides[d6_side.extra.selected_die_key].remove_from_deck) == "function" then
			SMODS.D6_Sides[d6_side.extra.selected_die_key]:remove_from_deck(card, from_debuff, {from_chaos = true}, d6_side)
		end
		for k, v in pairs(d6_side.extra) do
			if k ~= "selected_die_key" then d6_side.extra[k] = nil end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	name_config = { colour = G.C.UI.TEXT_INACTIVE },
	calc_function = function (card)
		local side_key = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].extra.selected_die_key
		if side_key ~= card.joker_display_values.selected_die_key then
			for k, v in pairs(card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].extra) do
				card.joker_display_values[k] = v
			end
			card.joker_display_values.selected_die_key = side_key
			card.children.joker_display:remove_text()
			card.children.joker_display_small:remove_text()
			card.children.joker_display:remove_reminder_text()
			card.children.joker_display:remove_extra()
			if D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] then
				if D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function then
					D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
				end
				if D6_JokerDisplay.D6_Side_Definitions[side_key].text then
					card.children.joker_display:add_text(D6_JokerDisplay.D6_Side_Definitions[side_key].text, D6_JokerDisplay.D6_Side_Definitions[side_key].text_config)
					card.children.joker_display_small:add_text(D6_JokerDisplay.D6_Side_Definitions[side_key].text, D6_JokerDisplay.D6_Side_Definitions[side_key].text_config)
				end
				if D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text then
					local reminder_text_config = D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text_config or {}
					reminder_text_config.colour = reminder_text_config.colour or G.C.UI.TEXT_INACTIVE
					reminder_text_config.scale = reminder_text_config.scale or 0.3
					card.children.joker_display:add_reminder_text(D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text, reminder_text_config)
				end
				if D6_JokerDisplay.D6_Side_Definitions[side_key].extra then
					card.children.joker_display:add_extra(D6_JokerDisplay.D6_Side_Definitions[side_key].extra, D6_JokerDisplay.D6_Side_Definitions[side_key].extra_config)
				end
			else
				card.children.joker_display:add_text({{ text = ' ' }})
			end
			if side_key then
				local name_config = D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] and D6_JokerDisplay.D6_Side_Definitions[side_key].name_config or { }
				name_config.colour = name_config.colour or G.C.ORANGE
				name_config.scale = name_config.scale or 0.3
				card.children.joker_display:add_extra({{{ text = G.localization.descriptions["D6 Side"][side_key].label or "" },}}, name_config)
			end
		elseif D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] then
			if D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function then
				D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
			end
		end
	end
}

return d6_side_info