local d6_side_info = SMODS.D6_Side({
	key = "nothing_side",
	loc_txt = {},
	config = {},
	pos = {x=0, y=0},
	upgrade = "nothing_plus_side",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 1,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
}

return d6_side_info