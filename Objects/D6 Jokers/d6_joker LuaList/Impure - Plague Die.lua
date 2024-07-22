local d6_joker_info = SMODS.D6_Joker({
	key = "impure_plague_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "curse_confusion_side",
		[2] = "curse_concussion_side",
		[3] = "curse_confusion_side",
		[4] = "curse_concussion_side",
		[5] = "curse_confusion_side",
		[6] = "curse_infection_side"
	},
	impure = true,
	pure_upgrade = "j_dsix_pure_medical_die",
	rarity = 4,
	cost = 20,
	config = {extra = {infected_cards = 4}},
	loc_vars = function(self, info_queue, card)
		SMODS.D6_Joker.loc_vars(self, info_queue, card)
		return {vars = {card.ability.extra.infected_cards}}
	end,
	calculate = function(self, card, context)
		SMODS.D6_Joker.calculate(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			local infected_cards = {}
			for i, v in ipairs(G.jokers.cards) do
				if v.ability.dsix_infected then infected_cards[#infected_cards+1] = v end
			end
			if G.consumeables.cards then
				for i, v in ipairs(G.consumeables.cards) do
					if v.ability.dsix_infected then infected_cards[#infected_cards+1] = v end
				end
			end
			--sendDebugMessage("infected_cards: "..tostring(#infected_cards))
			if #infected_cards >= 4 then 
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function() 
						card.set_ability(card, G.P_CENTERS[card.config.center.pure_upgrade], true)
						for i = 1, #G.jokers.cards do
							if G.jokers.cards[i].ability.dsix_infected then G.jokers.cards[i].ability.dsix_infected = nil end
						end
						for i = 1, #G.consumeables.cards do
							if G.consumeables.cards[i].ability.dsix_infected then G.consumeables.cards[i].ability.dsix_infected = nil end
						end
                        return true
                    end
				}))
			end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	yes_pool_flag = "impure_joker",
	order = 1,
})

return d6_joker_info