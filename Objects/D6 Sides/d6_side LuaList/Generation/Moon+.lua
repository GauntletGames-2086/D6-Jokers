local d6_side_info = SMODS.D6_Side({
	key = "moon_plus_side",
	loc_txt = {},
	config = {hands_leveled = 1},
	pos = {x=5, y=5}, 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.hands_leveled}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.setting_blind and not card.getting_sliced then
			local card_to_jiggle = context.blueprint_card or card
			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_all_hands')})
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
				play_sound('tarot1')
				card_to_jiggle:juice_up(0.8, 0.5)
				G.TAROT_INTERRUPT_PULSE = true
				return true end }))
			update_hand_text({delay = 0}, {mult = '+', StatusText = true})
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
				play_sound('tarot1')
				card_to_jiggle:juice_up(0.8, 0.5)
				return true end }))
			update_hand_text({delay = 0}, {chips = '+', StatusText = true})
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
				play_sound('tarot1')
				card_to_jiggle:juice_up(0.8, 0.5)
				G.TAROT_INTERRUPT_PULSE = nil
				return true end }))
			update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(card_to_jiggle, k, true, d6_side.extra.hands_leveled)
			end
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
}

return d6_side_info