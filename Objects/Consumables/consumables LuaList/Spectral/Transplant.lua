local tarot_info = SMODS.Consumable({
	key = "transplant",
	set = "Spectral",
	loc_txt = {
		name = "Transplant",
		text = {
			"Set selected D6 Joker's die face",
			"in position 1 to die face",
			"in position 6"
		}
	},
	pos = {x=0, y=0},
	cost = 4,
	discovered = true,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker then 
				d6_joker_selected = true 
			end
		end
		return d6_joker_selected
	end,
	use = function(self, card, area, copier)
		local selected_card
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true then selected_card = v end
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			if selected_card.ability.extra.selected_d6_face == 1 then 
				SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:remove_from_deck(selected_card, nil, true)
				selected_card.ability.extra.local_d6_sides[1] = selected_card.ability.extra.local_d6_sides[6]
				SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:add_to_deck(selected_card, nil, true)
			else
				selected_card.ability.extra.local_d6_sides[1] = selected_card.ability.extra.local_d6_sides[6]
			end
            return true end }))
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return tarot_info