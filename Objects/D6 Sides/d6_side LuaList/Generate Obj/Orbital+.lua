local d6_side_info = SMODS.D6_Side({
	key = "orbital_plus_side",
	loc_txt = {
		name = "{C:attention}Orbital+{}",
		text = {
			"{C:attention}Gain #1# Orbital Tag",
			"{C:attention}when this joker is sold",
		},
		label = "Orbital+"
	},
	config = {count = 2},
	atlas = "d6_side_selling_self",
	icon_pos = {x=7, y=4},
	pos = {x=0, y=3},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.count}}
	end,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag("tag_orbital", false, 'Small'))
					add_tag(Tag("tag_orbital", false, 'Big'))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
					return true
				end)
			}))
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