local d6_side_info = SMODS.D6_Side({
	key = "curse_bear_market_side",
	loc_txt = {},
	config = {money_loss = 15},
	atlas = "d6_side_curse",
	icon_pos = {x=1, y=6},
	pos = {x=0, y=5},
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	curse = true,
	order = 5,
})

local GFUNCSevaluate_round_ref = G.FUNCS.evaluate_round
G.FUNCS.evaluate_round = function()
	if #SMODS.D6_Side.get_die_info("count", "curse_bear_market_side") > 0 then
		G.E_MANAGER:add_event(Event({
			trigger = 'before',
			delay = 1.3*math.min(G.GAME.blind.dollars+2, 7)/2*0.15 + 0.5,
			func = function()
			  G.GAME.blind:defeat()
			  return true
			end
		  }))
		delay(0.2)
		G.E_MANAGER:add_event(Event({
			func = function()
				ease_background_colour_blind(G.STATES.ROUND_EVAL, '')
				return true
			end
		}))
		add_round_eval_row({name = 'bottom', dollars = 0})
	else
		GFUNCSevaluate_round_ref()
	end
end

return d6_side_info