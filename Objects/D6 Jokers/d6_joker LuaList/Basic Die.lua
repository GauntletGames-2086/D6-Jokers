local d6_joker_info = SMODS.D6_Joker({
	key = "basic_die",
	loc_txt = {
		name = "Basic Die",
		text = {
			"Just a basic die, nothing more",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "chips_side",
		[2] = "mult_side",
		[3] = "chips_side",
		[4] = "mult_side",
		[5] = "chips_side",
		[6] = "mult_side"
	},
	rarity = 1,
	cost = 4,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info