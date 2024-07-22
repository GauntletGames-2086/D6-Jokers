local d6_side_info = SMODS.D6_Side({
	key = "chips_minus2_side",
	loc_txt = {},
	config = {chips = 100},
	atlas = "d6_side_chips",
	icon_pos = {x=1, y=1},
	pos = {x=0, y=4},
	upgrade = "chips_minus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.chips}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_chips_minus',vars={d6_side.extra.chips}},
				chip_mod = -d6_side.extra.chips,
				colour = G.C.CHIPS
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 3,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {
		{ text = '-' },
		{ ref_table = 'card.joker_display_values', ref_value = 'chips' },
	},
	text_config = { colour = G.C.CHIPS },
}

return d6_side_info