local d6_side_info = SMODS.D6_Side({
	key = "curse_bankruptcy_side",
	loc_txt = {},
	config = {money_loss = 25},
	pos = {x=2, y=7}, 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.money_loss}}
	end,
	calc_dollar_bonus = function(self, card, d6_side)
		return -d6_side.extra.money_loss, true
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	in_pool = function(self)
		return false
	end,
	curse = true,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {
		{ text = '-$' },
		{ ref_table = 'card.joker_display_values', ref_value = 'money_loss' },
	},
	text_config = { colour = G.C.GOLD },
	reminder_text = {
		{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
	},
	name_config = { colour = G.C.PURPLE },
	calc_function = function(card)
		card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
	end
}

return d6_side_info