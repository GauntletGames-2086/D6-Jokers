local d6_joker_info = SMODS.D6_Joker({
	key = "chaos_die",
	loc_txt = {
		name = "Chaos Die",
		text = {
			"Unstable, prone to",
			"increased randomness",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "chaos_side",
		[2] = "chaos_side",
		[3] = "chaos_side",
		[4] = "chaos_side",
		[5] = "chaos_side",
		[6] = "chaos_side"
	},
	rarity = 2,
	cost = 8,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 4,
})

return d6_joker_info