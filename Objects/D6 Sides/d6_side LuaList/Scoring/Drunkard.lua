local d6_side_info = SMODS.D6_Side({
	key = "drunkard_side",
	loc_txt = {},
	config = {discards = 1, triggered = true},
	pos = {x=2, y=3},
	upgrade = "drunkard_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.discards}}
	end,
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + d6_side.extra.discards
		ease_discard(d6_side.extra.discards)
		d6_side.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards - d6_side.extra.discards
			ease_discard(-d6_side.extra.discards)
			d6_side.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = nil
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
		{ ref_table = 'card.joker_display_values', ref_value = 'discards' },
		{ text = ' Discards' },
	},
	reminder_text_config = { colour = G.C.RED }
}

return d6_side_info