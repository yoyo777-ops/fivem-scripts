local isCuffed = false
local cuffType = nil

-- Load animation dictionary
local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

-- Apply cuffing
local function handleCuff(cuffType)
    local ped = PlayerPedId()
    local anim = Config.Animations.cuff[cuffType]

    -- Play cuffing animation
    loadAnimDict(anim.dict)
    TaskPlayAnim(ped, anim.dict, anim.anim, 8.0, -8.0, anim.duration, 49, 0, false, false, false)
    Wait(anim.duration)

    -- Apply restrictions
    isCuffed = true
    SetEnableHandcuffs(ped, true)
    cuffType = cuffType

    if cuffType == "soft" then
        -- Hands in front for soft cuffs
        AttachEntityToEntity(ped, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 2, true)
    else
        -- Hands in back for hard cuffs
        AttachEntityToEntity(ped, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 2, true)
    end
end

-- Apply uncuffing
local function handleUncuff()
    local ped = PlayerPedId()
    local anim = Config.Animations.uncuff

    -- Play uncuff animation
    loadAnimDict(anim.dict)
    TaskPlayAnim(ped, anim.dict, anim.anim, 8.0, -8.0, anim.duration, 49, 0, false, false, false)
    Wait(anim.duration)

    -- Remove restrictions
    ClearPedTasksImmediately(ped)
    SetEnableHandcuffs(ped, false)
    DetachEntity(ped, true, true)

    isCuffed = false
    cuffType = nil
end

-- Register target interactions
exports.ox_target:addGlobalPlayer({
    {
        name = "cuff_soft",
        label = Config.TargetOptions.cuff_soft.label,
        icon = Config.TargetOptions.cuff_soft.icon,
        item = Config.TargetOptions.cuff_soft.item,
        onSelect = function(data)
            if not isCuffed then
                handleCuff("soft")
            end
        end
    },
    {
        name = "cuff_hard",
        label = Config.TargetOptions.cuff_hard.label,
        icon = Config.TargetOptions.cuff_hard.icon,
        item = Config.TargetOptions.cuff_hard.item,
        onSelect = function(data)
            if not isCuffed then
                handleCuff("hard")
            end
        end
    },
    {
        name = "uncuff",
        label = Config.TargetOptions.uncuff.label,
        icon = Config.TargetOptions.uncuff.icon,
        item = Config.TargetOptions.uncuff.item,
        onSelect = function(data)
            if isCuffed then
                handleUncuff()
            end
        end
    }
})
