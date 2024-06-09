local d6_side_info = SMODS.D6_Side({
	key = "card_pack_side",
	loc_txt = {
		name = "{C:attention}Card Pack{}",
		text = {
			"{C:attention}Gain #1# Card Pack Tag",
			"{C:attention}when this joker is sold",
			"{C:inactive}(Ethereal, Standard, etc.)"
		},
		label = "Card Pack"
	},
	config = {count = 1},
	atlas = "d6_side_selling_self",
	icon_pos = {x=4, y=4},
	upgrade = "card_pack_plus_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.count}}
	end,
	calculate = function(self, card, context)
		if context.selling_self then
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

return d6_side_info