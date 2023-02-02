net.Receive("kari_afk_msg", function(len)
    local color1 = net.ReadColor()
    local text1 = net.ReadString()
    local color2 = net.ReadColor()
    local text2 = net.ReadString()
    
    chat.AddText(color1, text1, color2 or color_white, text2 or "")
end)