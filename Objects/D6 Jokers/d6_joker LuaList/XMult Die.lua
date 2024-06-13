local d6_joker_info = SMODS.D6_Joker({
	key = "xmult_die",
	loc_txt = {
		name = "XMult Die",
		text = {
			"Just a basic xmult",
			"die, nothing more",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "nothing_side",
		[3] = "nothing_side",
		[4] = "xmult_side",
		[5] = "xmult_side",
		[6] = "xmult_side"
	},
	rarity = 1,
	cost = 6,
	upgrade = "xmult_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info