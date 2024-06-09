local d6_joker_info = SMODS.D6_Joker({
	key = "insurance_die",
	loc_txt = {
		name = "Insurance Die",
		text = {
			"Not very reliable, but",
			"gets the job done",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "blocker_side",
		[3] = "nothing_side",
		[4] = "blocker_side",
		[5] = "nothing_side",
		[6] = "blocker_side"
	},
	rarity = 2,
	cost = 6,
	upgrade = "insurance_plus_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info