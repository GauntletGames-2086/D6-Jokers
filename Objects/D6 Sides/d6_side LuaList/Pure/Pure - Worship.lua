local d6_side_info = SMODS.D6_Side({
	key = "pure_worship_side",
	loc_txt = {
		name = "{C:blue}Pure: Worship{}",
		text = {
			"{C:attention}+#1#{C:blue} Hand Size",
		},
		label = "Pure: Worship"
	},
	config = {hand_size = 6},
	atlas = "d6_side_pure",
	icon_pos = {x=7, y=5},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.hand_size}}
	end,
	add_to_deck = function(self, card, from_debuff, from_roll)
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