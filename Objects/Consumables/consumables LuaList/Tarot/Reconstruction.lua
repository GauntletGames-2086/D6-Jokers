local tarot_info = SMODS.Consumable({
	key = "reconstruction",
	set = "Tarot",
	loc_txt = {
		name = "Reconstruction",
		text = {
			"{C:attention}Upgrade{} selected {C:attention}D6 Joker{}",
		}
	},
	pos = {x=0, y=0},
	cost = 4,
	discovered = true,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker and v.config.center.upgrade then 
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
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
			local card = create_card('Joker', G.jokers, nil, 0, nil, nil, "j_dsix_"..selected_card.config.center.upgrade)
			selected_card:start_dissolve()
			card:add_to_deck()
			G.jokers:emplace(card)
			card:start_materialize()
            return true 
		end }))
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return tarot_info