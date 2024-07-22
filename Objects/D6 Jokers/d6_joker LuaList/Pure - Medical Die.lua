local d6_joker_info = SMODS.D6_Joker({
	key = "pure_medical_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "pure_booster_side",
		[2] = "pure_quality_care_side",
		[3] = "pure_booster_side",
		[4] = "pure_quality_care_side",
		[5] = "pure_booster_side",
		[6] = "pure_quality_care_side"
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