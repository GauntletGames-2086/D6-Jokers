local d6_side_info = SMODS.D6_Side({
	key = "the_end_side",
	loc_txt = {},
	config = {},
	atlas = "d6_side_other",
	icon_pos = {x=7, y=1},
	add_to_deck = function(self, card, from_debuff)
		card.ability["perma_debuff"] = true
		if card.ability.perishable == true then card.ability.perishable = nil end
		card.ability.eternal = true
	end,
	remove_from_deck = function(self, card, from_debuff, other)
		if other.from_roll then
			card.ability["perma_debuff"] = false
			card.ability.eternal = false
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