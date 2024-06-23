local d6_side_info = SMODS.D6_Side({
	key = "curse_challenge_side",
	loc_txt = {},
	config = {score_increase = 2.5},
	atlas = "d6_side_curse",
	icon_pos = {x=3, y=5},
	pos = {x=0, y=1},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.score_increase}}
	end,
	add_to_deck = function(self, card, from_debuff, other)
		if other.from_roll then
			G.GAME.blind.chips = G.GAME.blind.chips*self.config.score_increase
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	remove_from_deck = function(self, card, from_debuff, other)
		if G.GAME.blind and other.from_roll == false then 
			G.GAME.blind.chips = G.GAME.blind.chips/self.config.score_increase
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	curse = true,
	order = 5,
})

return d6_side_info