local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local uiCommon = mjrequire "mainThread/ui/uiCommon/uiCommon"
local material = mjrequire "common/material"

local customAddedScript = mjrequire "customAddedScript"

local mod = {
    loadOrder = 1, -- lower numbers are loaded first, and should be preffered. If you require the mod be loaded after other mods, use a higher number.
}

function mod:onload(mainMenu)

    local baseLoadFunction = mainMenu.load
    mainMenu.load = function(self_, controller)
        baseLoadFunction(mainMenu, controller)
        if mainMenu.mainBanner then
            local titleText = ModelTextView.new(mainMenu.mainBanner)
            titleText.font = Font(uiCommon.titleFontName, 16)
            titleText:setText("LuaModExample Loaded!", material.types.standardText.index)
            titleText.baseOffset = vec3(0, -60, 0)
            titleText.relativePosition = ViewPosition(MJPositionCenter, MJPositionTop)
        end
    end

    mj:log("customAddedScript loaded:", customAddedScript.success)
    
end

return mod