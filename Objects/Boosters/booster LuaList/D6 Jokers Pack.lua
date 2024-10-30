local booster_info = SMODS.Booster({
	key = "d6_jokers_pack",
	weight = 0.7,
	cost = 4,
	config = {extra = 4, choose = 1},
	create_card = function(self, card)
		return create_card("D6 Joker", G.pack_cards, nil, nil, true, true, nil, 'dsix_jokers')
	end,
	group_key = "d6_jokers_pack",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Booster.register(self)
		end
	end,
	in_pool = function(self)
		if D6Joker_ModData.config["BoosterPacks_Enabled"] then
			return true
		else
			return false
		end
	end,
	order = 1,
})

return booster_info