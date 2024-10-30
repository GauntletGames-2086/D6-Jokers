--- STEAMODDED HEADER
--- MOD_NAME: D6 Jokers
--- MOD_ID: D6Joker
--- MOD_AUTHOR: [ItsFlowwey]
--- MOD_DESCRIPTION: Adds D6 Jokers that have their effects determined by a die roll. 
--- PREFIX: dsix
--- VERSION: 0.7.2
--- PRIORITY: -100
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1030c]

----------------------------------------------
------------MOD CODE -------------------------

D6Joker_ModData = SMODS.current_mod
local mod_path = D6Joker_ModData.path
--D6 Side UI
SMODS.Atlas{key = "d6_side_icons", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_side_icons.png"}
--Object Art
SMODS.Atlas{key = "d6_jokers", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_jokers_atlas.png"}
SMODS.Atlas{key = "d6_boosters", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_boosters.png"}
SMODS.Atlas{key = "dice_modifiers", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_consumables.png"}
SMODS.UndiscoveredSprite{key = 'Dice Modifier', atlas = 'dsix_d6_consumables', pos = {x=1, y=0}}
SMODS.Atlas{key = "booster_enhancement", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "boosted_enhancement.png"}
--Other
SMODS.Atlas{key = "modicon", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_jokers_mod_tag.png"}
-- Shaders
SMODS.Shader{key = 'infected', path = 'infected.fs'}
SMODS.Shader{key = 'darken', path = 'darken.fs'}
SMODS.Shader{key = 'polychrome_darken', path = 'polychrome_darken.fs'}
SMODS.Shader{key = 'holo_darken', path = 'holo_darken.fs'}
SMODS.Shader{key = 'foil_darken', path = 'foil_darken.fs'}
SMODS.Shader{key = 'foil_light', path = 'd6_side_foil.fs'}
-- Modded compat shaders
SMODS.Shader{key = 'glitched_darken', path = 'glitched_darken.fs'} -- Cryptid (based on Glitched Edition shader)
SMODS.Shader{key = 'oversat_darken', path = 'oversat_darken.fs'} -- Cryptid (based on Oversaturated Edition shader)

-- SMODS.D6_Sides API. 
SMODS.D6_Sides = {}
SMODS.D6_Side = SMODS.GameObject:extend {
	obj_table = SMODS.D6_Sides,
	obj_buffer = {},
	required_params = {
		'key',
	},
	loc_txt = {},
	set = "D6 Side",
	atlas = "d6_side_icons",
	config = {},
	pos = { x = 0, y = 0 },
	unlocked = true,
	discovered = true,
	reverse_lookup_name = {},
	prefix_config = {key = false},
	valid_editions = {"e_foil", "e_holo", "e_polychrome"},
	pre_inject_class = function(self)
		G.P_D6_SIDES = {}
		G.P_CENTER_POOLS[self.set] = {}
		G.P_D6_EDITIONS = {
			e_polychrome = {
				config = {xmult = 1.5},
				key = "e_polychrome",
				shaders = {
					lighten = "polychrome",
					darken = "dsix_polychrome_darken",
				},
				loc_vars = function(self, info_queue, card, edition)
					info_queue[#info_queue+1] = {key = "d6_side_edition_polychrome", set = "Other", vars = {edition.config.xmult}}
				end
			},
			e_holo = {
				config = {mult = 10},
				key = "e_holo",
				shaders = {
					lighten = "holo",
					darken = "dsix_holo_darken",
				},
				loc_vars = function(self, info_queue, card, edition)
					info_queue[#info_queue+1] = {key = "d6_side_edition_holo", set = "Other", vars = {edition.config.mult}}
				end
			},
			e_foil = {
				config = {chips = 50},
				key = "e_foil",
				shaders = {
					lighten = "dsix_foil_light",
					darken = "dsix_foil_darken",
				},
				loc_vars = function(self, info_queue, card, edition)
					info_queue[#info_queue+1] = {key = "d6_side_edition_foil", set = "Other", vars = {edition.config.chips}}
				end
			}
		}
		if SMODS.Mods["Cryptid"] and SMODS.Mods["Cryptid"].can_load then 
			load_compat("Cryptid")
		end
	end,
	inject = function(self)
		G.P_D6_SIDES[self.key] = self
		SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
		self.reverse_lookup_name[G.localization.descriptions["D6 Side"][self.key:lower()].label or self.loc_txt.label] = self.key
	end,
	process_loc_text = function(self)
		--Creates the tooltip info
		SMODS.process_loc_text(G.localization.descriptions.Other, self.key, {
			name = G.localization.descriptions["D6 Side"][self.key:lower()].label or self.loc_txt.label, 
			text = G.localization.descriptions["D6 Side"][self.key:lower()].text or self.loc_txt.text
		})
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		local target = { type = 'descriptions', key = self.key, set = self.set, nodes = desc_nodes, vars =
		specific_vars }
		local res = {}
		if self.loc_vars and type(self.loc_vars) == 'function' then
			res = self:loc_vars(info_queue, card, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
			target.vars = res.vars or target.vars
			target.key = res.key or target.key
		end
		full_UI_table.name = localize{type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name}
		if res.main_start then
			desc_nodes[#desc_nodes + 1] = res.main_start
		end
		localize(target)
		if res.main_end then
			desc_nodes[#desc_nodes + 1] = res.main_end
		end
	end,
	get_obj = function(self, key)
		if not G.P_D6_SIDES then G.P_D6_SIDES = {} end
		return G.P_D6_SIDES[key] 
	end,
	get_die_info = function(context, die_side_key, card, ignore_debuff)
		if context == "left" then
			local other_joker = nil
			if card.debuff and not ignore_debuff then return nil end
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i+1] end
            end
            if other_joker and other_joker ~= card and (other_joker.debuff ~= true) and other_joker.ability.extra and type(other_joker.ability.extra) == "table" and other_joker.ability.extra.local_d6_sides then
				if other_joker.ability.extra.chaos_selected_die then return SMODS.D6_Sides[other_joker.ability.extra.chaos_selected_die].key
				else return SMODS.D6_Sides[other_joker.ability.extra.local_d6_sides[other_joker.ability.extra.selected_d6_face].key].key end
            end
		elseif context == "count" then
			local total_d6_sides = {}
			for i = 1, #G.jokers.cards do
				if (G.jokers.cards[i].debuff and not ignore_debuff) or not G.jokers.cards[i].config.center.d6_joker then
				elseif G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face].key == die_side_key then 
					total_d6_sides[#total_d6_sides+1] = {card = G.jokers.cards[i], side_config = SMODS.D6_Sides[G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face].key]}
				elseif G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face].key == "chaos_side" and G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face].extra.selected_die_key == die_side_key then
					total_d6_sides[#total_d6_sides+1] = {card = G.jokers.cards[i], side_config = SMODS.D6_Sides[G.jokers.cards[i].ability.extra.chaos_selected_die]}
				end
			end
			return total_d6_sides
		end
	end,
	create_die_side = function(gen_config)
		gen_config = gen_config or {d6_side = {}, edition = {}}
		gen_config.d6_side = gen_config.d6_side or {}
		gen_config.edition = gen_config.edition or {}

		local target = gen_config.d6_side.copy or {
			key = gen_config.d6_side.key,
			extra = gen_config.d6_side.config or copy_table(SMODS.D6_Sides[gen_config.d6_side.key].config) or {},
			edition = nil,
		}

		if not gen_config.edition.no_edition and G.jokers then 
			SMODS.D6_Side.set_edition(gen_config.edition, target) 
		end

		return target
	end,
	set_edition = function(gen_config, target)
		gen_config = gen_config or {}

		if gen_config.forced_edition and G.P_D6_EDITIONS[gen_config.forced_edition] then
			local edi_config = copy_table(G.P_D6_EDITIONS[gen_config.forced_edition])
			target.edition = {key = edi_config.key, shaders = edi_config.shaders, config = edi_config.config}
			if edi_config.apply and type(edi_config.apply) == 'function' then edi_config.apply(target) end
		else
			local edition = poll_edition("d6_side_gen", nil, nil, gen_config.guaranteed or false, SMODS.D6_Side.valid_editions)
			if edition and G.P_D6_EDITIONS[edition] then 
				local edi_config = copy_table(G.P_D6_EDITIONS[edition])
				target.edition = {key = edi_config.key, shaders = edi_config.shaders, config = edi_config.config}
				if edi_config.apply and type(edi_config.apply) == 'function' then edi_config.apply(target) end
			elseif edition ~= nil and G.P_D6_EDITIONS[edition] == nil then
				sendWarnMessage("D6 Jokers | Failed to apply edition to D6 Side: "..tostring(edition)..". does not exist in P_D6_EDITIONS")
			end
		end
	end,
}

--SMODS.D6_Joker API. Used to load functionality for D6 Joker without needing it to be copy-pasted per joker
SMODS.D6_Jokers = {}
SMODS.D6_Joker = SMODS.Joker:extend {
	required_params = {
		'key',
		'd6_sides'
	},
	set = "Joker",
	config = {},
	loc_txt = {},
	d6_joker = true,
	pos = {x=0, y=0},
	atlas = "dsix_d6_jokers",
	pools = {["D6 Joker"] = true},
	discovered = false,
	set_ability = function(self, card, initial, delay_sprites)
		for i = 1, #self.d6_sides do
			card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = self.d6_sides[i]}})
		end
		card.ability.extra.selected_d6_face = math.clamp(1, math.round(pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
	end,
	inject = function(self)
		SMODS.Joker.inject(self)
		SMODS.D6_Jokers[self.key] = self
		if not self.config.extra then self.config.extra = {} end
		self.config.extra.local_d6_sides = {}
		self.config.extra.selected_d6_face = 1
	end,
	loc_vars = function(self, info_queue, card)
		if not card.debuff then
			local total_die_faces = {}
			for _, v in ipairs(card.ability.extra.local_d6_sides) do
				if not total_die_faces[v.key] then total_die_faces[v.key] = v end
			end
			total_die_faces[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key] = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]
			for k, v in pairs(total_die_faces) do
				local d6_side_config = SMODS.D6_Sides[k]
				local loc_vars
				if d6_side_config.loc_vars and type(d6_side_config.loc_vars) == "function" then loc_vars = d6_side_config:loc_vars(info_queue, card, v) end
				info_queue[#info_queue+1] = {key = k, set = "Other", vars = loc_vars and loc_vars.vars or {}}
			end
			if card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].edition then
				local edition = G.P_D6_EDITIONS[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].edition.key]
				if edition.loc_vars and type(edition.loc_vars) == 'function' then edition:loc_vars(info_queue, card, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].edition) end
			end
			if card.ability.extra.weighted_side then info_queue[#info_queue+1] = {key = "d6_joker_weighted", set = "Other", vars = {3*G.GAME.probabilities.normal, 4, card.ability.extra.weighted_side}} end
		end
	end,
	calculate = function(self, card, context)
		if not card.debuff and not context.sdm_adding_card then --SDM_0 compat, we don't use it anyways
			--D6 Joker logic
			local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
			if context.setting_blind and not card.getting_sliced and not context.blueprint_card then
				if d6_side.remove_from_deck and type(d6_side.remove_from_deck) == "function" then
					d6_side:remove_from_deck(card, nil, {from_roll = true}, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
				end

				card.ability.extra.selected_d6_face = math.clamp(1, math.round((card.ability.extra.weighted_side and pseudorandom('weighted_chance') < (G.GAME.probabilities.normal*3)/4) and card.ability.extra.weighted_side or pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='d6_joker_roll',vars={card.ability.extra.selected_d6_face}}, colour = G.C.BLUE})

				if #SMODS.find_card("j_oops") > 0 and card.ability.extra.selected_d6_face ~= 6 then 
					local oops_card = nil
					for i, v in ipairs(G.jokers.cards) do
						if v.config.center_key == "j_oops" then oops_card = v; break end 
					end
					card_eval_status_text(oops_card, 'extra', nil, nil, nil, {message = localize('k_oops'), colour = G.C.GREEN})
					card.ability.extra.selected_d6_face = 6
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='d6_joker_roll',vars={card.ability.extra.selected_d6_face}}, colour = G.C.BLUE})
				end

				d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
				if d6_side.add_to_deck and type(d6_side.add_to_deck) == "function" then
					d6_side:add_to_deck(card, from_debuff, {from_roll = true}, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
				end
			end
			--D6 Sides calculate
			if d6_side.calculate and type(d6_side.calculate) == "function" then
				local o, retrigger = d6_side:calculate(card, context, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
				if o or retrigger then return o, retrigger end
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
		if d6_side.add_to_deck and type(d6_side.add_to_deck) == "function" then
			d6_side:add_to_deck(card, from_debuff, {from_roll = false}, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
		if d6_side.remove_from_deck and type(d6_side.remove_from_deck) == "function" then
			d6_side:remove_from_deck(card, from_debuff, {from_roll = false}, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
		end
	end,
	calc_dollar_bonus = function(self, card)
		local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
		if d6_side.calc_dollar_bonus and type(d6_side.calc_dollar_bonus) == "function" then
			local o, retrigger = d6_side:calc_dollar_bonus(card, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
			if o or retrigger then return o, retrigger end
		end
	end,
	update = function(self, card, dt)
		if G.jokers and card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face] then
			local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
			if d6_side.update and type(d6_side.update) == "function" then
				d6_side:update(card, dt, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
			end
		elseif card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face] == nil then
			sendWarnMessage("D6 Joker has invalid local_d6_sides info")
			sendDebugMessage(tprint(card.ability.extra))
		end
	end,
}

--Basic support for Foil/Holo/Poly
local get_edition_ref = Card.get_edition
function Card:get_edition()
	local orig_ret = get_edition_ref(self)
	if not orig_ret then
		orig_ret = {card = self}
		orig_ret.card.edition = {}
	end
	if self.ability.set == "Joker" and self.ability.extra and type(self.ability.extra) == 'table' and self.ability.extra.local_d6_sides and self.ability.extra.local_d6_sides[self.ability.extra.selected_d6_face].edition then
		local edition = self.ability.extra.local_d6_sides[self.ability.extra.selected_d6_face].edition
		if edition.config.xmult then
			orig_ret.x_mult_mod = (orig_ret.x_mult_mod or 1) * edition.config.xmult
		end
		if edition.config.mult then
			orig_ret.mult_mod = (orig_ret.mult_mod or 0) + edition.config.mult
		end
		if edition.config.chips then
			orig_ret.chip_mod = (orig_ret.chip_mod or 0) + edition.config.chips
		end
	end
	return orig_ret
end

function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

--Blame Cryptid for this
function math.clamp(low, n, high) return math.min(math.max(low, n), high) end
function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end

SMODS.current_mod.custom_collection_tabs = function()
	return {
		UIBox_button({button = 'your_collection_d6_sides', label = {localize('b_d6_sides')}, count = G.ACTIVE_MOD_UI and modsCollectionTally(G.P_D6_SIDES) or G.DISCOVER_TALLIES.d6_sides, minw = 5, minh = 2.0, id = 'your_collection_d6_sides', focus_args = {snap_to = true}})
	}
end

SMODS.Enhancement{
	key = "boosted",
	atlas = "dsix_booster_enhancement",
	config = {bonus = 50, mult = 10, Xmult = 1.5},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.bonus, card.ability.mult, card.ability.Xmult}}
	end,
	loc_subtract_extra_chips = 50,
	in_pool = function(self)
		return false
	end,
	no_doe = true,
}

SMODS.ConsumableType{
	key = "Dice Modifiers",
	primary_colour = HEX("80f1c3"),
    secondary_colour = HEX("437e67"),
	loc_txt = {},
	collection_rows = { 5, 4 },
	shop_rate = 0,
    default = 'c_dsix_die_wielder',
	cards = {
		["c_dsix_die_wielder"] = true,
	},
}

SMODS.ObjectType{
	key = "D6 Side",
	default = "nothing_side",
}

SMODS.ObjectType{
	key = "D6 Joker",
	default = "j_dsix_basic_die",
	rarities = {
		{ key = "Common" },
		--Slightly boosted odds since there's more common D6 jokers than any other rarity
		{ key = "Uncommon", rate = 0.35}, 
		{ key = "Rare", rate = 0.15},
	},
}

SMODS.ObjectType{
	key = "Impure",
	default = "j_dsix_impure_gutless_die",
}

-- Can't do inject for some reason so sloppy hook
local align_h_popup_ref = Card.align_h_popup
function Card:align_h_popup()
	if self.config and self.config.center and self.config.center.d6_sides then
		local focused_ui = self.children.focused_ui and true or false
		local popup_direction = (self.children.buy_button or (self.area and self.area.config.view_deck) or (self.area and self.area.config.type == 'shop')) and 'cl' or 
								(self.T.y > G.CARD_H*0.8 and self.T.y < G.CARD_H*1.8) and ((self.T.x > G.ROOM.T.w*0.4) and "cl" or "cr") or
								(self.T.y < G.CARD_H*0.8) and 'bm' or
								'tm'
		local sign = 1
		if popup_direction == 'cl' and self.T.x <= G.ROOM.T.w*0.4 then
			popup_direction = 'cr'
			sign = -1
		end
		return {
			major = self.children.focused_ui or self,
			parent = self,
			xy_bond = 'Strong',
			r_bond = 'Weak',
			wh_bond = 'Weak',
			offset = {
				x = popup_direction ~= 'cl' and popup_direction ~= 'cr' and 0 or
					focused_ui and sign*-0.05 or
					(self.ability.consumeable and 0.0) or
					(self.ability.set == 'Voucher' and 0.0) or
					sign*-0.05,
				y = focused_ui and (
							popup_direction == 'tm' and (self.area and self.area == G.hand and -0.08 or-0.15) or
							popup_direction == 'bm' and 0.12 or
							0
						) or
					popup_direction == 'tm' and -0.13 or
					popup_direction == 'bm' and 0.1 or
					0
			},  
			type = popup_direction,
			--lr_clamp = true
		}
	else
		return align_h_popup_ref(self)
	end
end

--""""borrowing"""" the reserve button from Cryptid
local G_UIDEF_use_and_sell_buttons_ref=G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
		if card.config.center.key == 'c_dsix_override' then
			return {
				n=G.UIT.ROOT, config = {padding = -0.1,  colour = G.C.CLEAR}, nodes={
				{n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.7*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_reserve_card'}, nodes={
					{n=G.UIT.T, config={text = "RESERVE",colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
				}},
				{n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, maxw = 0.9*card.T.w - 0.15, minh = 0.1*card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'Do you know that this parameter does nothing?', func = 'can_use_consumeable'}, nodes={
					{n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
				}},
				{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
				{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
				{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
				{n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
				-- Betmma can't explain it, _Mathisfun can't explain it, neither can I
			}}
		end
	end
	return G_UIDEF_use_and_sell_buttons_ref(card)
end

G.FUNCS.can_reserve_card = function(e)
	if #G.consumeables.cards < G.consumeables.config.card_limit then 
		e.config.colour = G.C.RED
		e.config.button = 'reserve_card'
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

G.FUNCS.reserve_card = function(e)
	local c1 = e.config.ref_table
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 0.1,
		func = function()
		c1.area:remove_card(c1)
		c1:add_to_deck()
		if c1.children.price then c1.children.price:remove() end
		c1.children.price = nil
		if c1.children.buy_button then c1.children.buy_button:remove() end
		c1.children.buy_button = nil
		remove_nils(c1.children)
		G.consumeables:emplace(c1)
		G.GAME.pack_choices = G.GAME.pack_choices - 1
		if G.GAME.pack_choices <= 0 then
			G.FUNCS.end_consumeable(nil, delay_fac)
		end
		return true
		end
	}))
end

-- D6 Sides UI
G.FUNCS.your_collection_d6_sides = function(e)
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu{
		definition = create_UIBox_your_collection_d6_Sides_master(),
	}
end

function create_UIBox_your_collection_d6_Sides_master()
	local d6_sides_pool = {}
	if G.ACTIVE_MOD_UI then
		for k, v in pairs(G.P_CENTER_POOLS["D6 Side"]) do
			if v.mod and G.ACTIVE_MOD_UI.id == v.mod.id then d6_sides_pool[#d6_sides_pool+1] = v end
		end
	else
		d6_sides_pool = G.P_CENTER_POOLS["D6 Side"]
	end

	local d6_sides_options = {}
	for i = 1, math.ceil(#d6_sides_pool/(6*9)) do
		table.insert(d6_sides_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#d6_sides_pool/(6*9))))
	end

	return create_UIBox_generic_options({ back_func = 'your_collection_other_gameobjects', contents = {
		{n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05}, nodes={
			{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.O, config={id = 'd6_sides_ui', object = UIBox{
					definition = create_UIBox_your_collection_d6_Sides(1),
					config = {offset = {x=0,y=0}}
				}}},
			}},
			#d6_sides_pool > 54 and {n=G.UIT.R, config={align = "cm"}, nodes={
				create_option_cycle({options = d6_sides_options, w = 4.5, cycle_shoulders = true, opt_callback = 'd6_sides_ui_page', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
			}} or nil
		}},
	}})
end

function create_UIBox_your_collection_d6_Sides(page)
	page = page or 1

	local d6_sides_pool = {}
	if G.ACTIVE_MOD_UI then
		for k, v in pairs(G.P_CENTER_POOLS["D6 Side"]) do
			if v.mod and G.ACTIVE_MOD_UI.id == v.mod.id then d6_sides_pool[#d6_sides_pool+1] = v end
		end
	else
		d6_sides_pool = G.P_CENTER_POOLS["D6 Side"]
	end

	local d6_side_matrix = {
		{},{},{},{},{},{},
	}
	local d6_side_tab = {}
	for k, v in pairs(d6_sides_pool) do
		d6_side_tab[#d6_side_tab+1] = v
	end
	
	table.sort(d6_side_tab, function(a, b) return a.order < b.order end)
	
	local blinds_to_be_alerted = {}
	for i = 1, 54 do
		local selected_d6_side = d6_side_tab[i+(54*(page-1))]
		if not selected_d6_side then break end

		local temp_d6_side = Sprite(34,34,1,1, G.ASSET_ATLAS["dsix_d6_side_icons"], selected_d6_side.pos)
		temp_d6_side:define_draw_steps({
			{shader = 'dissolve', shadow_height = 0.05},
			{shader = 'dissolve'}
		})
		if i == 1 then 
			G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = (function()
				G.CONTROLLER:snap_to{node = temp_d6_side}
				return true
			end)
			}))
		end
		temp_d6_side.float = true
		temp_d6_side.states.hover.can = true
		temp_d6_side.states.drag.can = false
		temp_d6_side.states.collide.can = true
		temp_d6_side.hover = function()
			if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
				if not temp_d6_side.hovering and temp_d6_side.states.visible then
					temp_d6_side.hovering = true
					temp_d6_side.hover_tilt = 3
					temp_d6_side:juice_up(0.05, 0.02)
					play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
					local temp_d6_side_loc_vars = nil
					local dummy_d6_side = {
						key = selected_d6_side.key,
						extra = copy_table(selected_d6_side.config),
						edition = nil,
					}
					if selected_d6_side.loc_vars and type(selected_d6_side.loc_vars) == "function" then temp_d6_side_loc_vars = selected_d6_side:loc_vars({}, nil, dummy_d6_side) end
					temp_d6_side.config.h_popup = create_UIBox_d6_side_popup(selected_d6_side, temp_d6_side_loc_vars)
					temp_d6_side.config.h_popup_config ={align = 'cl', offset = {x=-0.1,y=0},parent = temp_d6_side}
					Node.hover(temp_d6_side)
					if temp_d6_side.children.alert then 
						temp_d6_side.children.alert:remove()
						temp_d6_side.children.alert = nil
						selected_d6_side.alerted = true
						G:save_progress()
					end
				end
			end
			temp_d6_side.stop_hover = function() temp_d6_side.hovering = false; Node.stop_hover(temp_d6_side); temp_d6_side.hover_tilt = 0 end
		end
		local d6_side_per_row = 9
		local row = math.ceil(i/9)
		table.insert(d6_side_matrix[row], {
			n = G.UIT.C,
			config = { align = "cm", padding = 0.1 },
			nodes = {
				(i % 18) == 1 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
				{ n = G.UIT.O, config = { object = temp_d6_side, focus_with_object = true } },
				(i % 18) == 0 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
			}
		})
	end

	local t = {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
		{n=G.UIT.C, config={align = "cm"}, nodes={
			{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[1]},
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[2]},
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[3]},
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[4]},
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[5]},
				{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_matrix[6]},
			}}
		}}
	}}
	return t
end

G.FUNCS.d6_sides_ui_page = function(args)
	if not args or not args.cycle_config then return end
	local d6_sides_uibox = G.OVERLAY_MENU:get_UIE_by_ID('d6_sides_ui')
	
	d6_sides_uibox.config.object:remove()
	d6_sides_uibox.config.object = UIBox{
		definition = create_UIBox_your_collection_d6_Sides(args.cycle_config.current_option),
		config = {offset = {x=0,y=0}, parent = d6_sides_uibox},
	}
	d6_sides_uibox.config.object:recalculate()
end

function create_UIBox_d6_side_popup(d6_side, vars)
	local d6_side_text = {}
	
	local loc_target = localize{type = 'raw_descriptions', key = d6_side.key, set = 'Other', vars = vars and vars.vars or nil}
	local loc_name = localize{type = 'name_text', key = d6_side.key, set = 'Other'}
	
	local ability_text = {}
	if loc_target then 
		for k, v in ipairs(loc_target) do
			ability_text[#ability_text + 1] = {n=G.UIT.R, config={align = "cm"}, nodes={{n=G.UIT.T, config={text = v, scale = 0.35, shadow = true, colour = G.C.WHITE}}}}
		end
	end

	d6_side_text[#d6_side_text + 1] =
	{n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.07, colour = G.C.WHITE}, nodes={
		ability_text[1] and {n=G.UIT.R, config={align = "cm", padding = 0.08, colour = G.C.GREY, r = 0.1, emboss = 0.05, minw = 2.5, minh = 0.9}, nodes=ability_text} or nil
	}}

	return {n=G.UIT.ROOT, config={align = "cm", padding = 0.05, colour = lighten(G.C.JOKER_GREY, 0.5), r = 0.1, emboss = 0.05}, nodes={
			{n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.1, colour = G.C.GREY}, nodes={
			{n=G.UIT.O, config={object = DynaText({string = loc_name, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, spacing = 2, bump = true, scale = 0.4})}},
		}},
		{n=G.UIT.R, config={align = "cm"}, nodes=d6_side_text},
	}}
end

--JokerDisplay support
if _G["JokerDisplay"] and SMODS.Mods["JokerDisplay"] then
	D6_JokerDisplay = JokerDisplay
	D6_JokerDisplay.D6_Side_Definitions = {}
else
	D6_JokerDisplay = {Definitions = {}, D6_Side_Definitions = {}}
end

--DebugPlus commands
local success, dpAPI = pcall(require, "debugplus-api")
if success and dpAPI.isVersionCompatible(0) then
    local debugplus = dpAPI.registerID("dsix")

    debugplus.addCommand({
        name = "set_edition",
        shortDesc = "Set D6 Joker edition",
        desc = "Sets all D6 Sides on D6 Joker to an edition. Args: edition_key",
        exec = function (args, rawArgs, dp)
			local card = dp.hovered
			for i, v in ipairs(card.ability.extra.local_d6_sides) do
				SMODS.D6_Side.set_edition({forced_edition = args[1]}, v)
			end
            return "Command Complete: D6 Sides set to "..args[1].." edition", "INFO", {0, 1, 0}
        end
    })

	debugplus.addCommand({
        name = "set_sides",
        shortDesc = "Set D6 Sides",
        desc = "Sets all D6 Sides on D6 Joker to specified D6 Side. Args: d6_side_key",
        exec = function (args, rawArgs, dp)
			local card = dp.hovered
			for i = 1, #card.ability.extra.local_d6_sides do
				card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = args[1]}})
			end
            return "Command Complete: D6 Sides set to D6 Side of key "..args[1].." ", "INFO", {0, 1, 0}
        end
    })
end

-- Mod compat function; compat is mod ID
function load_compat(compat)
	if compat == "Cryptid" then
		local cry_misprintize_ref = cry_misprintize
		function cry_misprintize(card, override, force_reset, stack, d6_side)
			if d6_side then
				if 
					(not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod)
					and (G.GAME.modifiers.cry_misprint_min or override)
				then
					if G.GAME.modifiers.cry_jkr_misprint_mod then
						if not override then
							override = {}
						end
						override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
						override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
						override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
						override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
					end
					if G.GAME.modifiers.cry_misprint_min or override and override.min then
						cry_misprintize_tbl(d6_side.key, d6_side, "extra", nil, override, stack)
					end
				else
					cry_misprintize_tbl(d6_side.key, d6_side, "extra", nil, override, stack)
				end
			elseif card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.local_d6_sides then
				local d6_joker_extra = copy_table(card.ability.extra)
				for i, v in ipairs(type(d6_joker_extra.local_d6_sides) == "table" and d6_joker_extra.local_d6_sides or {}) do
					if 
						(not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod)
						and (G.GAME.modifiers.cry_misprint_min or override or card.ability.set == "Joker")
					then
						if G.GAME.modifiers.cry_jkr_misprint_mod and card.ability.set == "Joker" then
							if not override then
								override = {}
							end
							override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
							override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
							override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
							override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
						end
						if G.GAME.modifiers.cry_misprint_min or override and override.min then
							cry_misprintize_tbl(v.key, v, "extra", nil, override, stack)
						end
					else
						cry_misprintize_tbl(v.key, v, "extra")
					end
				end
				cry_misprintize_ref(card, override, force_reset, stack)
				card.ability.extra = d6_joker_extra
			end
			if card then cry_misprintize_ref(card, override, force_reset, stack) end
		end

		table.insert(SMODS.D6_Side.valid_editions, "e_cry_glitched")
		G.P_D6_EDITIONS["e_cry_glitched"] = {
			key = "e_cry_glitched",
			config = {},
			shaders = {
				lighten = "cry_glitched",
				darken = "dsix_glitched_darken",
			},
			loc_vars = function(self, info_queue, card, edition)
				info_queue[#info_queue+1] = {key = "d6_side_edition_cry_glitched", set = "Other", vars = {}}
			end,
			apply = function(d6_side)
				cry_misprintize(nil, {min=0.1*(G.GAME.modifiers.cry_misprint_min or 1),max=10*(G.GAME.modifiers.cry_misprint_max or 1)}, nil, nil, d6_side)
			end,
		}

		table.insert(SMODS.D6_Side.valid_editions, "e_cry_oversat")
		G.P_D6_EDITIONS["e_cry_oversat"] = {
			key = "e_cry_oversat",
			config = {},
			shaders = {
				lighten = "cry_oversat",
				darken = "dsix_oversat_darken",
				other = {
					"negative_shine"
				},
			},
			loc_vars = function(self, info_queue, card, edition)
				info_queue[#info_queue+1] = {key = "d6_side_edition_cry_oversat", set = "Other", vars = {}}
			end,
			apply = function(d6_side)
				cry_misprintize(nil, {min=2*(G.GAME.modifiers.cry_misprint_min or 1),max=2*(G.GAME.modifiers.cry_misprint_max or 1)}, nil, nil, d6_side)
			end,
		}
	end
end

-- Mod Config UI
D6Joker_ModData.config_tab = function()
	return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            r = 0.1,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = {
			{n=G.UIT.C, config = {align = "tl", padding = 0.05}, nodes = {
				create_toggle({
					label = localize("d6config_dice_modifier"),
					ref_table = D6Joker_ModData.config,
					ref_value = "DiceModifier_Enabled",
				}),
				create_toggle({
					label = localize("d6config_other_consumables"),
					ref_table = D6Joker_ModData.config,
					ref_value = "OtherConsumables_Enabled",
				}),
				create_toggle({
					label = localize("d6config_booster_packs"),
					ref_table = D6Joker_ModData.config,
					ref_value = "BoosterPacks_Enabled",
				}),
				create_toggle({
					label = localize("d6config_upgrades_in_shop"),
					ref_table = D6Joker_ModData.config,
					ref_value = "D6Joker_Upgrades_Shop",
				}),
			}},
		}
    }
end

--File loading setup
local file_groups = NFS.getDirectoryItems(mod_path.."Objects")
local function init_file_groups()
	for k, file_group in pairs(file_groups) do
		local init_files = NFS.getDirectoryItems(mod_path.."Objects/"..file_group)
		for kk, v in pairs(init_files) do
			if string.find(v, ".lua") then
				local init_obj_filepath = tostring("Objects/"..file_group.."/"..v)
				local init_obj_file = assert(SMODS.load_file(init_obj_filepath))()
				if init_obj_file.init_func and type(init_obj_file.init_func) == "function" then init_obj_file.init_func("Objects/"..file_group) end
			end
		end
	end
end

init_file_groups()

----------------------------------------------
------------MOD CODE END----------------------
