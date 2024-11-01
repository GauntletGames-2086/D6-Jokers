local d6_joker_info = SMODS.D6_Joker({
	key = "interstellar_plus_die",
	loc_txt = {},
	d6_sides = {
		[1] = "moon_minus2_side",
		[2] = "moon_minus_side",
		[3] = "moon_side",
		[4] = "moon_side",
		[5] = "moon_side",
		[6] = "moon_plus_side",
	},
	rarity = 3,
	cost = 10,
	pos = {x=5, y=3},
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