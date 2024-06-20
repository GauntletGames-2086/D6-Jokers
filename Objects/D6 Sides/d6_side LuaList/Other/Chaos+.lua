local d6_side_info = SMODS.D6_Side({
	key = "chaos_plus_side",
	loc_txt = {},
	config = {},
	atlas = "d6_side_chaos",
	icon_pos = {x=1, y=4},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue, card)
		if not (card and card.ability.extra and card.ability.extra.chaos_selected_die) then return {vars = {localize("k_na")}}
		else 
			local selected_chaos_die = SMODS.D6_Sides[card.ability.extra.chaos_selected_die]
			local loc_vars
			if selected_chaos_die.loc_vars and type(selected_chaos_die.loc_vars) == "function" then loc_vars = selected_chaos_die:loc_vars(info_queue, card) end
			info_queue[#info_queue+1] = {key = card.ability.extra.chaos_selected_die, set = "Other", vars = loc_vars and loc_vars.vars or {}}
			return {vars = {localize{type = 'name_text', key = card.ability.extra.chaos_selected_die, set = 'Other'}}}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local viable_die_sides = {}
		for k, v in pairs(G.P_D6_SIDES) do
			if k ~= self.key and k ~= "chaos_side" and v.upgrade_level > 1 then viable_die_sides[#viable_die_sides+1] = k end
		end
		card.ability.extra["chaos_selected_die"] = pseudorandom_element(viable_die_sides, pseudoseed("chaos_selected_die"))
		if SMODS.D6_Sides[card.ability.extra.chaos_selected_die].add_to_deck and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].add_to_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:add_to_deck(card, from_debuff)
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if type(card.ability.extra) ~= "table" then sendErrorMessage("D6 Jokers print. CARD.ABILITY.EXTRA IS NOT A TABLE") else sendInfoMessage(tprint(card.ability.extra)) end
		if card.ability.extra and type(card.ability.extra) ~= "table" and card.ability.extra.chaos_selected_die ~= nil and SMODS.D6_Sides[card.ability.extra.chaos_selected_die].remove_from_deck and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].remove_from_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:remove_from_deck(card, from_debuff)
			card.ability.extra["chaos_selected_die"] = nil
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info