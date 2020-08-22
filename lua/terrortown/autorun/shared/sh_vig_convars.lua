CreateConVar("ttt2_vig_enemy_kill_bonus", 0.2, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_team_kill_penalty", 0.1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_max_multiplier", 2.0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_min_multiplier", 0.5, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_armor", 30, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_msg", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

if CLIENT then
  hook.Add("TTT2FinishedLoading", "vig_devicon", function() -- addon developer emblem for me ^_^
    AddTTT2AddonDev("76561198049910438")
  end)
end

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_vigilante_convars", function(tbl)
  tbl[ROLE_VIGILANTE] = tbl[ROLE_VIGILANTE] or {}

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_armor",
      slider = true,
      min = 0,
      max = 100,
      decimal = 0,
      desc = "ttt2_vig_armor (def. 30)"
  })

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_msg",
      checkbox = true,
      desc = "ttt2_vig_msg (def. 1)"
  })

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_enemy_kill_bonus",
      slider = true,
      min = 0,
      max = 1,
      decimal = 1,
      desc = "ttt2_vig_enemy_kill_bonus (def. 0.2)"
  })

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_team_kill_penalty",
      slider = true,
      min = 0,
      max = 1,
      decimal = 1,
      desc = "ttt2_vig_team_kill_penalty (def. 0.1)"
  })

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_max_multiplier",
      slider = true,
      min = 1,
      max = 3,
      decimal = 1,
      desc = "ttt2_vig_max_multiplier (def. 2.0)"
  })

  table.insert(tbl[ROLE_VIGILANTE], {
      cvar = "ttt2_vig_min_multiplier",
      slider = true,
      min = 0,
      max = 1,
      decimal = 1,
      desc = "ttt2_vig_min_multiplier (def. 0.5)"
  })
end)
