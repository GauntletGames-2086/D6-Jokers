local d6_side_info = SMODS.D6_Side({
	key = "pure_worship_side",
	loc_txt = {},
	config = {hand_size = 6},
	atlas = "d6_side_pure",
	icon_pos = {x=7, y=5},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.hand_size}}
	end,
	add_to_deck = function(self, card, from_debuff, other)
		G.hand:change_size(self.config.hand_size)
		card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff, other, from_copy)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] or other.from_chaos then
			G.hand:change_size(-self.config.hand_size)
			card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = nil
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	pure = true,
	order = 5,
})

return d6_side_info