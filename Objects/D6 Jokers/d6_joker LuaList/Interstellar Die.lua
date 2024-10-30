local d6_joker_info = SMODS.D6_Joker({
	key = "interstellar_die",	
	loc_txt = {},
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "moon_side",
		[5] = "moon_side",
		[6] = "moon_side"
	},
	rarity = 3,
	cost = 8,
	upgrade = "j_dsix_interstellar_plus_die",
	pos = {x=5, y=2},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info