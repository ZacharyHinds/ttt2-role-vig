
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
