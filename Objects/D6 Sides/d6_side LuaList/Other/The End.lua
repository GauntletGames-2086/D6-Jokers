local d6_side_info = SMODS.D6_Side({
	key = "the_end_side",
	loc_txt = {
		name = "{C:attention}The End{}",
		text = {
			"{C:attention}This joker is Debuffed",
			"{C:attention}and set to Eternal",
			"{C:inactive}(Bypass {C:attention}Perishable{C:inactive})",
			"{C:inactive}(Bypass {C:attention}Blocker{C:inactive})"
		},
		label = "The End"
	},
	config = {},
	atlas = "d6_side_other",
	icon_pos = {x=7, y=1},
	upgrade = "chaos_plus_side",
	add_to_deck = function(self, card, from_debuff)
		card.ability["perma_debuff"] = true
		if card.ability.perishable == true then card.ability.perishable = nil end
		card.ability.eternal = true
	end,
	remove_frm_deck = function(self, card, from_debuff, from_roll)
		if from_roll then
			card.ability["perma_debuff"] = false
			card.ability.eternal = false
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