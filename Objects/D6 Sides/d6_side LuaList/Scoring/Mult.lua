local d6_side_info = SMODS.D6_Side({
	key = "mult_side",
	loc_txt = {},
	config = {mult = 4},
	atlas = "d6_side_mult",
	icon_pos = {x=2, y=1},
	upgrade = "mult_plus_side",
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