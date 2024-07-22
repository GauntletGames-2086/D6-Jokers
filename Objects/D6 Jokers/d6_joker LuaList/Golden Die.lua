local d6_joker_info = SMODS.D6_Joker({
	key = "golden_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "payout_side",
		[4] = "payout_side",
		[5] = "payout_side",
		[6] = "payout_side"
	},
	rarity = 1,
	cost = 4,
	upgrade = "j_dsix_golden_plus_die",
	pos = {x=7, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 3,
})

return d6_joker_info