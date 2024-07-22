local d6_joker_info = SMODS.D6_Joker({
	key = "mult_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "mult_side",
		[2] = "mult_side",
		[3] = "mult_side",
		[4] = "mult_plus_side",
		[5] = "mult_plus_side",
		[6] = "mult_plus_side"
	},
	rarity = 1,
	cost = 4,
	upgrade = "j_dsix_mult_plus_die",
	pos = {x=2, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info