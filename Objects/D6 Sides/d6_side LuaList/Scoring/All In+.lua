local d6_side_info = SMODS.D6_Side({
	key = "all_in_plus_side",
	loc_txt = {},
	config = {mult = 80},
	atlas = "d6_side_all_in",
	icon_pos = {x=3, y=4},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.mult, self.config.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local mult_chance = pseudorandom("all_in_plus")
			if mult_chance >= 0.5 then
				return {
					message = localize{type='variable',key='a_mult',vars={self.config.mult}},
					mult_mod = self.config.mult,
					colour = G.C.MULT
				}
			elseif mult_chance < 0.5 and SMODS.D6_Side.is_die_side(SMODS.D6_Side.get_die_info("left", nil, card), "blocker_side", card) ~= true then
				return {
					message = localize{type='variable',key='a_mult_minus',vars={self.config.mult}},
					mult_mod = -self.config.mult,
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

return d6_side_info