local d6_side_info = SMODS.D6_Side({
	key = "juggler_plus_side",
	loc_txt = {},
	config = {hand_size = 2, triggered = true},
	atlas = "d6_side_juggler",
	icon_pos = {x=5, y=3},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.hand_size}}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(self.config.hand_size)
		card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] then
			G.hand:change_size(-self.config.hand_size)
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

return d6_side_info