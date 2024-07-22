local d6_joker_info = SMODS.D6_Joker({
	key = "pure_savior_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "pure_worship_side",
		[2] = "pure_slayer_side",
		[3] = "pure_worship_side",
		[4] = "pure_slayer_side",
		[5] = "pure_worship_side",
		[6] = "pure_slayer_side"
	},
	rarity = 4,
	cost = 20,
	yes_pool_flag = "pure_joker",
	pure = true,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info