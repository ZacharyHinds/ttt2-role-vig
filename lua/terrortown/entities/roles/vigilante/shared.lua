
CreateConVar("ttt2_vig_enemy_kill_bonus", 0.2, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_team_kill_penalty", 0.1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_max_multiplier", 2.0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_min_multiplier", 0.5, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_armor", 30, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_vig_msg", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_vig.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(68, 37, 245, 255)

  self.abbr = "vig" -- abbreviation
  self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 1 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -4 -- multiplier for teamkill
  self.unknownTeam = true -- player don't know their teammates
  self.isPublicRole = true
  self.isPolicingRole = true

  self.defaultTeam = TEAM_INNOCENT -- the team name: roles with same team name are working together
  self.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment

  self.conVarData = {
    pct = 0.15, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 6, -- minimum amount of players until this role is able to get selected
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)

    credits = 2,
    creditsTraitorKill = 1,
    creditsTraitorDead = 0,
    random = 40,

    shopFallback = SHOP_FALLBACK_DETECTIVE
  }
end

function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_DETECTIVE)
end

if SERVER then
  function ROLE:GiveRoleLoadout(ply, isRoleChange)
    if not isRoleChange then return end

    ply:GiveArmor(GetConVar("ttt2_vig_armor"):GetInt())
  end

  function ROLE:RemoveRoleLoadout(ply, isRoleChange)
    ply:RemoveArmor(GetConVar("ttt2_vig_armor"):GetInt())
  end
end

if CLIENT then
  hook.Add("TTT2FinishedLoading", "vig_devicon", function() -- addon developer emblem for me ^_^
    AddTTT2AddonDev("76561198049910438")
  end)

  function ROLE:AddToSettingsMenu(parent)
    local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

    form:MakeSlider({
      serverConvar = "ttt2_vig_armor",
      label = "label_ttt2_vig_armor",
      min = 0,
      max = 100,
      decimal = 0
    })

    form:MakeCheckBox({
      serverConvar = "ttt2_vig_msg",
      label = "label_ttt2_vig_msg"
    })

    form:MakeSlider({
      serverConvar = "ttt2_vig_enemy_kill_bonus",
      label = "label_ttt2_vig_enemy_kill_bonus",
      min = 0,
      max = 1,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_vig_team_kill_penalty",
      label = "label_ttt2_vig_team_kill_penalty",
      min = 0,
      max = 1,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_vig_max_multiplier",
      label = "label_ttt2_vig_max_multiplier",
      min = 1,
      max = 3,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_vig_min_multiplier",
      label = "label_ttt2_vig_min_multiplier",
      min = 0,
      max = 1,
      decimal = 1
    })

  end
end