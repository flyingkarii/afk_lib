local meta = FindMetaTable("Player")

if SERVER then
    function meta:SetCanPlay(value)
        if type(value) ~= "boolean" then return end 
        self:SetNW2Bool("knlr_playable", value)
    end

    function meta:StartNLRTimer(seconds)
        self:SetNW2Bool("NLROngoing", true)
        self:SetNW2Int("NLRElapsed", 0)
        self:SetNW2Int("NLRTime", seconds)
        timer.Create("knlr_timer" .. self:EntIndex(), 1, seconds, function()
            local elapsed = self:GetNW2Int("NLRElapsed", 0)
            self:SetNW2Int("NLRElapsed", elapsed + 1)

            if elapsed == seconds then
                self:EndNLRTimer()
            end
        end)
    end

    function meta:PauseNLRTimer()
        if self:HasNLRTimer() then
            timer.Pause("knlr_timer" .. self:EntIndex())
        end
    end

    function meta:UnpauseNLRTimer()
        if self:HasNLRTimer() then
            timer.UnPause("knlr_timer" .. self:EntIndex())
        end
    end

    function meta:EndNLRTimer()
        self:SetNW2Bool("NLROngoing", nil)
        self:SetNW2Int("NLRElapsed", nil)
        self:SetNW2Int("NLRTime", nil)

        timer.Remove("knlr_timer" .. self:EntIndex())
    end
end

function meta:HasNLRTimer()
    return self:GetNW2Bool("NLROngoing") ~= nil
end

function meta:GetNLRSeconds()
    if self:GetNW2Bool("NLROngoing") ~= nil then
        return self:GetNW2Int("NLRTime") - self:GetNW2Int("NLRElapsed")
    end

    return
end