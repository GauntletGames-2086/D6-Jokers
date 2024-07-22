local d6_side_info = SMODS.D6_Side({
	key = "orbital_side",
	loc_txt = {},
	config = {count = 1},
	atlas = "d6_side_selling_self",
	icon_pos = {x=6, y=4},
	pos = {x=0, y=2},
	upgrade = "orbital_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.count}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.selling_self and not context.blueprint then
			G.E_MANAGER:add_event(Event({
				func = (function()
					--THANK YOU CRYPTID FOR AN UNSCUFFED SOLUTION I fucking hate these tags
					local tag = Tag("tag_orbital")
					local _poker_hands = {}
                    for k, v in pairs(G.GAME.hands) do
                        if v.visible then _poker_hands[#_poker_hands+1] = k end
                    end
                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed('dsix_orbital_side'))
					add_tag(tag)
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
					return true
				end)
			}))
		end
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
	reminder_text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'count' },
		{ text = ' Orbital Tag' },
	},
	reminder_text_config = { colour = G.C.SECONDARY_SET.Planet }
}

return d6_side_info