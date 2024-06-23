local d6_side_info = SMODS.D6_Side({
	key = "curse_confusion_side",
	loc_txt = {},
	config = {odds = 2},
	atlas = "d6_side_curse",
	icon_pos = {x=4, y=5},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.odds}}
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
	if #SMODS.D6_Side.get_die_info("count", "curse_confusion_side") > 0 and pseudorandom('confusion_side') < G.GAME.probabilities.normal/2 then return true end
	return Blind_stay_flipped_ref(self, area, card)
end

return d6_side_info