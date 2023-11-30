local handle = getCurrentHandle()
local json = jsonParse(response)
if json == nil then
    print('json was nil')
    return
end

local classList = jsonParse(json.d)

if classList == nil then
    print('classlist was nil')
    return
end

for _, cls in ipairs(classList) do
    local class = {
        name = cls.GROUPING_NAME,
        teacher_name = cls.TEACHER_NAME
    }

    print(jsonStringify(class))
end
