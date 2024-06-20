local d6_side_info = SMODS.D6_Side({
	key = "payout_plus2_side",
	loc_txt = {},
	config = {money = 24},
	atlas = "d6_side_payout",
	icon_pos = {x=5, y=2},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.money}}
	end,
	calc_dollar_bonus = function(self, card)
		return self.config.money
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 4,
})

return d6_side_info