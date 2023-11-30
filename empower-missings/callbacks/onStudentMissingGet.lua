local handle = getCurrentHandle()
local json = jsonParse(response)
local classList = jsonParse(json.d)

local content_areas = {

}


for _, scale in ipairs(classList) do
    if content_areas[scale.CONTENT_AREA_NAME] == nil then
        content_areas[scale.CONTENT_AREA_NAME] = {
            missings = scale.STANDARD_MISSING_COUNT,
            low_mas = scale.LOW_MAS_COUNT,
            course_grade = scale.AVERAGE_COURSE_SCORE
        }
    else
        local ca = content_areas[scale.CONTENT_AREA_NAME]
        content_areas[scale.CONTENT_AREA_NAME] = {
            missings = scale.STANDARD_MISSING_COUNT + ca.missings,
            low_mas = scale.LOW_MAS_COUNT + ca.low_mas,
            course_grade = ca.course_grade
        }
    end
end

print(jsonStringify(content_areas))
setPersistentString(handle, "content_areas", jsonStringify(content_areas))

