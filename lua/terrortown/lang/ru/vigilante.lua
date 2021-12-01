L = LANG.GetLanguageTableReference("ru")

-- GENERAL ROLE LANGUAGE STRINGS
L[VIGILANTE.name] = "Линчеватель"
L["info_popup_" .. VIGILANTE.name] = [[Вы линчеватель! Защитите невиновных любыми средствами!]]
L["body_found_" .. VIGILANTE.abbr] = "Он был линчевателем!"
L["search_role_" .. VIGILANTE.abbr] = "Этот человек был линчевателем!"
L["target_" .. VIGILANTE.name] = "Линчеватель"
L["ttt2_desc_" .. VIGILANTE.name] = [[Линчевателю нужно защищать невиновных, убивая предателей любыми средствами! Ваш урон увеличивается с каждым убитым вами врагом, но будьте осторожны, если вы убьёте своих союзников, ваш урон уменьшится!]]
L["credit_" .. VIGILANTE.abbr .. "_all"] = "Vigilante, you have been awarded {num} equipment credit(s) for your performance."

L["ttt2_vig_multi"] = "Текущий множитель: x{multiplier}"
L["ttt2_vig_enemy_killed"] = "Вы убили врага!"
L["ttt2_vig_inno_killed"] = "Вы убили невиновного!"
L["ttt2_vig_teammate_killed"] = "Вы убили товарища по команде!"


-- --SETTING STRINGS
-- L["label_ttt2_vig_armor"] = "Armor"
-- L["label_ttt2_vig_msg"] = "Alert when kill changes damage multiplier"
-- L["label_ttt2_vig_enemy_kill_bonus"] = "Multiplier increase per enemy kill"
-- L["label_ttt2_vig_team_kill_penalty"] = "Multiplier decrease per teammate kill"
-- L["label_ttt2_vig_max_multiplier"] = "Maximum multiplier"
-- L["label_ttt2_vig_min_multiplier"] = "Minimum multiplier"
