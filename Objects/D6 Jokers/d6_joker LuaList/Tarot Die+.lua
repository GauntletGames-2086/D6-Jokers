local d6_joker_info = SMODS.D6_Joker({
	key = "tarot_plus_die",
	loc_txt = {
		name = "Tarot Die+",
		text = {
			"A more compelling method",
			"of tarot reading"
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "cartomancy_side",
		[3] = "cartomancy_side",
		[4] = "cartomancy_side",
		[5] = "cartomancy_plus_side",
		[6] = "cartomancy_plus_side"
	},
	rarity = 3,
	cost = 10,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 2,
})

return d6_joker_info