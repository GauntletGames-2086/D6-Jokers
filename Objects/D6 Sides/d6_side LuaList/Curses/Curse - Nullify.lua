local d6_side_info = SMODS.D6_Side({
	key = "curse_nullify_side",
	loc_txt = {
		name = "{C:purple}Curse: Nullify{}",
		text = {
			"{C:purple}This Joker is {C:attention}Pinned",
			"{C:purple}The joker to the left",
			"{C:purple}is {C:attention}Debuffed",
			"{C:purple}for the rest of the blind",
		},
		label = "Curse: Nullify"
	},
	config = {},
	atlas = "d6_side_curse",
	icon_pos = {x=2, y=5},
	pos = {x=0, y=0},
	add_to_deck = function(self, card, from_debuff, from_roll)
		card.pinned = true
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i+1] end
		end
		if other_joker and other_joker ~= card then
			other_joker.debuff = true
		end
	end,
	remove_from_deck = function(self, card, from_debuff, from_roll)
		card.pinned = false
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info