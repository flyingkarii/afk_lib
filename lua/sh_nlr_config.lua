Kari = Kari or {}
Kari.NLR = Kari.NLR or {}

-- list of areas that won't cause NLR on death
Kari.NLR.ExemptAreas = {
    ["mtfspawn"] = true,
    ["cibunks"] = true,
    ["secspawn"] = true,
    ["utilityspawn"] = true,
    ["researchspawn"] = true 
}

Kari.NLR.CategoryTimes = {
    ["Site Administration"] = 120,
    ["Foundation Security"] = 120,
    ["Mobile Task Force Nu-7 \"Hammer Down\""] = 180,
    ["Mobile Task Force Epsilon-11 \"Nine-Tailed Fox\""] = 180,
    ["Mobile Task Force Omnicorn 9 \"Sound and Fury\""] = 180,
    ["Mobile Task Force Alpha-1 \"Red Right Hand\""] = 180,
    ["Medical Staff"] = 120,
    ["Chaos Insurgency"] = 180,
    ["Special Forces"] = 180,
}

Kari.NLR.JobTimes = {}

Kari.NLR.Config = {
    DefaultTime = -1,
    PrefixColor = Color(74,0,96)
    Prefix = "[NLR]",
    MsgColors = color_white,
    CannotExitMsg = "You cannot exit for %s."
}