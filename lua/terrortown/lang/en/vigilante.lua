L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[VIGILANTE.name] = "Vigilante"
L["info_popup_" .. VIGILANTE.name] = [[You are a Vigilante! Protect the innocent by any means necessary!]]
L["body_found_" .. VIGILANTE.abbr] = "They were a Vigilante!"
L["search_role_" .. VIGILANTE.abbr] = "This person was a Vigilante!"
L["target_" .. VIGILANTE.name] = "Vigilante"
L["ttt2_desc_" .. VIGILANTE.name] = [[The Vigilante needs to protect the innocents by killing traitors with any means necessary! Your damage increases with every enemy you kill, but watch out, if you kill your allies your damage will decrease!]]
L["credit_" .. VIGILANTE.abbr .. "_all"] = "Vigilante, you have been awarded {num} equipment credit(s) for your performance."

L["ttt2_vig_multi"] = "Current Multiplier: x{multiplier}"
L["ttt2_vig_enemy_killed"] = "You killed an enemy!"
L["ttt2_vig_inno_killed"] = "You killed an innocent!"
L["ttt2_vig_teammate_killed"] = "You killed a teammate!"

--SETTING STRINGS
L["label_ttt2_vig_armor"] = "Armor"
L["label_ttt2_vig_msg"] = "Alert when kill changes damage multiplier"
L["label_ttt2_vig_enemy_kill_bonus"] = "Multiplier increase per enemy kill"
L["label_ttt2_vig_team_kill_penalty"] = "Multiplier decrease per teammate kill"
L["label_ttt2_vig_max_multiplier"] = "Maximum multiplier"
L["label_ttt2_vig_min_multiplier"] = "Minimum multiplier"
