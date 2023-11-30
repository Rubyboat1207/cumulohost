local handle = getCurrentHandle()

if persistentStringExists(handle, "studentId") then
    setPersistentBoolean(handle, "IsConfigScreenOpen", false)
else
    setPersistentBoolean(handle, "IsConfigScreenOpen", false)
end
setPersistentFloat(handle, "timer", 0)

setHudWindowName(handle, "Missings")



local w = 300
local h = 200

setWidth(handle, w)
setHeight(handle, h)
setX(handle, getScreenWidth() - w - 35)
setY(handle, getScreenHeight() - h - 170)

local cur_id = getPersistentString(handle, "studentId")

if cur_id ~= nil then
    postResourceAt(
        "https://plano.empowerlearning.net",
        "/WebServices/EMPlayList.asmx/ECCS_STUDENT_GUARD_DROP_LIST",
        [[{
            "EffectiveDate":"11/29/2023",
            "GuardianID":"0",
            "StudentId":"]]..cur_id..[["
        }]],
        "onStudentInfoGet"
    )
end

-- postResourceAt(
--     "https://plano.empowerlearning.net",
--     "/WebServices/EMPlayList.asmx/GetHomeStudentPageData",
--     [[{
--         "EffectiveDate":"11/29/2023",
--         "GuardianID":"0",
--         "StudentId":"1650"
--     }]],
--     "onStudentHomeGet"
-- )




local buttonIdent = "configbutton"
addButtonWidget(handle, buttonIdent, 0)
setButtonWidgetLabel(handle, buttonIdent, "Toggle Config Menu")
setWidgetX(handle, buttonIdent, w - (30 + calculateTextWidth("Toggle Config Menu")))
setWidgetY(handle, buttonIdent, 30)
setButtonOnClick(handle, buttonIdent, "toggleconf")

local textIdent = "missing_text"
addTextWidget(handle, textIdent, 0)
setWidgetX(handle, textIdent, 15)
setWidgetY(handle, textIdent, 45)
setTextWidgetContent(handle, textIdent, "loading...")

local textInputIdent = "idInput"
addTextFieldWidget(handle, textInputIdent, 5, 0)
setWidgetX(handle, textInputIdent, 15)
setWidgetY(handle, textInputIdent, 30)
setTextFieldPlaceholder(handle, textInputIdent, "Id")
setWidgetWidth(handle, textInputIdent, 100)
setTextFieldContent(handle, textInputIdent, getPersistentString(handle, "studentId"))

local nameIdent = "name"
addTextWidget(handle, nameIdent, 0)
setWidgetX(handle, nameIdent, 15)
setWidgetY(handle, nameIdent, 60)
