local d6_joker_info = SMODS.D6_Joker({
	key = "chips_plus_die",
	loc_txt = {
		name = "Chips Die+",
		text = {
			"Just a really good basic chips",
			"die, nothing more",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "chips_minus_side",
		[2] = "chips_plus_side",
		[3] = "chips_plus_side",
		[4] = "chips_plus_side",
		[5] = "chips_plus2_side",
		[6] = "chips_plus2_side"
	},
	rarity = 1,
	cost = 6,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info