
local selling = false
local usedEntities = {}
local robbedByEntities = {}
local occupied = false

local cornersellingTargetLabels = {}
local cornersellingTargetOptionNames = {}

local forbiddenEntities = {}

local function getDrugLabel(drugName)
    if Config.inventoryResource == 'ox_inventory' then
        local itemLabels = {}
        for _, data in pairs(exports.ox_inventory:Items()) do
            itemLabels[data.name] = data.label
        end
        return itemLabels[drugName]

    elseif Config.inventoryResource == 'qb-inventory' then
        local QBCore = exports['qb-core']:GetCoreObject()
        return QBCore.Shared.Items[drugName]['label']
    elseif Config.inventoryResource == 'ESX' then
        return lib.callback.await('bobi-selldrugs:server:GetDrugLabel', false, drugName)
    else
        print('Config.inventoryResource is not set, an inventory resource is required')
    end
end

local function addTargetEntity(entity, options)
    if not next(options) then return end
    if lib.table.contains(forbiddenEntities, entity) then return end
    if lib.table.contains(Config.forbiddenModels, GetEntityModel(entity)) then return end
    if IsEntityAMissionEntity(entity) then return end
    if IsEntityAnObject(entity) then return end
    if not IsEntityAPed(entity) then return end
    if Config.targetResource == 'qb-target' then
        cornersellingTargetLabels = cornersellingTargetLabels or {}
        exports['qb-target']:AddTargetEntity(entity, {
            options = options,
        })
        for _, option in pairs(options) do
            cornersellingTargetLabels[option.label] = true
        end
    elseif Config.targetResource == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, options)
        for _, option in pairs(options) do
            cornersellingTargetOptionNames[option.name] = true
        end
    else
        print('Config.targetResource is not set, target resource is required')
    end
end

local function removeTargetEntity(entity)
    if Config.targetResource == 'qb-target' then
        local qbTargetLabels = {}
        for label, _ in pairs(cornersellingTargetLabels) do
            table.insert(qbTargetLabels, label)
        end
        if not next(qbTargetLabels) then return end
        exports['qb-target']:RemoveTargetEntity(entity, qbTargetLabels)
    elseif Config.targetResource == 'ox_target' then
        local oxTargetOptionNames = {}
        for optionName, _ in pairs(cornersellingTargetOptionNames) do
            table.insert(oxTargetOptionNames, optionName)
        end
        if not next(oxTargetOptionNames) then return end
        exports.ox_target:removeLocalEntity(entity, oxTargetOptionNames)
    else
        print('Config.targetResource is not set, target resource is required')
    end
end

local function getNpcPeds()
    local playerPeds = {}
    local pedPool = GetGamePool('CPed')
    local peds = {}
    for _, activePlayer in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(activePlayer)
        playerPeds[#playerPeds + 1] = ped
    end
    for i = 1, #pedPool, 1 do
        local found = false
        for j = 1, #playerPeds, 1 do
            if playerPeds[j] == pedPool[i] then
                found = true
            end
        end
        if not found then
            peds[#peds + 1] = pedPool[i]
        end
    end
    return peds
end

local function canSellDrugs()
    local availableDrugs = {}
    local sellableDrugNames = {}
    local canSell = false
    for drugName, _ in pairs(SellableDrugs) do
        table.insert(sellableDrugNames, drugName)
    end
    availableDrugs = lib.callback.await('bobi-selldrugs:server:GetAvailableDrugs', false, sellableDrugNames)
    while not availableDrugs do
        availableDrugs = lib.callback.await('bobi-selldrugs:server:GetAvailableDrugs', false, sellableDrugNames)
    end
    for _, drugsCount in pairs(availableDrugs) do
        if drugsCount ~= 0 then
            canSell = true
        end
    end
    return Config.sellingOnByDefault and true or canSell, availableDrugs
end

local function takeBackDrugs (theEntity, drugCount, drugName, drugLabel)
    lib.notify({
        id='took_back',
        title='Reprendre '..drugCount.. 'x '..drugLabel,
        position='top',
    })
    TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', drugName, drugCount)
    removeTargetEntity(theEntity)
    robbedByEntities[theEntity] = nil
    table.insert(usedEntities, theEntity)
    -- take back the drugs
end

local function successfulSell(entity, drugName, drugCount)
    removeTargetEntity(entity)
    table.insert(usedEntities, entity)
    ClearPedTasks(entity)
    TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
    TaskLookAtEntity(entity, PlayerPedId(), -1, 2048, 3)
    Wait(1000)
    ClearPedTasksImmediately(entity)
    local moveto = GetEntityCoords(PlayerPedId())
    TaskGoStraightToCoord(ped, moveto.x, moveto.y, moveto.z, 15.0, -1, GetEntityHeading(PlayerPedId()) - 180.0, 0.0)
    Wait(1900)
    FreezeEntityPosition(PlayerPedId(), true)
    ClearPedTasks(PlayerPedId())
    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
    TaskStartScenarioInPlace(entity, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
    Wait(5000)
    local success = lib.callback.await('bobi-selldrugs:server:RemoveDrugs', false, drugName, drugCount)
    if not success then
        -- player trying to do something fishy
        lib.notify({
            id='fishy_selling_drugs',
            title='Bien essayé, vos actions ont été signalées aux administrateurs.',
            position='top',
        })  -- Add your reporting stuff here to actually report
    else
        lib.notify({
            id='selling_drugs',
            title='Tu as vendu '..drugName..'!',
            icon='check',
            iconColor='#00FF00',
            position='top',
        })
        TriggerServerEvent('bobi-selldrugs:server:PayMoneyForDrugs', drugName, drugCount)
    end
    SetPedKeepTask(entity, false)
    SetEntityAsNoLongerNeeded(entity)
    ClearPedTasks(entity)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
end

local function robbedOnSell(entity, drugName, drugCount)
    ClearPedTasks(entity)
    TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
    TaskLookAtEntity(entity, PlayerPedId(), -1, 2048, 3)
    Wait(1000)
    ClearPedTasksImmediately(entity)
    local moveto = GetEntityCoords(PlayerPedId())
    TaskGoStraightToCoord(ped, moveto.x, moveto.y, moveto.z, 15.0, -1, GetEntityHeading(PlayerPedId()) - 180.0, 0.0)
    Wait(1900)
    FreezeEntityPosition(PlayerPedId(), true)
    ClearPedTasks(PlayerPedId())
    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
    TaskStartScenarioInPlace(entity, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
    removeTargetEntity(entity)
    Wait(5000)
    ClearPedTasksImmediately(entity)
    local success = lib.callback.await('bobi-selldrugs:server:RemoveDrugs', false, drugName, drugCount)
    Wait(200)
    local drugLabel = getDrugLabel(drugName)
    if not success then
        -- player trying to do something fishy
        lib.notify({
            id='fishy_selling_drugs',
            title='Bien essayé, vos actions ont été signalées aux administrateurs.',
            position='top',
        })
    else
        lib.notify({
            id='robbed',
            title='Cet enfoiré n\'a pas payé pour le '..drugLabel..'!',
            icon='warning',
            iconColor='#EBE134',
            position='top',
        })
        removeTargetEntity(entity)
        table.insert(robbedByEntities, entity)
        addTargetEntity(entity, {{
                canInteract = function(_, distance, _)
                    return distance <= 4.0
                end,
                action = function(theEntity)
                    takeBackDrugs(theEntity, drugCount, drugName, drugLabel)
                end,
                onSelect = function(data)
                    takeBackDrugs(data.entity, drugCount, drugName, drugLabel)
                end,
                label = "Reprendre" .. drugLabel,
                name = "take_back_drugs"
            }}
        )
    end
    TaskSmartFleeCoord(entity, moveto.x, moveto.y, moveto.z, 1000.5, 60000, true, true)
    SetEntityAsNoLongerNeeded(entity)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
end

local function aggroOnSell(entity)
    table.insert(usedEntities, entity)
    ClearPedTasks(entity)
    TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
    TaskLookAtEntity(entity, PlayerPedId(), -1, 2048, 3)
    Wait(1000)
    ClearPedTasksImmediately(entity)
    local moveto = GetEntityCoords(PlayerPedId())
    TaskGoStraightToCoord(ped, moveto.x, moveto.y, moveto.z, 15.0, -1, GetEntityHeading(PlayerPedId()) - 180.0, 0.0)
    Wait(1900)
    lib.notify({
        id='aggro',
        title='Oh merde, cet idiot s\'est vraiment mis en colère contre vous !',
        icon='warning',
        iconColor='#EBE134',
        position='top',
    })
    SetPedCombatAttributes(entity, 5, true)
    SetPedCombatAttributes(entity, 46, true)
    TaskCombatPed(entity, PlayerPedId(), 0, 16)
end

local function denyOnSell(entity)
    table.insert(usedEntities, entity)
    table.insert(usedEntities, entity)
    ClearPedTasks(entity)
    TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
    TaskLookAtEntity(entity, PlayerPedId(), -1, 2048, 3)
    Wait(2000)
    lib.notify({
        id='denied',
        title='J\'imagine qu\'ils n\'aiment pas s\'amuser..',
        icon='question',
        position='top',
    })
    TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_shrug_hard", 2.0, 2.0, 1000, 16, 0, 0, 0)
    ClearPedTasks(entity)
end

local function attemptSellDrugs (entity, drugName, drugCount)
    if occupied then
        lib.notify({
            id='already_selling',
            title='Vous êtes déjà occupée avec un client !',
            position='top',
            icon='ban',
            iconColor='#C53030'
        })
        return
    end
    occupied = true
    if math.random(1, 100) > SellableDrugs[drugName].odds.sellChance then
        if math.random(1, 100) < SellableDrugs[drugName].odds.aggroChance then
            aggroOnSell(entity)
        else
            denyOnSell(entity)
        end
    else
        local sellAmount = math.random(drugCount >= SellableDrugs[drugName].odds.sellAmountRange[1] and SellableDrugs[drugName].odds.sellAmountRange[1] or drugCount, drugCount >= SellableDrugs[drugName].odds.sellAmountRange[2] and SellableDrugs[drugName].odds.sellAmountRange[2] or drugCount)
        if math.random(1, 100) < SellableDrugs[drugName].odds.robberyChance then
            robbedOnSell(entity, drugName, sellAmount)
        else
            successfulSell(entity, drugName, sellAmount)
        end
        if SellableDrugs[drugName].odds.policeCallChance > math.random(1, 100) then
            Config.policeCallClientFunction()
        end
    end
    occupied = false
end

local function startDrugSellingLoop()
    CreateThread(function ()
        while true do
            if not selling then
                lib.hideTextUI()
                return
            end
            local buyers = getNpcPeds()
            for _, npcBuyer in pairs(buyers) do
                if not lib.table.contains(robbedByEntities, npcBuyer) then
                    removeTargetEntity(npcBuyer)
                end
            end
            local canSell, availableDrugs = canSellDrugs()
            if not canSell then
                selling = false
            end
            local sellOptions = {}
            for drugName, drugCount in pairs(availableDrugs) do
                if drugCount >= 1 then
                    local drugLabel = getDrugLabel(drugName)
                    table.insert(sellOptions, {
                        canInteract = function(interactEntity, distance, _)
                            if IsEntityDead(interactEntity) then
                                return false
                            end
                            if distance >= 4.0 then
                                return false
                            end
                            return true
                        end,
                        action = function(entity)
                            attemptSellDrugs(entity, drugName, drugCount)
                        end,
                        onSelect = function(data)
                            attemptSellDrugs(data.entity, drugName, drugCount)
                        end,
                        label = "Vendre " .. drugLabel,
                        name = "sell_option_" .. drugName,
                    })
                end
            end
            for _, npcBuyer in pairs(buyers) do
                if not lib.table.contains(usedEntities, npcBuyer) then
                    addTargetEntity(npcBuyer, sellOptions)
                end
            end
            Wait(5000)
        end
    end)
end
local function startSelling()
    local buyers = getNpcPeds()
    for _, npcBuyer in pairs(buyers) do
        removeTargetEntity(npcBuyer)
    end
    local canSell, _ = canSellDrugs()
    if not canSell then
        selling = false
        lib.notify({
            id='no_drugs',
            title='Aucune drogues a vendre',
            position='top',
            icon='ban',
            iconColor='#C53030'
        })
        return
    end
    selling = not selling
    if selling then
        if not Config.sellingOnByDefault then
            lib.showTextUI('A la recherche de client ...', {
                position = 'left-center',
                icon = 'cannabis',
                iconColor = '34EB37'
            })
        end
        startDrugSellingLoop()
    else
        lib.hideTextUI()
    end
end
local function addForbiddenEntity (entity)
    table.insert(forbiddenEntities, entity)
end

RegisterNetEvent('bobi-selldrugs:client:StartSelling', function ()
    startSelling()
end)

RegisterNetEvent('bobi-selldrugs:client:AddForbiddenEntity', function (entity)
    addForbiddenEntity(entity)
end)
exports('AddForbiddenEntity', addForbiddenEntity)

if Config.sellingOnByDefault then
    AddEventHandler('playerSpawned', function()
        startSelling()
    end)
end
