local str = {}
--- generate random string for ids
function str.genId()
    local id = ""
    for i = 1, 8 do
        id = id .. string.char(math.random(97, 122))
    end
    return id
end

return str
