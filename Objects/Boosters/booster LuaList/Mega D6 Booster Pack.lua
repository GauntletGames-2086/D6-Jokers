local booster_info = SMODS.Booster({
	key = "mega_d6_booster_pack",
	weight = 0.25,
	cost = 8,
	config = {extra = 4, choose = 2},
	create_card = function(self, card)
		local card_to_make = nil
		if not card.ability.cards_made then card.ability.cards_made = 0 end
		if card.ability.cards_made < card.ability.extra/2 then 
			card_to_make = create_card("D6 Joker", G.pack_cards, nil, nil, true, true, nil, 'dsix_mega_booster')
		else 
			card_to_make = create_card("Dice Modifiers", G.pack_cards, nil, nil, true, true, nil, 'dsix_mega_booster')
		end
		card.ability.cards_made = card.ability.cards_made + 1
		return card_to_make
	end,
	group_key = "d6_booster_pack",
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