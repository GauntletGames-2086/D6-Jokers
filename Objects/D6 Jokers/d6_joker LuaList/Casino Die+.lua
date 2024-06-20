local d6_joker_info = SMODS.D6_Joker({
	key = "casino_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "the_end_side",
		[2] = "all_in_plus_side",
		[3] = "all_in_plus_side",
		[4] = "all_in_plus_side",
		[5] = "xmult_plus_side",
		[6] = "xmult_plus_side"
	},
	rarity = 3,
	cost = 10,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info