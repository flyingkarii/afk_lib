function KariAfk.getMaxRandomFromChance(chance)
    if not type(chance) == "number" then return end
    if chance > 100 then return end

    if chance >= 1 or chance == 0 then
        return 100
    end

    local baseChance = 100
    local int = chance
    local str = tostring(int):reverse()
    str = str:gsub("%p", "")
    
    return tonumber(str) * baseChance
end

local function GetHighest(tbl)
    local highest = 0

    for _, chance in ipairs(tbl) do
        if chance > highest then
            highest = chance
        end
    end

    return highest
end

local function GetPlayersChance(ply)
    local config = KariAfk.AFKKeyRewards
    local command = RPExtraTeams[ply:Team()].command
    local toCheck = {
        config.UsergroupChances[ply:GetUserGroup()], 
        config.UsergroupChances[ply:GetUserGroup()], config.JobChances[command]
    }

    if ply.GetSecondaryUserGroup then
        table.insert(toCheck, config.UsergroupChances[ply:GetSecondaryUserGroup()])
    end

    return GetHighest(toCheck)
end

function KariAfk.chance(ply)
    local playersChance = GetPlayersChance(ply)
    local max = KariAfk.getMaxRandomFromChance(playersChance)
    local isLower = playersChance < 1 and playersChance > 0
    local random = math.random(1, max)
    local percent = math.floor((random / max) * 100)

    if isLower then
        return random == 1
    else
        return percent <= playersChance
    end
end

