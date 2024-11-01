local booster_info = SMODS.Booster({
	key = "d6_support_pack",
	weight = 0.4,
	cost = 4,
	config = {extra = 4, choose = 1},
	pos = {x=2, y=0},
	atlas = "d6_boosters",
	create_card = function(self, card)
		return create_card("Dice Modifiers", G.pack_cards, nil, nil, true, true, nil, 'dsix_support')
	end,
	group_key = "d6_support_pack",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Booster.register(self)
		end
	end,
	in_pool = function(self)
		if D6Joker_ModData.config["DiceModifier_Enabled"] and D6Joker_ModData.config["BoosterPacks_Enabled"] then
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.d6_joker then 
					return true 
				end
			end
			return false
		else
			return false
		end
	end,
	order = 1,
})

return booster_info