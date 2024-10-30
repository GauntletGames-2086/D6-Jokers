local d6_joker_info = SMODS.D6_Joker({
	key = "casino_die",
	loc_txt = {},
	pos = {x=1, y=2},
	d6_sides = {
		[1] = "mult_minus_side",
		[2] = "all_in_side",
		[3] = "all_in_side",
		[4] = "all_in_side",
		[5] = "xmult_side",
		[6] = "xmult_side"
	},
	rarity = 2,
	cost = 7,
	upgrade = "j_dsix_casino_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info