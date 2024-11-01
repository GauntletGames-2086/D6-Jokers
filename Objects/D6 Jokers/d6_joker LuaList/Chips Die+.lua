local d6_joker_info = SMODS.D6_Joker({
	key = "chips_plus_die",
	loc_txt = {},
	d6_sides = {
		[1] = "chips_minus_side",
		[2] = "chips_minus_side",
		[3] = "chips_side",
		[4] = "chips_side",
		[5] = "chips_plus_side",
		[6] = "chips_plus_side"
	},
	rarity = 2,
	cost = 6,
	pos = {x=1, y=1},
	in_pool = function(self, extra)
		if D6Joker_ModData.config["D6Joker_Upgrades_Shop"] then return true end
		if extra and extra.source and (extra.source == "dsix_booster" or extra.source == "dsix_jokers" or extra.source == "dsix_mega_booster") then
			return true
		end
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