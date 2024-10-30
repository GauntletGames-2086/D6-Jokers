local init_d6_jokers = function(base_file_path)
	local d6_joker_files = assert(NFS.getDirectoryItems(SMODS.current_mod.path..base_file_path.."/d6_joker LuaList"))
	local d6_jokers_to_inject = {}
	local order_list = assert(SMODS.load_file(base_file_path.."/d6_jokers_config.lua"))()

	--assemble list of d6_jokers_to_inject
	for k, file in pairs(d6_joker_files) do
		if string.find(file, ".lua") then
			local d6_joker = assert(SMODS.load_file(base_file_path.."/d6_joker LuaList/"..file))()
			if not d6_joker then break end
			d6_joker["order"] = (order_list[d6_joker.key] and order_list[d6_joker.key].order) or #order_list
			if not order_list[d6_joker.key] then sendErrorMessage("MISSING FROM ORDER LIST: "..d6_joker.key) end
			d6_jokers_to_inject[#d6_jokers_to_inject+1] = d6_joker
		end
	end

	--Sort by order
	table.sort(d6_jokers_to_inject, function(a, b) return a.order < b.order end)

	--Register the joker (in the sorted order)
	local curr_d6_joker_order = 1
	for _, d6_joker in pairs(d6_jokers_to_inject) do
		d6_jokers_to_inject[curr_d6_joker_order]:register(d6_joker.order)
		curr_d6_joker_order = curr_d6_joker_order + 1
	end

	-- D6_JokerDisplay support
	for _, d6_joker in pairs(d6_jokers_to_inject) do
		D6_JokerDisplay.Definitions[d6_joker.key] = {
			calc_function = function (card)
				if card.ability.extra then
					local side_key = card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].key
					if side_key ~= card.joker_display_values.d6_side then
						card.joker_display_values.d6_side = side_key
						for k, v in pairs(card.ability.extra.local_d6_sides[card.ability.extra.selected_d6_face].extra) do
							card.joker_display_values[k] = v
						end
						card.children.joker_display:remove_text()
						card.children.joker_display_small:remove_text()
						card.children.joker_display:remove_reminder_text()
						card.children.joker_display:remove_extra()
						if D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] then
							if D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function then
								D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
							end
							if D6_JokerDisplay.D6_Side_Definitions[side_key].text then
								card.children.joker_display:add_text(D6_JokerDisplay.D6_Side_Definitions[side_key].text, D6_JokerDisplay.D6_Side_Definitions[side_key].text_config)
								card.children.joker_display_small:add_text(D6_JokerDisplay.D6_Side_Definitions[side_key].text, D6_JokerDisplay.D6_Side_Definitions[side_key].text_config)
							end
							if D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text then
								local reminder_text_config = D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text_config or {}
								reminder_text_config.colour = reminder_text_config.colour or G.C.UI.TEXT_INACTIVE
								reminder_text_config.scale = reminder_text_config.scale or 0.3
								card.children.joker_display:add_reminder_text(D6_JokerDisplay.D6_Side_Definitions[side_key].reminder_text, reminder_text_config)
							end
							if D6_JokerDisplay.D6_Side_Definitions[side_key].extra then
								card.children.joker_display:add_extra(D6_JokerDisplay.D6_Side_Definitions[side_key].extra, D6_JokerDisplay.D6_Side_Definitions[side_key].extra_config)
							end
						end
						if side_key then
							local name_config = D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] and D6_JokerDisplay.D6_Side_Definitions[side_key].name_config or { }
							name_config.colour = name_config.colour or G.C.ORANGE
							name_config.scale = name_config.scale or 0.3
							card.children.joker_display:add_extra({{{ text = G.localization.descriptions["D6 Side"][side_key].label or "" },}}, name_config)
						end
					elseif D6_JokerDisplay.D6_Side_Definitions and D6_JokerDisplay.D6_Side_Definitions[side_key] then
						if D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function then
							D6_JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
						end
					end
				end
			end
		}
	end
end

return {init_func = init_d6_jokers}