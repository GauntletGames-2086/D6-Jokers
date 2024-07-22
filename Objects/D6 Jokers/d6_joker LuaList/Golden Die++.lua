local d6_joker_info = SMODS.D6_Joker({
	key = "golden_plus2_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "payout_side",
		[2] = "payout_plus_side",
		[3] = "payout_plus_side",
		[4] = "payout_plus_side",
		[5] = "payout_plus_side",
		[6] = "payout_plus2_side"
	},
	rarity = 3,
	cost = 10,
	pos = {x=7, y=2},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 3,
})

return d6_joker_info