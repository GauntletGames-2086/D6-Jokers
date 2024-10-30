local d6_side_info = SMODS.D6_Side({
	key = "payout_plus2_side",
	loc_txt = {},
	config = {money = 20},
	pos = {x=5, y=2}, 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.money}}
	end,
	calc_dollar_bonus = function(self, card, d6_side)
		return d6_side.extra.money, true
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
		{ text = '+$' },
		{ ref_table = 'card.joker_display_values', ref_value = 'money' },
	},
	text_config = { colour = G.C.GOLD },
	reminder_text = {
		{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
	},
	calc_function = function(card)
		card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
	end
}

return d6_side_info