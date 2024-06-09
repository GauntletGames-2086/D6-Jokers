local d6_side_info = SMODS.D6_Side({
	key = "drunkard_side",
	loc_txt = {
		name = "{C:attention}Drunkard{}",
		text = {
			"{C:attention}Gain {C:red}+#1#{C:attention} discard",
			"{C:attention}when die is rolled",
		},
		label = "Drunkard"
	},
	config = {discards = 1, triggered = true},
	atlas = "d6_side_drunkard",
	icon_pos = {x=2, y=3},
	upgrade = "drunkard_plus_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.discards}}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.config.discards
		ease_discard(self.config.discards)
		card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		if card.ability.extra[self.key..tostring(card.ability.extra.selected_d6_face).."_triggered"] then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards - self.config.discards
			ease_discard(-self.config.discards)
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