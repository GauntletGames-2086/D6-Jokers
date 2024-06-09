local d6_side_info = SMODS.D6_Side({
	key = "nothing_plus3_side",
	loc_txt = {
		name = "{C:attention}Nothing+++{}",
		text = {
			"{C:attention}IT DOES SOMETHING?!",
			"{C:attention}jk. Does nothing*4"
		},
		label = "Nothing+++"
	},
	config = {},
	atlas = "d6_side_nothing",
	icon_pos = {x=3, y=0},
	pos = {x=0, y=3},
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 2,
})

return d6_side_info