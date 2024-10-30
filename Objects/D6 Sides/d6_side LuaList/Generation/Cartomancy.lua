local d6_side_info = SMODS.D6_Side({
	key = "cartomancy_side",
	loc_txt = {},
	config = {tarot_cards_gained = 1},
	pos = {x=0, y=3},
	upgrade = "cartomancy_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.tarot_cards_gained}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.setting_blind and not card.getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
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
			return nil, true
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	reminder_text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'tarot_cards_gained' },
		{ text = ' Tarot' },
	},
	reminder_text_config = { colour = G.C.SECONDARY_SET.Tarot }
}

return d6_side_info