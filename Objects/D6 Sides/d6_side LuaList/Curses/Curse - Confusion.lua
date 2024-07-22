local d6_side_info = SMODS.D6_Side({
	key = "curse_confusion_side",
	loc_txt = {},
	config = {odds = 2},
	atlas = "d6_side_curse",
	icon_pos = {x=6, y=6},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), d6_side.extra.odds}}
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	curse = true,
	order = 5,
})

local Blind_stay_flipped_ref = Blind.stay_flipped
function Blind:stay_flipped(area, card)
	local confusion_rand = pseudorandom('confusion_side')
	if area == G.hand and #SMODS.D6_Side.get_die_info("count", "curse_confusion_side") > 0 and confusion_rand < G.GAME.probabilities.normal/2 then return true end
	return Blind_stay_flipped_ref(self, area, card)
end

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	name_config = { colour = G.C.PURPLE }
}

return d6_side_info