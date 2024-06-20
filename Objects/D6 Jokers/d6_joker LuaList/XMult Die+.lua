local d6_joker_info = SMODS.D6_Joker({
	key = "xmult_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "mult_minus_side",
		[2] = "xmult_side",
		[3] = "xmult_side",
		[4] = "xmult_side",
		[5] = "xmult_plus_side",
		[6] = "xmult_plus_side"
	},
	rarity = 2,
	cost = 8,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info