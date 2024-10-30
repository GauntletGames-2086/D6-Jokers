local d6_joker_info = SMODS.D6_Joker({
	key = "party_die",
	loc_txt = {},
	pos = {x=0, y=1},
	d6_sides = {
		[1] = "drunkard_side",
		[2] = "drunkard_side",
		[3] = "cardist_side",
		[4] = "cardist_side",
		[5] = "juggler_side",
		[6] = "juggler_side"
	},
	rarity = 1,
	cost = 6,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 4,
})

return d6_joker_info