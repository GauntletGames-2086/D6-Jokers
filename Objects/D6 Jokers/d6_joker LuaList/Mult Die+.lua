local d6_joker_info = SMODS.D6_Joker({
	key = "mult_plus_die",
	loc_txt = {
		name = "Mult Die+",
		text = {
			"Just a really good basic mult",
			"die, nothing more",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "mult_minus_side",
		[2] = "mult_plus_side",
		[3] = "mult_plus_side",
		[4] = "mult_plus_side",
		[5] = "mult_plus2_side",
		[6] = "mult_plus2_side"
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