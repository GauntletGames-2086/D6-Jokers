local d6_side_info = SMODS.D6_Side({
	key = "pure_return_investment_side",
	loc_txt = {},
	config = {money_gained = 1, money_to_spend = 2},
	atlas = "d6_side_pure",
	icon_pos = {x=3, y=6},
	pos = {x=0, y=3},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.money_gained, self.config.money_to_spend}}
	end,
	calculate = function(self, card, context)
		if (context.buying_card or context.open_booster) and not context.blueprint then
			local money_to_gain = context.card.cost/self.config.money_to_spend
			ease_dollars(money_to_gain)
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('$')..money_to_gain, colour = G.C.MONEY, delay = 0.45})
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