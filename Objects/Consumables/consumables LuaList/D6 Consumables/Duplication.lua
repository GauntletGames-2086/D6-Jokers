local tarot_info = SMODS.Consumable({
	key = "duplication",
	set = "Dice Modifiers",
	loc_txt = {},
	pos = {x=2, y=0},
	atlas = "dice_modifiers",
	cost = 4,
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
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
			local selected_d6_side = selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face]
			-- position above
			if selected_card.ability.extra.selected_d6_face == 6 then
				selected_card.ability.extra.local_d6_sides[1] = selected_d6_side
			else
				selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face+1] = selected_d6_side
			end
			--position below
			if selected_card.ability.extra.selected_d6_face == 1 then
				selected_card.ability.extra.local_d6_sides[6] = selected_d6_side
			else
				selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face-1] = selected_d6_side
			end
            return true end 
		}))
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Consumable.register(self)
		end
	end,
	in_pool = function(self)
		if D6Joker_ModData.config["DiceModifier_Enabled"] then
			return true
		else
			return false
		end
	end,
	order = 1,
})

return tarot_info