local d6_joker_info = SMODS.D6_Joker({
	key = "casino_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "mult_minus2_side",
		[2] = "all_in_side",
		[3] = "all_in_side",
		[4] = "all_in_side",
		[5] = "xmult_side",
		[6] = "xmult_side"
	},
	rarity = 2,
	cost = 8,
	upgrade = "j_dsix_casino_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info