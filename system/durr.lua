local base64 = {}
local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function base64.decode(data)
    local result = {}
    local buffer = 0
    local bits = 0
    
    for i = 1, #data do
        local char = data:sub(i, i)
        
        if char == '=' then
            break
        end
        
        local value = chars:find(char) - 1
        if value then
            buffer = (buffer << 6) | value
            bits = bits + 6
            
            if bits >= 8 then
                bits = bits - 8
                local byte = (buffer >> bits) & 0xFF
                table.insert(result, string.char(byte))
            end
        end
    end
    
    return table.concat(result)
end

local ef = "cHJpbnQoInBhcmFiw6lucyB0dSBlbmNvbnRyb3UgdW0gZWFzdGVyIGVnZyBjaGFtYWRvIERVUlIhIG1lIGZhbGUgbm8gbWV1IGRpc2NvcmQgbG9sZG9fZ2cgc2UgdHUgZW5jb250cm91IGVzc2UgZWFzdGVyZWdnIik="

function execute(codigo)
    local de = base64.decode(codigo)
    
    local func, erro = load(de)
    
    if func then
        local status, resultado = pcall(func)
        if not status then
            print("durr2")
        end
    else
        print("durr")
    end
end

execute(ef)
