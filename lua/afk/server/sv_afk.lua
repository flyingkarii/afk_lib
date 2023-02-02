hook.Add("PlayerInitialSpawn", "kari_afk_init", function(ply, transition)
    ply:InitAfk()
end)

hook.Add("PlayerDisconnected", "kari_afk_disconnected", function(ply)
    timer.Remove("afk_timer_" .. ply:SteamID64())
end)