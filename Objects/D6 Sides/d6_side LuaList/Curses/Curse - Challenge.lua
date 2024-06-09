local d6_side_info = SMODS.D6_Side({
	key = "curse_challenge_side",
	loc_txt = {
		name = "{C:purple}Curse: Challenge{}",
		text = {
			"{C:purple}Increase the current score",
			"{C:purple}requirement by {C:attention}#1#X"
		},
		label = "Curse: Challenge"
	},
	config = {score_increase = 2},
	atlas = "d6_side_curse",
	icon_pos = {x=3, y=5},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.score_increase}}
	end,
	add_to_deck = function(self, card, from_debuff, from_roll)
		if from_roll then
			G.GAME.blind.chips = G.GAME.blind.chips*2
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	remove_from_deck = function(self, card, from_debuff, from_roll)
		if G.GAME.blind and from_roll == false then 
			G.GAME.blind.chips = G.GAME.blind.chips/2
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