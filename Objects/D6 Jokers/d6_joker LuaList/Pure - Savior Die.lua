local d6_joker_info = SMODS.D6_Joker({
	key = "pure_savior_die",
	loc_txt = {
		name = "Pure: Savior Die",
		text = {
			"The pinacle of strength and might",
			"No blind can hold it's own",
			"with this die in play"
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "pure_calmness_side",
		[2] = "pure_slayer_side",
		[3] = "pure_calmness_side",
		[4] = "pure_slayer_side",
		[5] = "pure_calmness_side",
		[6] = "pure_slayer_side"
	},
	rarity = 4,
	cost = 20,
	yes_pool_flag = "pure_joker",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info