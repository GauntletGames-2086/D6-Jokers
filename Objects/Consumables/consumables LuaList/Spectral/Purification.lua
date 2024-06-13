local tarot_info = SMODS.Consumable({
	key = "purification",
	set = "Spectral",
	loc_txt = {
		name = "Purification",
		text = {
			"Spawn an {C:legendary}Impure{} die"
		}
	},
	pos = {x=0, y=0},
	discovered = true,
	can_use = function(self, card)
		if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
			return true
		else
			return false
		end
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
			local valid_keys = {}
			for k, v in pairs(SMODS.D6_Jokers) do
				if v.impure then valid_keys[#valid_keys+1] = k end
			end
            local _card = create_card('Joker', G.jokers, nil, nil, nil, nil, pseudorandom_element(valid_keys, pseudoseed("purification_impure_spawn")))
            _card:add_to_deck()
            G.jokers:emplace(_card)
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return tarot_info