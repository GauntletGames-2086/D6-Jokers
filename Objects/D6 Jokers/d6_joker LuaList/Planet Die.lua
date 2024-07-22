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
		[6] = "planetarium_side"
	},
	rarity = 1,
	cost = 6,
	upgrade = "j_dsix_planet_plus_die",
	pos = {x=5, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info