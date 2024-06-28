local d6_side_info = SMODS.D6_Side({
	key = "nothing_plus3_side",
	loc_txt = {},
	config = {xmult = 5},
	atlas = "d6_side_nothing",
	icon_pos = {x=3, y=0},
	pos = {x=0, y=3},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.config.xmult}},
				Xmult_mod = self.config.xmult,
				colour = G.C.MULT
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 2,
})

return d6_side_info