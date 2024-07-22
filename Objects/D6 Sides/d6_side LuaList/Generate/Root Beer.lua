local d6_side_info = SMODS.D6_Side({
	key = "root_beer_side",
	loc_txt = {},
	config = {count = 1},
	atlas = "d6_side_selling_self",
	icon_pos = {x=0, y=5},
	pos = {x=0, y=4},
	upgrade = "root_beer_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.count}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.selling_self and not context.blueprint then
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag("tag_double"))
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
		{ text = ' Double Tag' },
	},
	reminder_text_config = { colour = G.C.ORANGE }
}

return d6_side_info