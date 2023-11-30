local handle = getCurrentHandle()
local timer = getPersistentFloat(handle, "timer")
local textIdent = "missing_text"
local buttonIdent = "configbutton"
local textInputIdent = "idInput"
local nameIdent = "name"

if timer == nil then
    timer = 0
end

local w = getWidth(handle)
local h = getHeight(handle)

local cur_id = getPersistentString(handle, "studentId")


if not getPersistentBoolean(handle, "IsConfigScreenOpen") then
    setWidgetHidden(handle, textInputIdent, true)
    setWidgetHidden(handle, nameIdent, true)
    setWidgetHidden(handle, textIdent, false)
    timer = timer + getDeltaTime();
    
    if timer > 5 and cur_id ~= nil then
        postResourceAt(
            "https://plano.empowerlearning.net",
            "/WebServices/EMPlayList.asmx/PARENT_PORTAL_BY_AREAS",
            [[{
                "params":{
                    "StudentId":]]..cur_id..[[,
                    "ProgressPeriodId":22,
                    "EffectiveDate":"11/29/2023",
                    "SiteId":16,
                    "UserId":"531003"
                }
            }]],
            "onStudentMissingGet"
        )
        timer = 0
    end

    if persistentStringExists(handle, "content_areas") then
        local ca = getPersistentString(handle, "content_areas")

        if ca ~= nil then
            local json = jsonParse(ca)

            if json == nil then
                return
            end
            
            local str = ""

            for key, content_area in pairs(json) do
                str = str.."\n"..key.." ("..content_area.course_grade..")"..
                    "\n    You have "..content_area.low_mas.." low mas assignments."..
                    "\n    You have "..content_area.missings.." missing assignments."
            end
            setWidth(handle, 70 + calculateTextWidth(str))
            setWidgetX(handle, buttonIdent, w - (30 + calculateTextWidth("Toggle Config Menu")))
            setX(handle, getScreenWidth() - w - 35)
            setTextWidgetContent(handle, textIdent, str)
        end
    end
else
    setWidgetHidden(handle, textInputIdent, false)
    setWidgetHidden(handle, nameIdent, false)
    setWidgetHidden(handle, textIdent, true)
    local content = getTextFieldContent(handle, textInputIdent)

    if content ~= cur_id and #content >= 4 then
        postResourceAt(
            "https://plano.empowerlearning.net",
            "/WebServices/EMPlayList.asmx/ECCS_STUDENT_GUARD_DROP_LIST",
            [[{
                "EffectiveDate":"11/30/2023",
                "GuardianID":"0",
                "StudentId":"]]..cur_id..[["
            }]],
            "onStudentInfoGet"
        )
        setTextWidgetContent(handle, nameIdent, "")
    end
    

    setPersistentString(handle, "studentId", content)
end

setPersistentFloat(handle, "timer", timer)