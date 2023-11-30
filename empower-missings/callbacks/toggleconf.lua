local handle = getCurrentHandle()
local isopen = getPersistentBoolean(handle, "IsConfigScreenOpen")
if isopen == nil then
    isopen = false
end

isopen = not isopen
setPersistentBoolean(handle, "IsConfigScreenOpen", isopen)
setPersistentFloat(handle, "timer", 0)
