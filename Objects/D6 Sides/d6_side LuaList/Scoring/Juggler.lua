local d6_side_info = SMODS.D6_Side({
	key = "juggler_side",
	loc_txt = {},
	config = {hand_size = 1, triggered = true},
	pos = {x=4, y=3},
	upgrade = "juggler_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.hand_size}}
	end,
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		G.hand:change_size(d6_side.extra.hand_size or 0)
		card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] then
			G.hand:change_size(-d6_side.extra.hand_size or 0)
			card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = nil
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
	text = {},
	reminder_text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'hand_size' },
		{ text = ' Hand Size' },
	},
	reminder_text_config = { colour = G.C.ORANGE }
}

return d6_side_info