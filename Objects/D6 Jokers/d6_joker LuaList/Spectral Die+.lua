local d6_joker_info = SMODS.D6_Joker({
	key = "spectral_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "apparition_side",
		[4] = "apparition_side",
		[5] = "apparition_side",
		[6] = "apparition_plus_side"
	},
	rarity = 3,
	cost = 10,
	pos = {x=6, y=1},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info