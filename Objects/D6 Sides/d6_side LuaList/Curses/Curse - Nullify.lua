local d6_side_info = SMODS.D6_Side({
	key = "curse_nullify_side",
	loc_txt = {},
	config = {},
	pos = {x=4, y=6}, 
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		card.pinned = true
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		card.pinned = false
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability and G.jokers.cards[i].ability.debuffed_by_nullify then 
				G.jokers.cards[i].ability.debuffed_by_nullify = nil 
				G.jokers.cards[i].debuff = false
			end
		end
	end,
	update = function(self, card, dt, d6_side)
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i+1] end
			if G.jokers.cards[i].ability and G.jokers.cards[i].ability.debuffed_by_nullify then 
				G.jokers.cards[i].ability.debuffed_by_nullify = nil 
				G.jokers.cards[i].debuff = false
			end
		end
		if other_joker and other_joker ~= card and not other_joker.config.center.impure then
			other_joker.debuff = true
			other_joker.ability["debuffed_by_nullify"] = true
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

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.PURPLE }
}

return d6_side_info