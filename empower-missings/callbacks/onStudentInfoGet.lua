local handle = getCurrentHandle()
local json = jsonParse(response)
local nameIdent = "name"

if json == nil then
    return
end

if json.Message ~= nil then
    print(json.Message)
    return
end


local realjson = jsonParse(json.d)

if realjson == nil then
    print(response)
    return
end

local name = realjson[1].FIRST_NAME.." "..realjson[1].LAST_NAME

setPersistentString(handle, "student_name", name)
setTextWidgetContent(handle, nameIdent, name)