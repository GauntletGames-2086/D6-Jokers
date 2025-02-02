local d6_joker_info = SMODS.D6_Joker({
	key = "planet_plus_die",
	loc_txt = {},
	d6_sides = {
		[1] = "demolish_side",
		[2] = "planetarium_side",
		[3] = "planetarium_side",
		[4] = "planetarium_side",
		[5] = "planetarium_plus_side",
		[6] = "planetarium_plus_side"
	},
	rarity = 2,
	cost = 8,
	pos = {x=5, y=1},
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
	order = 2,
})

return d6_joker_info