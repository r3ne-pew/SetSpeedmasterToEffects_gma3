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

function main()
    gatherUserInput()
    assign()

    print("SpeedMaster " ..
        tonumber(SpeedMaster) ..
        "; has been assigned to presets " ..
        tonumber(SpeedMaster) .. "." .. tonumber(PresetFrom) ..
        "; thru " .. tonumber(SpeedMaster) .. "." .. tonumber(PresetTo) .. ";")
    print('Speed Master Assignment successful')
end

return main
