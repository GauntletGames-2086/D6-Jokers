local d6_side_info = SMODS.D6_Side({
	key = "pure_slayer_side",
	loc_txt = {},
	config = {score_decrease = 0.5},
	pos = {x=0, y=7}, 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.score_decrease}}
	end,
	add_to_deck = function(self, card, from_debuff, other, d6_side)
		if other.from_roll then
			G.GAME.blind.chips = G.GAME.blind.chips*(1-d6_side.extra.score_decrease)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	remove_from_deck = function(self, card, from_debuff, other, d6_side)
		if G.GAME.blind and other.from_roll == false then 
			G.GAME.blind.chips = G.GAME.blind.chips/(1-d6_side.extra.score_decrease)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	in_pool = function(self)
		return false
	end,
	pure = true,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.GREEN }
}

return d6_side_info