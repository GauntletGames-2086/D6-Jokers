local d6_side_info = SMODS.D6_Side({
	key = "curse_confusion_side",
	loc_txt = {
		name = "{C:purple}Curse: Confusion{}",
		text = {
			"{C:purple}All cards drawn have a",
			"{C:green}#1# in #2#{C:purple} chance to",
			"{C:purple}be drawn face down"
		},
		label = "Curse: Confusion"
	},
	config = {odds = 2},
	atlas = "d6_side_curse",
	icon_pos = {x=4, y=5},
	pos = {x=0, y=2},
	loc_vars = function(self, info_queue)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.odds}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.after then
			local o = card:calculate({setting_blind = true, blind = G.GAME.round_resets.blind})
			if o then return o end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

local Blind_stay_flipped_ref = Blind.stay_flipped
function Blind:stay_flipped(area, card)
	if #SMODS.D6_Side.get_die_info("count", "curse_confusion_side") > 0 and pseudorandom('confusion_side') < G.GAME.probabilities.normal/2 then return true end
	return Blind_stay_flipped_ref(self, area, card)
end

return d6_side_info