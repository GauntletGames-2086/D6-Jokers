local d6_side_info = SMODS.D6_Side({
	key = "mult_plus2_side",
	loc_txt = {},
	config = {mult = 60},
	atlas = "d6_side_mult",
	icon_pos = {x=4, y=1},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_mult',vars={self.config.mult}},
				mult_mod = self.config.mult,
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