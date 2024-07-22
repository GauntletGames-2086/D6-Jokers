local d6_joker_info = SMODS.D6_Joker({
	key = "chips_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "chips_side",
		[4] = "chips_side",
		[5] = "chips_plus_side",
		[6] = "chips_plus_side"
	},
	rarity = 1,
	cost = 4,
	upgrade = "j_dsix_chips_plus_die",
	pos = {x=1, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info