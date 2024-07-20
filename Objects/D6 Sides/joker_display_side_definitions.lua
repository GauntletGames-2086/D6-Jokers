local init_joker_display = function(base_file_path)
    if _G["JokerDisplay"] then
        JokerDisplay.D6_Side_Definitions = {
            nothing_side = { -- Nothing
                text = {
                    { text = ' ' },
                },
            },
            nothing_plus_side = { -- Nothing+
                text = {
                    { text = ' ' },
                },
            },
            nothing_plus2_side = { -- Nothing++
                text = {
                    { text = ' ' },
                },
            },
            nothing_plus3_side = { -- Nothing+++
                text = {
                    {
                        border_nodes = {
                            { text = 'X' },
                            { ref_table = 'G.P_D6_SIDES.nothing_plus3_side.config', ref_value = 'xmult' },
                        },
                    },
                },
            },
            chips_side = { -- Chips
                text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.chips_side.config', ref_value = 'chips' },
                },
                text_config = { colour = G.C.CHIPS },
            },
            chips_plus_side = { -- Chips+
                text = {
                    { text = '+', },
                    { ref_table = 'G.P_D6_SIDES.chips_plus_side.config', ref_value = 'chips' },
                },
                text_config = { colour = G.C.CHIPS },
            },
            chips_plus2_side = { -- Chips++
                text = {
                    { text = '+', },
                    { ref_table = 'G.P_D6_SIDES.chips_plus2_side.config', ref_value = 'chips' },
                },
                text_config = { colour = G.C.CHIPS },
            },
            chips_minus_side = { -- Chips-
                text = {
                    { text = '-', },
                    { ref_table = 'card.joker_display_values', ref_value = 'chips' },
                },
                text_config = { colour = G.C.CHIPS },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.chips = 0
                    else
                        card.joker_display_values.chips = G.P_D6_SIDES.chips_minus_side.config.chips or 0
                    end
                end
            },
            chips_minus2_side = { -- Chips--
                text = {
                    { text = '-', },
                    { ref_table = 'card.joker_display_values', ref_value = 'chips' },
                },
                text_config = { colour = G.C.CHIPS },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.chips = 0
                    else
                        card.joker_display_values.chips = G.P_D6_SIDES.chips_minus2_side.config.chips or 0
                    end
                end
            },
            mult_side = { -- Mult
                text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.mult_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
            },
            mult_plus_side = { -- Mult+
                text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.mult_plus_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
            },
            mult_plus2_side = { -- Mult++
                text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.mult_plus2_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
            },
            mult_minus_side = { -- Mult-
                text = {
                    { text = '-' },
                    { ref_table = 'card.joker_display_values', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.mult = 0
                    else
                        card.joker_display_values.mult = G.P_D6_SIDES.mult_minus_side.config.mult or 0
                    end
                end
            },
            mult_minus2_side = { -- Mult-
                text = {
                    { text = '-' },
                    { ref_table = 'G.P_D6_SIDES.mult_minus2_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.mult = 0
                    else
                        card.joker_display_values.mult = G.P_D6_SIDES.mult_minus2_side.config.mult or 0
                    end
                end
            },
            xmult_side = { -- XMult
                text = {
                    {
                        border_nodes = {
                            { text = 'X' },
                            { ref_table = 'G.P_D6_SIDES.xmult_side.config', ref_value = 'xmult' },
                        },
                    },
                },
            },
            xmult_plus_side = { -- XMult+
                text = {
                    {
                        border_nodes = {
                            { text = 'X' },
                            { ref_table = 'G.P_D6_SIDES.xmult_plus_side.config', ref_value = 'xmult' },
                        },
                    },
                },
            },
            xmult_plus2_side = { -- XMult++
                text = {
                    {
                        border_nodes = {
                            { text = 'X' },
                            { ref_table = 'G.P_D6_SIDES.xmult_plus2_side.config', ref_value = 'xmult' },
                        },
                    },
                },
            },
            payout_side = { -- Payout
                text = {
                    { text = '+$' },
                    { ref_table = 'G.P_D6_SIDES.payout_side.config', ref_value = 'money' },
                },
                text_config = { colour = G.C.GOLD },
                reminder_text = {
                    { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                },
                calc_function = function(card)
                    card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                end
            },
            payout_plus_side = { -- Payout+
                text = {
                    { text = '+$' },
                    { ref_table = 'G.P_D6_SIDES.payout_plus_side.config', ref_value = 'money' },
                },
                text_config = { colour = G.C.GOLD },
                reminder_text = {
                    { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                },
                calc_function = function(card)
                    card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                end
            },
            payout_plus2_side = { -- Payout++
                text = {
                    { text = '+$' },
                    { ref_table = 'G.P_D6_SIDES.payout_plus2_side.config', ref_value = 'money' },
                },
                text_config = { colour = G.C.GOLD },
                reminder_text = {
                    { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                },
                calc_function = function(card)
                    card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                end
            },
            planetarium_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.planetarium_side.config', ref_value = 'planet_cards_gained' },
                    { text = ' Planet' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Planet }
            },
            planetarium_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.planetarium_plus_side.config', ref_value = 'planet_cards_gained' },
                    { text = ' Planet' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Planet }
            },
            cartomancy_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.cartomancy_side.config', ref_value = 'tarot_cards_gained' },
                    { text = ' Tarot' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Tarot }
            },
            cartomancy_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.cartomancy_plus_side.config', ref_value = 'tarot_cards_gained' },
                    { text = ' Tarot' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Tarot }
            },
            juggler_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.juggler_side.config', ref_value = 'hand_size' },
                    { text = ' Hand Size' },
                },
                reminder_text_config = { colour = G.C.ORANGE }
            },
            juggler_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.juggler_plus_side.config', ref_value = 'hand_size' },
                    { text = ' Hand Size' },
                },
                reminder_text_config = { colour = G.C.ORANGE }
            },
            drunkard_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.drunkard_side.config', ref_value = 'discards' },
                    { text = ' Discards' },
                },
                reminder_text_config = { colour = G.C.RED }
            },
            drunkard_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.drunkard_plus_side.config', ref_value = 'discards' },
                    { text = ' Discards' },
                },
                reminder_text_config = { colour = G.C.RED }
            },
            cardist_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.cardist_side.config', ref_value = 'hands' },
                    { text = ' Hands' },
                },
                reminder_text_config = { colour = G.C.BLUE }
            },
            cardist_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.cardist_plus_side.config', ref_value = 'hands' },
                    { text = ' Hands' },
                },
                reminder_text_config = { colour = G.C.BLUE }
            },
            chaos_side = {
                name_config = { colour = G.C.UI.TEXT_INACTIVE },
                calc_function = function (card)
					if card.ability.extra and card.ability.extra.chaos_selected_die then
						local side_key = card.ability.extra.chaos_selected_die
						if side_key ~= card.joker_display_values.d6_chaos_side then
							card.joker_display_values.d6_chaos_side = side_key
							card.children.joker_display:remove_text()
							card.children.joker_display_small:remove_text()
							card.children.joker_display:remove_reminder_text()
							card.children.joker_display:remove_extra()
							if JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
								if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
									JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].text then
									card.children.joker_display:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
									card.children.joker_display_small:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].reminder_text then
									local reminder_text_config = JokerDisplay.D6_Side_Definitions[side_key].reminder_text_config or {}
									reminder_text_config.colour = reminder_text_config.colour or G.C.UI.TEXT_INACTIVE
        							reminder_text_config.scale = reminder_text_config.scale or 0.3
									card.children.joker_display:add_reminder_text(JokerDisplay.D6_Side_Definitions[side_key].reminder_text, reminder_text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].extra then
									card.children.joker_display:add_extra(JokerDisplay.D6_Side_Definitions[side_key].extra, JokerDisplay.D6_Side_Definitions[side_key].extra_config)
								end
							else
                                card.children.joker_display:add_text({{ text = ' ' }})
                            end
							if side_key then
								local name_config = JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] and JokerDisplay.D6_Side_Definitions[side_key].name_config or { }
								name_config.colour = name_config.colour or G.C.ORANGE
								name_config.scale = name_config.scale or 0.3
								card.children.joker_display:add_extra({{{ text = G.localization.descriptions["D6 Side"][side_key].label or "" },}}, name_config)
							end
						elseif JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
							if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
								JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
							end
						end
                    end
				end
            },
            chaos_plus_side = {
                name_config = { colour = G.C.UI.TEXT_INACTIVE },
                calc_function = function (card)
					if card.ability.extra and card.ability.extra.chaos_selected_die then
						local side_key = card.ability.extra.chaos_selected_die
						if side_key ~= card.joker_display_values.d6_chaos_side then
							card.joker_display_values.d6_chaos_side = side_key
							card.children.joker_display:remove_text()
							card.children.joker_display_small:remove_text()
							card.children.joker_display:remove_reminder_text()
							card.children.joker_display:remove_extra()
							if JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
								if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
									JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].text then
									card.children.joker_display:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
									card.children.joker_display_small:add_text(JokerDisplay.D6_Side_Definitions[side_key].text, JokerDisplay.D6_Side_Definitions[side_key].text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].reminder_text then
									local reminder_text_config = JokerDisplay.D6_Side_Definitions[side_key].reminder_text_config or {}
									reminder_text_config.colour = reminder_text_config.colour or G.C.UI.TEXT_INACTIVE
        							reminder_text_config.scale = reminder_text_config.scale or 0.3
									card.children.joker_display:add_reminder_text(JokerDisplay.D6_Side_Definitions[side_key].reminder_text, reminder_text_config)
								end
								if JokerDisplay.D6_Side_Definitions[side_key].extra then
									card.children.joker_display:add_extra(JokerDisplay.D6_Side_Definitions[side_key].extra, JokerDisplay.D6_Side_Definitions[side_key].extra_config)
								end
							else
                                card.children.joker_display:add_text({{ text = ' ' }})
                            end
							if side_key then
								local name_config = JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] and JokerDisplay.D6_Side_Definitions[side_key].name_config or { }
								name_config.colour = name_config.colour or G.C.ORANGE
								name_config.scale = name_config.scale or 0.3
								card.children.joker_display:add_extra({{{ text = G.localization.descriptions["D6 Side"][side_key].label or "" },}}, name_config)
							end
						elseif JokerDisplay.D6_Side_Definitions and JokerDisplay.D6_Side_Definitions[side_key] then
							if JokerDisplay.D6_Side_Definitions[side_key].calc_function then
								JokerDisplay.D6_Side_Definitions[side_key].calc_function(card)
							end
						end
					else
                        card.children.joker_display:add_text({{ text = ' ' }})
                    end
				end
            },
            all_in_side = {
                text = {
                    { text = '-' },
                    { ref_table = 'card.joker_display_values', ref_value = 'minus_mult' },
                    { text = ' +' },
                    { ref_table = 'G.P_D6_SIDES.all_in_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
                reminder_text = {
                    { text = '(50%)  (50%)' }
                },
                reminder_text_config = { colour = G.C.GREEN },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.minus_mult = 0
                    else
                        card.joker_display_values.minus_mult = G.P_D6_SIDES.all_in_side.config.mult or 0
                    end
                end
            },
            all_in_plus_side = {
                text = {
                    { text = '-' },
                    { ref_table = 'card.joker_display_values', ref_value = 'minus_mult' },
                    { text = ' +' },
                    { ref_table = 'G.P_D6_SIDES.all_in_plus_side.config', ref_value = 'mult' },
                },
                text_config = { colour = G.C.MULT },
                reminder_text = {
                    { text = '(50%)  (50%)' }
                },
                reminder_text_config = { colour = G.C.GREEN },
                calc_function = function (card)
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
                    end
                    if other_joker and other_joker.joker_display_values and 
                    other_joker.joker_display_values.d6_side and
                    other_joker.joker_display_values.d6_side == "blocker_side" then
                        card.joker_display_values.minus_mult = 0
                    else
                        card.joker_display_values.minus_mult = G.P_D6_SIDES.all_in_plus_side.config.mult or 0
                    end
                end
            },
            card_pack_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.card_pack_side.config', ref_value = 'count' },
                    { text = ' Card Pack Tag' },
                },
                reminder_text_config = { colour = G.C.PURPLE }
            },
            card_pack_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.card_pack_plus_side.config', ref_value = 'count' },
                    { text = ' Card Pack Tag' },
                },
                reminder_text_config = { colour = G.C.BOOSTER }
            },
            orbital_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.orbital_side.config', ref_value = 'count' },
                    { text = ' Orbital Tag' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Planet }
            },
            orbital_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.orbital_plus_side.config', ref_value = 'count' },
                    { text = ' Orbital Tag' },
                },
                reminder_text_config = { colour = G.C.SECONDARY_SET.Planet }
            },
            root_beer_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.root_beer_side.config', ref_value = 'count' },
                    { text = ' Double Tag' },
                },
                reminder_text_config = { colour = G.C.ORANGE }
            },
            root_beer_plus_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.root_beer_plus_side.config', ref_value = 'count' },
                    { text = ' Double Tag' },
                },
                reminder_text_config = { colour = G.C.ORANGE }
            },
            blocker_side = {
                text = {
                    { text = ' ' },
                },
            },
            the_end_side = {
                text = {
                    { text = ' ' },
                },
            },
            curse_challenge_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.PURPLE }
            },
            curse_nullify_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.PURPLE }
            },
            curse_confusion_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.PURPLE }
            },
            curse_concussion_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '-' },
                    { ref_table = 'G.P_D6_SIDES.curse_concussion_side.config', ref_value = 'hand_size' },
                    { text = ' Hand Size' },
                },
                reminder_text_config = { colour = G.C.ORANGE },
                name_config = { colour = G.C.PURPLE }
            },
            curse_bankruptcy_side = {
                text = {
                    { text = '-$' },
                    { ref_table = 'G.P_D6_SIDES.curse_bankruptcy_side.config', ref_value = 'money_loss' },
                },
                text_config = { colour = G.C.GOLD },
                reminder_text = {
                    { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                },
                name_config = { colour = G.C.PURPLE },
                calc_function = function(card)
                    card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                end
            },
            curse_bear_market_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.PURPLE }
            },
            pure_slayer_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.GREEN }
            },
            pure_worship_side = {
                text = {
                    { text = ' ' },
                },
                reminder_text = {
                    { text = '+' },
                    { ref_table = 'G.P_D6_SIDES.pure_worship_side.config', ref_value = 'hand_size' },
                    { text = ' Hand Size' },
                },
                reminder_text_config = { colour = G.C.ORANGE },
                name_config = { colour = G.C.GREEN }
            },
            pure_skyrocket_side = {
                text = {
                    {
                        border_nodes = {
                            { text = '$X' },
                            { ref_table = 'G.P_D6_SIDES.pure_skyrocket_side.config', ref_value = 'interest_buff' },
                        },
                        border_colour = G.C.GOLD
                    }
                },
                name_config = { colour = G.C.GREEN }
            },
            pure_return_investment_side = {
                text = {
                    { text = ' ' },
                },
                name_config = { colour = G.C.GREEN }
            }
        }
    end
end
return {init_func = init_joker_display}