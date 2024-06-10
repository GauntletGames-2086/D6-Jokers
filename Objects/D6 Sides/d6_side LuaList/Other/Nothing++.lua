local d6_side_info = SMODS.D6_Side({
	key = "nothing_plus2_side",
	loc_txt = {
		name = "{C:attention}Nothing++{}",
		text = {
			"{C:attention}Does nothing*3"
		},
		label = "Nothing++"
	},
	config = {},
	atlas = "d6_side_nothing",
	icon_pos = {x=2, y=0},
	pos = {x=0, y=2},
	upgrade = "nothing_plus3_side",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 2,
})

return d6_side_info