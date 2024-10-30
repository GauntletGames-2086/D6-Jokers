local d6_joker_info = SMODS.D6_Joker({
	key = "pure_exchange_die",
	loc_txt = {},
	d6_sides = {
		[1] = "pure_return_investment_side",
		[2] = "pure_return_investment_side",
		[3] = "pure_return_investment_side",
		[4] = "pure_skyrocket_side",
		[5] = "pure_skyrocket_side",
		[6] = "pure_skyrocket_side"
	},
	rarity = 4,
	cost = 20,
	yes_pool_flag = "pure_joker",
	in_pool = function(self)
		return false
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info