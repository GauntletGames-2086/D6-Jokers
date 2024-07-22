local booster_info = SMODS.Booster({
	key = "d6_support_pack",
	weight = 1,
	cost = 4,
	config = {extra = 3, choose = 1},
	discovered = true,
	create_card = function(self, card)
		return create_card("d6_consumables", G.pack_cards, nil, nil, true, true, nil, 'dsix_support')
	end,
	group_key = "d6_support_pack",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Booster.register(self)
		end
	end,
	order = 1,
})

return booster_info