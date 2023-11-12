Handle = getCurrentHandle()

setHudWindowName(Handle, "ClockTest")

setPersistentFloat(Handle, "paddingDirection", -1)
setPersistentBoolean(Handle, "isInConfigScreen", false)
setPersistentBoolean(Handle, "useExeTime", true)
setPersistentBoolean(Handle, "recordWindowTitles", false)

local textIdent = "testText"

local w = 250
local h = 70
local offset = 35

setWidth(Handle, w)
setHeight(Handle, h)

setX(Handle, getScreenWidth() - (w + offset))
setY(Handle, getScreenHeight() - (h + 50 + offset))

addTextWidget(Handle, textIdent, 0)

setWidgetX(Handle, textIdent, 10)
setWidgetY(Handle, textIdent, 22)

setTextWidgetContent(Handle, textIdent, "Loading...")

local timeident = "time"

addTextWidget(Handle, timeident, 0)

setWidgetX(Handle, timeident, 10)
setWidgetY(Handle, timeident, 42)

setTextWidgetContent(Handle, timeident, "Loading...")

local configbuttonident = "configbutton"

addButtonWidget(Handle, configbuttonident, 0)

setWidgetX(Handle, configbuttonident, 150)
setWidgetY(Handle, configbuttonident, h - 31)

setButtonWidgetLabel(Handle, configbuttonident, "Open Settings")
setButtonOnClick(Handle, configbuttonident, "toggleSettings")

setWidgetWidth(Handle, configbuttonident, calculateTextWidth("Open Settings") + 10)
setWidgetHeight(Handle, configbuttonident, calculateTextHeight("Open Settings"))