local d6_side_info = SMODS.D6_Side({
	key = "curse_bankruptcy_side",
	loc_txt = {},
	config = {money_loss = 15},
	atlas = "d6_side_curse",
	icon_pos = {x=0, y=6},
	pos = {x=0, y=4},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.money_loss}}
	end,
	calc_dollar_bonus = function(self, card)
		return -self.config.money_loss
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info