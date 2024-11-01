local d6_joker_info = SMODS.D6_Joker({
	key = "casino_plus_die",
	loc_txt = {},
	pos = {x=1, y=3},
	d6_sides = {
		[1] = "the_end_side",
		[2] = "all_in_plus_side",
		[3] = "all_in_plus_side",
		[4] = "xmult_side",
		[5] = "xmult_plus_side",
		[6] = "xmult_plus_side"
	},
	rarity = 3,
	cost = 10,
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