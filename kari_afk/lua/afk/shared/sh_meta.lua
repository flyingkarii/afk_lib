local PLAYER = FindMetaTable("Player")
KariAfk = KariAfk or {}

if SERVER then
    function PLAYER:CancelAfk()
        self:SetNW2Bool("afk", false)
        self:SetNW2Int("afktimer", 0)

        hook.Run("PlayerAfkChanged", self, self:GetAfkValue(), true)
    end

    function PLAYER:InitAfk()
        self:SetNW2Int("afktimer", 0)
        self:SetNW2Bool("afk", false)

        timer.Create("afk_timer_" .. self:SteamID64(), 1, 0, function()
            self:IncrementAfkTimer()
            
            if self:GetAfkTimer() >= KariAfk.SecondsUntilAfk then
                self:SetNW2Bool("afk", true)
                hook.Run("PlayerAfkChanged", self, self:GetAfkValue(), self:GetAfkTimer() == KariAfk.SecondsUntilAfk)
            end
        end)
    end

    function PLAYER:GetAfkTimer()
        return self:GetNW2Int("afktimer", 0)
    end

    function PLAYER:SetAfkTimer(value)
        if value ~= nil and type(value) == "boolean" then
            self:SetNW2Bool("afk", value)
        end
    end

    function PLAYER:SetAfkTimerValue(number)
        if type(number) != "number" then
            return
        end
        
        self:SetNW2Int("afktimer", number)
    end

    function PLAYER:IncrementAfkTimer()
        local afkTimer = self:GetNW2Int("afktimer", 0)
        self:SetNW2Int("afktimer", afkTimer + 1)
    end

    function PLAYER:DecrementAfkTimer()
        local afkTimer = self:GetNW2Int("afktimer", 0)
        self:SetNW2Int("afktimer", afkTimer - 1)
    end
end

function PLAYER:GetAfkValue()
    return self:GetNW2Bool("afk")
end