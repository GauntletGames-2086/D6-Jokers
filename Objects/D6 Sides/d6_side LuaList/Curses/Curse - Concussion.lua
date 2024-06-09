local d6_side_info = SMODS.D6_Side({
	key = "curse_concussion_side",
	loc_txt = {
		name = "{C:purple}Curse: Concussion{}",
		text = {
			"{C:attention}-#1#{C:purple} Hand Size",
		},
		label = "Curse: Concussion"
	},
	config = {hand_size = 2, triggered = true},
	atlas = "d6_side_curse",
	icon_pos = {x=5, y=5},
	pos = {x=0, y=3},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.hand_size}}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(-self.config.hand_size)
		self.config.triggered = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		if self.config.triggered == true then
			G.hand:change_size(self.config.hand_size)
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