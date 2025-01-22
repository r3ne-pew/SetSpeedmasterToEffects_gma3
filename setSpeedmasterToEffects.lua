---------------------------------------------------------------------------
-- **************************************************
-- **Scriptname		: setSpeedmasterToEffects.lua
-- **Description	:
-- **Author			: Rene Henkenius
-- **Github			: https://github.com/r3ne-pew/SetSpeedmasterToEffects_gma3
-- **Date			: 22.01.2025
-- **************************************************

local function print(msg)
    Printf(msg)
    Echo(msg)
end
--- Open Preset, Set SpeedMaster, Update
local function assign()
    for i = tonumber(PresetFrom), tonumber(PresetTo), 1 do
        Cmd("Edit Preset " ..
            tonumber(SpeedMaster) .. "." .. i ..
            "; SpeedMaster " .. tonumber(SpeedMaster) .. "; Update /NoConfirmation; ClearAll")
    end
end

local function gatherUserInput()
    SpeedMaster = TextInput("PresetPool")
    PresetFrom = TextInput("PresetFrom")
    PresetTo = TextInput("PresetTo")
    SpeedMaster = TextInput("SpeedMaster")
end

local function messageBoxUserInput()
    -- A table with two default buttons for the pop-up
    local defaultCommandButtons = {
        { value = 2, name = "OK" },
        { value = 1, name = "Cancel" }
    }
    -- A table with three input fields
    -- The fields will be displayed alphabetically in the pop-up based on name
    local inputFields = {
        { name = "1-PresetPool",  value = "", whiteFilter = "0123456789", vkPlugin = "NumericInput" },
        { name = "2-PresetFrom",  value = "", whiteFilter = "0123456789", vkPlugin = "NumericInput" },
        { name = "3-PresetTo",    value = "", whiteFilter = "0123456789", vkPlugin = "NumericInput" },
        { name = "4-SpeedMaster", value = "" }
    }

    -- A table with the elements needed for the pop-up
    local messageTable = {
        icon = "object_smart",
        backColor = "Window.Plugins",
        title = "Set Speedmaster to Effects",
        message = 'Set the needed values and click "Ok"',
        commands = defaultCommandButtons,
        inputs = inputFields,
        autoCloseOnInput = false
    }

    -- The creation on the actual pop-up with the result stored in a variable
    local returnTable = MessageBox(messageTable)

    -- Print the content of the returned table
    Printf("Success = " .. tostring(returnTable.success))

    SpeedMaster = returnTable.inputs["1-PresetPool"]
    PresetFrom = returnTable.inputs["2-PresetFrom"]
    PresetTo = returnTable.inputs["3-PresetTo"]
    SpeedMaster = returnTable.inputs["4-SpeedMaster"]
end

function main()
    messageBoxUserInput()
    assign()

    print("SpeedMaster " ..
        tonumber(SpeedMaster) ..
        "; has been assigned to presets " ..
        tonumber(SpeedMaster) .. "." .. tonumber(PresetFrom) ..
        "; thru " .. tonumber(SpeedMaster) .. "." .. tonumber(PresetTo) .. ";")
    print('Speed Master Assignment successful')
end

return main
