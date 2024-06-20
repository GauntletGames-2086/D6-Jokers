local d6_side_info = SMODS.D6_Side({
	key = "mult_minus2_side",
	loc_txt = {},
	config = {mult = 60},
	atlas = "d6_side_mult",
	icon_pos = {x=6, y=1},
	pos = {x=0, y=4},
	upgrade = "mult_minus_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main and SMODS.D6_Side.is_die_side(SMODS.D6_Side.get_die_info("left", nil, card), "blocker_side", card) ~= true then
			return {
				message = localize{type='variable',key='a_mult_minus',vars={self.config.mult}},
				mult_mod = -self.config.mult,
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