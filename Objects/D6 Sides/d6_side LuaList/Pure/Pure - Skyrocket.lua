local d6_side_info = SMODS.D6_Side({
	key = "pure_skyrocket_side",
	loc_txt = {},
	config = {interest_buff = 3},
	atlas = "d6_side_pure",
	icon_pos = {x=2, y=6},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.interest_buff}}
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info