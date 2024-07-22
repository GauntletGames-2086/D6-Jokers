local d6_side_info = SMODS.D6_Side({
	key = "all_in_plus_side",
	loc_txt = {},
	config = {mult = 50},
	atlas = "d6_side_all_in",
	icon_pos = {x=3, y=4},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.mult, d6_side.extra.mult}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.joker_main then
			local mult_chance = pseudorandom("all_in_plus")
			if mult_chance >= 0.5 then
				return {
					message = localize{type='variable',key='a_mult',vars={d6_side.extra.mult}},
					mult_mod = d6_side.extra.mult,
					colour = G.C.MULT
				}
			elseif mult_chance < 0.5 then
				return {
					message = localize{type='variable',key='a_mult_minus',vars={d6_side.extra.mult}},
					mult_mod = -d6_side.extra.mult,
					colour = G.C.MULT
				}
			end
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
		{ text = '-' },
		{ ref_table = 'card.joker_display_values', ref_value = 'mult' },
		{ text = ' +' },
		{ ref_table = 'card.joker_display_values', ref_value = 'mult' },
	},
	text_config = { colour = G.C.MULT },
	reminder_text = {
		{ text = '(50%)  (50%)' }
	},
	reminder_text_config = { colour = G.C.GREEN },
}

return d6_side_info