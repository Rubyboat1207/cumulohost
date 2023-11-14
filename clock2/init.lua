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

local w = 250 *3
local h = 70 *3
local offset = 35

setWidth(Handle, w)
setHeight(Handle, h)

setX(Handle, getScreenWidth() - (w + offset))
setY(Handle, getScreenHeight() - (h + 50 *3 + offset))

addTextWidget(Handle, textIdent, 0)

setWidgetX(Handle, textIdent, 10*3)
setWidgetY(Handle, textIdent, 22*3)

setTextWidgetContent(Handle, textIdent, "Loading...")

local timeident = "time"

addTextWidget(Handle, timeident, 0)

setWidgetX(Handle, timeident, 10*3)
setWidgetY(Handle, timeident, 42*3)

setTextWidgetContent(Handle, timeident, "Loading...")

local configbuttonident = "configbutton"

addButtonWidget(Handle, configbuttonident, 0)

setWidgetX(Handle, configbuttonident, 150 *3)
setWidgetY(Handle, configbuttonident, h - 31*3)

setButtonWidgetLabel(Handle, configbuttonident, "Open Settings")
setButtonOnClick(Handle, configbuttonident, "toggleSettings")

setWidgetWidth(Handle, configbuttonident, calculateTextWidth("Open Settings") + 10*3)
setWidgetHeight(Handle, configbuttonident, calculateTextHeight("Open Settings"))

local trackingMethodCheckboxIdent = 'trackmethod'

addCheckboxWidget(Handle, trackingMethodCheckboxIdent, 0)

setWidgetX(Handle, trackingMethodCheckboxIdent, 10*3)
setWidgetY(Handle, trackingMethodCheckboxIdent, 45*3)

setCheckboxLabel(Handle, trackingMethodCheckboxIdent, "Use executable path instead of window title")
setCheckboxChecked(Handle, trackingMethodCheckboxIdent, getPersistentBoolean(Handle, "useExeTime")==true)
setWidgetHidden(Handle, trackingMethodCheckboxIdent, true)