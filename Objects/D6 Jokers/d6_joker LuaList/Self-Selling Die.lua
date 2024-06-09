local d6_joker_info = SMODS.D6_Joker({
	key = "self_selling_die",
	loc_txt = {
		name = "Self-Selling Die",
		text = {
			"This die really doesn't want",
			"to be taking up a joker slot, huh?",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "card_pack_side",
		[2] = "card_pack_side",
		[3] = "root_beer_side",
		[4] = "root_beer_side",
		[5] = "orbital_side",
		[6] = "orbital_side"
	},
	rarity = 2,
	cost = 6,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info