local d6_joker_info = SMODS.D6_Joker({
	key = "planet_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "planetarium_side",
		[3] = "planetarium_side",
		[4] = "planetarium_side",
		[5] = "planetarium_plus_side",
		[6] = "planetarium_plus_side"
	},
	rarity = 2,
	cost = 8,
	pos = {x=5, y=1},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info