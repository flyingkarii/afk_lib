hook.Add("PlayerChangedArea", "kari_area_changed", function(ply, area, oldarea)
    local oldname = oldarea.uniquename

    if Kari.NLR.AreaNames[oldname] then
        if ply:HasNLRTimer() then
            local shownTimer = Kari.NLR.convertSecondsToTimeString(ply:GetNLRSeconds())
            local spawnPos = DarkRP.retrieveTeamSpawnPos(ply:Team())
            Kari.NLR.sendMessage(ply, "You cannot leave this area for another " .. shownTimer)
            ply:SetPos(spawnPos)
        end
    end
end)

hook.Add("PlayerDeath", "kari_nlr_readying", function(victim, inflictor, attacker)
    local victimArea = victim:GetArea()
    if Kari.NLR.ExemptAreas[victimArea] then return end
    if Kari.NLR.GetTime(victim) == Kari.NLR.Config.DefaultTime then return end
    local nlrTime = Kari.NLR.GetTime(victim)

    victim.shouldNLR = nlrTime
end)

hook.Add("PlayerSpawn", "kari_nlr_set", function(ply, transition)
    if !victim.shouldNLR then return end
    victim:StartNLRTimer(victim.shouldNLR)
    victim.shouldNLR = nil
end)

hook.Add("PlayerChangedTeam", "kari_nlr_changed_team", function(ply, old, new)
    if RPExtraTeams[new] == nil then return end

    if Kari.NLR.GetTime(victim) == Kari.NLR.Config.DefaultTime then
        victim:SetCanPlay(false)
        Kari.NLR.sendMessage(ply, "Your job\'s NLR time is not currently set. Please make a Management ticket in our discord.")
    end
end)