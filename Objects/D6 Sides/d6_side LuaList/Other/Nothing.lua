local d6_side_info = SMODS.D6_Side({
	key = "nothing_side",
	loc_txt = {
		name = "{C:attention}Nothing{}",
		text = {
			"{C:attention}Does nothing"
		},
		label = "Nothing"
	},
	config = {},
	atlas = "d6_side_nothing",
	icon_pos = {x=0, y=0},
	upgrade = "nothing_plus_side",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 1,
})

return d6_side_info