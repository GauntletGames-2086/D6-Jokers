local tarot_info = SMODS.Consumable({
	key = "weighted",
	set = "Tarot",
	loc_txt = {},
	pos = {x=0, y=0},
	atlas = "d6_consumables",
	cost = 3,
	discovered = true,
	can_use = function(self, card)
		local d6_joker_selected = false
		for k, v in ipairs(G.jokers.cards) do
			if v.highlighted == true and v.config.center.d6_joker and not 
			(v.ability.extra and type(v.ability.extra) == "table" and v.ability.extra.weighted_side) then 
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
		selected_card.ability.extra.weighted_side = selected_card.ability.extra.selected_d6_face
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = "d6_joker_weighted", set = "Other", vars = {3*G.GAME.probabilities.normal, 4, "[selected D6 Side]"}}
	end,
	in_pool = function(self)
		local has_d6_joker
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.d6_joker then has_d6_joker = true end
		end
		print("d6_consumable_no_d6_jokers: "..tostring((pseudorandom('d6_consumable_no_d6_jokers') >= 0.5) or has_d6_joker == true))
		if (pseudorandom('d6_consumable_no_d6_jokers') >= 0.5) or has_d6_joker == true then return true end
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