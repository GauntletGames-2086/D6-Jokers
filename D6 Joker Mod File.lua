--- STEAMODDED HEADER
--- MOD_NAME: D6 Jokers
--- MOD_ID: D6Joker
--- MOD_AUTHOR: [ItsFlowwey]
--- MOD_DESCRIPTION: Adds D6 Jokers that have their effects determined by a die roll. 
--- PREFIX: dsix
--- VERSION: 0.5.31
--- LOADER_VERSION_GEQ: 1.0.0-ALPHA-0628a
--- PRIORITY: -900

----------------------------------------------
------------MOD CODE -------------------------

local mod_path = SMODS.current_mod.path
--D6 Sides art
SMODS.Atlas{key = "d6_side_nothing", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_nothing.png"}
SMODS.Atlas{key = "d6_side_chips", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_chips.png"}
SMODS.Atlas{key = "d6_side_mult", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_mult.png"}
SMODS.Atlas{key = "d6_side_xmult", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_xmult.png"}
SMODS.Atlas{key = "d6_side_planetarium", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_planetarium.png"}
SMODS.Atlas{key = "d6_side_cartomancy", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_side_atlas_cartomancy.png"}
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
--D6 Side UI
SMODS.Atlas{key = "base_test_d6_art", atlas_table = "ASSET_ATLAS", px = 88, py = 102, path = "d6_test_sprite2.png"}
SMODS.Atlas{key = "d6_test_selector", atlas_table = "ASSET_ATLAS", px = 88, py = 104, path = "d6_test_selector.png"}
SMODS.Atlas{key = "d6_side_icons", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_side_icons.png"}
--Other atlases
SMODS.Atlas{key = "d6_jokers", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_jokers_atlas.png"}
SMODS.Atlas{key = "d6_boosters", atlas_table = "ASSET_ATLAS", px = 71, py = 95, path = "d6_boosters.png"}
SMODS.Atlas{key = "d6_blinds", atlas_table = "ANIMATION_ATLAS", px = 34, py = 34, path = "d6_blind_chips.png", frames = 21}
SMODS.Atlas{key = "modicon", atlas_table = "ASSET_ATLAS", px = 34, py = 34, path = "d6_jokers_mod_tag.png"}

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
	colour = HEX("9151b5"),
	reverse_lookup_name = {},
	omit_prefix = true,
	inject = function(self)
		if not G["P_D6_SIDES"] then G["P_D6_SIDES"] = {} end
		G.P_D6_SIDES[self.key] = self
		if not G.P_CENTER_POOLS[self.set] then G.P_CENTER_POOLS[self.set] = {} end
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
			res = self:loc_vars(info_queue, card)
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
	get_obj = function(self, key) return G.P_D6_SIDES[key] end,
	get_die_info = function(context, die_side_key, card, ignore_debuff)
		if context == "left" then
			local other_joker = nil
			if card.debuff and not ignore_debuff then return nil end
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i+1] end
            end
            if other_joker and other_joker ~= card and (other_joker.debuff ~= true) and other_joker.ability.extra and type(other_joker.ability.extra) == "table" and other_joker.ability.extra.local_d6_sides then
				if other_joker.ability.extra.chaos_selected_die then return SMODS.D6_Sides[other_joker.ability.extra.chaos_selected_die].key
				else return SMODS.D6_Sides[other_joker.ability.extra.local_d6_sides[other_joker.ability.extra.selected_d6_face]].key end
            end
		elseif context == "count" then
			local total_d6_sides = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].debuff and not ignore_debuff then
				elseif G.jokers.cards[i].config.center.d6_joker and G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face] == die_side_key then 
					total_d6_sides[#total_d6_sides+1] = {card = G.jokers.cards[i], side_config = SMODS.D6_Sides[G.jokers.cards[i].ability.extra.local_d6_sides[G.jokers.cards[i].ability.extra.selected_d6_face]]}
				elseif G.jokers.cards[i].config.center.d6_joker and G.jokers.cards[i].ability.extra.chaos_selected_die and G.jokers.cards[i].ability.extra.chaos_selected_die == die_side_key then
					total_d6_sides[#total_d6_sides+1] = {card = G.jokers.cards[i], side_config = SMODS.D6_Sides[G.jokers.cards[i].ability.extra.chaos_selected_die]}
				end
			end
			return total_d6_sides
		end
	end,
	is_die_side = function(die_key_to_check, die_key, card)
		return die_key_to_check == die_key
	end,
}

--SMODS.D6_Joker API. Used to load functionality for D6 Joker without needing it to be copy-pasted per joker
SMODS.D6_Jokers = {}
SMODS.D6_Joker = SMODS.Joker:extend {
	required_params = {
		'd6_sides'
	},
	loc_txt = {},
	d6_joker = true,
	pos = {x=0, y=0},
	atlas = "dsix_d6_jokers",
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.extra.selected_d6_face = math.clamp(1, math.round(pseudorandom("d6_joker"..card.config.center.key, 1, 6)), 6)
		card.ability.extra.local_d6_sides = copy_table(card.config.center.d6_sides)
	end,
	inject = function(self)
		-- call the parent function to ensure all pools are set
		SMODS.Joker.inject(self)
		if not self.config["extra"] then self.config.extra = {} end
		self.config.extra["local_d6_sides"] = {}
		if not G.P_CENTERS[self.key].config["extra"] then G.P_CENTERS[self.key].config["extra"] = {} end
		--Inject logic into the config so jokers extending this don't need to add it manually
		G.P_CENTERS[self.key].config.extra["selected_d6_face"] = 1 
		G.P_CENTERS[self.key].config.extra["d6_joker_spawned"] = false
		SMODS.D6_Jokers[self.key] = self
	end,
	loc_vars = function(self, info_queue, card)
		local total_die_faces = {}
		for _, v in ipairs(card.ability.extra.local_d6_sides) do
			if not total_die_faces[v] then total_die_faces[v] = 1
			else total_die_faces[v] = total_die_faces[v] + 1 end
		end
		for k, v in pairs(total_die_faces) do
			local d6_side_config = SMODS.D6_Side:get_obj(k)
			local loc_vars
			if d6_side_config.loc_vars and type(d6_side_config.loc_vars) == "function" then loc_vars = d6_side_config:loc_vars(info_queue, card) end
			info_queue[#info_queue+1] = {key = k, set = "Other", vars = loc_vars and loc_vars.vars or {}}
		end
	end,
	calculate = function(self, card, context)
		if not card.debuff then 
			--D6 Joker logic
			if context.setting_blind and not card.getting_sliced and not context.blueprint_card then
				if SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].remove_from_deck and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].remove_from_deck) == "function" then
					SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:remove_from_deck(card, nil, {from_roll = true})
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

				if SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].add_to_deck and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].add_to_deck) == "function" then
					SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:add_to_deck(card, from_debuff, {from_roll = true})
				end
			end
			--D6 Sides calculate
			if card.ability.extra.chaos_selected_die and (SMODS.D6_Sides[card.ability.extra.chaos_selected_die].calculate and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].calculate) == "function") then
				local o = SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:calculate(card, context)
				if o then return o end
			elseif SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].calculate and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].calculate) == "function" then
				local o = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:calculate(card, context)
				if o then return o end
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.d6_joker_spawned == true and SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].add_to_deck and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].add_to_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:add_to_deck(card, from_debuff, {from_roll = true})
		end
		card.ability.extra.d6_joker_spawned = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		if SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].remove_from_deck and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].remove_from_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:remove_from_deck(card, from_debuff, {from_roll = false})
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.chaos_selected_die and (SMODS.D6_Sides[card.ability.extra.chaos_selected_die].calc_dollar_bonus and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].calc_dollar_bonus) == "function") then
			local o = SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:calc_dollar_bonus(card)
			if o then return o end
		elseif SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].calc_dollar_bonus and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].calc_dollar_bonus) == "function" then
			local o = SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:calc_dollar_bonus(card)
			if o then return o end
		end
	end,
	update = function(self, card, dt)
		if card.ability.extra.selected_d6_face % 1 > 0 then card.ability.extra.selected_d6_face = math.round(card.ability.extra.selected_d6_face) end
		if card.ability.extra.selected_d6_face < 0 then card.ability.extra.selected_d6_face = card.ability.extra.selected_d6_face*-1 end
		card.ability.extra.selected_d6_face = math.clamp(1, card.ability.extra.selected_d6_face, 6)
		if G.jokers then
			if card.ability.extra.chaos_selected_die and (SMODS.D6_Sides[card.ability.extra.chaos_selected_die].update and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].update) == "function") then
				SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:update(card, dt)
			elseif SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].update and type(SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]].update) == "function" then
				SMODS.D6_Sides[card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face]]:update(card, dt)
			end
		end
	end,
}

SMODS.Booster{
	key = "d6_jokers_pack",
	weight = 1,
	cost = 4,
	config = {extra = 3, choose = 1},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	create_card = function(self, card)
		return create_card("d6_jokers", G.pack_cards, nil, nil, true, true, nil, 'dsix_jokers')
	end,
	group_key = "d6_jokers_pack",
}

SMODS.Booster{
	key = "mega_d6_jokers_pack",
	weight = 0.25,
	cost = 8,
	config = {extra = 5, choose = 2},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	create_card = function(self, card)
		return create_card("d6_jokers", G.pack_cards, nil, nil, true, true, nil, 'dsix_jokers')
	end,
	group_key = "d6_jokers_pack",
}

SMODS.Booster{
	key = "d6_support_pack",
	weight = 1,
	cost = 4,
	config = {extra = 3, choose = 1},
	discovered = true,
	create_card = function(self, card)
		return create_card("d6_consumables", G.pack_cards, nil, nil, true, true, nil, 'dsix_support')
	end,
	group_key = "d6_support_pack",
}

SMODS.Booster{
	key = "mega_d6_support_pack",
	weight = 0.25,
	cost = 8,
	config = {extra = 5, choose = 2},
	discovered = true,
	create_card = function(self, card)
		return create_card("d6_consumables", G.pack_cards, nil, nil, true, true, nil, 'dsix_support')
	end,
	group_key = "d6_support_pack",
}

SMODS.Booster{
	key = "d6_booster_pack",
	weight = 0.8,
	cost = 6,
	config = {extra = 4, choose = 1},
	discovered = true,
	create_card = function(self, card)
		local card_to_make = nil
		if not card.ability.cards_made then card.ability.cards_made = 0 end
		if card.ability.cards_made < card.ability.extra/2 then 
			card_to_make = create_card("d6_jokers", G.pack_cards, nil, nil, true, true, nil, 'dsix_booster')
		else 
			card_to_make = create_card("d6_consumables", G.pack_cards, nil, nil, true, true, nil, 'dsix_booster')
		end
		card.ability.cards_made = card.ability.cards_made + 1
		return card_to_make
	end,
	group_key = "d6_booster_pack",
}

SMODS.Booster{
	key = "mega_d6_booster_pack",
	weight = 0.15,
	cost = 8,
	config = {extra = 4, choose = 2},
	discovered = true,
	create_card = function(self, card)
		local card_to_make = nil
		if not card.ability.cards_made then card.ability.cards_made = 0 end
		if card.ability.cards_made < card.ability.extra/2 then 
			card_to_make = create_card("d6_jokers", G.pack_cards, nil, nil, true, true, nil, 'dsix_mega_booster')
		else 
			card_to_make = create_card("d6_consumables", G.pack_cards, nil, nil, true, true, nil, 'dsix_mega_booster')
		end
		card.ability.cards_made = card.ability.cards_made + 1
		return card_to_make
	end,
	group_key = "d6_booster_pack",
}

--Helper Class for Booster API
SMODS.Obj_Pools = {}
SMODS.Obj_Pool = SMODS.GameObject:extend {
	obj_table = SMODS.Obj_Pools,
	obj_buffer = {},
	required_params = {
		'key',
	},
	omit_prefix = true,
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
			--print(tprint(o))
			--print(otwo)
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

G.FUNCS.your_collection_d6_sides = function(e)
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu{
	  definition = create_UIBox_your_collection_d6_Sides(),
	}
end

function create_UIBox_your_collection_d6_Sides(exit)
	local d6_side_matrix = {
	  {},{},{},{},{},{},
	}
	local d6_side_tab = {}
	for k, v in pairs(G.P_D6_SIDES) do
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
					if v.loc_vars and type(v.loc_vars) == "function" then temp_d6_side_loc_vars = v:loc_vars({}) end
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
  
	G.E_MANAGER:add_event(Event({
	  trigger = 'immediate',
	  func = (function()
		  for _, v in ipairs(blinds_to_be_alerted) do
			v.children.alert = UIBox{
			  definition = create_UIBox_card_alert(), 
			  config = { align="tri", offset = {x = 0.1, y = 0.1}, parent = v}
			}
			v.children.alert.states.collide.can = false
		  end
		  return true
	  end)
	}))
	
	local d6_sides_options = {}
	for i = 1, math.floor(#G.P_CENTER_POOLS["D6 Side"]/7) do
	  table.insert(d6_sides_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.floor(#G.P_CENTER_POOLS["D6 Side"]/7)))
	end

	local extras = nil
	local t = create_UIBox_generic_options({ back_func = exit or 'your_collection', contents = {
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

--File loading setup from OrtalabDEMO (it's peak ok)
local file_groups = NFS.getDirectoryItems(mod_path.."Objects")
local function init_file_groups()
	for k, file_group in pairs(file_groups) do
		local init_files = NFS.getDirectoryItems(mod_path.."Objects/"..file_group)
		for kk, v in pairs(init_files) do
			if string.find(v, ".lua") then
				local init_obj_filepath = tostring(mod_path.."Objects/"..file_group)
				local f, err = NFS.load(mod_path.."Objects/"..file_group.."/"..v)
				if err then sendErrorMessage("Couldn't load object file from D6 Jokers: "..err); sendErrorMessage("Object file path: "..tostring(mod_path.."Objects/"..file_group.."/"..v)) else
					local init_obj_file = f()
					if init_obj_file.init_func and type(init_obj_file.init_func) == "function" then init_obj_file.init_func(init_obj_filepath) end
				end
			end
		end
	end
end

init_file_groups()

----------------------------------------------
------------MOD CODE END----------------------
