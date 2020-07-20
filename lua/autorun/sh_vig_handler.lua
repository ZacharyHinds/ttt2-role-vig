if SERVER then
  function SetMultiplier(ply, multiplier)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    if multiplier > GetConVar("ttt2_vig_max_multiplier"):GetFloat() then
      ply:SetNWFloat("ttt2ttt2_vig_multiplier_vig", GetConVar("ttt2_vig_max_multiplier"):GetFloat())
    elseif multiplier < GetConVar("ttt2_vig_min_multiplier"):GetFloat() then
      ply:SetNWFloat("ttt2ttt2_vig_multiplier_vig", GetConVar("ttt2_vig_min_multiplier"):GetFloat())
    else
      ply:SetNWFloat("ttt2_vig_multiplier", multiplier or 1)
    end
  end

  function ModifyMultiplier(ply, modifier)
    if not IsValid(ply) or not ply:IsPlayer() then return end

    SetMultiplier(ply, ply:GetNWFloat("ttt2_vig_multiplier", 1) + modifier)
  end

  function ResetMultiplier(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    SetMultiplier(ply, 1)
  end

  hook.Add("PostPlayerDeath", "VigilanteKill", function(ply)
    if not IsValid(ply) then return end
    local attacker = ply.targetAttacker

    if attacker:GetSubRole() ~= ROLE_VIGILANTE then return end

    if not attacker:HasTeam(ply:GetTeam()) then
      ModifyMultiplier(attacker, math.Round(GetConVar("ttt2_vig_enemy_kill_bonus"):GetFloat(), 1))
      LANG.Msg(attacker, "ttt2_vig_enemy_killed", nil, MSG_STACK_ROLE)
    else
      ModifyMultiplier(attacker, math.Round(GetConVar("ttt2_vig_team_kill_penalty"):GetFloat(), 1))
      if attacker:HasTeam(TEAM_INNOCENT) then
        LANG.Msg(attacker, "ttt2_vig_inno_killed", nil, MSG_STACK_ROLE)
      else
        LANG.Msg(attacker, "ttt2_vig_teammate_killed", nil, MSG_STACK_ROLE)
      end
    end
  end)

  hook.Add("EntityTakeDamage", "TTT2VigilanteDamageScaling", function(ply, dmginfo)
    if not ply or not IsValid(ply) or not ply:IsPlayer() then return end

    local attacker = dmginfo:GetAttacker()
    local damage_multiplier = attacker:GetNWFloat("ttt2_vig_multiplier", 1)

    if not attacker or not IsValid(attacker) or not attacker:IsPlayer() or attacker:GetSubRole() ~= ROLE_VIGILANTE then return end

    if ply:AccountID() ~= attacker:AccountID() then
      dmginfo:ScaleDamage(damage_multiplier)
    end
  end)

  hook.Add("TTTEndRound", "ResetVigEnd", function()
    for _, ply in ipairs(player.GetAll()) do
      ResetMultiplier(ply)
    end
  end)

  hook.Add("TTTPrepRound", "ResetVigPrep", function()
    for _, ply in ipairs(player.GetAll()) do
      ResetMultiplier(ply)
    end
  end)

  hook.Add("TTTBeginRound", "ResetVigBegin", function()
    for _, ply in ipairs(player.GetAll()) do
      ResetMultiplier(ply)
    end
  end)
end

if CLIENT then
  hook.Add("TTTRenderEntityInfo", "ttt2_vig_targetid", function(tData)
    if not VIGILANTE then return end

    local client = LocalPlayer()

    if not IsValid(client) or not client:IsPlayer() or client:GetSubRole() ~= ROLE_VIGILANTE then return end

    tData:AddDescriptionLine(
      LANG.GetParamTranslation("ttt2_vig_multi", {multiplier = math.Round(client:GetNWFloat("ttt2_vig_multiplier", 1), 1)}),
      VIGILANTE.ltcolor
    )
  end)
end
