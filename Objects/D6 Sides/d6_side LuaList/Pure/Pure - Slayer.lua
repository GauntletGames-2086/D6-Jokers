local d6_side_info = SMODS.D6_Side({
	key = "pure_slayer_side",
	loc_txt = {
		name = "{C:blue}Pure: Slayer{}",
		text = {
			"{C:blue}Decrease the current score",
			"{C:blue}requirement by {C:attention}#1#X"
		},
		label = "Pure: Slayer"
	},
	config = {score_decrease = 0.25},
	atlas = "d6_side_pure",
	icon_pos = {x=6, y=5},
	pos = {x=0, y=0},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.score_decrease}}
	end,
	add_to_deck = function(self, card, from_debuff, from_roll)
		if from_roll then
			G.GAME.blind.chips = G.GAME.blind.chips*(1-self.config.score_decrease)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	remove_from_deck = function(self, card, from_debuff, from_roll)
		if G.GAME.blind and from_roll == false then 
			G.GAME.blind.chips = G.GAME.blind.chips/(1-self.config.score_decrease)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info