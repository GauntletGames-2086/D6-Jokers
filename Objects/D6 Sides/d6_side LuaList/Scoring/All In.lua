local d6_side_info = SMODS.D6_Side({
	key = "all_in_side",
	loc_txt = {},
	config = {mult = 40, odds = 2},
	pos = {x=2, y=4},
	upgrade = "all_in_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), d6_side.extra.odds, d6_side.extra.mult}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.joker_main then
			local mult_chance = pseudorandom("all_in")
			if pseudorandom("all_in") > G.GAME.probabilities.normal/d6_side.extra.odds then
				return {
					message = localize{type='variable',key='a_mult',vars={d6_side.extra.mult}},
					mult_mod = d6_side.extra.mult,
					colour = G.C.MULT
				}, true
			end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 4,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'mult' },
		{ text = ' Nothing' },
	},
	text_config = { colour = G.C.MULT },
	reminder_text = {
		{ ref_table = 'card.joker_display_values', ref_value = 'mult_hit_odds' },
		{ text = ' ' },
		{ ref_table = 'card.joker_display_values', ref_value = 'mult_miss_odds' },
	},
	reminder_text_config = { colour = G.C.GREEN },
	calc_function = function(card)
		card.joker_display_values.mult_hit_odds = ""..(((G.GAME and G.GAME.probabilities.normal or 1)/card.joker_display_values.odds)*100).."%"
		card.joker_display_values.mult_miss_odds = ""..(1-((G.GAME and G.GAME.probabilities.normal or 1)/card.joker_display_values.odds)*100).."%"
	end,
}

return d6_side_info