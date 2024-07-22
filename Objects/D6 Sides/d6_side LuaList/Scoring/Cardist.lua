local d6_side_info = SMODS.D6_Side({
	key = "cardist_side",
	loc_txt = {},
	config = {hands = 1, triggered = true},
	atlas = "d6_side_cardist",
	icon_pos = {x=6, y=3},
	upgrade = "cardist_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.hands}}
	end,
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + d6_side.extra.hands
		ease_hands_played(d6_side.extra.hands)
		card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"]then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands - d6_side.extra.hands
			ease_hands_played(-d6_side.extra.hands)
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
		{ ref_table = 'card.joker_display_values', ref_value = 'hands' },
		{ text = ' Hands' },
	},
	reminder_text_config = { colour = G.C.BLUE }
}

return d6_side_info