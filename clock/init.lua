Handle = getCurrentHandle()

setHudWindowName(Handle, "ClockTest")

setPersistentFloat(Handle, "paddingDirection", -1)
setPersistentBoolean(Handle, "isInConfigScreen", false)

if not persistentBooleanExists(Handle, "useExeTime") then
    setPersistentBoolean(Handle, "useExeTime", true)
end
if not persistentBooleanExists(Handle, "recordWindowTitles") then
    setPersistentBoolean(Handle, "recordWindowTitles", false)
end

local textIdent = "testText"

local w = 250
local h = 80
local offset = 35

setWidth(Handle, w)
setHeight(Handle, h)

setX(Handle, getScreenWidth() - (w + offset))
setY(Handle, getScreenHeight() - (h + 50 + offset))

addTextWidget(Handle, textIdent, 0)

setWidgetX(Handle, textIdent, 10)
setWidgetY(Handle, textIdent, 24)

setTextWidgetContent(Handle, textIdent, "Loading...")

local timeident = "time"

addTextWidget(Handle, timeident, 0)

setWidgetX(Handle, timeident, 10)
setWidgetY(Handle, timeident, 47)

setTextWidgetContent(Handle, timeident, "Loading...")

local configbuttonident = "configbutton"

addButtonWidget(Handle, configbuttonident, 0)

setWidgetX(Handle, configbuttonident, 140)
setWidgetY(Handle, configbuttonident, h - 34)

setButtonWidgetLabel(Handle, configbuttonident, "Open Settings")
setButtonOnClick(Handle, configbuttonident, "toggleSettings")

setWidgetWidth(Handle, configbuttonident, calculateTextWidth("Open Settings") + 10)
setWidgetHeight(Handle, configbuttonident, calculateTextHeight("Open Settings"))

local trackingMethodCheckboxIdent = 'trackmethod'

addCheckboxWidget(Handle, trackingMethodCheckboxIdent, 0)

setWidgetX(Handle, trackingMethodCheckboxIdent, 10)
setWidgetY(Handle, trackingMethodCheckboxIdent, 45)

setCheckboxLabel(Handle, trackingMethodCheckboxIdent, "Use executable path instead of window title")
setCheckboxChecked(Handle, trackingMethodCheckboxIdent, getPersistentBoolean(Handle, "useExeTime")==true)
setWidgetHidden(Handle, trackingMethodCheckboxIdent, true)