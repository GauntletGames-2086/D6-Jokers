local d6_side_info = SMODS.D6_Side({
	key = "moon_minus_side",
	loc_txt = {},
	config = {hands_leveled = 1, amount = 3},
	pos = {x=6, y=5},
	upgrade = "moon_side", 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.amount, d6_side.extra.hands_leveled}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.setting_blind and not card.getting_sliced then
			local available_poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible == true and v.level > 0 then table.insert(available_poker_hands, k) end
			end
			if available_poker_hands then
				for i = 1, d6_side.extra.amount or 1 do
					local selected_poker_hand = pseudorandom_element(available_poker_hands, pseudoseed("moon_side"..tostring(i)))
					card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_delevel_ex')})
					update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(selected_poker_hand, 'poker_hands'),chips = G.GAME.hands[selected_poker_hand].chips, mult = G.GAME.hands[selected_poker_hand].mult, level=d6_side.extra.hands_leveled})
					level_up_hand(card, selected_poker_hand, nil, -d6_side.extra.hands_leveled)
					update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
				end
			end
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