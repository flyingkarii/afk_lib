surface.CreateFont("kari_afk_font", {
    font = "Roboto",
    weight = 800,
    size = 48   ,
    shadow = 0
})

hook.Add("HUDPaint", "kari_afk_msg", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then print('invalid') return end
    if not ply:Alive() then return end
    local currentAfkValue = ply:GetAfkValue()
    if !currentAfkValue then
        return
    end

    draw.SimpleText("You are currently AFK.", "kari_afk_font", ScrW() / 2, 40, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end)