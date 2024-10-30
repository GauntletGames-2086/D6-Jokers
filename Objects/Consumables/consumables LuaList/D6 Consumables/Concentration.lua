local tarot_info = SMODS.Consumable({
	key = "concentration",
	set = "Dice Modifiers",
	loc_txt = {},
	pos = {x=4, y=0},
	atlas = "dice_modifiers",
	cost = 4,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker then 
				for i, v in ipairs(v.ability.extra.local_d6_sides) do
					if SMODS.D6_Sides[v.key].upgrade then d6_joker_selected = true end
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
			for i, v in ipairs(selected_card.ability.extra.local_d6_sides) do
				local d6_side_config = SMODS.D6_Sides[v.key]
				if d6_side_config.upgrade then
					local d6_side_edition = selected_card.ability.extra.local_d6_sides[i].edition
					selected_card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = d6_side_config.upgrade}, edition = {forced_edition = d6_side_edition and d6_side_edition.key or nil}})
				end
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
