local function getTimeText(num, timeType)
    if num == 1 then
        return timeType:sub(1, #timeType - 1)
    else
        return timeType
    end
end

local function shownText(times)
    local converting = {
        {times[1], tostring(times[1]), "days"},
        {times[2], tostring(times[2]), "hours"},
        {times[3], tostring(times[3]), "minutes"},
        {times[4], tostring(times[4]), "seconds"}
    }

    local str = ""

    for index, timeData in pairs(converting) do
        if timeData[1] > 0 then
            str = str .. timeData[2] .. " " .. getTimeText(timeData[1], timeData[3]) .. " "
        end
    end

    return str
end

function Kari.NLR.convertSecondsToTimeString(seconds)
    local days = math.floor(seconds/86400)
    local hours = math.floor(mod(seconds, 86400)/3600)
    local minutes = math.floor(mod(seconds,3600)/60)
    local seconds = math.floor(mod(seconds,60))
    local shownText = shownText({days, hours, minutes, seconds})

    return shownText
end

function Kari.NLR.sendMessage(recipients, msg)
    if not SERVER then return end

    local prefixColor = Kari.NLR.Config.PrefixColor
    local prefix = Kari.NLR.Config.Prefix
    local msgColor = Kari.NLR.Config.MsgColors
    
    net.Start("knlr_send")
        net.WriteColor(prefixColor)
        net.WriteString(prefix)
        net.WriteColor(msgColor)
        net.WriteString(msg)
    net.Send(recipients)
end

function Kari.NLR.GetTime(ply)
    local teamData = RPExtraTeams[ply:Team()]
    if not teamData then return Kari.NLR.Config.DefaultTime end
    local categoryTime = Kari.NLR.CategoryTimes[teamData.category]
    local commandTime = Kari.NLR.JobTimes[teamData.command]

    if commandTime then
        return commandTime
    end

    if categoryTime then
        return categoryTime
    else
        return Kari.NLR.Config.DefaultTime
    end
end