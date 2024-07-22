local d6_side_info = SMODS.D6_Side({
	key = "pure_skyrocket_side",
	loc_txt = {},
	config = {interest_buff = 3},
	atlas = "d6_side_pure",
	icon_pos = {x=5, y=7},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {self.config.interest_buff}}
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	pure = true,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {
		{
			border_nodes = {
				{ text = '$X' },
				{ ref_table = 'card.joker_display_values', ref_value = 'interest_buff' },
			},
			border_colour = G.C.GOLD
		}
	},
	name_config = { colour = G.C.GREEN }
}

return d6_side_info