if KariAfk.DetectionsEnabled["footstep"] then
    hook.Add("PlayerFootstep", "kari_afk_footstep", function(ply, pos, foot, sound, volume, filter)
        ply:CancelAfk()
    end)
end

if KariAfk.DetectionsEnabled["use"] then
    hook.Add("PlayerUse", "kari_afk_use", function(ply, ent)
        ply:CancelAfk()
    end)
end

if KariAfk.DetectionsEnabled["say"] then
    hook.Add("PlayerSay", "kari_afk_say", function(ply, ent)
        ply:CancelAfk()
    end)
end

if KariAfk.DetectionsEnabled["jump"] then
    hook.Add("HandlePlayerJumping", "kari_afk_jump", function(ply, velocity)
        ply:CancelAfk()
    end)
end

if KariAfk.DetectionsEnabled["noclip"] then
    hook.Add("HandlePlayerNoClipping", "kari_afk_noclip", function(ply, velocity)
        ply:CancelAfk()
    end)
end

if KariAfk.DetectionsEnabled["ducking"] then
    hook.Add("HandlePlayerDucking", "kari_afk_ducking", function(ply, velocity)
        ply:CancelAfk()
    end)
end