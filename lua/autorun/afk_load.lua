local trimRight, getFileFromFilename, substr, getPathFromFilename, format = string.TrimRight, string.GetFileFromFilename, string.sub, string.GetPathFromFilename, string.format

function LoadFile(path)
    path = trimRight(path, ".lua") .. ".lua"

    local name = getFileFromFilename(path)
    local realm = substr(name, 1, 3)

    if realm == "cl_" then
        if CLIENT then
            include(path)
        else
            AddCSLuaFile(path)
        end
    elseif realm == "sh_" or (realm  ~= "sv_" and realm ~= "cl_") then
        if SERVER then
            AddCSLuaFile(path)
        end

        include(path)
    elseif realm == "sv_" then
        if SERVER then
            include(path)
        end        
    end
end

function LoadDirectory(dir)
    local files, dirs = file.Find(dir .. "/*", "LUA")

    for i = 1, #files do
        LoadFile(dir .. "/" .. files[i])
    end

    for i = 1, #dirs do
        LoadDirectory(dir .. "/" .. dirs[i])
    end
end

LoadFile("sh_afk_config")
LoadDirectory("afk")
