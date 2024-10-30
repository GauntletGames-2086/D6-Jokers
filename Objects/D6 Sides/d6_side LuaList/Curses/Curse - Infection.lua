local d6_side_info = SMODS.D6_Side({
	key = "curse_infection_side",
	loc_txt = {},
	config = {},
	pos = {x=4, y=6}, 
	calculate = function(self, card, context, d6_side)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			--sendInfoMessage("handling infection")
			local available_cards = {}
			for i, v in ipairs(G.jokers.cards) do
				if not v.ability.dsix_infected and v ~= card and not (v.config.center.pure or v.config.center.impure) then available_cards[#available_cards+1] = v end
			end
			for i, v in ipairs(G.consumeables.cards) do
				if not (v.ability and v.ability.dsix_infected) and v ~= card and not v.config.center.pure then available_cards[#available_cards+1] = v end
			end
			if #available_cards > 0 then
				local selected_card = pseudorandom_element(available_cards, pseudoseed("curse_infection"))
				selected_card.ability.dsix_infected = true
			end
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_dsix_infected'), colour = G.C.GREEN})
			return nil, true
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	in_pool = function(self)
		return false
	end,
	curse = true,
	order = 5,
})

local get_type_colour_ref = get_type_colour
function get_type_colour(_c, card)
	local orig_return = get_type_colour_ref(_c, card)
	if card.ability and card.ability.dsix_infected then return mix_colours(G.C.GREEN, G.C.GREY, 0.7)
	else return orig_return end
end

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.PURPLE }
}

return d6_side_info