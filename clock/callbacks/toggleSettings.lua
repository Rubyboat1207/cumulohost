Handle = getCurrentHandle()

local isConfig = getPersistentBoolean(Handle, "isInConfigScreen")

local textIdent = "testText"
local timeident = "time"
local configbuttonident = "configbutton"
local trackingMethodCheckboxIdent = 'trackmethod'


isConfig = not isConfig
local w
local h
local offset = 35

if isConfig then
    w = 250
    h = 500

    setWidgetHidden(Handle, textIdent, true)
    setWidgetHidden(Handle, timeident, true)

    setWidgetHidden(Handle, trackingMethodCheckboxIdent, false)

    setButtonWidgetLabel(Handle, configbuttonident, "Close Config")
else
    w = 250
    h = 70

    setWidgetHidden(Handle, textIdent, false)
    setWidgetHidden(Handle, timeident, false)
    
    setWidgetHidden(Handle, trackingMethodCheckboxIdent, true)

    setButtonWidgetLabel(Handle, configbuttonident, "Open Settings")
end

setWidth(Handle, w)
setHeight(Handle, h)

setX(Handle, getScreenWidth() - (w + offset))
setY(Handle, getScreenHeight() - (h + 50 + offset))
setWidgetY(Handle, configbuttonident, h - 31)
setPersistentBoolean(Handle, "isInConfigScreen", isConfig)