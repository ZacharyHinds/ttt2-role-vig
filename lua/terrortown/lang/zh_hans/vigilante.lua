L = LANG.GetLanguageTableReference("zh_hans")

-- GENERAL ROLE LANGUAGE STRINGS
L[VIGILANTE.name] = "义务警员"
L["info_popup_" .. VIGILANTE.name] = [[你是个义务警员!以任何必要的手段保护无辜者!]]
L["body_found_" .. VIGILANTE.abbr] = "他们是义务警员!"
L["search_role_" .. VIGILANTE.abbr] = "这个人是义务警员!"
L["target_" .. VIGILANTE.name] = "义务警员"
L["ttt2_desc_" .. VIGILANTE.name] = [[义务警员需要用任何必要的手段杀死叛徒来保护无辜者!你的伤害会随着你杀死的每一个敌人而增加,但要小心,如果你杀死了你的盟友,你的伤害将会减少!]]
L["credit_" .. VIGILANTE.abbr .. "_all"] = "义务警员,您的表现已获得{num}个设备积分."

L["ttt2_vig_multi"] = "电流倍增器: x{multiplier}"
L["ttt2_vig_enemy_killed"] = "你击杀一个敌人!"
L["ttt2_vig_inno_killed"] = "你击杀一个无辜者!"
L["ttt2_vig_teammate_killed"] = "你杀了一个队友!"

--SETTING STRINGS
L["label_ttt2_vig_armor"] = "护甲"
L["label_ttt2_vig_msg"] = "当杀戮改变伤害乘数时发出警报"
L["label_ttt2_vig_enemy_kill_bonus"] = "每杀死一名敌人的乘数增加"
L["label_ttt2_vig_team_kill_penalty"] = "每杀死一名队友的乘数减少"
L["label_ttt2_vig_max_multiplier"] = "最大乘数"
L["label_ttt2_vig_min_multiplier"] = "最小乘数"
