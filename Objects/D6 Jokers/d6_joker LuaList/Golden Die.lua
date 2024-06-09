local d6_joker_info = SMODS.D6_Joker({
	key = "golden_die",
	loc_txt = {
		name = "Golden Die",
		text = {
			"Feels like 14K gold",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "payout_side",
		[3] = "nothing_side",
		[4] = "payout_side",
		[5] = "nothing_side",
		[6] = "payout_side"
	},
	rarity = 1,
	cost = 4,
	upgrade = "golden_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 3,
})

return d6_joker_info