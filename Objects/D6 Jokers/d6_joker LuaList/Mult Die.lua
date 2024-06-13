local d6_joker_info = SMODS.D6_Joker({
	key = "mult_die",
	loc_txt = {
		name = "Mult Die",
		text = {
			"Just a basic mult",
			"die, nothing more",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "mult_side",
		[2] = "mult_side",
		[3] = "mult_side",
		[4] = "mult_plus_side",
		[5] = "mult_plus_side",
		[6] = "mult_plus_side"
	},
	rarity = 1,
	cost = 4,
	upgrade = "mult_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info