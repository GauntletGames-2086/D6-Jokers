local d6_side_info = SMODS.D6_Side({
	key = "demolish_side",
	loc_txt = {},
	config = {consumable_slots_removed = 0},
	pos = {x=7, y=0},
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		G.E_MANAGER:add_event(Event({
            func = function() 
				d6_side.extra.consumable_slots_removed = G.consumeables.config.card_limit

				for i, v in ipairs(G.consumeables.cards) do
					v:start_dissolve(nil, i ~= 1, 1.6)
					if v.edition and v.edition.card_limit then 
						d6_side.extra.consumable_slots_removed = d6_side.extra.consumable_slots_removed - 1 
					end
				end

				G.consumeables:change_size(-d6_side.extra.consumable_slots_removed or 0)
			return true end
		}))
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		G.E_MANAGER:add_event(Event({
            func = function() 
				G.consumeables:change_size(d6_side.extra.consumable_slots_removed or 0)
			return true end
		}))
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
}

return d6_side_info