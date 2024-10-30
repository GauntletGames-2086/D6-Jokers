local d6_joker_info = SMODS.D6_Joker({
	key = "spectral_die",
	loc_txt = {},
	d6_sides = {
		[1] = "demolish_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "nothing_side",
		[5] = "apparition_side",
		[6] = "apparition_side"
	},
	rarity = 2,
	cost = 8,
	upgrade = "j_dsix_spectral_plus_die",
	pos = {x=6, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info