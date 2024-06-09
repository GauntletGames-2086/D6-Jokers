local d6_side_info = SMODS.D6_Side({
	key = "all_in_side",
	loc_txt = {
		name = "{C:attention}All In{}",
		text = {
			"{C:attention}50% chance of {C:mult}+#1#{C:attention} Mult",
			"{C:attention}50% chance of {C:mult}-#2#{C:attention} Mult"
		},
		label = "All In"
	},
	config = {mult = 40},
	atlas = "d6_side_all_in",
	icon_pos = {x=2, y=4},
	upgrade = "all_in_plus_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.mult, self.config.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local mult_chance = pseudorandom("all_in")
			if mult_chance > 0.5 then
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