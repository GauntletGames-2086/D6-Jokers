return {
	["misc"] = {
		["v_dictionary"] = {
			["k_amount_of"] = "#1#/#2#",
			["d6_joker_roll"] = "Rolled: #1#",
		},
		["dictionary"] = {
			["k_na"] = "N/A",
			["k_created"] = "Created!",
			["b_d6_sides"] = "D6 Sides",
			["k_oops"] = "Oops!",
			["d6_jokers_pack"] = "D6 Jokers Pack",
			["d6_support_pack"] = "D6 Support Pack",
			["d6_booster_pack"] = "D6 Booster Pack",
			["k_dice modifiers"] = "Dice Modifier",
			["b_dice modifiers_cards"] = "Dice Modifiers",
			["k_dsix_infected"] = "Infected!",
			["k_delevel_ex"] = "Delevel!",
			["k_boosted_ex"] = "Boosted!",
			["d6config_dice_modifier"] = "Dice Modifiers",
			["d6config_other_consumables"] = "Other Consumables",
			["d6config_booster_packs"] = "Booster Pack",
			["d6config_upgrades_in_shop"] = "D6 Joker Upgrades in Shop",
		},
	},
	["descriptions"] = {
		["Other"] = {
			["p_dsix_d6_jokers_pack"] = {
				["name"] = "D6 Jokers Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} D6 Jokers{}",
				},
			},
			["p_dsix_mega_d6_jokers_pack"] = {
				["name"] = "Mega D6 Jokers Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} D6 Jokers{}",
				},
			},
			["p_dsix_d6_support_pack"] = {
				["name"] = "D6 Support Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} Dice Modifiers{}",
				},
			},
			["p_dsix_mega_d6_support_pack"] = {
				["name"] = "Mega D6 Support Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} Dice Modifiers{}",
				},
			},
			["p_dsix_d6_booster_pack"] = {
				["name"] = "D6 Booster Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} D6 Jokers{}",
					"or {C:joker}Dice Modifiers",
				},
			},
			["p_dsix_mega_d6_booster_pack"] = {
				["name"] = "Mega D6 Booster Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:joker} D6 Jokers{}",
					"or {C:joker}Dice Modifiers",
				},
			},
			["undiscovered_dice modifiers"] = {
                ["name"] = "Not Discovered",
                ["text"] = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
			["infection_default"] = {
				["name"] = "Infected",
				["text"] = {
					"Card is {C:attention}Debuffed{}",
					"{C:green}#1# in #2#{} to infect",
					"another card of same type"
				},
			},
			["d6_side_edition_foil"] = {
                ["name"] = "Foil",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Foil{} edition",
                    "{C:chips}+#1#{} chips"
                }
			},
			["d6_side_edition_holo"] = {
                ["name"] = "Holographic",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Holographic{} edition",
                    "{C:mult}+#1#{} Mult"
                }
			},
			["d6_side_edition_polychrome"] = {
                ["name"] = "Polychrome",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Polychrome{} edition",
                    "{X:mult,C:white} X#1# {} Mult"
                }
			},
			["d6_side_edition_cry_glitched"] = {
                ["name"] = "Glitched",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Glitched{} edition",
					'All values on this D6 Side',
					'are {C:dark_edition}randomized{}',
					'between {C:attention}X0.1{} and {C:attention}X10{}',
					'{C:inactive}(If possible){}',
                }
			},
			["d6_side_edition_cry_oversat"] = {
                ["name"] = "Oversaturated",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Oversaturated{} edition",
					"All values",
					"on this D6 Side",
					"are {C:attention}doubled{}",
					"{C:inactive}(If possible)"
                }
			},
			["d6_side_edition_cry_mosaic"] = {
                ["name"] = "Mosaic",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Oversaturated{} edition",
					"{X:chips,C:white}X#1# {} Chips",
                }
			},
			["d6_joker_weighted"] = {
				["name"] = "Weighted",
				["text"] = {
					"This D6 Joker has",
					"a {C:green}#1# in #2#{} to",
					"roll {C:attention}#3#"
				},
			},
		},
		["Enhanced"] = {
			["m_dsix_boosted"] = {
				["name"] = "Boosted",
				["text"] = {
					"{C:chips}+#1#{} chips",
					"{C:mult}+#2#{} Mult",
					"{X:mult,C:white} X#3# {} Mult",
				},
			},
		},
		["Joker"] = {
			["j_dsix_basic_die"] = {
				["name"] = "Basic Die",
				["text"] = {
					"Just a basic die, nothing more",
				},
			},
			["j_dsix_chips_die"] = {
				["name"] = "Chips Die",
				["text"] = {
					"Just a basic chips",
					"die, nothing more",
				},
			},
			["j_dsix_chips_plus_die"] = {
				["name"] = "Chips Die+",
				["text"] = {
					"Just a really good basic chips",
					"die, nothing more",
				},
			},
			["j_dsix_mult_die"] = {
				["name"] = "Mult Die",
				["text"] = {
					"Just a basic mult",
					"die, nothing more",
				},
			},
			["j_dsix_mult_plus_die"] = {
				["name"] = "Mult Die+",
				["text"] = {
					"Just a really good basic mult",
					"die, nothing more",
				},
			},
			["j_dsix_xmult_die"] = {
				["name"] = "XMult Die",
				["text"] = {
					"Just a basic xmult",
					"die, nothing more",
				},
			},
			["j_dsix_xmult_plus_die"] = {
				["name"] = "XMult Die+",
				["text"] = {
					"Just a really good xmult",
					"die, nothing more",
				},
			},
			["j_dsix_golden_die"] = {
				["name"] = "Golden Die",
				["text"] = {
					"Feels like 14K gold",
				},
			},
			["j_dsix_golden_plus_die"] = {
				["name"] = "Golden Die+",
				["text"] = {
					"Feels like 22K gold",
				},
			},
			["j_dsix_tarot_die"] = {
				["name"] = "Tarot Die",
				["text"] = {
					"An... interesting method",
					"of tarot reading"
				},
			},
			["j_dsix_tarot_plus_die"] = {
				["name"] = "Tarot Die+",
				["text"] = {
					"A more compelling method",
					"of tarot reading",
				},
			},
			["j_dsix_planet_die"] = {
				["name"] = "Planet Die",
				["text"] = {
					"This die was crafted by",
					"celestial beings",
				},
			},
			["j_dsix_planet_plus_die"] = {
				["name"] = "Planet Die+",
				["text"] = {
					"This die was crafted by",
					"celestial beings",
				},
			},
			["j_dsix_spectral_die"] = {
				["name"] = "Spectral Die",
				["text"] = {
					"You feel the presense",
					"of ghosts",
				},
			},
			["j_dsix_spectral_plus_die"] = {
				["name"] = "Spectral Die+",
				["text"] = {
					"The dead will rise",
					"by the power of this die!"
				},
			},
			["j_dsix_casino_die"] = {
				["name"] = "Roulette Die",
				["text"] = {
					"Better hedge your bets",
				},
			},
			["j_dsix_casino_plus_die"] = {
				["name"] = "Roulette Die+",
				["text"] = {
					"It's all or nothing",
				},
			},
			["j_dsix_party_die"] = {
				["name"] = "Party Die",
				["text"] = {
					"Always down to have fun!",
				},
			},
			["j_dsix_chaos_die"] = {
				["name"] = "Chaos Die",
				["text"] = {
					"Unstable, prone to",
					"increased randomness",
				},
			},
			["j_dsix_interstellar_die"] = {
				["name"] = "Interstellar Die",
				["text"] = {
					"An abandoned spacecraft in",
					"the shape of a die",
					"Still capable of transmitting data",
				},
			},
			["j_dsix_interstellar_plus_die"] = {
				["name"] = "Interstellar Die+",
				["text"] = {
					"A functioning spacecraft in",
					"the shape of a die",
					"Provides excellent planet observation",
				},
			},
			["j_dsix_impure_gutless_die"] = {
				["name"] = "Impure: Gutless Die",
				["text"] = {
					"Even the pinacle of dice wielders",
					"cower in fear",
					"Nobody knows its true power",
					"{C:inactive}Purification condition:",
					"{C:inactive}Total blinds defeated: {C:attention}#1#/#2#{C:inactive}",
				},
			},
			["j_dsix_impure_broke_die"] = {
				["name"] = "Impure: Broke Die",
				["text"] = {
					"This die was \"gifted\" to die wielders",
					"under the promise of fortune",
					"It was all rigged from the start",
					"{C:inactive}Purification condition:",
					"{C:inactive}Dollars after payout: {C:attention}#1#{C:inactive}",
				},
			},
			["j_dsix_impure_plague_die"] = {
				["name"] = "Impure: Plague Die",
				["text"] = {
					"All that these die wielders wanted",
					"to do is help the best they can...",
					"{C:inactive}Purification condition:",
					"{C:inactive}Infected Jokers/Consumables: {C:attention}#1#{C:inactive}",
				},
			},
			["j_dsix_pure_savior_die"] = {
				["name"] = "Pure: Savior Die",
				["text"] = {
					"The pinacle of strength and might",
					"No blind can hold its own",
					"with this die in play",
				},
			},
			["j_dsix_pure_exchange_die"] = {
				["name"] = "Pure: Exchange Die",
				["text"] = {
					"This die is capapble of turning",
					"small amounts of cash into billions",
					"A favorite in Wall Street",
				},
			},
			["j_dsix_pure_medical_die"] = {
				["name"] = "Pure: Medical Die",
				["text"] = {
					"Any and all would will be healed",
					"through the power held in this die",
				},
			},
		},
		["Dice Modifiers"] = {
			["c_dsix_reconstruct"] = {
				["name"] = "Reconstruct",
				["text"] = {
					"{C:attention}Upgrade{} selected {C:attention}D6 Joker{}",
				},
			},
			["c_dsix_transplant"] = {
				["name"] = "Transplant",
				["text"] = {
					"Set {C:attention}D6 Joker{} die face",
					"in position {C:attention}1{} to D6 Side",
					"in position {C:attention}6{}",
				},
			},
			["c_dsix_lightshow"] = {
				["name"] = "Lightshow",
				["text"] = {
					"All {C:attention}D6 Sides{} on selected",
					"{C:attention}D6 Joker{} gain a",
					"random {C:dark_edition}Edition{}",
				},
			},
			["c_dsix_weighted"] = {
				["name"] = "Weighted",
				["text"] = {
					"Selected {C:attention}D6 Joker{}",
					"becomes {C:attention}Weighted",
				},
			},
			["c_dsix_override"] = {
				["name"] = "Override",
				["text"] = {
					"Set all {C:attention}D6 Sides",
					"on selected {C:attention}D6 Joker{}",
					"to this cards selected {C:attention}D6 Side",
				},
			},
			["c_dsix_concentration"] = {
				["name"] = "Concentration",
				["text"] = {
					"{C:attention}Upgrade{} all die faces on",
                    "selected {C:attention}D6 Joker{}",
				},
			},
			["c_dsix_duplication"] = {
				["name"] = "Duplication",
				["text"] = {
					"Selected {C:attention}D6 Side{} is copied",
					"to adjacent positions on",
					"selected {C:attention}D6 Joker",
				},
			},
		},
		["Tarot"] = {
			["c_dsix_the_die_wielder"] = {
				["name"] = "The Die Wielder",
				["text"] = {
					"Spawn a random {C:attention}D6 Joker",
				},
			},
		},
		["Spectral"] = {
			["c_dsix_purification"] = {
				["name"] = "Purification",
				["text"] = {
					"Spawn an {C:legendary}Impure Die{}",
				},
			},
		},
		["D6 Side"] = {
			["nothing_side"] = {
				["label"] = "Nothing",
				["name"] = "{C:attention}Nothing{}",
				["text"] = {
					"{C:attention}Does nothing",
				},
			},
			["nothing_plus_side"] = {
				["label"] = "Nothing+",
				["name"] = "{C:attention}Nothing+{}",
				["text"] = {
					"{C:attention}Does nothing*2",
				},
			},
			["nothing_plus2_side"] = {
				["label"] = "Nothing++",
				["name"] = "{C:attention}Nothing++{}",
				["text"] = {
					"{C:attention}Does nothing*3"
				},
			},
			["nothing_plus3_side"] = {
				["label"] = "Nothing+++",
				["name"] = "{C:attention}Nothing+++{}",
				["text"] = {
					"{C:attention}IT DOES SOMETHING?!",
					"{X:mult,C:white}X#1#{C:attention} Mult",
				},
			},
			["chips_side"] = {
				["label"] = "Chips",
				["name"] = "{C:attention}Chips{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Chips",
				},
			},
			["chips_plus_side"] = {
				["label"] = "Chips+",
				["name"] = "{C:attention}Chips+{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Chips",
				},
			},
			["chips_plus2_side"] = {
				["label"] = "Chips++",
				["name"] = "{C:attention}Chips++{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Chips",
				},
			},
			["chips_minus_side"] = {
				["label"] = "Chips-",
				["name"] = "{C:attention}Chips-{}",
				["text"] = {
					"{C:chips}-#1#{C:attention} Chips",
				},
			},
			["chips_minus2_side"] = {
				["label"] = "Chips--",
				["name"] = "{C:attention}Chips--{}",
				["text"] = {
					"{C:chips}-#1#{C:attention} Chips",
				},
			},
			["mult_side"] = {
				["label"] = "Mult",
				["name"] = "{C:attention}Mult{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Mult",
				},
			},
			["mult_plus_side"] = {
				["label"] = "Mult+",
				["name"] = "{C:attention}Mult+{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Mult",
				},
			},
			["mult_plus2_side"] = {
				["label"] = "Mult++",
				["name"] = "{C:attention}Mult++{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Mult",
				},
			},
			["mult_minus_side"] = {
				["label"] = "Mult-",
				["name"] = "{C:attention}Mult-{}",
				["text"] = {
					"{C:mult}-#1#{C:attention} Mult",
				},
			},
			["mult_minus2_side"] = {
				["label"] = "Mult--",
				["name"] = "{C:attention}Mult--{}",
				["text"] = {
					"{C:mult}-#1#{C:attention} Mult",
				},
			},
			["xmult_side"] = {
				["label"] = "XMult",
				["name"] = "{C:attention}XMult{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Mult",
				},
			},
			["xmult_plus_side"] = {
				["label"] = "XMult+",
				["name"] = "{C:attention}XMult+{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Mult",
				},
			},
			["xmult_plus2_side"] = {
				["label"] = "XMult++",
				["name"] = "{C:attention}XMult++{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Mult",
				},
			},
			["all_in_side"] = {
				["label"] = "All In",
				["name"] = "{C:attention}All In{}",
				["text"] = {
					"{C:green}#1# in #2#{C:attention} chance",
					"{C:attention}for {C:mult}+#3#{C:attention} Mult",
				},
			},
			["all_in_plus_side"] = {
				["label"] = "All In+",
				["name"] = "{C:attention}All In+{}",
				["text"] = {
					"{C:green}#1# in #2#{C:attention} chance",
					"{C:attention}for {C:mult}+#3#{C:attention} Mult",
					"{C:attention}else {C:mult}-#4#{C:attention} Mult"
				},
			},
			["payout_side"] = {
				["label"] = "Payout",
				["name"] = "{C:attention}Payout{}",
				["text"] = {
					"{C:attention}Earn {C:money}$#1#{C:attention} at",
					"{C:attention}end of round"
				},
			},
			["payout_plus_side"] = {
				["label"] = "Payout+",
				["name"] = "{C:attention}Payout+{}",
				["text"] = {
					"{C:attention}Earn {C:money}$#1#{C:attention} at",
					"{C:attention}end of round"
				},
			},
			["payout_plus2_side"] = {
				["label"] = "Payout++",
				["name"] = "{C:attention}Payout++{}",
				["text"] = {
					"{C:attention}Earn {C:money}$#1#{C:attention} at",
					"{C:attention}end of round"
				},
			},
			["payout_minus_side"] = {
				["label"] = "Payout-",
				["name"] = "{C:attention}Payout-{}",
				["text"] = {
					"{C:attention}Lose {C:red}$#1#{C:attention} at",
					"{C:attention}end of round"
				},
			},
			["payout_minus2_side"] = {
				["label"] = "Payout--",
				["name"] = "{C:attention}Payout--{}",
				["text"] = {
					"{C:attention}Lose {C:red}$#1#{C:attention} at",
					"{C:attention}end of round"
				},
			},
			["cartomancy_side"] = {
				["label"] = "Cartomancy",
				["name"] = "{C:attention}Cartomancy{}",
				["text"] = {
					"{C:attention}Creates #1# {C:tarot}Tarot",
					"{C:attention}card when die is rolled",
				},
			},
			["cartomancy_plus_side"] = {
				["label"] = "Cartomancy+",
				["name"] = "{C:attention}Cartomancy+{}",
				["text"] = {
					"{C:attention}Creates #1# {C:tarot}Tarot",
					"{C:attention}cards when die is rolled",
				},
			},
			["planetarium_side"] = {
				["label"] = "Planetarium",
				["name"] = "{C:attention}Planetarium{}",
				["text"] = {
					"{C:attention}Creates #1# {C:planet}Planet",
					"{C:attention}card when die is rolled",
				},
			},
			["planetarium_plus_side"] = {
				["label"] = "Planetarium+",
				["name"] = "{C:attention}Planetarium+{}",
				["text"] = {
					"{C:attention}Creates #1# {C:planet}Planet",
					"{C:attention}cards when die is rolled",
				},
			},
			["apparition_side"] = {
				["label"] = "Apparition",
				["name"] = "{C:attention}Apparition{}",
				["text"] = {
					"{C:attention}Creates #1# {C:spectral}Spectral",
					"{C:attention}card when die is rolled",
				},
			},
			["apparition_plus_side"] = {
				["label"] = "Apparition+",
				["name"] = "{C:attention}Apparition+{}",
				["text"] = {
					"{C:attention}Creates #1# {C:spectral}Spectral",
					"{C:attention}cards when die is rolled",
				},
			},
			["cardist_side"] = {
				["label"] = "Cardist",
				["name"] = "{C:attention}Cardist{}",
				["text"] = {
					"{C:attention}Gain +#1# hand",
					"{C:attention}when die is rolled",
				},
			},
			["cardist_plus_side"] = {
				["label"] = "Cardist+",
				["name"] = "{C:attention}Cardist+{}",
				["text"] = {
					"{C:attention}Gain +#1# hands",
					"{C:attention}when die is rolled",
				},
			},
			["juggler_side"] = {
				["label"] = "Juggler",
				["name"] = "{C:attention}Juggler{}",
				["text"] = {
					"{C:attention}+#1# Hand Size",
					"{C:attention}when die is rolled",
				},
			},
			["juggler_plus_side"] = {
				["label"] = "Juggler+",
				["name"] = "{C:attention}Juggler+{}",
				["text"] = {
					"{C:attention}+#1# Hand Size",
					"{C:attention}when die is rolled",
				},
			},
			["drunkard_side"] = {
				["label"] = "Drunkard",
				["name"] = "{C:attention}Drunkard{}",
				["text"] = {
					"{C:attention}Gain {C:red}+#1#{C:attention} discard",
					"{C:attention}when die is rolled",
				},
			},
			["drunkard_plus_side"] = {
				["label"] = "Drunkard+",
				["name"] = "{C:attention}Drunkard+{}",
				["text"] = {
					"{C:attention}Gain {C:red}+#1#{C:attention} discard",
					"{C:attention}when die is rolled",
				},
			},
			["chaos_side"] = {
				["label"] = "Chaos",
				["name"] = "{C:attention}Chaos{}",
				["text"] = {
					"{C:attention}Copies ability of a",
					"{C:attention}random die when rolled",
					"{C:inactive}(Copied die: {C:attention}#1#{C:inactive})",
				},
			},
			["chaos_plus_side"] = {
				["label"] = "Chaos+",
				["name"] = "{C:attention}Chaos+{}",
				["text"] = {
					"{C:attention}Copies ability of a",
					"{C:attention}random leveled die when rolled",
					"{C:inactive}(Copied die: {C:attention}#1#{C:inactive})",
				},
			},
			["moon_side"] = {
				["label"] = "Moon",
				["name"] = "{C:attention}Moon{}",
				["text"] = {
					"{C:attention}Upgrade level of", 
					"{C:attention}#1# random poker hand by",
					"{C:attention}#2# when rolled",
				},
			},
			["moon_plus_side"] = {
				["label"] = "Moon+",
				["name"] = "{C:attention}Moon+{}",
				["text"] = {
					"{C:attention}Upgrades level of", 
					"{C:attention}all poker hands by",
					"{C:attention}#1# when rolled",
				},
			},
			["moon_minus_side"] = {
				["label"] = "Moon-",
				["name"] = "{C:attention}Moon-{}",
				["text"] = {
					"{C:attention}Decreased level of", 
					"{C:attention}#1# random poker hand by",
					"{C:attention}#2# when rolled",
				},
			},
			["moon_minus2_side"] = {
				["label"] = "Moon--",
				["name"] = "{C:attention}Moon--{}",
				["text"] = {
					"{C:attention}Decreased level of", 
					"{C:attention}all poker hands by",
					"{C:attention}#1# when rolled",
				},
			},
			["the_end_side"] = {
				["label"] = "The End",
				["name"] = "{C:attention}The End{}",
				["text"] = {
					"{C:attention}This joker is Debuffed",
					"{C:attention}and set to Eternal",
					"{C:inactive}(Bypass {C:attention}Perishable{C:inactive})",
				},
			},
			["demolish_side"] = {
				["label"] = "Demolish",
				["name"] = "{C:attention}Demolish{}",
				["text"] = {
					"{C:attention}All consumables are",
					"{C:attention}destroyed",
					"{C:attention}Consumable slots",
					"{C:attention}set to 0",
				},
			},
			["curse_challenge_side"] = {
				["label"] = "Curse: Challenge",
				["name"] = "{C:purple}Curse: Challenge{}",
				["text"] = {
					"{C:purple}Increase the current score",
					"{C:purple}requirement by {C:attention}#1#X",
				},
			},
			["curse_nullify_side"] = {
				["label"] = "Curse: Nullify",
				["name"] = "{C:purple}Curse: Nullify{}",
				["text"] = {
					"{C:purple}This Joker is {C:attention}Pinned",
					"{C:purple}The joker to the right",
					"{C:purple}is {C:attention}Debuffed",
					"{C:purple}for the rest of the blind",
				},
			},
			["curse_bankruptcy_side"] = {
				["label"] = "Curse: Bankruptcy",
				["name"] = "{C:purple}Curse: Bankruptcy{}",
				["text"] = {
					"{C:purple}Lose {C:red}$#1#{C:purple}",
					"{C:purple}at end of round",
				},
			},
			["curse_bear_market_side"] = {
				["label"] = "Curse: Bear Market",
				["name"] = "{C:purple}Curse: Bear Market{}",
				["text"] = {
					"{C:attention}Cash Out{C:purple} is {C:red}disabled",
				},
			},
			["curse_confusion_side"] = {
				["label"] = "Curse: Confusion",
				["name"] = "{C:purple}Curse: Confusion{}",
				["text"] = {
					"{C:purple}All cards drawn have a",
					"{C:green}#1# in #2#{C:purple} chance to",
					"{C:purple}be drawn face down",
				},
			},
			["curse_concussion_side"] = {
				["label"] = "Curse: Concussion",
				["name"] = "{C:purple}Curse: Concussion{}",
				["text"] = {
					"{C:attention}-#1#{C:purple} Hand Size",
				},
			},
			["curse_infection_side"] = {
				["label"] = "Curse: Infection",
				["name"] = "{C:purple}Curse: Infection{}",
				["text"] = {
					"{C:pale_green}Infect{C:purple} a random",
					"{C:attention}Joker{C:purple} or {C:attention}Consumable",
					"{C:purple}at end of round"
				},
			},
			["pure_slayer_side"] = {
				["label"] = "Pure: Slayer",
				["name"] = "{C:blue}Pure: Slayer{}",
				["text"] = {
					"{C:blue}Decrease the current score",
					"{C:blue}requirement by {C:attention}#1#X",
				},
			},
			["pure_worship_side"] = {
				["label"] = "Pure: Worship",
				["name"] = "{C:blue}Pure: Worship{}",
				["text"] = {
					"{C:attention}+#1#{C:blue} Hand Size",
				},
			},
			["pure_skyrocket_side"] = {
				["label"] = "Pure: Skyrocket",
				["name"] = "{C:blue}Pure: Skyrocket{}",
				["text"] = {
					"{C:blue}Interest earned is",
					"{C:blue}increased by {C:attention}#1#X",
				},
			},
			["pure_return_investment_side"] = {
				["label"] = "Pure: Return Investment",
				["name"] = "{C:blue}Pure: Return Investment{}",
				["text"] = {
					"{C:blue}Earn {C:money}$#1#{C:blue} per",
					"{C:money}$#2#{C:blue} lost or spent",
				},
			},
			["pure_booster_side"] = {
				["label"] = "Pure: Booster",
				["name"] = "{C:blue}Pure: Booster{}",
				["text"] = {
					"{C:blue}All unscored cards convert",
					"{C:blue}to {C:attention}Boosted{C:blue} cards",
				},
			},
			["pure_quality_care_side"] = {
				["label"] = "Pure: Quality Care",
				["name"] = "{C:blue}Pure: Quality Care{}",
				["text"] = {
					"{C:attention}Retrigger {C:blue}all",
					"{C:attention}scored cards #1# time",
				},
			},
		},
	},
}