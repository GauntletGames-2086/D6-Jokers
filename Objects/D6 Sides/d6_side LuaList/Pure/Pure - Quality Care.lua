local d6_side_info = SMODS.D6_Side({
	key = "pure_quality_care_side",
	loc_txt = {},
	config = {retriggers = 1},
	atlas = "d6_side_pure",
	icon_pos = {x=0, y=8},
	pos = {x=0, y=5},
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {self.config.retriggers}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.cardarea == G.play and context.repetition then
			return {
				message = localize('k_again_ex'),
				repetitions = d6_side.extra.retriggers,
				card = card
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	pure = true,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.GREEN },
	retrigger_function = function(card, scoring_hand, held_in_hand)
		return scoring_hand and 1 or 0
	end,
}

return d6_side_info