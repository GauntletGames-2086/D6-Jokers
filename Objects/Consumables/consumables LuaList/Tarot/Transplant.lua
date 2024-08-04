local tarot_info = SMODS.Consumable({
	key = "transplant",
	set = "Tarot",
	loc_txt = {},
	pos = {x=0, y=0},
	atlas = "d6_consumables",
	cost = 3,
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
		local selected_card = nil
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true then selected_card = v end
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			if selected_card.ability.extra.selected_d6_face == 1 then 
				if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key].remove_from_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key].remove_from_deck) == "function" then
					SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key]:remove_from_deck(selected_card, from_debuff, {from_roll = true}, selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face])
				end
				selected_card.ability.extra.local_d6_sides[1] = copy_table(selected_card.ability.extra.local_d6_sides[6])
				if SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key].add_to_deck and type(SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key].add_to_deck) == "function" then
					SMODS.D6_Sides[selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face].key]:add_to_deck(selected_card, from_debuff, {from_roll = true}, selected_card.ability.extra.local_d6_sides[selected_card.ability.extra.selected_d6_face])
				end
			else
				selected_card.ability.extra.local_d6_sides[1] = copy_table(selected_card.ability.extra.local_d6_sides[6])
			end
            return true end 
		}))
	end,
	in_pool = function(self)
		local has_d6_joker
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.d6_joker then has_d6_joker = true end
		end
		if has_d6_joker == true then return true else return false end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Consumable.super.register(self)
		end
	end,
	d6_consumable = true,
	order = 1,
})

return tarot_info