local d6_joker_info = SMODS.D6_Joker({
	key = "impure_broke_die",
	loc_txt = {
		name = "Impure: Broke Die",
		text = {
			"This die was \"gifted\" to die wielders",
			"deemed responsible for the",
			"2008 housing market crash",
			"{C:inactive}(Money required after payout: {C:attention}#1#{C:inactive})"
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "curse_bankruptcy_side",
		[2] = "curse_bear_market_side",
		[3] = "curse_bankruptcy_side",
		[4] = "curse_bear_market_side",
		[5] = "curse_bankruptcy_side",
		[6] = "curse_bear_market_side"
	},
	impure = true,
	rarity = 4,
	cost = 20,
	config = {extra = {money_required = 100}},
	loc_vars = function(self, info_queue, card)
		SMODS.D6_Joker.loc_vars(self, info_queue, card)
		return {vars = {card.ability.extra.money_requiredd}}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			if G.GAME.dollars >= card.ability.extra.money_required then
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function() 
						local _card = create_card('Joker', G.jokers, nil, 0, nil, nil, "j_dsix_pure_saviour_die")
						_card:add_to_deck()
						G.jokers:emplace(_card)
						_card:start_materialize()
						G.GAME.joker_buffer = 0
						card:start_dissolve()
                        return true
                    end
				}))
			end
		end
		SMODS.D6_Joker.calculate(self, card, context)
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info