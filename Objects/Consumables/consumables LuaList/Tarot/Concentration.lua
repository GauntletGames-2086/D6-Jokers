local tarot_info = SMODS.Consumable({
	key = "concentration",
	set = "Tarot",
	loc_txt = {},
	pos = {x=0, y=0},
	cost = 3,
	discovered = true,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker then 
				for i, k in ipairs(v.ability.extra.local_d6_sides) do
					if SMODS.D6_Sides[k].upgrade then d6_joker_selected = true end
				end
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
			for i, k in ipairs(selected_card.ability.extra.local_d6_sides) do
				local d6_side_config = SMODS.D6_Sides[k]
				if d6_side_config.upgrade then
					selected_card.ability.extra.local_d6_sides[i] = d6_side_config.upgrade
				end
			end
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