local d6_side_info = SMODS.D6_Side({
	key = "card_pack_side",
	loc_txt = {},
	config = {count = 1},
	atlas = "d6_side_selling_self",
	icon_pos = {x=4, y=4},
	upgrade = "card_pack_plus_side",
	loc_vars = function(self, info_queue, card, d6_side)
		return {vars = {d6_side.extra.count}}
	end,
	calculate = function(self, card, context, d6_side)
		if context.selling_self and not context.blueprint then
			local total_card_pack_tags = {}
			for k, v in pairs(G.P_TAGS) do
				if v.config["type"] and v.config.type == 'new_blind_choice' and k ~= "tag_boss" then total_card_pack_tags[#total_card_pack_tags+1] = k end
			end
			if #total_card_pack_tags ~= 0 then
				local selected_tag_1 = pseudorandom_element(total_card_pack_tags, pseudoseed('card_pack_side'))
				G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag(selected_tag_1))
						play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
						play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
						return true
					end)
				}))
			end
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

D6_JokerDisplay.D6_Side_Definitions[d6_side_info.key] = {
	text = {},
	reminder_text = {
		{ text = '+' },
		{ ref_table = 'card.joker_display_values', ref_value = 'count' },
		{ text = ' Card Pack Tag' },
	},
	reminder_text_config = { colour = G.C.PURPLE }
}

return d6_side_info