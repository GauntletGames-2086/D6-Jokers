local d6_side_info = SMODS.D6_Side({
	key = "cartomancy_plus_side",
	loc_txt = {
		name = "{C:attention}Cartomancy+{}",
		text = {
			"{C:attention}Creates #1# {C:tarot}Tarot cards",
			"{C:attention}when die is rolled"
		},
		label = "Cartomancy+"
	},
	config = {tarot_cards_gained = 2},
	atlas = "d6_side_cartomancy",
	icon_pos = {x=1, y=3},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.tarot_cards_gained}}
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not card.getting_sliced and not context.blueprint_card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			for i = 1, self.config.tarot_cards_gained do 
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = (function()
							G.E_MANAGER:add_event(Event({
								func = function() 
									local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'cartomancy')
									card:add_to_deck()
									G.consumeables:emplace(card)
									G.GAME.consumeable_buffer = 0
									return true
								end}))
								card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
							return true
						end)}))
				end
			end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info