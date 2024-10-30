local tarot_info = SMODS.Consumable({
	key = "lightshow",
	set = "Dice Modifiers",
	loc_txt = {},
	pos = {x=6, y=0},
	atlas = "dice_modifiers",
	cost = 3,
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
			for i, v in ipairs(selected_card.ability.extra.local_d6_sides) do
				if v.edition == nil then
					SMODS.D6_Side.set_edition({guaranteed = true}, v)
				end
			end
			play_sound('holo1', 1.2*1.58, 0.4)
            return true 
		end }))
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