return {
	["misc"] = {
		["v_dictionary"] = {
			["k_amount_of"] = "#1#/#2#",
			["d6_joker_roll"] = "Tiradas: #1#",
		},
		["dictionary"] = {
			["k_na"] = "¡No!",
			["k_created"] = "¡Creado!",
			["b_d6_sides"] = "Caras del D6",
			["k_oops"] = "¡Ups!",
			["d6_jokers_pack"] = "Paquete de bufón D6",
			["d6_support_pack"] = "Paquete de apoyo D6",
			["d6_booster_pack"] = "Paquete D6",
			["k_dice modifiers"] = "Modificador de dado",
			["b_dice modifiers_cards"] = "Modificadores de dado",
			["k_dsix_infected"] = "¡Infectado!",
			["k_delevel_ex"] = "¡Nivel bajado!",
			["k_boosted_ex"] = "¡Mejorado!",
			["d6config_dice_modifier"] = "Modificadores de dado",
			["d6config_booster_packs"] = "Paquetes",
			["d6config_upgrades_in_shop"] = "Mejoras de comodines D6 en tienda",
		},
	},
	["descriptions"] = {
		["Other"] = {
			["p_dsix_d6_jokers_pack"] = {
				["name"] = "Paquete de bufón D6",
				["text"] = {
					"Elige hasta {C:attention}#1#{} de",
					"{C:attention}#2#{C:joker} comodines D6{}",
				},
			},
			["p_dsix_mega_d6_jokers_pack"] = {
				["name"] = "Megapaquete de bufón D6",
				["text"] = {
					"Elige hasta {C:attention}#1#{} de",
					"{C:attention}#2#{C:joker} comodines D6{}",
				},
			},
			["p_dsix_d6_support_pack"] = {
				["name"] = "Paquete de apoyo D6",
				["text"] = {
					"Elige hasta {C:attention}#1#{} de",
					"{C:attention}#2#{C:joker} modificadores de dado{}",
				},
			},
			["p_dsix_mega_d6_support_pack"] = {
				["name"] = "Megapaquete de apoyo D6",
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
                ["name"] = "Por descubrir",
                ["text"] = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
			["infection_default"] = {
				["name"] = "Infectado",
				["text"] = {
					"Esta carta está {C:attention}debilitada{}",
					"{C:green}#1# de #2#{} de probabilidad",
					"de debilitar otra carta de igual tipo"
				},
			},
			["d6_side_edition_foil"] = {
                ["name"] = "Laminada",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}laminada{}",
                    "{C:chips}+#1#{} chips"
                }
			},
			["d6_side_edition_holo"] = {
                ["name"] = "Holográfica",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}holográfica{}",
                    "{C:mult}+#1#{} Mult"
                }
			},
			["d6_side_edition_polychrome"] = {
                ["name"] = "Policroma",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}policroma{}",
                    "{X:mult,C:white} X#1# {} Mult"
                }
			},
			["d6_side_edition_cry_glitched"] = {
                ["name"] = "Corrupta",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}corrupta{}",
					"Todos los resultados de esta cara",
					"serán {C:dark_edition}aleatorios{}",
					"entre {C:attention}X0.1{} y {C:attention}X10{}",
					"{C:inactive}(Si es posible){}",
                }
			},
			["d6_side_edition_cry_oversat"] = {
                ["name"] = "Sobresaturada",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}sobresaturada{}",
					"Todos los resultados de esta cara",
					"serán {C:attention}duplicados{}",
					"{C:inactive}(Si es posible)",
                }
			},
			["d6_side_edition_cry_mosaic"] = {
                ["name"] = "Troceada",
                ["text"] = {
					"Esta cara de D6 es de",
					"edición {C:dark_edition}troceada{}",
					"{X:chips,C:white}X#1# {} fichas",
                }
			},
			["d6_joker_weighted"] = {
				["name"] = "trucada",
				["text"] = {
					"Este comodín D6 tiene un",
					"{C:green}#1# de #2#{} de probabilidad",
					"de sacar {C:attention}#3#"
				},
			},
		},
		["Enhanced"] = {
			["m_dsix_boosted"] = {
				["name"] = "Mejorado",
				["text"] = {
					"{C:chips}+#1#{} fichas",
					"{C:mult}+#2#{} Multi",
					"{X:mult,C:white} X#3# {} Multi",
				},
			},
		},
		["Joker"] = {
			["j_dsix_basic_die"] = {
				["name"] = "Dado estándar",
				["text"] = {
					"Solamente un dado estándar",
				},
			},
			["j_dsix_chips_die"] = {
				["name"] = "Dado de fichas",
				["text"] = {
					"Solo un dado de fichas",
					"estándar",
				},
			},
			["j_dsix_chips_plus_die"] = {
				["name"] = "Dado de fichas+",
				["text"] = {
					"Un dado de fichas",
					"muy mejorado",
				},
			},
			["j_dsix_mult_die"] = {
				["name"] = "Dado multi",
				["text"] = {
					"Solo un dado multi",
					"estándar",
				},
			},
			["j_dsix_mult_plus_die"] = {
				["name"] = "Dado multi+",
				["text"] = {
					"Un dado multi",
					"muy mejorado",
				},
			},
			["j_dsix_xmult_die"] = {
				["name"] = "Dado Xmulti",
				["text"] = {
					"Solo un dado Xmulti",
					"estándar",
				},
			},
			["j_dsix_xmult_plus_die"] = {
				["name"] = "Dado Xmulti+",
				["text"] = {
					"Un dado Xmulti",
					"muy mejorado",
				},
			},
			["j_dsix_golden_die"] = {
				["name"] = "Dado dorado",
				["text"] = {
					"Se siente como $14",
				},
			},
			["j_dsix_golden_plus_die"] = {
				["name"] = "Dado dorado+",
				["text"] = {
					"Se siente como $22",
				},
			},
			["j_dsix_tarot_die"] = {
				["name"] = "Dado del tarot",
				["text"] = {
					"Un... método curioso",
					"para leer el tarot"
				},
			},
			["j_dsix_tarot_plus_die"] = {
				["name"] = "Dado del tarot+",
				["text"] = {
					"Un... método enrevesado",
					"para leer el tarot",
				},
			},
			["j_dsix_planet_die"] = {
				["name"] = "Dado celestial",
				["text"] = {
					"Este dado fue fabricado",
					"por entes celestiales",
				},
			},
			["j_dsix_planet_plus_die"] = {
				["name"] = "Dado celestial+",
				["text"] = {
					"Este dado fue fabricado",
					"por dioses celestiales",
				},
			},
			["j_dsix_spectral_die"] = {
				["name"] = "Dado espectral",
				["text"] = {
					"Puedes sentir la presencia",
					"de fantasmas",
				},
			},
			["j_dsix_spectral_plus_die"] = {
				["name"] = "Dado espectral+",
				["text"] = {
					"¡Los muertos vivirán",
					"por el poder de este dado!"
				},
			},
			["j_dsix_casino_die"] = {
				["name"] = "Dado ruleta",
				["text"] = {
					"Piénsatelo dos veces",
				},
			},
			["j_dsix_casino_plus_die"] = {
				["name"] = "Dado ruleta+",
				["text"] = {
					"No te lo pienses",
					"más veces",
				},
			},
			["j_dsix_party_die"] = {
				["name"] = "Dado fiesta",
				["text"] = {
					"¡Un poco de diversión",
					"nunca viene mal!"
				},
			},
			["j_dsix_chaos_die"] = {
				["name"] = "Dado caótico",
				["text"] = {
					"Inestable, loco y",
					"completamente aleatorio",
				},
			},
			["j_dsix_interstellar_die"] = {
				["name"] = "Dado interestelar",
				["text"] = {
					"Una nave abandonada",
					"con forma de dado",
					"Todavía puede transmitir datos",
				},
			},
			["j_dsix_interstellar_plus_die"] = {
				["name"] = "Dado interestelar+",
				["text"] = {
					"Una nave futurista",
					"con forma de dado",
					"Excelente observación planetaria",
				},
			},
			["j_dsix_impure_gutless_die"] = {
				["name"] = "{C:inactive}Impuro{} Dado demónico",
				["text"] = {
					"Nadie conoce su verdadero poder",
					"{C:inactive}Cómo purificar:",
					"{C:inactive}Ciegas derrotadas: {C:attention}#1#/#2#{C:inactive}",
				},
			},
			["j_dsix_impure_broke_die"] = {
				["name"] = "{C:inactive}Impuro{} Dado arruinado",
				["text"] = {
					"Bajo la falsa promesa de fortuna,",
					"todo estaba planeado desde el inicio",
					"{C:inactive}Cómo purificar:",
					"{C:inactive}Dinero recibido: {C:attention}#1#{C:inactive}",
				},
			},
			["j_dsix_impure_plague_die"] = {
				["name"] = "{C:inactive}Impuro{} Dado enfermo",
				["text"] = {
					"Por mucho que quiera ayudar",
					"solo transmite enfermedad...",
					"{C:inactive}Cómo purificar:",
					"{C:inactive}Comodines/consumibles infectados: {C:attention}#1#{C:inactive}",
				},
			},
			["j_dsix_pure_savior_die"] = {
				["name"] = "{C:inactive}Purificado{} Dado divino",
				["text"] = {
					"Ninguna ciega puede resistirse",
					"a la todopoderosa fuerza",
					"de este dado en juego",
				},
			},
			["j_dsix_pure_exchange_die"] = {
				["name"] = "{C:inactive}Purificado{} Dado de la fortuna",
				["text"] = {
					"Este dado convierte el más mísero",
					"centavo en millones y billones",
					"El secreto de Wall Street",
				},
			},
			["j_dsix_pure_medical_die"] = {
				["name"] = "{C:inactive}Purificado{} Dado médico",
				["text"] = {
					"Absolutamente toda enfermedad es curada",
					"a través del poder de este dado",
				},
			},
		},
		["Dice Modifiers"] = {
			["c_dsix_reconstruct"] = {
				["name"] = "Reconstrucción",
				["text"] = {
					"{C:attention}Mejora{} un {C:attention}comodín D6{}",
				},
			},
			["c_dsix_transplant"] = {
				["name"] = "Transplante",
				["text"] = {
					"El {C:attention}comodín{} cambia",
					"de posición {C:attention}1{} a",
					"posición {C:attention}6{}",
				},
			},
			["c_dsix_lightshow"] = {
				["name"] = "Espectáculo",
				["text"] = {
					"Todas las {C:attention}caras D6{} del",
					"{C:attention}comodín D6{} seleccionado",
					"ganan una {C:dark_edition}edición{} al azar",
				},
			},
			["c_dsix_weighted"] = {
				["name"] = "Trucamiento",
				["text"] = {
					"El {C:attention}comodín D6{} seleccionado",
					"pasa a ser {C:attention}trucado",
				},
			},
			["c_dsix_override"] = {
				["name"] = "Reemplazo",
				["text"] = {
					"Cambia todas las {C:attention}caras D6",
					"en el {C:attention}comodín D6{} seleccionado",
					"a la {C:attention}cara D6{} elegida",
				},
			},
			["c_dsix_concentration"] = {
				["name"] = "Concentración",
				["text"] = {
					"{C:attention}Mejora{} todas las caras del",
                    			"{C:attention}comodín D6{} seleccionado",
				},
			},
			["c_dsix_duplication"] = {
				["name"] = "Duplicado",
				["text"] = {
					"Selected {C:attention}D6 Side{} is copied",
					"to adjacent positions on",
					"selected {C:attention}D6 Joker",
				},
			},
		},
		["Tarot"] = {
			["c_dsix_the_die_wielder"] = {
				["name"] = "El portador",
				["text"] = {
					"Genera un {C:attention}comodín D6{}",
					"al azar"
				},
			},
		},
		["Spectral"] = {
			["c_dsix_purification"] = {
				["name"] = "Purificación",
				["text"] = {
					"Genera un {C:legendary}dado impuro{}",
				},
			},
		},
		["D6 Side"] = {
			["nothing_side"] = {
				["label"] = "Nada",
				["name"] = "{C:attention}Nada{}",
				["text"] = {
					"{C:attention}No hace nada",
				},
			},
			["nothing_plus_side"] = {
				["label"] = "Nada+",
				["name"] = "{C:attention}Nada+{}",
				["text"] = {
					"{C:attention}No hace nada*2",
				},
			},
			["nothing_plus2_side"] = {
				["label"] = "Nada++",
				["name"] = "{C:attention}Nada++{}",
				["text"] = {
					"{C:attention}No hace nada*3"
				},
			},
			["nothing_plus3_side"] = {
				["label"] = "Nada+++",
				["name"] = "{C:attention}Nada+++{}",
				["text"] = {
					"{C:attention}¡¿Hace algo?!",
					"{X:mult,C:white}X#1#{C:attention} Multi",
				},
			},
			["chips_side"] = {
				["label"] = "Fichas",
				["name"] = "{C:attention}Fichas{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Fichas",
				},
			},
			["chips_plus_side"] = {
				["label"] = "Fichas+",
				["name"] = "{C:attention}Fichas+{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Fichas",
				},
			},
			["chips_plus2_side"] = {
				["label"] = "Fichas++",
				["name"] = "{C:attention}Fichas++{}",
				["text"] = {
					"{C:chips}+#1#{C:attention} Fichas",
				},
			},
			["chips_minus_side"] = {
				["label"] = "Fichas-",
				["name"] = "{C:attention}Fichas-{}",
				["text"] = {
					"{C:chips}-#1#{C:attention} Fichas",
				},
			},
			["chips_minus2_side"] = {
				["label"] = "Fichas--",
				["name"] = "{C:attention}Fichas--{}",
				["text"] = {
					"{C:chips}-#1#{C:attention} Fichas",
				},
			},
			["mult_side"] = {
				["label"] = "Multi",
				["name"] = "{C:attention}Multi{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Multi",
				},
			},
			["mult_plus_side"] = {
				["label"] = "Multi+",
				["name"] = "{C:attention}Multi+{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Multi",
				},
			},
			["mult_plus2_side"] = {
				["label"] = "Multi++",
				["name"] = "{C:attention}Multi++{}",
				["text"] = {
					"{C:mult}+#1#{C:attention} Multi",
				},
			},
			["mult_minus_side"] = {
				["label"] = "Multi-",
				["name"] = "{C:attention}Multi-{}",
				["text"] = {
					"{C:mult}-#1#{C:attention} Multi",
				},
			},
			["mult_minus2_side"] = {
				["label"] = "Multi--",
				["name"] = "{C:attention}Multi--{}",
				["text"] = {
					"{C:mult}-#1#{C:attention} Multi",
				},
			},
			["xmult_side"] = {
				["label"] = "Xmulti",
				["name"] = "{C:attention}Xmulti{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Multi",
				},
			},
			["xmult_plus_side"] = {
				["label"] = "Xmulti+",
				["name"] = "{C:attention}Xmulti+{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Multi",
				},
			},
			["xmult_plus2_side"] = {
				["label"] = "Xmulti++",
				["name"] = "{C:attention}Xmulti++{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention} Multi",
				},
			},
			["all_in_side"] = {
				["label"] = "Todo a una",
				["name"] = "{C:attention}Todo a una{}",
				["text"] = {
					"{C:green}#1# de #2#{C:attention} de probabilidad",
					"{C:attention}de {C:mult}+#3#{C:attention} Multi",
				},
			},
			["all_in_plus_side"] = {
				["label"] = "Todo a una+",
				["name"] = "{C:attention}Todo a una+{}",
				["text"] = {
					"{C:green}#1# de #2#{C:attention} de probabilidad",
					"{C:attention}de {C:mult}+#3#{C:attention} Multi",
					"{C:attention}si no {C:mult}-#4#{C:attention} Multi"
				},
			},
			["payout_side"] = {
				["label"] = "Paga",
				["name"] = "{C:attention}Payga{}",
				["text"] = {
					"{C:attention}Gana {C:money}$#1#{C:attention} al",
					"{C:attention}final de la ronda"
				},
			},
			["payout_plus_side"] = {
				["label"] = "Paga+",
				["name"] = "{C:attention}Paga+{}",
				["text"] = {
					"{C:attention}Gana {C:money}$#1#{C:attention} al",
					"{C:attention}final de la ronda"
				},
			},
			["payout_plus2_side"] = {
				["label"] = "Paga++",
				["name"] = "{C:attention}Paga++{}",
				["text"] = {
					"{C:attention}Gana {C:money}$#1#{C:attention} al",
					"{C:attention}final de la ronda"
				},
			},
			["payout_minus_side"] = {
				["label"] = "Paga-",
				["name"] = "{C:attention}Paga-{}",
				["text"] = {
					"{C:attention}Pierde {C:red}$#1#{C:attention} al",
					"{C:attention}final de la ronda"
				},
			},
			["payout_minus2_side"] = {
				["label"] = "Paga--",
				["name"] = "{C:attention}Paga--{}",
				["text"] = {
					"{C:attention}Pierde {C:red}$#1#{C:attention} al",
					"{C:attention}final de la ronda"
				},
			},
			["cartomancy_side"] = {
				["label"] = "Cartomancia",
				["name"] = "{C:attention}Cartomancia{}",
				["text"] = {
					"{C:attention}Crea #1# carta de",
					"{C:attention}{C:tarot}tarot{} al lanzar el dado",
				},
			},
			["cartomancy_plus_side"] = {
				["label"] = "Cartomancia+",
				["name"] = "{C:attention}Cartomancia+{}",
				["text"] = {
					"{C:attention}Crea #1# cartas de",
					"{C:attention}{C:tarot}tarot{} al lanzar el dado",
				},
			},
			["planetarium_side"] = {
				["label"] = "Planetario",
				["name"] = "{C:attention}Planetario{}",
				["text"] = {
					"{C:attention}Crea #1# carta de",
					"{C:attention}{C:planet}planeta{} al lanzar el dado",
				},
			},
			["planetarium_plus_side"] = {
				["label"] = "Planetario+",
				["name"] = "{C:attention}Planetario+{}",
				["text"] = {
					"{C:attention}Crea #1# cartas de",
					"{C:attention}{C:planet}planeta{} al lanzar el dado",
				},
			},
			["apparition_side"] = {
				["label"] = "Aparición",
				["name"] = "{C:attention}Aparición{}",
				["text"] = {
					"{C:attention}Crea #1# carta {C:spectral}espectral{}",
					"{C:attention}al lanzar el dado",
				},
			},
			["apparition_plus_side"] = {
				["label"] = "Aparición+",
				["name"] = "{C:attention}Aparición+{}",
				["text"] = {
					"{C:attention}Crea #1# cartas {C:spectral}espectrales{}",
					"{C:attention}al lanzar el dado",
				},
			},
			["cardist_side"] = {
				["label"] = "Jugador",
				["name"] = "{C:attention}Jugador{}",
				["text"] = {
					"{C:attention}Gana +#1# mano",
					"{C:attention}al tirar el dado",
				},
			},
			["cardist_plus_side"] = {
				["label"] = "Jugador+",
				["name"] = "{C:attention}Jugador+{}",
				["text"] = {
					"{C:attention}Gana +#1# manos",
					"{C:attention}al tirar el dado",
				},
			},
			["juggler_side"] = {
				["label"] = "Malabarista",
				["name"] = "{C:attention}Malabarista{}",
				["text"] = {
					"{C:attention}+#1# tamaño de mano",
					"{C:attention}al tirar el dado",
				},
			},
			["juggler_plus_side"] = {
				["label"] = "Malabarista+",
				["name"] = "{C:attention}Malabarista+{}",
				["text"] = {
					"{C:attention}+#1# tamaño de mano",
					"{C:attention}al tirar el dado",
				},
			},
			["drunkard_side"] = {
				["label"] = "Derrochador",
				["name"] = "{C:attention}Derrochador{}",
				["text"] = {
					"{C:attention}Gana {C:red}+#1#{C:attention} descarte",
					"{C:attention}al tirar el dado",
				},
			},
			["drunkard_plus_side"] = {
				["label"] = "Derrochador+",
				["name"] = "{C:attention}Derrochador+{}",
				["text"] = {
					"{C:attention}Gana {C:red}+#1#{C:attention} descartes",
					"{C:attention}al tirar el dado",
				},
			},
			["chaos_side"] = {
				["label"] = "Caos",
				["name"] = "{C:attention}Caos{}",
				["text"] = {
					"{C:attention}Copia la habilidad de una",
					"{C:attention}cara D6 al azar al ser tirado",
					"{C:inactive}(Cara D6 copiada: {C:attention}#1#{C:inactive})",
				},
			},
			["chaos_plus_side"] = {
				["label"] = "Caos+",
				["name"] = "{C:attention}Caos+{}",
				["text"] = {
					"{C:attention}Copia la habilidad de una cara D6",
					"{C:attention}de nivel máximo al azar al ser tirado",
					"{C:inactive}(Cara D6 copiada: {C:attention}#1#{C:inactive})",
				},
			},
			["moon_side"] = {
				["label"] = "Luna",
				["name"] = "{C:attention}Luna{}",
				["text"] = {
					"{C:attention}Aumenta el nivel de", 
					"{C:attention}#1# mano de póker al azar",
					"{C:attention}por #2# cuando es tirado",
				},
			},
			["moon_plus_side"] = {
				["label"] = "Luna+",
				["name"] = "{C:attention}Luna+{}",
				["text"] = {
					"{C:attention}Aumenta el nivel de", 
					"{C:attention}#1# mano de póker al azar",
					"{C:attention}por #2# cuando es tirado",
				},
			},
			["moon_minus_side"] = {
				["label"] = "Luna-",
				["name"] = "{C:attention}Luna-{}",
				["text"] = {
					"{C:attention}Disminuye el nivel de", 
					"{C:attention}#1# mano de póker al azar",
					"{C:attention}por #2# cuando es tirado",
				},
			},
			["moon_minus2_side"] = {
				["label"] = "Luna--",
				["name"] = "{C:attention}Luna--{}",
				["text"] = {
					"{C:attention}Disminuye el nivel de", 
					"{C:attention}#1# mano de póker al azar",
					"{C:attention}por #2# cuando es tirado",
				},
			},
			["the_end_side"] = {
				["label"] = "El fin",
				["name"] = "{C:attention}El fin{}",
				["text"] = {
					"{C:attention}Este comodín se debilita",
					"{C:attention}y se vuelve eterno.",
					"{C:inactive}(No cuenta si es {C:attention}destruible{C:inactive})",
				},
			},
			["demolish_side"] = {
				["label"] = "Demolición",
				["name"] = "{C:attention}Demolición{}",
				["text"] = {
					"{C:attention}Todos los consumibles",
					"{C:attention}se destruyen y",
					"{C:attention}las ranuras pasan",
					"{C:attention}a ser 0",
				},
			},
			["curse_challenge_side"] = {
				["label"] = "Maldición desafío",
				["name"] = "{C:purple}Maldición desafío{}",
				["text"] = {
					"{C:purple}Aumenta el requisito",
					"{C:purple}de puntos en {C:attention}#1#X",
				},
			},
			["curse_nullify_side"] = {
				["label"] = "Maldición anulación",
				["name"] = "{C:purple}Maldición anulación{}",
				["text"] = {
					"{C:purple}El comodín de la derecha",
					"{C:purple}es {C:attention}debilitado",
					"{C:purple}durante el resto de la ciega",
				},
			},
			["curse_bankruptcy_side"] = {
				["label"] = "Maldición bancarrota",
				["name"] = "{C:purple}Maldición bancarrota{}",
				["text"] = {
					"{C:purple}Pierde {C:red}$#1#{C:purple}",
					"{C:purple}al final de la ronda",
				},
			},
			["curse_bear_market_side"] = {
				["label"] = "Maldición impuesto",
				["name"] = "{C:purple}Maldición impuesto{}",
				["text"] = {
					"{C:attention}La recompensa económica",
					"{C:purple} es de {C:red}$0",
				},
			},
			["curse_confusion_side"] = {
				["label"] = "Maldición confusión",
				["name"] = "{C:purple}Maldición confusión{}",
				["text"] = {
					"{C:purple}Todas las cartas tienen #1# de",
					"{C:green}#2#{C:purple} de probabilidad de",
					"{C:purple}ser robadas boca abajo",
				},
			},
			["curse_concussion_side"] = {
				["label"] = "Maldición recorte",
				["name"] = "{C:purple}Maldición recorte{}",
				["text"] = {
					"{C:attention}-#1#{C:purple} tamaño de mano",
				},
			},
			["curse_infection_side"] = {
				["label"] = "Maldición infección",
				["name"] = "{C:purple}Maldición infección{}",
				["text"] = {
					"{C:pale_green}Infecta{C:purple} un {C:attention}comodín",
					"{C:purple} o {C:attention}consumible {C:purple}al",
					"{C:purple}final de la ronda"
				},
			},
			["pure_slayer_side"] = {
				["label"] = "Bendición facilidad",
				["name"] = "{C:blue}Bendición facilidad{}",
				["text"] = {
					"{C:purple}Disminuye el requisito",
					"{C:purple}de puntos en {C:attention}#1#X",
				},
			},
			["pure_worship_side"] = {
				["label"] = "Bendición alabanza",
				["name"] = "{C:blue}Bendición alabanza{}",
				["text"] = {
					"{C:attention}+#1#{C:blue} Hand Size",
				},
			},
			["pure_skyrocket_side"] = {
				["label"] = "Bendición ganancia",
				["name"] = "{C:blue}Bendición ganancia{}",
				["text"] = {
					"{C:blue}El interés",
					"{C:blue}aumenta en {C:attention}#1#X",
				},
			},
			["pure_return_investment_side"] = {
				["label"] = "Bendición reintegro",
				["name"] = "{C:blue}Bendición reintegro{}",
				["text"] = {
					"{C:blue}Gana {C:money}$#1#{C:blue} por",
					"cada {C:money}$#2#{C:blue} perdidos o gastados",
				},
			},
			["pure_booster_side"] = {
				["label"] = "Bendición mejoría",
				["name"] = "{C:blue}Bendición mejoría{}",
				["text"] = {
					"{C:blue}Todas las cartas que no anoten se",
					"{C:blue}vuelven cartas {C:attention}mejoradas",
				},
			},
			["pure_quality_care_side"] = {
				["label"] = "Bendición calidad",
				["name"] = "{C:blue}Bendición calidad{}",
				["text"] = {
					"{C:attention}Reactiva {C:blue}todas",
					"{C:attention}las cartas anotadas #1# vez",
				},
			},
		},
	},
}