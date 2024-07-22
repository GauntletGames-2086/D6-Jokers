local d6_joker_info = SMODS.D6_Joker({
	key = "interstellar_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "moon_minus2_side",
		[2] = "moon_minus_side",
		[3] = "moon_minus_side",
		[4] = "moon_side",
		[5] = "moon_side",
		[6] = "moon_plus_side"
	},
	rarity = 3,
	cost = 10,
	pos = {x=5, y=3},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info