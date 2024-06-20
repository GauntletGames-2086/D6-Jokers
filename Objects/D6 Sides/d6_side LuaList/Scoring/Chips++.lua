local d6_side_info = SMODS.D6_Side({
	key = "chips_plus2_side",
	loc_txt = {},
	config = {chips = 150},
	atlas = "d6_side_chips",
	icon_pos = {x=6, y=0},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.chips}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_chips',vars={self.config.chips}},
				chip_mod = self.config.chips,
				colour = G.C.CHIPS
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 3,
})

return d6_side_info