local d6_side_info = SMODS.D6_Side({
	key = "mult_side",
	loc_txt = {},
	config = {mult = 4},
	atlas = "d6_side_mult",
	icon_pos = {x=2, y=1},
	upgrade = "mult_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.mult}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_mult',vars={d6_side.extra.mult}},
				mult_mod = d6_side.extra.mult,
				colour = G.C.MULT
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 4,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'mult' },
	},
	text_config = { colour = G.C.MULT },
}

return d6_side_info