local d6_side_info = SMODS.D6_Side({
	key = "chips_minus_side",
	loc_txt = {
		name = "{C:attention}Chips-{}",
		text = {
			"{C:chips}-#1#{C:attention} Chips"
		},
		label = "Chips-"
	},
	config = {chips = 75},
	atlas = "d6_side_chips",
	icon_pos = {x=0, y=1},
	pos = {x=0, y=3},
	upgrade = "chips_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.chips}}
	end,
	calculate = function(self, card, context)
		if context.joker_main and SMODS.D6_Side.is_die_side(SMODS.D6_Side.get_die_info("left", nil, card), "blocker_side", card) ~= true then
			return {
				message = localize{type='variable',key='a_chips_minus',vars={self.config.chips}},
				chip_mod = -self.config.chips,
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