local tarot_info = SMODS.Blind({
	key = "the_die1",
	loc_txt = {
		name = "The D1",
		text = {
			"All D6 effects roll a 1",
		}
	},
	pos = {x=0, y=0},
	discovered = true,
	boss = {min = 1, max = 10},
	atlas = "d6_blinds",
	boss_colour = HEX('a84024'),
	register = function(self, order)
		if order and order == self.order then
			SMODS.Blind.register(self)
		end
	end,
	order = 1,
})

return tarot_info