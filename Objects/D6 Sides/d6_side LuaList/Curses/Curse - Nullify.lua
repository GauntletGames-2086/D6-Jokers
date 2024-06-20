local d6_side_info = SMODS.D6_Side({
	key = "curse_nullify_side",
	loc_txt = {
		name = "{C:purple}Curse: Nullify{}",
		text = {
			"{C:purple}This Joker is {C:attention}Pinned",
			"{C:purple}The Joker to the right",
			"{C:purple}is {C:attention}Debuffed",
		},
		label = "Curse: Nullify"
	},
	config = {},
	atlas = "d6_side_curse",
	icon_pos = {x=2, y=5},
	pos = {x=0, y=0},
	add_to_deck = function(self, card, from_debuff, from_roll)
		card.pinned = true
	end,
	remove_from_deck = function(self, card, from_debuff, from_roll)
		card.pinned = false
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability and G.jokers.cards[i].ability.debuffed_by_nullify then 
				G.jokers.cards[i].ability.debuffed_by_nullify = nil 
				G.jokers.cards[i].debuff = false
			end
		end
	end,
	update = function(self, card, dt)
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
	order = 5,
})

return d6_side_info