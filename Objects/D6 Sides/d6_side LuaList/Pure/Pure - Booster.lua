local d6_side_info = SMODS.D6_Side({
	key = "pure_booster_side",
	loc_txt = {},
	config = {},
	atlas = "d6_side_pure",
	icon_pos = {x=7, y=7},
	pos = {x=0, y=4},
	calculate = function(self, card, context, d6_side)
		if context.cardarea == G.jokers and context.before then
			local cards_boosted = {}
			for k, v in ipairs(context.full_hand) do
				if not table.contains(context.scoring_hand, v) then 
					cards_boosted[#cards_boosted+1] = v
					v:set_ability(G.P_CENTERS.m_dsix_boosted, nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					})) 
				end
			end
			if #cards_boosted > 0 then 
				return {
					message = localize('k_boosted_ex'),
					colour = G.C.RED,
					card = self
				}
			end
		end
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
	text = {},
	name_config = { colour = G.C.GREEN }
}

return d6_side_info