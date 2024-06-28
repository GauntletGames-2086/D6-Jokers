local tarot_info = SMODS.Consumable({
	key = "the_die_wielder",
	set = "Tarot",
	loc_txt = {},
	pos = {x=0, y=0},
	cost = 3,
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
			local _card = create_card("d6_jokers", G.jokers, nil, nil, nil, nil, nil, 'dsix_jokers')
			_card:add_to_deck()
			G.jokers:emplace(_card)
			_card:juice_up(0.3, 0.5)
			return true end }))
		delay(0.6)
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Consumable.super.register(self)
		end
	end,
	d6_consumable = true,
	order = 1,
})

return tarot_info