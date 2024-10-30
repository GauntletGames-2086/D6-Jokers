local d6_joker_info = SMODS.D6_Joker({
	key = "tarot_die",
	loc_txt = {},
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "cartomancy_side",
		[4] = "cartomancy_side",
		[5] = "cartomancy_side",
		[6] = "cartomancy_side"
	},
	rarity = 1,
	cost = 6,
	upgrade = "j_dsix_tarot_plus_die",
	pos = {x=4, y=0},
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info