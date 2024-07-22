--- STEAMODDED HEADER
--- MOD_NAME: D6 Jokers
--- MOD_ID: D6Joker
--- MOD_AUTHOR: [ItsFlowwey]
--- MOD_DESCRIPTION: Adds D6 Jokers that have their effects determined by a die roll. 
--- PREFIX: dsix
--- VERSION: 0.7.0
--- LOADER_VERSION_GEQ: "1.0.0-ALPHA-0721a"
--- PRIORITY: -900

----------------------------------------------
------------MOD CODE -------------------------

local mod_path = SMODS.current_mod.path
--D6 Sides Art
SMODS.Atlas{key = "d6_side_nothing", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_nothing.png"}
SMODS.Atlas{key = "d6_side_chips", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_chips.png"}
SMODS.Atlas{key = "d6_side_mult", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_mult.png"}
SMODS.Atlas{key = "d6_side_xmult", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_xmult.png"}
SMODS.Atlas{key = "d6_side_planetarium", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_planetarium.png"}
SMODS.Atlas{key = "d6_side_cartomancy", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_cartomancy.png"}
SMODS.Atlas{key = "d6_side_apparition", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_apparition.png"}
SMODS.Atlas{key = "d6_side_payout", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_payout.png"}
SMODS.Atlas{key = "d6_side_cardist", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_cardist.png"}
SMODS.Atlas{key = "d6_side_juggler", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_juggler.png"}
SMODS.Atlas{key = "d6_side_drunkard", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_drunkard.png"}
SMODS.Atlas{key = "d6_side_chaos", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_chaos.png"}
SMODS.Atlas{key = "d6_side_selling_self", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_selling_self.png"}
SMODS.Atlas{key = "d6_side_all_in", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_all_in.png"}
SMODS.Atlas{key = "d6_side_other", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_other.png"}
SMODS.Atlas{key = "d6_side_curse", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_curse.png"}
SMODS.Atlas{key = "d6_side_pure", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_pure.png"}
SMODS.Atlas{key = "d6_side_moon", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_moon.png"}
--D6 Side UI
SMODS.Atlas{key = "base_test_d6_art", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_test_sprite2.png"}
SMODS.Atlas{key = "d6_side_icons", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_side_icons.png"}
--Object Art
SMODS.Atlas{key = "d6_jokers", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_jokers_atlas.png"}
SMODS.Atlas{key = "d6_boosters", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_boosters.png"}
SMODS.Atlas{key = "booster_enhancement", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "boosted_enhancement.png"}
--Other
SMODS.Atlas{key = "modicon", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_jokers_mod_tag.png"}
-- Shaders
SMODS.Shader{key = 'infected', path = 'infected.fs'}
SMODS.Shader{key = 'darken', path = 'darken.fs'}
SMODS.Shader{key = 'polychrome_darken', path = 'polychrome_darken.fs'}
SMODS.Shader{key = 'holo_darken', path = 'holo_darken.fs'}
SMODS.Shader{key = 'foil_darken', path = 'foil_darken.fs'}
SMODS.Shader{key = 'light_foil', path = 'd6_side_foil.fs'}

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
	atlas = "d6_side_nothing",
	icon_atlas = "d6_side_icons",
	config = {},
	pos = { x = 0, y = 0 },
	unlocked = true,
	discovered = true,
	reverse_lookup_name = {},
	prefix_config = {key = false},
	inject_class = function(self)
		G.P_D6_SIDES = {}
		G.P_CENTER_POOLS["D6 Side"] = {}
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
					lighten = "dsix_light_foil",
					darken = "dsix_foil_darken",
				},
				loc_vars = function(self, info_queue, card, edition)
					info_queue[#info_queue+1] = {key = "d6_side_edition_foil", set = "Other", vars = {edition.config.chips}}
				end
			},
		}
		SMODS.D6_Side.super.inject_class(self)
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

		if gen_config.edition.forced_edition and G.P_D6_EDITIONS[gen_config.edition.forced_edition] then
			local edi_config = copy_table(G.P_D6_EDITIONS[gen_config.edition.forced_edition])
			target.edition = {key = edi_config.key, shaders = edi_config.shaders, config = edi_config.config}
		elseif not gen_config.edition.no_edition then
			local edition = poll_edition("d6_side_gen", nil, nil, gen_config.edition.guaranteed or false, {'e_polychrome', 'e_holo', 'e_foil'}) --base game editions
			if edition and G.P_D6_EDITIONS[edition] then 
				local edi_config = copy_table(G.P_D6_EDITIONS[edition])
				target.edition = {key = edi_config.key, shaders = edi_config.shaders, config = edi_config.config}
			elseif edition ~= nil and G.P_D6_EDITIONS[edition] == nil then
				sendWarnMessage("D6 JOKERS | Failed to apply edition to D6 Side: "..tostring(edition)..". does not exist in P_D6_EDITIONS")
			end
		end

		return target
	end,
}

--SMODS.D6_Joker API. Used to load functionality for D6 Joker without needing it to be copy-pasted per joker
SMODS.D6_Jokers = {}
SMODS.D6_Joker = SMODS.Joker:extend {
	required_params = {
		'key',
		'd6_sides'
	},
	config = {},
	loc_txt = {},
	d6_joker = true,
	pos = {x=0, y=0},
	atlas = "dsix_d6_jokers",
	set_ability = function(self, card, initial, delay_sprites)
		for i = 1, #card.config.center.d6_sides do
			card.ability.extra.local_d6_sides[i] = SMODS.D6_Side.create_die_side({d6_side = {key = self.d6_sides[i]}})
		end
		card.ability.extra.selected_d6_face = math.clamp(1, math.round(pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
	end,
	inject = function(self)
		SMODS.Joker.inject(self)
		SMODS.D6_Jokers[self.key] = self
		if not self.config["extra"] then self.config["extra"] = {} end
		self.config.extra["local_d6_sides"] = {}
		self.config.extra["selected_d6_face"] = 1 
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
			if card.ability.extra.cannot_reroll then info_queue[#info_queue+1] = {key = "d6_joker_weighted", set = "Other", vars = {}} end
		end
	end,
	calculate = function(self, card, context)
		if not card.debuff and not context.sdm_adding_card then --SDM_0 compat, we don't use it anyways
			--D6 Joker logic
			local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
			if context.setting_blind and not card.getting_sliced and not context.blueprint_card and not card.ability.extra.cannot_reroll then
				if d6_side.remove_from_deck and type(d6_side.remove_from_deck) == "function" then
					d6_side:remove_from_deck(card, nil, {from_roll = true}, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
				end

				card.ability.extra.selected_d6_face = math.clamp(1, math.round(pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
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
				local o = d6_side:calculate(card, context, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
				if o then return o end
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
			local o = d6_side:calc_dollar_bonus(card, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
			if o then return o end
		end
	end,
	update = function(self, card, dt)
		if G.jokers then
			local d6_side = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key]
			if d6_side.update and type(d6_side.update) == "function" then
				d6_side:update(card, dt, card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face])
			end
		end
	end,
}

--Helper Class for Booster API
SMODS.Obj_Pools = {}
SMODS.Obj_Pool = SMODS.GameObject:extend {
	obj_table = SMODS.Obj_Pools,
	obj_buffer = {},
	required_params = {
		'key',
	},
	prefix_config = {key = false},
	inject = function(self) end, --There is nothing to inject into the game here, so skip over injection
	get_obj_pool = function(self, _type, _rarity, _legendary, _append, preset)
		-- Return the pool ref as this is the best way to make a "default" pool func compatible with other mod shenanigans. 
		-- You'd want to override this anyways with your own function sooo
		-- TODO: Make "preset" work 
		return get_current_pool_ref(_type, _rarity, _legendary, _append, preset)
	end,
}

local get_current_pool_ref = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if SMODS.Obj_Pools and SMODS.Obj_Pools[_type] then 
		local o, otwo = SMODS.Obj_Pools[_type]:get_obj_pool(_type, _rarity, legendary, _append)
		if o and otwo then 
			return o, otwo 
		else 
			error("Failed to return SMODS.Obj_Pools correctly. _pool: "..tostring(o)..", _pool_key: "..tostring(otwo))
		end
	else
		return get_current_pool_ref(_type, _rarity, _legendary, _append)
	end
end

local mod_chips_ref = mod_chips
function mod_chips(_chips)
	local curr_chips = mod_chips_ref(_chips)
	return math.max(curr_chips, 0)
end

local mod_mult_ref = mod_mult
function mod_mult(_mult)
	local curr_mult = mod_chips_ref(_mult)
	return math.max(curr_mult, 0)
end

--Basic support for Foil/Holo/Poly
local get_edition_ref = Card.get_edition
function Card:get_edition()
	local orig_ret = get_edition_ref(self) or {card = self}
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

G.FUNCS.your_collection_d6_sides = function(e)
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu{
	  definition = create_UIBox_your_collection_d6_Sides(),
	}
end

function create_UIBox_your_collection_d6_Sides(exit)
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
	for k, v in ipairs(d6_side_tab) do
	    local discovered = v.discovered
  
		local s = 1.3*1.25*1.25
		if math.ceil(#d6_side_tab/6) > 6 then
			s = s * 6/math.ceil(#d6_side_tab/6)
		end
		local temp_d6_side = Sprite(34,34,s,s, G.ASSET_ATLAS["dsix_d6_side_icons"], v.icon_pos)
		temp_d6_side:define_draw_steps({
			{shader = 'dissolve', shadow_height = 0.05},
			{shader = 'dissolve'}
		})
		if k == 1 then 
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
		--temp_d6_side.config = {blind = v, force_focus = true}
		if discovered and not v.alerted then 
			blinds_to_be_alerted[#blinds_to_be_alerted+1] = temp_d6_side
		end
		temp_d6_side.hover = function()
			if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
				if not temp_d6_side.hovering and temp_d6_side.states.visible then
					temp_d6_side.hovering = true
					temp_d6_side.hover_tilt = 3
					temp_d6_side:juice_up(0.05, 0.02)
					play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
					local temp_d6_side_loc_vars = nil
					local dummy_d6_side = {
						key = v.key,
						extra = copy_table(v.config),
						edition = nil,
					}
					if v.loc_vars and type(v.loc_vars) == "function" then temp_d6_side_loc_vars = v:loc_vars({}, nil, dummy_d6_side) end
					temp_d6_side.config.h_popup = create_UIBox_d6_side_popup(v, temp_d6_side_loc_vars)
					temp_d6_side.config.h_popup_config ={align = 'cl', offset = {x=-0.1,y=0},parent = temp_d6_side}
					Node.hover(temp_d6_side)
					if temp_d6_side.children.alert then 
						temp_d6_side.children.alert:remove()
						temp_d6_side.children.alert = nil
						v.alerted = true
						G:save_progress()
					end
				end
			end
			temp_d6_side.stop_hover = function() temp_d6_side.hovering = false; Node.stop_hover(temp_d6_side); temp_d6_side.hover_tilt = 0 end
		end
	  local d6_side_per_row = math.ceil(#d6_side_tab / 6)
	  local row = math.ceil((k - 1) / d6_side_per_row + 0.001)
	  table.insert(d6_side_matrix[row], {
		  n = G.UIT.C,
		  config = { align = "cm", padding = 0.1 },
		  nodes = {
			  ((k - d6_side_per_row) % (2 * d6_side_per_row) == 1) and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
			  { n = G.UIT.O, config = { object = temp_d6_side, focus_with_object = true } },
			  ((k - d6_side_per_row) % (2 * d6_side_per_row) == 0) and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
		  }
	  })
	end
	
	local d6_sides_options = {}
	for i = 1, math.floor(#d6_sides_pool/7) do
	  table.insert(d6_sides_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.floor(#d6_sides_pool/7)))
	end

	local extras = nil
	local t = create_UIBox_generic_options({ back_func = 'your_collection_other_gameobjects', contents = {
	  {n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05}, nodes={
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
	}})
	return t
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
}

--D6_JokerDisplay support
if _G["JokerDisplay"] and SMODS.Mods["JokerDisplay"] then
	D6_JokerDisplay = JokerDisplay
	D6_JokerDisplay.D6_Side_Definitions = {}
else
	D6_JokerDisplay = {Definitions = {}, D6_Side_Definitions = {}}
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
