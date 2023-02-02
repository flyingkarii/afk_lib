local function onAFK(ply)
    local count = 0
    timer.Create("kafk_key_gift_" .. ply:SteamID64(), 1, 0, function()
        count = count + 1

        if count == KariAfk.AFKKeyRewards.SecondsToCheck then
            local hasWon = KariAfk.chance(ply)
            
            if hasWon then
                VoidCases.AddItem(ply:SteamID64(), 45, 1)
                count = 0

                VoidCases.NetworkItem(ply, 45, 1)
            end
        end
    end)
end

local function onUnAFK(ply)
    if timer.Exists("kafk_key_gift_" .. ply:SteamID64()) then
        timer.Remove("kafk_key_gift_" .. ply:SteamID64())
    end
end

hook.Add("PlayerAfkChanged", "kafk_onChanged", function(ply, newValue, isFirst)
    if !isFirst then
        return
    end

    if newValue then
        onAFK(ply)
    else
        onUnAFK(ply)
    end
end) 