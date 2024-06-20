local d6_side_info = SMODS.D6_Side({
	key = "xmult_plus_side",
	loc_txt = {},
	config = {xmult = 3},
	atlas = "d6_side_xmult",
	icon_pos = {x=1, y=2},
	pos = {x=0, y=1},
	upgrade = "mult_plus2_side",
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
	order = 4,
})

return d6_side_info