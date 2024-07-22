return {
	["misc"] = {
		["v_dictionary"] = {
			["k_amount_of"] = "#1#/#2#",
			["d6_joker_roll"] = "骰点：#1#",
		},
		["dictionary"] = {
			["k_na"] = "暂无",
			["k_created"] = "生成！",
			["b_d6_sides"] = "骰面",
			["k_oops"] = "哦哟！",
			["d6_jokers_pack"] = "六面骰小丑包",
			["d6_support_pack"] = "六面骰支援包",
			["d6_booster_pack"] = "六面骰补充包",
		},
	},
	["descriptions"] = {
		["Other"] = {
			["p_dsix_d6_jokers_pack"] = {
				["name"] = "六面骰小丑包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰小丑牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			["p_dsix_mega_d6_jokers_pack"] = {
				["name"] = "超级六面骰小丑包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰小丑牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			["p_dsix_d6_support_pack"] = {
				["name"] = "六面骰支援包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰消耗牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			["p_dsix_mega_d6_support_pack"] = {
				["name"] = "超级六面骰支援包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰消耗牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			["p_dsix_d6_booster_pack"] = {
				["name"] = "六面骰补充包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰小丑牌{}或{C:joker}消耗牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			["p_dsix_mega_d6_booster_pack"] = {
				["name"] = "超级六面骰补充包",
				["text"] = {
					"从至多{C:attention}#2#{}张",
					"{C:joker}六面骰小丑牌{}或{C:joker}消耗牌{}中",
					"选择{C:attention}#1#{}张"
				},
			},
			-- TODO: translate
			["infection_default"] = {
				["name"] = "Infected",
				["text"] = {
					"Card is {C:attention}Debuffed{}",
					"{C:green}#1# in #2#{} to infect",
					"another card of same type"
				},
			},
			["d6_side_edition_polychrome"] = {
                ["name"] = "Polychrome",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Polychrome{} edition",
                    "{X:mult,C:white} X#1# {} Mult"
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
			["d6_side_edition_foil"] = {
                ["name"] = "Foil",
                ["text"] = {
					"Selected D6 Side has",
					"{C:dark_edition}Foil{} edition",
                    "{C:chips}+#1#{} chips"
                }
			},
			["d6_joker_linked"] = {
				["name"] = "Linked",
				["text"] = {
					"This D6 Joker cannot",
					"change selected {C:attention}D6 Side"
				},
			},
		},
		["Joker"] = {
			-- TODO: translate
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
			["j_dsix_interstellar_die"] = {
				["name"] = "Interstellar Die",
				["text"] = {
					"An abandoned spacecraft in",
					"the shape of a die",
					"Still capable of transmitting data",
				},
			},
			["j_dsix_interstellar_plus_die"] = {
				["name"] = "Interstellar Die",
				["text"] = {
					"A functioning space ship in",
					"the shape of a die",
					"Fully capable of data collection",
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
			["j_dsix_pure_medical_die"] = {
				["name"] = "Pure: Medical Die",
				["text"] = {
					"Any and all would will be healed",
					"through the power held in this die",
				},
			},
			["j_dsix_casino_die"] = {
				["name"] = "赌场骰子",
				["text"] = {
					"别在一棵树上吊死",
				},
			},
			["j_dsix_chips_die"] = {
				["name"] = "筹码骰子",
				["text"] = {
					"稀松平常的筹码骰子"
				},
			},
			["j_dsix_golden_plus_die"] = {
				["name"] = "黄金骰子+",
				["text"] = {
					"18K金般闪闪亮",
				},
			},
			["j_dsix_casino_plus_die"] = {
				["name"] = "赌场骰子+",
				["text"] = {
					"要么一夜暴富",
					"要么输光衣服",
				},
			},
			["j_dsix_insurance_plus_die"] = {
				["name"] = "保险骰子+",
				["text"] = {
					"比人寿保险还保险的保险",
					"（别在意那个“空”就行了）",
				},
			},
			["j_dsix_self_selling_die"] = {
				["name"] = "卖身骰子",
				["text"] = {
					"这个骰子好像真的不想",
					"占着你的小丑牌槽位",
				},
			},
			["j_dsix_planet_die"] = {
				["name"] = "星球骰子",
				["text"] = {
					"外星人做的骰子",
				},
			},
			["j_dsix_tarot_plus_die"] = {
				["name"] = "塔罗骰子+",
				["text"] = {
					"下辈子的命都能给你算出来",
				},
			},
			["j_dsix_impure_gutless_die"] = {
				["name"] = "不纯骰子：怯懦",
				["text"] = {
					"最顶尖的掷骰者都不免退缩",
					"因而尚无人知晓它真正的力量……",
					"{C:inactive}净化条件：",
					"{C:inactive}总计击败盲注数：{C:attention}#1#/#2#",
				},
			},
			["j_dsix_support_die"] = {
				["name"] = "支援骰子",
				["text"] = {
					"时刻待命，乐于助人！",
				},
			},
			["j_dsix_planet_plus_die"] = {
				["name"] = "星球骰子+",
				["text"] = {
					"外星人做的骰子",
				},
			},
			["j_dsix_golden_die"] = {
				["name"] = "黄金骰子",
				["text"] = {
					"14K金般闪闪亮",
				},
			},
			["j_dsix_impure_broke_die"] = {
				["name"] = "不纯骰子：破产",
				["text"] = {
					"这份“大礼”是否能唤醒一些",
					"零八年房地产市场崩盘的记忆？",
					"{C:inactive}净化条件：",
					"{C:inactive}提现后资金数额：{C:attention}#1#",
				},
			},
			["j_dsix_tarot_die"] = {
				["name"] = "塔罗骰子",
				["text"] = {
					"算个命还混搭着来啊",
				},
			},
			["j_dsix_mult_plus_die"] = {
				["name"] = "倍率骰子+",
				["text"] = {
					"更厉害的倍率骰子",
					"其他没什么好说的",
				},
			},
			["j_dsix_mult_die"] = {
				["name"] = "倍率骰子",
				["text"] = {
					"就是个倍率骰子",
					"没什么好说的",
				},
			},
			["j_dsix_pure_savior_die"] = {
				["name"] = "纯净骰子：救星",
				["text"] = {
					"至臻至纯，无上神力",
					"一骰既出，退散千军",
				},
			},
			["j_dsix_chaos_die"] = {
				["name"] = "混乱骰子",
				["text"] = {
					"很不稳定",
					"不止“随机”",
				},
			},
			["j_dsix_basic_die"] = {
				["name"] = "基础骰子",
				["text"] = {
					"基础的骰子，仅此而已",
				},
			},
			["j_dsix_xmult_die"] = {
				["name"] = "倍率翻倍骰子",
				["text"] = {
					"基础的倍率翻倍骰子",
					"仅此而已",
				},
			},
			["j_dsix_pure_exchange_die"] = {
				["name"] = "纯净骰子：运筹",
				["text"] = {
					"把雪球滚成雪山的奥妙尽在于此",
					"让华尔街上的无数掷骰者",
					"挤破头皮的抢手好货",
				},
			},
			["j_dsix_golden_plus2_die"] = {
				["name"] = "黄金骰子++",
				["text"] = {
					"22K金般闪闪亮",
				},
			},
			["j_dsix_xmult_plus_die"] = {
				["name"] = "倍率翻倍骰子+",
				["text"] = {
					"更厉害的倍率翻倍骰子",
					"没啥深文大义",
				},
			},
			["j_dsix_chips_plus_die"] = {
				["name"] = "筹码骰子+",
				["text"] = {
					"稀松平常的筹码骰子",
					"但品质更佳"
				},
			},
		},
		["Enhanced"] = {
			-- TODO: translate
			["m_dsix_booster"] = {
				["name"] = "Booster",
				["text"] = {
					"{C:chips}+#1#{} chips",
					"{C:mult}+#2#{} Mult",
					"{X:mult,C:white} X#3# {} Mult",
				},
			},
		},
		["Tarot"] = {
			["c_dsix_concentration"] = {
				["name"] = "专注",
				["text"] = {
					"{C:attention}升级{}所选定的",
                    "{C:attention}六面骰小丑牌",
                    "的所有骰面"
				},
			},
			["c_dsix_the_die_wielder"] = {
				["name"] = "掷骰者",
				["text"] = {
					"随机生成一张{C:attention}六面骰小丑牌",
				},
			},
			["c_dsix_reconstruction"] = {
				["name"] = "重构",
				["text"] = {
					"{C:attention}升级{}选定的{C:attention}六面骰小丑牌"
				},
			},
			["c_dsix_transplant"] = {
				["name"] = "移植",
				["text"] = {
					"选定一张{C:attention}六面骰小丑牌",
					"将其{C:attention}第一面{}设为{C:attention}第六面"
				},
			},
		},
		["Spectral"] = {
			["c_dsix_purification"] = {
				["name"] = "提纯",
				["text"] = {
					"生成一张{C:legendary}不纯骰子",
				},
			},
			["c_dsix_override"] = {
				["name"] = "换面",
				["text"] = {
					"将选定骰子的所有{C:attention}六面",
					"全部替换为本牌的{C:attention}当前面"
				},
			},
		},
		["D6 Side"] = {
			["chips_plus_side"] = {
				["label"] = "筹码+",
				["name"] = "{C:attention}筹码+{}",
				["text"] = {
					"{C:chips}+#1#{C:attention}筹码"
				},
			},
			["chaos_plus_side"] = {
				["label"] = "混乱+",
				["name"] = "{C:attention}混乱+",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}随机复制一种骰子能力",
					"{C:inactive}（当前复制：{C:attention}#1#{C:inactive}）",
				},
			},
			["root_beer_plus_side"] = {
				["label"] = "姜根汽水+",
				["name"] = "{C:attention}姜根汽水+{}",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}生成#1#个双倍标签",
				},
			},
			["chips_side"] = {
				["label"] = "筹码",
				["name"] = "{C:attention}筹码",
				["text"] = {
					"{C:chips}+#1#{C:attention}筹码",
				},
			},
			["pure_skyrocket_side"] = {
				["label"] = "纯净骰子：窜天猴",
				["name"] = "{C:blue}纯净骰子：窜天猴",
				["text"] = {
					"{C:blue}可获资金{C:attention}X#1#",
				},
			},
			["juggler_plus_side"] = {
				["label"] = "杂技演员+",
				["name"] = "{C:attention}杂技演员+{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}手牌上限+#1#",
				},
			},
			["chaos_side"] = {
				["label"] = "混乱",
				["name"] = "{C:attention}混乱",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}随机复制一种骰子能力",
					"{C:inactive}（当前复制：{C:attention}#1#{C:inactive}）",
				},
			},
			["mult_minus_side"] = {
				["label"] = "倍率-",
				["name"] = "{C:attention}倍率-",
				["text"] = {
					"{C:mult}-#1#{C:attention}倍率"
				},
			},
			["planetarium_plus_side"] = {
				["label"] = "星象+",
				["name"] = "{C:attention}星象+",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}生成#1#张{C:planet}星球牌"
				},
			},
			["xmult_side"] = {
				["label"] = "倍率翻倍",
				["name"] = "{C:attention}倍率翻倍",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention}倍率",
				},
			},
			["curse_bear_market_side"] = {
				["label"] = "霉运：熊市",
				["name"] = "{C:purple}霉运：熊市",
				["text"] = {
					"{C:purple}提现阶段{C:attention}无法获得资金",
				},
			},
			["nothing_plus2_side"] = {
				["label"] = "空++",
				["name"] = "{C:attention}空++",
				["text"] = {
					"{C:attention}又是无效果"
				},
			},
			["pure_slayer_side"] = {
				["label"] = "纯净：斩杀",
				["name"] = "{C:blue}纯净：斩杀",
				["text"] = {
					"{C:blue}将当前盲注的",
					"{C:blue}最低得分要求",
					"{C:blue}削减{C:attention}#1#{C:blue}倍"
				},
			},
			["pure_worship_side"] = {
				["label"] = "纯净：崇敬",
				["name"] = "{C:blue}纯净：崇敬",
				["text"] = {
					"{C:blue}手牌上限{C:attention}+#1#"
				},
			},
			["curse_bankruptcy_side"] = {
				["label"] = "霉运：破产",
				["name"] = "{C:purple}霉运：破产",
				["text"] = {
					"{C:purple}回合结束时",
					"{C:purple}损失{C:red}$#1#"
				},
			},
			["curse_concussion_side"] = {
				["label"] = "霉运：震荡",
				["name"] = "{C:purple}霉运：震荡",
				["text"] = {
					"{C:purple}手牌上限{C:attention}-#1#"
				},
			},
			["curse_confusion_side"] = {
				["label"] = "霉运：紊乱",
				["name"] = "{C:purple}霉运：紊乱",
				["text"] = {
					"{C:purple}抽到的每张牌",
					"{C:purple}均有{C:green}#1#/#2#{C:purple}的几率",
					"{C:purple}背面朝上",
				},
			},
			["nothing_plus3_side"] = {
				["label"] = "空+++",
				["name"] = "{C:attention}空+++{}",
				["text"] = {
					"{C:attention}有效果了？！",
    			    "{X:mult,C:white}X#1#{C:attention}倍率",
				},
			},
			["nothing_side"] = {
				["label"] = "空",
				["name"] = "{C:attention}空{}",
				["text"] = {
					"{C:attention}无效果",
				},
			},
			["all_in_plus_side"] = {
				["label"] = "全押+",
				["name"] = "{C:attention}全押+",
				["text"] = {
					"{C:attention}{C:mult}+#1#{C:attention}或{C:mult}-#2#{C:attention}倍率",
					"{C:attention}几率各50%",
				},
			},
			["orbital_plus_side"] = {
				["label"] = "星轨+",
				["name"] = "{C:attention}星轨+{}",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}获得#1#个轨道标签",
				},
			},
			["mult_plus2_side"] = {
				["label"] = "倍率++",
				["name"] = "{C:attention}倍率++{}",
				["text"] = {
					"{C:mult}+#1#{C:attention}倍率",
				},
			},
			["pure_return_investment_side"] = {
				["label"] = "纯净：回报投资",
				["name"] = "{C:blue}纯净：回报投资",
				["text"] = {
					"{C:blue}每花费或损失{C:money}$#2#",
					"{C:blue}获得{C:money}$#1#"
				},
			},
			["xmult_plus_side"] = {
				["label"] = "倍率翻倍+",
				["name"] = "{C:attention}倍率翻倍+{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention}倍率",
				},
			},
			["the_end_side"] = {
				["label"] = "戒赌走人",
				["name"] = "{C:attention}戒赌走人",
				["text"] = {
					"{C:attention}失效，永恒",
					"{C:inactive}（无视{C:attention}易腐{C:inactive}）",
					"{C:inactive}（无视{C:attention}阻隔{C:inactive}）"
				},
			},
			["cardist_plus_side"] = {
				["label"] = "耍牌玩家+",
				["name"] = "{C:attention}耍牌玩家+{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}出牌次数+#1#"
				},
			},
			["mult_plus_side"] = {
				["label"] = "倍率+",
				["name"] = "{C:attention}倍率+{}",
				["text"] = {
					"{C:mult}+#1#{C:attention}倍率"
				},
			},
			["root_beer_side"] = {
				["label"] = "姜根汽水",
				["name"] = "{C:attention}姜根汽水{}",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}生成#1#个双倍标签"
				},
			},
			["curse_challenge_side"] = {
				["label"] = "霉运：挑战",
				["name"] = "{C:purple}霉运：挑战",
				["text"] = {
					"{C:purple}当前盲注的",
					"{C:purple}最低得分要求{C:attention}X#1#"
				},
			},
			["mult_minus2_side"] = {
				["label"] = "倍率--",
				["name"] = "{C:attention}倍率--",
				["text"] = {
					"{C:mult}-#1#{C:attention}倍率"
				},
			},
			["cartomancy_side"] = {
				["label"] = "纸牌卜卦",
				["name"] = "{C:attention}纸牌卜卦",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}生成#1#张{C:tarot}塔罗牌"
				},
			},
			["planetarium_side"] = {
				["label"] = "星象",
				["name"] = "{C:attention}星象",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}生成#1#张{C:planet}星球牌",
				},
			},
			["card_pack_plus_side"] = {
				["label"] = "卡包+",
				["name"] = "{C:attention}卡包+",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}获得#1#个卡包类标签",
					"{C:inactive}（如空灵标签、标准标签等）",
				},
			},
			["orbital_side"] = {
				["label"] = "星轨",
				["name"] = "{C:attention}星轨",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}获得#1#个轨道标签"
				},
			},
			["cartomancy_plus_side"] = {
				["label"] = "纸牌卜卦+",
				["name"] = "{C:attention}纸牌卜卦+{}",
				["text"] = {
					"{C:attention}掷骰后",
					"{C:attention}生成#1#张{C:tarot}塔罗牌"
				},
			},
			["xmult_plus2_side"] = {
				["label"] = "倍率翻倍++",
				["name"] = "{C:attention}倍率翻倍++{}",
				["text"] = {
					"{X:mult,C:white}X#1#{C:attention}倍率",
				},
			},
			["juggler_side"] = {
				["label"] = "杂技演员",
				["name"] = "{C:attention}杂技演员{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}手牌上限+#1#",
				},
			},
			["payout_plus_side"] = {
				["label"] = "奖金+",
				["name"] = "{C:attention}奖金+{}",
				["text"] = {
					"{C:attention}回合结束时",
					"{C:attention}赚取{C:money}$#1#",
				},
			},
			["chips_minus2_side"] = {
				["label"] = "筹码--",
				["name"] = "{C:attention}筹码--",
				["text"] = {
					"{C:chips}-#1#{C:attention}筹码",
				},
			},
			["nothing_plus_side"] = {
				["label"] = "空+",
				["name"] = "{C:attention}空+{}",
				["text"] = {
					"{C:attention}还是无效果",
				},
			},
			["drunkard_plus_side"] = {
				["label"] = "酒蒙子+",
				["name"] = "{C:attention}酒蒙子+{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}弃牌次数{C:red}+#1#",
				},
			},
			["chips_minus_side"] = {
				["label"] = "筹码-",
				["name"] = "{C:attention}筹码-",
				["text"] = {
					"{C:chips}-#1#{C:attention}筹码",
				},
			},
			["curse_nullify_side"] = {
				["label"] = "霉运：作废",
				["name"] = "{C:purple}霉运：作废",
				["text"] = {
					"{C:purple}本牌遭到{C:attention}左极固定",
					"{C:purple}且本盲注内",
					"{C:purple}其右侧的小丑牌{C:attention}无效"
				},
			},
			["payout_side"] = {
				["label"] = "奖金",
				["name"] = "{C:attention}奖金{}",
				["text"] = {
					"{C:attention}回合结束时",
					"{C:attention}赚取{C:money}$#1#"
				},
			},
			["chips_plus2_side"] = {
				["label"] = "筹码++",
				["name"] = "{C:attention}筹码++",
				["text"] = {
					"{C:chips}+#1#{C:attention}筹码",
				},
			},
			["mult_side"] = {
				["label"] = "倍率",
				["name"] = "{C:attention}倍率{}",
				["text"] = {
					"{C:mult}+#1#{C:attention}倍率",
				},
			},
			["all_in_side"] = {
				["label"] = "全押",
				["name"] = "{C:attention}全押",
				["text"] = {
					"{C:attention}{C:mult}+#1#{C:attention}或{C:mult}-#2#{C:attention}倍率",
					"{C:attention}几率各50%",
				},
			},
			["card_pack_side"] = {
				["label"] = "卡包",
				["name"] = "{C:attention}卡包",
				["text"] = {
					"{C:attention}售出本牌后",
					"{C:attention}获得#1#个卡包类标签",
					"{C:inactive}（如空灵标签、标准标签等）",
				},
			},
			["payout_plus2_side"] = {
				["label"] = "奖金++",
				["name"] = "{C:attention}奖金++{}",
				["text"] = {
					"{C:attention}回合结束时",
					"{C:attention}赚取{C:money}$#1#",
				},
			},
			["cardist_side"] = {
				["label"] = "耍牌玩家",
				["name"] = "{C:attention}耍牌玩家{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}出牌次数+#1#",
				},
			},
			["drunkard_side"] = {
				["label"] = "酒蒙子",
				["name"] = "{C:attention}酒蒙子{}",
				["text"] = {
				    "{C:attention}掷骰后",
					"{C:attention}弃牌次数{C:red}+#1#"
				},
			},
		},
	},
}