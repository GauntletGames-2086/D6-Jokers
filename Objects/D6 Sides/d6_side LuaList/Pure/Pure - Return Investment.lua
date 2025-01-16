local d6_side_info = SMODS.D6_Side({
	key = "pure_return_investment_side",
	loc_txt = {},
	config = {money_gained = 1, money_to_spend = 2},
	pos = {x=6, y=7}, 
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.money_gained, d6_side.extra.money_to_spend}}
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

local ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
	if to_number(mod) < 0 and #SMODS.D6_Side.get_die_info("count", "pure_return_investment_side") > 0 then ease_dollars_ref((to_number(mod)*-1)/2) end
	return ease_dollars_ref(mod, instant)
end

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.GREEN }
}

return d6_side_info