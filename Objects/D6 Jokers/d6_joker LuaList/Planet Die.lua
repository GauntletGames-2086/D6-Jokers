local d6_joker_info = SMODS.D6_Joker({
	key = "planet_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "planetarium_side",
		[5] = "planetarium_side",
		[6] = "planetarium_plus_side"
	},
	rarity = 1,
	cost = 8,
	upgrade = "planet_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info