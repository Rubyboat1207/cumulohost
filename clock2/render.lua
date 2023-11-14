Handle = getCurrentHandle()
local window = getfocusedWindowName()
local path = getfocusedWindowFileName()

local isInConfigScreen = getPersistentBoolean(Handle, "isInConfigScreen")
local dt = getDeltaTime()

function AddTime()
    local pathident = "path_" .. path
    local windowident = "window_" .. window

    local secondsSpentOnPath = getPersistentFloat(Handle, pathident)
    local secondsSpentOnWindow = getPersistentFloat(Handle, windowident)


    if secondsSpentOnPath == nil then
        setPersistentFloat(Handle, pathident, 0)
        secondsSpentOnPath = 0
    end

    if secondsSpentOnWindow == nil then
        setPersistentFloat(Handle, windowident, 0)
        secondsSpentOnWindow = 0
    end


    secondsSpentOnWindow = secondsSpentOnWindow + dt
    secondsSpentOnPath = secondsSpentOnPath + dt

    setPersistentFloat(Handle, pathident, secondsSpentOnPath)
    if getPersistentBoolean(Handle, "recordWindowTitles") or
        (not getPersistentBoolean(Handle, "useExeTime")) then
        setPersistentFloat(Handle, windowident, secondsSpentOnWindow)
    end



    if getPersistentBoolean(Handle, "useExeTime") then
        return secondsSpentOnPath
    else
        return secondsSpentOnWindow
    end
end

function RenderNormalScreen()
    local textIdent = "testText"
    local timeident = "time"

    if path == "" or path == nil then
        return
    end

    setTextWidgetContent(Handle, textIdent, window)
    local defaultX = 10

    local winlen = calculateTextWidth(window)
    local width = getWidth(Handle)

    local s = AddTime()

    local hours = "" .. math.floor(s / 60 / 60)
    local minutes = "" .. (math.floor(s / 60) % 60)
    local seconds = "" .. (math.floor(s) % 60)

    if string.len(hours) == 1 then
        hours = "0" .. hours
    end
    if string.len(minutes) == 1 then
        minutes = "0" .. minutes
    end
    if string.len(seconds) == 1 then
        seconds = "0" .. seconds
    end

    setTextWidgetContent(Handle, timeident, hours .. ":" .. minutes .. ":" .. seconds)

    if winlen > width then
        local pad_dir = getPersistentFloat(Handle, "paddingDirection")

        local compensateDist = winlen - width
        local xpos = getWidgetX(Handle, textIdent)

        local extraDist = 10*3

        local min = defaultX - (defaultX + compensateDist + extraDist)
        local max = defaultX

        if xpos <= min or xpos >= max then
            pad_dir = -pad_dir
            setPersistentFloat(Handle, "paddingDirection", pad_dir)
        end

        xpos = clamp(xpos + 50 * dt * pad_dir, min, max)

        setWidgetX(Handle, textIdent, xpos)
    else
        setWidgetX(Handle, textIdent, 10*3)
        setPersistentFloat(Handle, "paddingDirection", -1)
    end
end

if not isInConfigScreen then
    RenderNormalScreen()
else
    local trackingMethodCheckboxIdent = 'trackmethod'

    setPersistentBoolean(Handle, "useExeTime", getCheckboxChecked(Handle, trackingMethodCheckboxIdent))
end

