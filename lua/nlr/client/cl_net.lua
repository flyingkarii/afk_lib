net.Receive("knlr_send", function(len, ply)
    local color1 = net.ReadColor()
    local text1 = net.ReadString()
    local color2 = net.ReadColor()
    local text2 = net.ReadString()

    chat.AddText(color1, text1, color2 or Color(255, 255, 255), " " .. text2 or "")
end)