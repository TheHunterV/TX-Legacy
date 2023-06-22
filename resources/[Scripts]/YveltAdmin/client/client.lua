ESX = exports["es_extended"]:getSharedObject()

local gamertag = {
    ["user"] = "Joueurs",
    ["help"] = "Helpeur",
    ["mod"] = "Modo",
    ["admin"] = "Admin",
    ["superadmin"] = "Fondateur",
    ["owner"] = "Fondateur",
    ["_dev"] = "Developpeur",
}

local Listing = {}
local player = {};
local jobs = nil
local lisenceontheflux = nil
local Bot = {}
local get = false
local onStaffMode = false

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(850)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(850)
		return nil
	end
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        player = ESX.GetPlayerData()
        Citizen.Wait(850)
    end
end)

local TempsValue = ""
local raisontosend = "Aucune Raison !"
local GroupItem = {}
GroupItem.Value = 1

local mainMenu = RageUI.CreateMenu("~w~Administration", "Menu Administratif", 0);
local inventoryMenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Inventaire du joueur", 0)
inventoryMenu:DisplayGlare(true)

local TARGET_INVENTORY = {}

mainMenu:DisplayPageCounter(false)
mainMenu:DisplayGlare(true)
mainMenu:AddInstructionButton({
    [1] = GetControlInstructionalButton(1, 334, 0),
    [2] = "Modifier la vitesse du NoClip",
});

local selectedMenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "placeholder")
selectedMenu:DisplayGlare(true)

local playerActionMenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "placeholder")
playerActionMenu:DisplayGlare(true)

local adminmenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Admin")
adminmenu:DisplayGlare(true)

local utilsmenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Utils")
utilsmenu:DisplayGlare(true)

local moneymenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Options")
moneymenu:DisplayGlare(true)

local tpmenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Teleportation")
tpmenu:DisplayGlare(true)

local vehiculemenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Vehicule")
vehiculemenu:DisplayGlare(true)

local menugive = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Menu Administratif")
menugive:DisplayGlare(true)

local customCols = RageUI.CreateSubMenu(vehiculemenu, "~w~Menu Couleurs", "Couleurs")
customCols:DisplayGlare(true)

local customNeon = RageUI.CreateSubMenu(vehiculemenu, "~w~Menu Neon", "Neon")
customNeon:DisplayGlare(true)

local reportmenu = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Liste Report")
reportmenu:DisplayGlare(true)

local pedmenubb = RageUI.CreateSubMenu(mainMenu, "~w~Administration", "Gestion des Peds")
pedmenubb:DisplayGlare(true)

---@class YVELT
YVELT = {} or {};

---@class SelfPlayer Administrator current settings
YVELT.SelfPlayer = {
    ped = 0,
    isStaffEnabled = false,
    isClipping = false,
    isGamerTagEnabled = false,
    isReportEnabled = true,
    isInvisible = false,
    isCarParticleEnabled = false,
    isSteve = false,
    isDelgunEnabled = false,
};

YVELT.SelectedPlayer = {};

YVELT.Menus = {} or {};

YVELT.Helper = {} or {}

---@class Players
YVELT.Players = {} or {} --- Players lists
---
YVELT.PlayersStaff = {} or {} --- Players Staff

YVELT.AllReport = {} or {} --- Players Staff


---@class GamerTags
YVELT.GamerTags = {} or {};

playerActionMenu.onClosed = function()
    YVELT.SelectedPlayer = {};
    lisenceontheflux = nil;
end

local NoClip = {
    Camera = nil,
    Speed = 1.0
}

local oldpos = nil
local specatetarget = nil
local specateactive = false

function spectate(target)
    if not oldpos then
        TriggerServerEvent("YVELT:teleport", target)
        oldpos = GetEntityCoords(GetPlayerPed(PlayerId()))
		SetEntityVisible(GetPlayerPed(PlayerId()), false)
        SetEntityCollision(GetPlayerPed(PlayerId()), false, false)
        specatetarget = target
        specateactive = true
    else
        SetEntityCoords(GetPlayerPed(PlayerId()), oldpos.x, oldpos.y, oldpos.z)
        SetEntityVisible(GetPlayerPed(PlayerId()), true)
        SetEntityCollision(GetPlayerPed(PlayerId()), true, true)
        specatetarget = nil
        gang = ""
        oldpos = nil
        specateactive = false
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if specateactive then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tonumber(specatetarget) then
                    local ped = GetPlayerPed(player)
                    local coords = GetEntityCoords(ped)
                    SetEntityNoCollisionEntity(GetPlayerPed(PlayerId()), ped, true)
                    SetEntityCoords(GetPlayerPed(PlayerId()), coords.x, coords.y, coords.z)
                end
            end             
        end            
    end
end)

local selectedIndex = 0;

local FastTravel = {
    { Name = "~g~Poste de Police~s~", Value = vector3(415.90014648438,-979.98913574219,29.440589904785) },
    { Name = "~g~Fourrière~s~", Value = vector3(408.11047363281,-1625.3238525391,29.291927337646) },
    { Name = "~g~Concessionaire~s~", Value = vector3(-38.297695159912,-1107.1236572266,26.437789916992) },
    { Name = "~g~Mécano~s~", Value = vector3(-212.19323730469,-1326.0252685547,30.890377044678) },
    { Name = "~g~Hopital~s~", Value = vector3(299.17370605469,-584.73223876953,43.260829925537) },
    { Name = "~g~Parking Central~s~", Value = vector3(215.29154968262,-809.84185791016,30.740789413452) },
}

local FastTravel2 = {
    { Name = "~g~Toit Centre ville~s~", Value = vector3(123.94564056396,-880.44451904297,134.77000427246) },
    { Name = "~g~Toit Est. ville~s~", Value = vector3(-159.36653137207,-992.88562011719,254.13056945801) },
    { Name = "~g~Toit de Studio 1~s~", Value = vector3(-143.79469299316,-593.11883544922,211.77502441406) },
    { Name = "~g~Toit Ouest. ville~s~", Value = vector3(-895.02905273438,-446.72402954102,171.81401062012) },
    { Name = "~g~Toit Sud. ville~s~", Value = vector3(-847.86987304688,-2142.7275390625,101.39619445801) },
}

local GroupIndex = 1;
local GroupIndexx = 1;
local GroupIndexxx = 1;
local GroupIndexxxx = 1;
local GroupIndexxxxx = 1;
local GroupIndexxxxxWeapon = 1;
local GroupIndexxxxxPed = 1;
local IndexJobs = 1;
local IndexJobsGrade = 1;
local IndexGangs = 1;
local IndexGangsGrade = 1;
local PermissionIndex = 1;
local VehicleIndex = 1;
local VehicleIndex2 = 1;
local ColorIndex = 1;
local FastTravelIndex = 1;
local FastTravelIndex2 = 1;
local CarParticleIndex = 1;
local idtosanctionbaby = 1;
local idtoreport = 1;
local kvdureport = 1;
local colorMetalList = 1;
local colorList = 1;
local colorNeon = 1;



function YVELT.Helper:RetrievePlayersDataByID(source)
    local player = {};
    for i, v in pairs(YVELT.Players) do
        if (v.source == source) then
            player = v;
        end
    end
    return player;
end




function YVELT.Helper:onToggleNoClip(toggle)
    if (toggle) then
        ESX.ShowNotification("NoClip ~g~activé")
        if (ESX.GetPlayerData()['group'] ~= "user") then
            if (NoClip.Camera == nil) then
                NoClip.Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            end
            SetCamActive(NoClip.Camera, true)
            RenderScriptCams(true, false, 0, true, true)
            SetCamCoord(NoClip.Camera, GetEntityCoords(YVELT.SelfPlayer.ped))
            SetCamRot(NoClip.Camera, GetEntityRotation(YVELT.SelfPlayer.ped))
            SetEntityCollision(NoClip.Camera, false, false)
            SetEntityVisible(NoClip.Camera, false)
            SetEntityVisible(YVELT.SelfPlayer.ped, false, false)
        end
    else
        if (ESX.GetPlayerData()['group'] ~= "user") then
            ESX.ShowNotification("NoClip ~r~désactivé")
            SetCamActive(NoClip.Camera, false)
            RenderScriptCams(false, false, 0, true, true)
            SetEntityCollision(YVELT.SelfPlayer.ped, true, true)
            SetEntityCoords(YVELT.SelfPlayer.ped, GetCamCoord(NoClip.Camera))
            SetEntityHeading(YVELT.SelfPlayer.ped, GetGameplayCamRelativeHeading(NoClip.Camera))
            if not (YVELT.SelfPlayer.isInvisible) then
                SetEntityVisible(YVELT.SelfPlayer.ped, true, false)
            end
        end
    end
end

RegisterNetEvent("YVELT:envoyer")
AddEventHandler("YVELT:envoyer", function(msg)
    ESX.ShowNotification('- ~r~Message du Staff~s~\n- '..msg)
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

function YVELT.Helper:OnRequestGamerTags()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if (YVELT.GamerTags[ped] == nil) or (YVELT.GamerTags[ped].ped == nil) or not (IsMpGamerTagActive(YVELT.GamerTags[ped].tags)) then
            local formatted;
            local group = 0;
            local permission = 0;
            local fetching = YVELT.Helper:RetrievePlayersDataByID(GetPlayerServerId(player));
            if fetching.group ~= nil then
                if fetching.group ~= "user" then
                    formatted = string.format('[' .. gamertag[fetching.group] .. '] %s | %s [%s]', GetPlayerName(player), GetPlayerServerId(player),fetching.jobs)
                else
                    formatted = string.format('[%d] %s [%s]', GetPlayerServerId(player), GetPlayerName(player), fetching.jobs)
                end
            else
                formatted = string.format('[%d] %s [%s]', GetPlayerServerId(player), GetPlayerName(player), "Jobs Inconnue")
            end
            if (fetching) then
                group = fetching.group
                permission = fetching.permission
            end

            YVELT.GamerTags[ped] = {
                player = player,
                ped = ped,
                group = group,
                permission = permission,
                tags = CreateFakeMpGamerTag(ped, formatted)
            };
        end

    end
end


function RefreshPlayerGroup()
    Citizen.CreateThread(function()
        ESX.TriggerServerCallback('YVELT:getUsergroup', function(group)
            playergroup = group
        end)   
    end)
end


function YVELT.Helper:RequestPtfx(assetName)
    RequestNamedPtfxAsset(assetName)
    if not (HasNamedPtfxAssetLoaded(assetName)) then
        while not HasNamedPtfxAssetLoaded(assetName) do
            Citizen.Wait(1.0)
        end
        return assetName;
    else
        return assetName;
    end
end

function YVELT.Helper:CreateVehicle(model, vector3)
    self:RequestModel(model)
    local vehicle = CreateVehicle(model, vector3, 100.0, true, false)
    local id = NetworkGetNetworkIdFromEntity(vehicle)

    SetNetworkIdCanMigrate(id, true)
    SetEntityAsMissionEntity(vehicle, false, false)
    SetModelAsNoLongerNeeded(model)

    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, 'OFF')
    while not HasCollisionLoadedAroundEntity(vehicle) do
        Citizen.Wait(500)
    end
    return vehicle, GetEntityCoords(vehicle);
end

function YVELT.Helper:OnGetPlayers()
    local clientPlayers = false;
    ESX.TriggerServerCallback('YVELT:retrievePlayers', function(players)
        clientPlayers = players
    end)

    while not clientPlayers do
        Citizen.Wait(0)
    end
    return clientPlayers
end

function YVELT.Helper:OnGetStaffPlayers()
    local clientPlayers = false;
    ESX.TriggerServerCallback('YVELT:retrieveStaffPlayers', function(players)
        clientPlayers = players
    end)
    while not clientPlayers do
        Citizen.Wait(0)
    end
    return clientPlayers
end

function YVELT.Helper:GetReport()
    ESX.TriggerServerCallback('YVELT:retrieveReport', function(allreport)
        ReportBB = allreport
    end)
    while not ReportBB do
        Citizen.Wait(500)
    end
    return ReportBB
end

function admin_vehicle_flip()

    local player = GetPlayerPed(-1)
    posdepmenu = GetEntityCoords(player)
    carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
    if carTargetDep ~= nil then
            platecarTargetDep = GetVehicleNumberPlateText(carTargetDep)
    end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
    
    SetEntityCoords(carTargetDep, playerCoords)
    
    ESX.ShowAdvancedNotification('Administration', '~r~Informations', 'Le ~r~véhicule~s~ a été retourné', 'CHAR_SUNLITE', 2)

end

RegisterNetEvent("YVELT:RefreshReport")
AddEventHandler("YVELT:RefreshReport", function()
    YVELT.GetReport = YVELT.Helper:GetReport()
end)

function YVELT.Helper:onStaffMode(status)
    if (status) then
        onStaffMode = true
        CreateThread(function()
            while onStaffMode do
                Visual.Subtitle("Nom : ~r~"..GetPlayerName(PlayerId()).."~s~ | Report actuels : ~r~" .. #YVELT.GetReport , 999999999999999)
                Citizen.Wait(1000)
            end
        end)
        YVELT.PlayersStaff = YVELT.Helper:OnGetStaffPlayers()
        YVELT.GetReport = YVELT.Helper:GetReport()
    else
        onStaffMode = false
        Visual.Subtitle("Report actifs : ~r~" .. #YVELT.GetReport , 1)
        if (YVELT.SelfPlayer.isClipping) then
            YVELT.Helper:onToggleNoClip(false)
        end
        if (YVELT.SelfPlayer.isInvisible) then
            YVELT.SelfPlayer.isInvisible = false;
            SetEntityVisible(YVELT.SelfPlayer.ped, true, false)
        end
    end
    
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if (YVELT.SelfPlayer.isStaffEnabled) then
            YVELT.Players = YVELT.Helper:OnGetPlayers()
            YVELT.PlayersStaff = YVELT.Helper:OnGetStaffPlayers()
            YVELT.GetReport = YVELT.Helper:GetReport()
        end
    end
end)

local ped = {
    { Name = "Pogo 1", Value = 'u_m_m_streetart_01' },
    { Name = "Pogo 2", Value = 'u_m_y_pogo_01' },
    { Name = "Mime", Value = 's_m_y_mime' },
    { Name = "Jesus", Value = 'u_m_m_jesus_01' },
    { Name = "Zombie", Value = 'u_m_y_zombie_01' },
    { Name = "The Rock", Value = 'u_m_y_babyd' },
}
local pedIndex = 1
local ValuePed = 'u_m_m_streetart_01'
local NamePed = 'Pogo 1'

RegisterNetEvent("YVELT:noclipkey")
AddEventHandler("YVELT:noclipkey", function()
    RefreshPlayerGroup()
    if (YVELT.SelfPlayer.isStaffEnabled) then
        if (YVELT.SelfPlayer.isClipping) then
            YVELT.Helper:onToggleNoClip(false)
            YVELT.SelfPlayer.isClipping = false
        else
            YVELT.Helper:onToggleNoClip(true)
            YVELT.SelfPlayer.isClipping = true 
        end
    else
        ESX.ShowNotification("Action impossible (NoClip)")
        ESX.ShowAdvancedNotification('Administration', '~r~Informations', 'Vous n\'avez pas activé votre ~b~mode staff', 'CHAR_SUNLITE', 2)
    end
   
end)

RegisterNetEvent("YVELT:menu1")
AddEventHandler("YVELT:menu1", function()
    RefreshPlayerGroup()
    YVELT.Players = YVELT.Helper:OnGetPlayers();
    YVELT.PlayersStaff = YVELT.Helper:OnGetStaffPlayers()
    YVELT.GetReport = YVELT.Helper:GetReport()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
   
end)

RegisterNetEvent("YVELT:menu2")
AddEventHandler("YVELT:menu2", function()
    RefreshPlayerGroup()
    YVELT.GetReport = YVELT.Helper:GetReport()
    RageUI.Visible(reportmenu, not RageUI.Visible(reportmenu))
   
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if (IsControlJustPressed(0, Config.Touche.Noclip)) then --F3
            TriggerServerEvent("YVELT:noclipkey")
        end

        if (IsControlJustPressed(0, Config.Touche.Menu)) then
            TriggerServerEvent("YVELT:ouvrirmenu1")
        end

        if (IsControlJustPressed(0, Config.Touche.MenuReport)) then
            TriggerServerEvent("YVELT:ouvrirmenu2")
        end

        RageUI.IsVisible(mainMenu, function()

            RageUI.Separator("Joueur(s) en jeu : ~g~".. #YVELT.Players.."")
            RageUI.Separator("Staff(s) en jeu : ~b~".. #YVELT.PlayersStaff.."")
           -- if onStaffMode == false then
            RageUI.Separator("Report(s) actifs : ~r~" ..#YVELT.GetReport)

           -- RageUI.Line(224, 50, 50, 255)

            -- RageUI.List('choisissez votre Ped', ped, pedIndex, nil, {}, true, {
                
            --     onListChange = function(Index, Item)
            --         pedIndex = Index;
            --         ValuePed = Item.Value
            --         NamePed = Item.Name
            --     end,
            -- })
            

            --RageUI.Separator('Ped : ~r~'.. NamePed)

            RageUI.Checkbox("~r~→ ~s~Prendre son service", "Le mode staff ne peut être utilisé que pour modérer le serveur, tout abus sera sévèrement puni, l'intégralité de vos actions sera enregistrée.", YVELT.SelfPlayer.isStaffEnabled, { }, {
                onChecked = function()
                    PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                    YVELT.Helper:onStaffMode(true)
                    TriggerServerEvent('YVELT:onStaffJoin')
                    -- local j1 = PlayerId(-1)
                    -- local p1 = GetHashKey(ValuePed)
                    -- RequestModel(p1)
                    -- while not HasModelLoaded(p1) do
                    --     Wait(100)
                    -- end 
                    --     SetPlayerModel(j1, p1)
                    --     SetModelAsNoLongerNeeded(p1)
                end,
                onUnChecked = function()
                    PlaySoundFrontend(-1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                    YVELT.Helper:onStaffMode(false)
                    ESX.ShowNotification('Avez vous bien penser a désactiver les GamerTags', 5000)
                    TriggerServerEvent('YVELT:onStaffLeave')
                    
                    
                    
                    -- ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    --     local isMale = skin.sex == 0
                    --     TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                    --         ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    --             TriggerEvent('skinchanger:loadSkin', skin)
                    --             TriggerEvent('esx:restoreLoadout')
                    --         end)
                    --     end)
                    -- end) 
                end,
                onSelected = function(Index)
                    YVELT.SelfPlayer.isStaffEnabled = Index
                end
            })
            

            if (YVELT.SelfPlayer.isStaffEnabled) then

              --  RageUI.Line(224, 50, 50, 255)
-- fleches ici  ↓ ↓

RageUI.Separator("~r~↓ ~s~Gestion ~r~↓")

              RageUI.Button('Menu Report(s)', nil, { RightLabel = '~r~'..#YVELT.GetReport }, true, {
                onSelected = function()
                end
            }, reportmenu)

                RageUI.Button('Menu Joueur(s)', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                        selectedMenu:SetSubtitle(string.format('Joueur(s) en lignes [%s]', #YVELT.Players))
                        selectedIndex = 1;
                    end
                }, selectedMenu)

                RageUI.Button('Menu Véhicule(s)', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                    end
                }, vehiculemenu)

                RageUI.Button('Menu Personnel', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                    end
                }, tpmenu)


                ------------------------ MENU DE BASE EN HAUT aa
         
               

                

               
                
                if playergroup ~= nil and ( playergroup == '_dev' or playergroup == 'owner' or playergroup == 'superadmin') then
                    RageUI.Button('Menu Administratif', 'Ce Menu vous permez de faire des actions Administratif. Attention, si vous utilisez cette option sans l\'autorisation du Fondateur, vous serez lourdement sanctionné.', { RightLabel = "~r~→→" }, true, {
                        onSelected = function()
                        end
                    }, menugive)
                end

            end
        end)

        if (YVELT.SelfPlayer.isStaffEnabled) then
            RageUI.IsVisible(inventoryMenu, function()
                for i, v in pairs(TARGET_INVENTORY) do
                    RageUI.Button(v.label, nil, { RightLabel = v.count }, true, {
                        onSelected = function()
        
                        end
                    })
                end
            end)
        end


        if (YVELT.SelfPlayer.isStaffEnabled) then
            RageUI.IsVisible(tpmenu, function()

                RageUI.Separator("~r~↓ ~s~Personnel ~r~↓")
                RageUI.Checkbox("→ NoClip", "Vous permet de vous déplacer librement sur toute la carte sous forme de caméra libre.", YVELT.SelfPlayer.isClipping, { }, {
                    onChecked = function()
                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                    TriggerServerEvent("YVELT:SendLogs", "Active noclip")
                    YVELT.Helper:onToggleNoClip(true)
                    end,
                    onUnChecked = function()
                        PlaySoundFrontend(-1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                    TriggerServerEvent("YVELT:SendLogs", "Désactive noclip")
                    YVELT.Helper:onToggleNoClip(false)
                    end,
                    onSelected = function(Index)
                    YVELT.SelfPlayer.isClipping = Index
                    end
                }, selectedMenu)

                RageUI.Checkbox("→ Affichage des GamerTags", "L'affichage des tags des joueurs vous permet de voir les informations des joueurs, y compris de vous reconnaître entre les membres du personnel grâce à votre couleur.", YVELT.SelfPlayer.isGamerTagEnabled, { }, {
                    onChecked = function()
                    if (ESX.GetPlayerData()['group'] ~= "user") then
                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                        ESX.ShowNotification("GamerTags ~g~activé")
                    TriggerServerEvent("YVELT:SendLogs", "Active GamerTags")
                    YVELT.Helper:OnRequestGamerTags()
                    end
                    end,
                    onUnChecked = function()
                    for i, v in pairs(YVELT.GamerTags) do
                        PlaySoundFrontend(-1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
                        ESX.ShowNotification("GamerTags ~r~désactivé")
                    TriggerServerEvent("YVELT:SendLogs", "Désactive GamerTags")
                    RemoveMpGamerTag(v.tags)
                    end
                    YVELT.GamerTags = {};
                    end,
                    onSelected = function(Index)
                    YVELT.SelfPlayer.isGamerTagEnabled = Index
                    end
                }, selectedMenu)

                RageUI.Checkbox("→ Affichage des Blips", nil, YVELT.SelfPlayer.IsBlipsActive, { }, {
                    onChecked = function()
                        TriggerServerEvent("YVELT:SendLogs", "Active Blips")
                        
                        ESX.ShowNotification("Blips ~g~activé")
                        blips = true
                    end,
                    onUnChecked = function()
                        TriggerServerEvent("YVELT:SendLogs", "Désactive Blips")
                        ESX.ShowNotification("Blips ~r~désactivé")
                        blips = false
                    end,
                    onSelected = function(Index)
                        YVELT.SelfPlayer.IsBlipsActive = Index
                    end
                })
                local blips = false


                RageUI.Checkbox("→ Mode Invisible", nil, YVELT.SelfPlayer.isInvisible, { }, {
                    onChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Active invisible")
                    SetEntityVisible(YVELT.SelfPlayer.ped, false, false)
                    
                    ESX.ShowNotification("Invisibilité ~g~activé")
                    end,
                    onUnChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Désactive invisible")
                    ESX.ShowNotification("Invisibilité ~r~desactivé")
                    SetEntityVisible(YVELT.SelfPlayer.ped, true, false)
                    end,
                    onSelected = function(Index)
                        YVELT.SelfPlayer.isInvisible = Index
                    end
                })
                if playergroup ~= nil and ( playergroup == '_dev' or playergroup == 'owner' or playergroup == 'superadmin') then
                    RageUI.Checkbox("→~s~ Mode l'Invincible ~r~(gradé)~s~","Devenir invincible.", YVELT.SelfPlayer.isInvincible, { }, {
                        onChecked = function()
                            local ped = GetPlayerPed(-1)
                            SetEntityInvincible(ped, true)
                            TriggerServerEvent("YVELT:SendLogs", "Invincible Activé")
                            ESX.ShowNotification("Invincibilité ~g~activé")
                        end,
                        onUnChecked = function()
                            local ped = GetPlayerPed(-1)
                            SetEntityInvincible(ped, false)
                            TriggerServerEvent("YVELT:SendLogs", "Invincible Désactivé")
                            ESX.ShowNotification("Invincibilité ~r~désactivé")
                        end,
                        onSelected = function(Index)
                            YVELT.SelfPlayer.isInvincible = Index
                        end
                    })
                end


                RageUI.Button("→ Se Revive", '/revive', {RightLabel = '~r~→→'}, true, {
                    onSelected = function()
                        
                    ExecuteCommand("revive")
                    Wait(1000)
                    ESX.ShowNotification('Vous avez été revive par ~g~vous', 5000)
                end
                
                })
                RageUI.Button("→ Se Nourir", '/heal', {RightLabel = '~r~→→'}, true, {
                    onSelected = function()
                    ExecuteCommand("heal")
                    Wait(2000)
                    ESX.ShowNotification('Vous avez été heal par ~g~vous', 5000)
                end
                
                })
               
                
                RageUI.Separator("~r~↓ ~s~Téléportation(s) ~r~↓")

                RageUI.Button('→ Spectate Aléatoire', "Regarder un joueur aléatoirement", { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        local number = #YVELT.Players
                        local target = YVELT.Players[math.random(0~number)].source
                        if target == GetPlayerServerId(PlayerId()) then
                            ESX.ShowNotification("Votre ID a été sélectionné mais vous ne pouvez pas vous spec vous même ! Réessayer !")
                        else
                            spectate(target)
                        end
                    end
                }) 
           

            RageUI.Button('→ Téléportation vers le marker', 'Permet de se ~r~téléporter~s~ sur un ~r~point~s~', { RightLabel = "~r~→→" }, true, {
                onSelected = function()
                    plyPed = PlayerPedId()
                    local waypointHandle = GetFirstBlipInfoId(8)

                    if DoesBlipExist(waypointHandle) then
                        Citizen.CreateThread(function()
                            local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                            local foundGround, zCoords, zPos = false, -500.0, 0.0
        
                            while not foundGround do
                                zCoords = zCoords + 10.0
                                RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                Citizen.Wait(0)
                                foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)
        
                                if not foundGround and zCoords >= 2000.0 then
                                    foundGround = true
                                end
                            end
        
                            SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
                            ESX.ShowNotification("Vous avez été TP")
                            TriggerServerEvent("YVELT:SendLogs", "Se TP sur le waypoint")
                        end)
                    else
                        ESX.ShowNotification("Pas de marqueur sur la carte")
                    end
                end
            })

            RageUI.List('→ Téléportation Rapide', FastTravel, FastTravelIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                FastTravelIndex = Index;
                end,
                onSelected = function(Index, Item)
                SetEntityCoords(PlayerPedId(), Item.Value)
                TriggerServerEvent("YVELT:SendLogs", "Utilise le fast travel")
                end
            })
            RageUI.List('→ Téléportation Toits', FastTravel2, FastTravelIndex2, nil, {}, true, {
                onListChange = function(Index, Item)
                FastTravelIndex2 = Index;
                end,
                onSelected = function(Index, Item)
                SetEntityCoords(PlayerPedId(), Item.Value)
                TriggerServerEvent("YVELT:SendLogs", "Utilise le fast travel")
                end
            })

            RageUI.Separator("~r~↓ ~s~Developpement ~r~↓")

            RageUI.Checkbox("→ Affiché les Coordonnées", "Affiche les ~o~coordonnées", YVELT.SelfPlayer.ShowCoords, { }, {
                onChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Affiche les coordonnées")
                    coords = true
                end,
                onUnChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Désactive l'affichage des coordonnées")
                    coords = false
                end,
                onSelected = function(Index)
                    YVELT.SelfPlayer.ShowCoords = Index
                end
            })

            RageUI.Button("→ Copié les Coordonnées (1)", "Forme : 100.00, 100.00, 100.0", {RightLabel = "~r~→→"}, true, {
                onSelected = function()
                ExecuteCommand("coords")
                ESX.ShowNotification("Les coordonnées ont été copié")  
            end
            
            })

            RageUI.Button("→ Copié les Coordonnées (2)", "Forme : x = 100.00, y = 100.00, z = 100.0", {RightLabel = "~r~→→"}, true, {
                onSelected = function()
                ExecuteCommand("c")
                ESX.ShowNotification("Les coordonnées ont été copié")  
            end
            
            })
            
            RageUI.Checkbox("→ Delgun", 'Active le ~g~pistolet~s~ qui ~r~delete', YVELT.SelfPlayer.isDelgunEnabled, { }, {
                onChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Active Delgun")
                    
                    ESX.ShowNotification("Delgun ~g~activé")
                end,
                onUnChecked = function()
                    TriggerServerEvent("YVELT:SendLogs", "Désactive Delgun")
                    ESX.ShowNotification("Delgun ~r~désactivé")
                end,
                onSelected = function(Index)
                    YVELT.SelfPlayer.isDelgunEnabled = Index
                end
            })
        end)
    end

        

        if (YVELT.SelfPlayer.isStaffEnabled) then
            RageUI.IsVisible(menugive, function()
                RageUI.Separator("Votre ID Unique : ~r~" .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .."")
                RageUI.Separator("~r~↓ ~s~Actions Rapides ~r~↓")

                   -- travaille fdp

                   RageUI.Checkbox("→~s~ Mode l'Invincible ~r~(gradé)~s~","Devenir invincible.", YVELT.SelfPlayer.isInvincible, { }, {
                    onChecked = function()
                        local ped = GetPlayerPed(-1)
                        SetEntityInvincible(ped, true)
                        TriggerServerEvent("YVELT:SendLogs", "Invincible Activé")
                        ESX.ShowNotification("Invincibilité ~g~activé")
                    end,
                    onUnChecked = function()
                        local ped = GetPlayerPed(-1)
                        SetEntityInvincible(ped, false)
                        TriggerServerEvent("YVELT:SendLogs", "Invincible Désactivé")
                        ESX.ShowNotification("Invincibilité ~r~désactivé")
                    end,
                    onSelected = function(Index)
                        YVELT.SelfPlayer.isInvincible = Index
                    end
                })


                
            


         --[[       function godmodayveltbeybey()
                    godmode = not godmode
                    local ped = GetPlayerPed(-1)
                
                    if godmode then -- activé
                          SetEntityInvincible(ped, true)
                    ESX.ShowAdvancedNotification("Administration", "", "Invincibilité : ~g~activé", "CHAR_MP_MORS_MUTUAL", 1)
                      else
                          SetEntityInvincible(ped, false)
                    ESX.ShowAdvancedNotification("Administration", "", "Invincibilité : ~r~désactivé", "CHAR_MP_MORS_MUTUAL", 1)
                    end
                  end
                  local invincible = false
               --   ]]





               
            RageUI.Button("→ Kick un joueur avec ID", nil, {RightLabel = "~r~→→"}, true, {
                onSelected = function()
                    ESX.ShowNotification("Entrez l'ID du joueur à kick")
                    --ESX.ShowHelpNotification("Entrez le nom steam du joueur à débannir")
                    local idkick = KeyboardInput("", "", '', 30)
                    ESX.ShowNotification("Entrez la raison du kick du joueur avec comme ID : " ..idkick.."")
                    local raisonkickid = KeyboardInput("", "", '', 30)
                    ESX.ShowNotification("~r~Sanction - Kick\n~s~Joueur (ID) : " ..idkick.."\nRaison : " ..raisonkickid.."")
                    ExecuteCommand("kick "..idkick.." "..raisonkickid.."")
            end
            
            })
            RageUI.Button("→ Bannir un joueur avec ID", nil, {RightLabel = "~r~→→"}, true, {
               
                    onSelected = function()
                        ESX.ShowNotification("Entrez l'ID du joueur à bannir")
                        --ESX.ShowHelpNotification("Entrez le nom steam du joueur à débannir")
                        local idban = KeyboardInput("", "", '', 30)
                        ESX.ShowNotification("Entrez la durée du bannissement en jour pour le joueur avec l'id : " ..idban.."")
                        local idbanday = KeyboardInput("", "", '', 30)
                        ESX.ShowNotification("Vous allez bannir le joueur avec l'id : " ..idban.." pendant "..idbanday.." jours. Maintenant entrez la raison")
                        local raisonbanid = KeyboardInput("", "", '', 30)
                        ESX.ShowNotification("~r~Sanction - Bannissement\n~s~Joueur [ID] : " ..idban.."\nRaison : " ..raisonbanid.."\nDurée : " ..raisonbanid.."")
                        ExecuteCommand("sqlban "..idban.." " ..idbanday.." "..raisonbanid.."")
                end
                
                })
               
            RageUI.Button("→ Débannir un joueur", nil, {RightLabel = "~r~→→"}, true, {
                onSelected = function()
                    ESX.ShowNotification("Entrez le nom steam du joueur à débannir")
                    --ESX.ShowHelpNotification("Entrez le nom steam du joueur à débannir")
                    local debanbb = KeyboardInput("", "", '', 30)
                    ExecuteCommand("sqlunban "..debanbb.." ")
            end
            
            })



                RageUI.Separator("~r~↓ ~s~Give argent / item ~r~↓")

                RageUI.Button("S'octroyer de ~g~l'argent en liquide", 'Si vous utilisez cette option sans l\'autorisation du Fondateur, vous serez lourdement sanctionné.', { RightLabel = "⚠  ~r~→→" }, true, {
                    onSelected = function()
                        local amount = KeyboardInput('YVELT_BOX_AMOUNT', "Veuillez entrer la somme", '', 8)

                        if amount ~= nil then
                            amount = tonumber(amount)
                
                            if type(amount) == 'number' then
                                TriggerServerEvent('YVELT:GiveMoney', "money", amount)   
                                ESX.ShowNotification("Give de ~g~" .. amount .. "$~s~")                            
                            end
                        end
                    end,
                })

                RageUI.Button("S'octroyer de ~o~l'argent en banque", 'Si vous utilisez cette option sans l\'autorisation du Fondateur, vous serez lourdement sanctionné.', { RightLabel = "⚠  ~r~→→" }, true, {
                    onSelected = function()
                        local amount = KeyboardInput('YVELT_BOX_AMOUNT', "Veuillez entrer la somme", '', 8)

                        if amount ~= nil then
                            amount = tonumber(amount)
                
                            if type(amount) == 'number' then
                                TriggerServerEvent('YVELT:GiveMoney', "bank <@989512047932882974>", amount)  
                                ESX.ShowNotification("Give de ~r~" .. amount .. "$~s~")                             
                            end
                        end
                    end,
                })

                RageUI.Button("S'octroyer de ~b~l'argent en sale", 'Si vous utilisez cette option sans l\'autorisation du Fondateur, vous serez lourdement sanctionné.', { RightLabel = "⚠  ~r~→→" }, true, {
                    onSelected = function()
                        local amount = KeyboardInput('YVELT_BOX_AMOUNT', "Veuillez entrer la somme", '', 8)

                        if amount ~= nil then
                            amount = tonumber(amount)
                
                            if type(amount) == 'number' then
                                TriggerServerEvent('YVELT:GiveMoney', "black_money", amount)  
                                ESX.ShowNotification("Give de ~r~" .. amount .. "$~s~")                             
                            end
                        end
                    end,
                })

                
                RageUI.Separator("~r~↓ ~s~Apparence du personnage ~r~↓")

                RageUI.Button("→ Changer d'apparance", nil, {RightLabel = "~r~→→"}, true, {
                    onSelected = function()
                        
                        RageUI.CloseAll()
                        Wait(100)
                    ExecuteCommand("skin")
                    ESX.ShowNotification("Vous êtes en train de vous changer")  
                end
                
                })

                RageUI.Button('→ Mettre un ped', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                    end
                }, pedmenubb)

                RageUI.Button("→ Reprendre son personnage", nil, {RightLabel = "~r~→→"}, true, {
                    onSelected = function()
                        
                        Wait(1000)
                    ESX.ShowNotification("Cette option n'est pas encore disponnible.")  
                end
                
                })
            end)
        end
        if (YVELT.SelfPlayer.isStaffEnabled) then
            RageUI.IsVisible(pedmenubb, function()
                RageUI.Separator("~r~↓ ~s~Gestion Personnage ~r~↓")
               
               
               


            end)
        end
       
     




        
        if (YVELT.SelfPlayer.isStaffEnabled) then
            RageUI.IsVisible(vehiculemenu, function()
                RageUI.Separator("~r~↓ ~s~Spawn de véhicule(s) ~r~↓")

                
                RageUI.Button("→ Spawn avec le nom", nil, { RightLabel = "~r~→→" }, true, {
                    
                    onSelected = function()
                            local modelName = KeyboardInput('YVELT_BOX_VEHICLE_NAME', "Veuillez entrer le ~r~nom~s~ du véhicule", '', 50)
                            TriggerEvent('YVELT:spawnVehicle', modelName)
                            TriggerServerEvent("YVELT:SendLogs", "Spawn custom vehicle")
                        
                      
                    end,
                })

                
                

                RageUI.List('→ Spawn Rapide', {
                    { Name = "BMX", Value = 'bmx' },
                    { Name = "Sanchez", Value = 'sanchez' },
                    { Name = "Futo", Value = "futo" },
                }, VehicleIndex, nil, {}, true, {
                    onListChange = function(Index, Item)
                        VehicleIndex = Index;
                    end,
                    onSelected = function(Index, Item)
                        if Item.Value == nil then
                            local modelName = KeyboardInput('YVELT_BOX_VEHICLE_NAME', "Veuillez entrer le ~r~nom~s~ du véhicule", '', 50)
                            TriggerEvent('YVELT:spawnVehicle', modelName)
                            TriggerServerEvent("YVELT:SendLogs", "Spawn custom vehicle")
                        else
                            TriggerEvent('YVELT:spawnVehicle', Item.Value)
                            TriggerServerEvent("YVELT:SendLogs", "Spawn vehicle")
                        end
                    end,
                })

                
                RageUI.Separator("~r~↓ ~s~Gestion véhicule ~r~↓")

                RageUI.Button('→ Réparer le véhicule', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                        local plyVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleFixed(plyVeh)
                        SetVehicleDirtLevel(plyVeh, 0.0)
                        ESX.ShowAdvancedNotification('Administration', '~r~Informations', 'Le ~r~véhicule~s~ a été réparé', 'CHAR_SUNLITE', 2)
                        TriggerServerEvent("YVELT:SendLogs", "Repair Vehicle")
                    end
                })

                RageUI.Button("→ Retourner le véhicule", nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                        admin_vehicle_flip()
                    end
                })

                RageUI.List('→ Supprimer des véhicules (Zone)', {
                    { Name = "~g~1~s~", Value = 1 },
                    { Name = "~g~5~s~", Value = 5 },
                    { Name = "~o~10~s~", Value = 10 },
                    { Name = "~o~15~s~", Value = 15 },
                    { Name = "~r~20~s~", Value = 20 },
                    { Name = "~r~25~s~", Value = 25 },
                }, GroupIndex, nil, {}, true, {
                    onListChange = function(Index, Item)
                        GroupIndex = Index;
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("YVELT:SendLogs", "Delete vehicle zone")
                        ESX.ShowAdvancedNotification('Administration', '~r~Informations', 'La ~r~suppression~s~ a été effectué', 'CHAR_SUNLITE', 2)
                        local playerPed = PlayerPedId()
                        local radius = Item.Value
                        if radius and tonumber(radius) then
                            radius = tonumber(radius) + 0.01
                            local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(playerPed, false), radius)

                            for i = 1, #vehicles, 1 do
                                local attempt = 0

                                while not NetworkHasControlOfEntity(vehicles[i]) and attempt < 100 and DoesEntityExist(vehicles[i]) do
                                    Citizen.Wait(500)
                                    NetworkRequestControlOfEntity(vehicles[i])
                                    attempt = attempt + 1
                                end

                                if DoesEntityExist(vehicles[i]) and NetworkHasControlOfEntity(vehicles[i]) then
                                    ESX.Game.DeleteVehicle(vehicles[i])
                                    DeleteEntity(vehicles[i])
                                end
                            end
                        else
                            local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

                            if IsPedInAnyVehicle(playerPed, true) then
                                vehicle = GetVehiclePedIsIn(playerPed, false)
                            end

                            while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
                                Citizen.Wait(500)
                                NetworkRequestControlOfEntity(vehicle)
                                attempt = attempt + 1
                            end

                            if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
                                ESX.Game.DeleteVehicle(vehicle)
                                DeleteEntity(vehicle)
                            end
                        end
                    end,
                })

                RageUI.Button('→ Changer la plaque', nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                            local plaqueVehicule = KeyboardInput('YVELT_PLAQUE_NAME',"Veuillez entrer le ~r~nom~s~ de la plaque", "", 8)
                            SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false) , plaqueVehicule)
                            ESX.ShowAdvancedNotification('Administration', '~r~Informations', 'Le nom de la plaque est désormais : ~r~' ..plaqueVehicule, 'CHAR_SUNLITE', 2)
                        else
                            ESX.ShowAdvancedNotification('Administration', '~r~Informations', '~r~Erreur :~s~ Vous n\'êtes pas dans un véhicule ~r~', 'CHAR_SUNLITE', 2)
                        end
                    end
                })

                --
                RageUI.Separator("~r~↓ ~s~Apparence du véhicule ~r~↓")

                RageUI.Button("→ Couleurs", nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                end}, customCols) 
        
                RageUI.Button("→ Neon", nil, { RightLabel = "~r~→→" }, true, {
                    onSelected = function()
                end}, customNeon)  

            end)
        end

        RageUI.IsVisible(customCols, function()
            RageUI.Separator("~r~↓~s~ Chrome ~r~↓")
                RageUI.Button("Chromé", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, 120, 120)
                end})
                RageUI.Button("Gold", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, 99, 99)
                end})
                RageUI.Button("Silver", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, 4, 4)
                end})
                RageUI.Button("Bronze", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, 90, 90)
                end})
                RageUI.Separator("~r~↓~s~ Classiques ~r~↓")
                Listing.ColorMetalList = {
                    { Name = "Black Steel", Value1 = 2, Value2 = 2 },
                    { Name = "Dark Steel", Value1 = 3, Value2 = 3 }, 
                    { Name = "Red", Value1 = 27, Value2 = 27 },
                    { Name = "Grace Red", Value1 = 31, Value2 = 31 },
                    { Name = "Sunset Red", Value1 = 33, Value2 = 33 },
                    { Name = "Wine Red", Value1 = 143, Value2 = 143 },
                    { Name = "Hot Pink", Value1 = 135, Value2 = 135 },
                    { Name = "Pfsiter Pink", Value1 = 137, Value2 = 137 },
                    { Name = "Salmon Pink", Value1 = 136, Value2 = 136 },
                    { Name = "Sunrise Orange", Value1 = 36, Value2 = 36 },
                    { Name = "Race Yellow", Value1 = 89, Value2 = 89 },
                    { Name = "Racing Green", Value1 = 50, Value2 = 50 },
                    { Name = "Lime Green", Value1 = 92, Value2 = 92 },
                    { Name = "Midnight Blue", Value1 = 141, Value2 = 141 },
                    { Name = "Galaxy Blue", Value1 = 61, Value2 = 61 },
                    { Name = "Dark Blue", Value1 = 62, Value2 = 62 },
                    { Name = "Diamond Blue", Value1 = 67, Value2 = 67 },
                    { Name = "Surf Blue", Value1 = 68, Value2 = 68 },
                    { Name = "Racing Blue", Value1 = 73, Value2 = 73 },
                    { Name = "Ultra Blue", Value1 = 70, Value2 = 70 },
                    { Name = "Light Blue", Value1 = 74, Value2 = 74 },
                    { Name = "Chocolate Brown", Value1 = 96, Value2 = 96 },
                    { Name = "Bison Brown", Value1 = 101, Value2 = 101 },
                    { Name = "Woodbeech Brown", Value1 = 102, Value2 = 102 },
                    { Name = "Bleached Brown", Value1 = 106, Value2 = 106 },
                    { Name = "Midnight Purple", Value1 = 142, Value2 = 142 },
                    { Name = "Bright Purple", Value1 = 145, Value2 = 145 },
                    { Name = "Cream", Value1 = 107, Value2 = 107 },
                    { Name = "Frost White", Value1 = 112, Value2 = 112 }
                }
                RageUI.List("Classiques", Listing.ColorMetalList, colorMetalList, nil, {}, true, {
                    onListChange = function(list, mls) 
                        colorMetalList = list end,
                    onSelected = function(list, mls)
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, mls.Value1, mls.Value2)
                end})  
                RageUI.Separator("~r~↓~s~ Mates ~r~↓")
                Listing.ColorList = {
                    { Name = "Black", Value1 = 12, Value2 = 12 },
                    { Name = "Gray", Value1 = 13, Value2 = 13 },
                    { Name = "Ice White", Value1 = 131, Value2 = 131 },
                    { Name = "Blue", Value1 = 83, Value2 = 83 },
                    { Name = "Schafter Purple", Value1 = 148, Value2 = 148 },
                    { Name = "Red", Value1 = 39, Value2 = 39 },
                    { Name = "Orange", Value1 = 41, Value2 = 41 },
                    { Name = "Yellow", Value1 = 42, Value2 = 42 },
                    { Name = "Green", Value1 = 128, Value2 = 128 }
                }
                RageUI.List("Mates", Listing.ColorList, colorList, nil, {}, true, {
                    onListChange = function(list, mls) 
                        colorList = list end,
                    onSelected = function(list, mls)
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        SetVehicleColours(vehicle, mls.Value1, mls.Value2)
                end})                              
        end)

        RageUI.IsVisible(customNeon, function()   
            Listing.ColorNeon = {
                { Name = "White", Value1 = 222, Value2 = 222, Value3 = 255 },	
                { Name = "Blue", Value1 = 2, Value2 = 21 , Value3 = 255 },
                { Name = "Electric Blue", Value1 = 3, Value2 = 83, Value3 = 255 },
                { Name = "Mint Green", Value1 = 0, Value2 = 255, Value3 = 140 },
                { Name = "Lime Green", Value1 = 94, Value2 = 255, Value3 = 1 },
                { Name = "Yellow", Value1 = 255, Value2 = 255, Value3 = 0 },
                { Name = "Orange", Value1 = 255, Value2 = 62, Value3 = 0 },
                { Name = "Red", Value1 = 255, Value2 = 1, Value3 = 1 },
                { Name = "Pony Pink", Value1 = 255, Value2 = 50, Value3 = 100 },
                { Name = "Hot Pink", Value1 = 255, Value2 = 5, Value3 = 190 },
                { Name = "Purple", Value1 = 35, Value2 = 1, Value3 = 255 },
                { Name = "Blacklight", Value1 = 15, Value2 = 3, Value3 = 255 }
            }                           
            RageUI.List("Neon", Listing.ColorNeon, colorNeon, nil, {}, true, {
                onListChange = function(list, cols) 
                    colorNeon = list end,
                onSelected = function(list, cols)
                    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    SetVehicleNeonLightEnabled(vehicle, 0, true)
                    SetVehicleNeonLightEnabled(vehicle, 1, true)
                    SetVehicleNeonLightEnabled(vehicle, 2, true)
                    SetVehicleNeonLightEnabled(vehicle, 3, true)
                    SetVehicleNeonLightsColour(vehicle, cols.Value1, cols.Value2, cols.Value3)
            end})  
        RageUI.Button("Supprimez les neons", nil, {}, true, {
            onSelected = function()
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                SetVehicleNeonLightEnabled(vehicle, 0, false)
                SetVehicleNeonLightEnabled(vehicle, 1, false)
                SetVehicleNeonLightEnabled(vehicle, 2, false)
                SetVehicleNeonLightEnabled(vehicle, 3, false)
        end})     
    end)

        if (YVELT.SelfPlayer.isStaffEnabled) then

            
            RageUI.IsVisible(selectedMenu, function()

              --[[  RageUI.Button('→ Spectate Aléatoire', "Regarder un joueur aléatoirement", { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        local number = #YVELT.Players
                        local target = YVELT.Players[math.random(0~number)].source
                        if target == GetPlayerServerId(PlayerId()) then
                            ESX.ShowNotification("Votre ID a été sélectionné mais vous ne pouvez pas vous spec vous même ! Réessayer !")
                        else
                            spectate(target)
                        end
                    end
                }) --]]
                RageUI.Separator("~r~↓ ~s~Informations ~r~↓")
                table.sort(YVELT.Players, function(a,b) return a.source < b.source end)
                if (selectedIndex == 1) then
                    if (#YVELT.Players > 0) then

                        for i, v in pairs(YVELT.Players) do
                            local gamertage = {
                                ["user"] = "Joueurs",
                                ["help"] = "Helpeur",
                                ["mod"] = "Modo",
                                ["admin"] = "Admin",
                                ["superadmin"] = "Fondateur",
                                ["owner"] = "Fondateur",
                                ["_dev"] = "Fondateur !!",
                            }                 
                            
                            RageUI.Button(string.format('[%s] %s [%s]', v.source, v.name, gamertage[v.group]), 'Job : ~r~'..v.jobs..'~s~ | Gourp : ~r~'..v.group..'', {}, true, {
                                onSelected = function()
                                    playerActionMenu:SetSubtitle(string.format('[%s] %s', i, v.name))
                                    YVELT.SelectedPlayer = v;
                                end
                            }, playerActionMenu)
                        end
                    else
                        RageUI.Separator("Aucun joueur en ligne.")
                    end
                end
                if (selectedIndex == 2) then
                    if (#YVELT.PlayersStaff > 0) then
                        for i, v in pairs(YVELT.PlayersStaff) do
                            local colors = {
                                ["_dev"] = '~r~',
                                ["superadmin"] = '~o~',
                                ["admin"] = '~r~',
                                ["modo"] = '~y~',
                            }
                            RageUI.Button(string.format('%s[%s] %s', colors[v.group], v.source, v.name), nil, {}, true, {
                                onSelected = function()
                                    playerActionMenu:SetSubtitle(string.format('[%s] %s', v.source, v.name))
                                    YVELT.SelectedPlayer = v;
                                end
                            }, playerActionMenu)
                        end
                    else
                        RageUI.Separator("Aucun joueur en ligne.")
                    end
                end

                if (selectedIndex == 3) then
                    --idtosanctionbaby

                    for i, v in pairs(YVELT.Players) do
                        if v.source == idtosanctionbaby then
                            
                            RageUI.Separator("~r~↓~s~ INFORMATION ~r~↓")
                            RageUI.Button('ID : ' .. idtosanctionbaby, nil, {}, true, {
                                onSelected = function()
                                end
                            })
        
                            RageUI.Button('Nom : ' .. v.name, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                            RageUI.Button('Jobs : ' .. v.jobs, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                        end
                    end

                    RageUI.Separator("↓ ~s~SANCTION ~r~↓")
                    RageUI.List('Temps de ban', {
                        { Name = "1 Heure", Value = '0.2' },
                        { Name = "12 Heure", Value = '1' },
                        { Name = "1 Semaine", Value = '7' },
                        { Name = "1 Mois", Value = '30' },
                        { Name = "Permanent", Value = '0' },
                    }, GroupIndex, "Pour mettre le temps de ban ! ~g~(Entrée pour valider)\n", {}, true, {
                        onListChange = function(Index, Item)
                            GroupItem = Item;
                            GroupIndex = Index;
                        end,
                    })
                    RageUI.Button('Raison du ban', nil, { RightLabel = '~r~'..raisontosend }, true, {
                        onSelected = function()
                            local Raison = KeyboardInput('YVELT_BOX_BAN_RAISON', "Raison du ban", '', 50)
                            raisontosend = Raison
                        end
                    })

                    RageUI.Button('Valider', nil, { RightLabel = "✅" }, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:Ban", idtosanctionbaby, GroupItem.Value, raisontosend)
                        end
                    })
                end

                if (selectedIndex == 4) then
                    for i, v in pairs(YVELT.Players) do
                        if v.source == idtosanctionbaby then
                            RageUI.Separator("~r~↓~s~ INFORMATION ~r~↓")
                            RageUI.Button('ID : ' .. idtosanctionbaby, nil, {}, true, {
                                onSelected = function()
                                end
                            })
        
                            RageUI.Button('Nom : ' .. v.name, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                            RageUI.Button('Jobs : ' .. v.jobs, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                        end
                    end
                    RageUI.Separator("~r~↓~s~ SANCTION ~r~↓")
                    RageUI.Button('Raison du kick', nil, { RightLabel = '~r~'..raisontosend }, true, {
                        onSelected = function()
                            local Raison = KeyboardInput('YVELT_BOX_BAN_RAISON', "Raison du ban", '', 50)
                            raisontosend = Raison
                        end
                    })

                    RageUI.Button('Valider', nil, { RightLabel = "✅" }, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:kick", idtosanctionbaby, raisontosend)
                        end
                    })
                end
                if (selectedIndex == 6) then
                    for i, v in pairs(YVELT.Players) do
                        if v.source == idtoreport then
                            RageUI.Button('Nom : ~r~' .. v.name, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                            RageUI.Button('ID : ~r~' .. idtoreport, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                            RageUI.Button('Jobs : ~r~' .. v.jobs, nil, {}, true, {
                                onSelected = function()
                                end
                            })
                        end
                    end

                    
                    RageUI.Separator("~r~↓~s~ Téléportations ~r~↓")


                    RageUI.Button('Se Teleporter sur lui', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:teleport", idtoreport)
                        end
                    })
                    RageUI.Button('Le Teleporter sur moi', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:teleportTo", idtoreport)
                        end
                    })
                    RageUI.Button("Le Teleporter au Parking Central", nil, {}, true, {
                        onSelected = function()
                           TriggerServerEvent('YVELT:teleportcoords', idtoreport, vector3(2578.9599609375,900.92572021484,6.0770440101624))
                        end
                    })

                    
                    RageUI.Separator("~r~↓~s~ Utils ~r~↓")

                    RageUI.Button('Le Revive', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:Revive", idtoreport)
                        end
                    })


                    RageUI.Separator("~r~↓~s~ Valider ~r~↓")

                    RageUI.Button('~g~Report Effectué', nil, { }, true, {
                        onSelected = function()
                            TriggerServerEvent("YVELT:ReportRegle", kvdureport)
                            TriggerEvent("YVELT:RefreshReport")
                        end
                    }, reportmenu)
                end
            end)

            RageUI.IsVisible(playerActionMenu, function()
                yo = ""
                if specateactive then
                    yo = "✔"
                end
              
                
                RageUI.Separator("~r~↓ ~s~Rapide ~r~↓")

                RageUI.Button("→ Spectate", nil, { RightLabel = '~r~→→' }, true, { 
                    onSelected = function()
                        spectate(YVELT.SelectedPlayer.source)
                    end 
                })

                RageUI.Button('→ Revive', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        TriggerServerEvent("YVELT:Revive", YVELT.SelectedPlayer.source)
                    end
                })

                RageUI.Button('→ Envoyer un message privé', 'Sert d\'avertisement', { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        local msg = KeyboardInput('YVELT_BOX_BAN_RAISON', "Message Privée", '', 50)
                        
                        if msg ~= nil then
                            msg = tostring(msg)
                    
                            if type(msg) == 'string' then
                                TriggerServerEvent("YVELT:Message", YVELT.SelectedPlayer.source, msg)
                            end
                        end
                        ESX.ShowNotification("Vous venez d'envoyer le message à ~r~" .. GetPlayerName(GetPlayerFromServerId(YVELT.SelectedPlayer.source)))
                    end
                })

                RageUI.Separator("~r~↓ ~s~Téléportation(s) ~r~↓")

                RageUI.Button('→ Vous téléporter sur lui', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        TriggerServerEvent('YVELT:teleport', YVELT.SelectedPlayer.source)
                    end
                })
                RageUI.Button('→ Téléporter vers vous', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        TriggerServerEvent('YVELT:teleportTo', YVELT.SelectedPlayer.source)
                    end
                })

                RageUI.Button('→ Le téléporter au PC', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        TriggerServerEvent('YVELT:teleportcoords', YVELT.SelectedPlayer.source, vector3(2578.9599609375,900.92572021484,6.0770440101624))
                    end
                })


                

                RageUI.Separator("~r~↓ ~s~Sanction(s) ~r~↓")


                RageUI.Button('→ Bannir le joueur', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        selectedMenu:SetSubtitle(string.format('Bannir le joueur'))
                        idtosanctionbaby = YVELT.SelectedPlayer.source
                        selectedIndex = 3;
                    end
                }, selectedMenu)

                RageUI.Button('→ Kick le joueur', nil, { RightLabel = '~r~→→' }, true, {
                    onSelected = function()
                        selectedMenu:SetSubtitle(string.format('Kick le joueur'))
                        idtosanctionbaby = YVELT.SelectedPlayer.source
                        selectedIndex = 4;
                    end
                }, selectedMenu)

          

                RageUI.Button("→ Wipe l'inventaire du Joueur", nil, { RightLabel = '⚠  ~r~→→' }, true, {
                    onSelected = function()
                        ExecuteCommand("clearinventory "..YVELT.SelectedPlayer.source)
                    ESX.ShowAdvancedNotification("Administration", "~r~Informations", "Vous venez de WIPE les items de ~r~".. GetPlayerName(GetPlayerFromServerId(YVELT.SelectedPlayer.source)) .."~s~ !", "CHAR_SUNLITE", 1) 																
                    end
                })

                RageUI.Button("→ Wipe les Armes du Joueur", nil, { RightLabel = '⚠  ~r~→→' }, true, {
                    onSelected = function()
                        ExecuteCommand("clearloadout "..YVELT.SelectedPlayer.source)
                    ESX.ShowAdvancedNotification("Administration", "~r~Informations", "Vous venez de WIPE les armes de ~r~".. GetPlayerName(GetPlayerFromServerId(YVELT.SelectedPlayer.source)) .."~s~ !", "CHAR_SUNLITE", 1) 								
                    end
                })
                  
            end)

            RageUI.IsVisible(reportmenu, function()
                
                RageUI.Separator("~r~↓ ~s~Report(s) en cours ~r~↓")
                RageUI.Separator("")
                for i, v in pairs(YVELT.GetReport) do
                    if i == 0 then
                        return
                    end
                    RageUI.Button("[" .. v.id .. "] " .. v.name , "ID : " .. v.id .. "\n" .. "Name : " .. v.name .. "\nRaison : " .. v.reason, {}, true, {
                        onSelected = function()
                            selectedMenu:SetSubtitle(string.format('Report'))
                            kvdureport = i
                            idtoreport = v.id
                            selectedIndex = 6;
                        end
                    }, selectedMenu)
                end
            end)
        end
        for i, onTick in pairs(YVELT.Menus) do
            onTick();
        end
    end
    Citizen.Wait(500)
end)

local function getEntity(player)
    -- function To Get Entity Player Is Aiming At
    local _, entity = GetEntityPlayerIsFreeAimingAt(player)
    return entity
end

local function aimCheck(player)
    -- function to check config value onAim. If it's off, then
    return IsPedShooting(player)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if (YVELT.SelfPlayer.isStaffEnabled) then
            if (YVELT.SelfPlayer.isDelgunEnabled) then
                if IsPlayerFreeAiming(PlayerId()) then
                    local entity = getEntity(PlayerId())
                    if GetEntityType(entity) == 2 or 3 then
                        if aimCheck(GetPlayerPed(-1)) then
                            SetEntityAsMissionEntity(entity, true, true)
                            DeleteEntity(entity)
                        end
                    end
                end
            end

            --if (YVELT.SelfPlayer.isStaffEnabled) then
                if (YVELT.SelfPlayer.ShowCoords) then
                    plyPed = PlayerPedId()
                    local plyCoords = GetEntityCoords(plyPed, false)
                    Text('~r~X~s~: ' .. ESX.Math.Round(plyCoords.x, 2) .. '\n~o~Y~s~: ' .. ESX.Math.Round(plyCoords.y, 2) .. '\n~g~Z~s~: ' .. ESX.Math.Round(plyCoords.z, 2) .. '\n~r~H~s~: ' .. ESX.Math.Round(GetEntityPhysicsHeading(plyPed), 2))
                end
            --end

            function Text(text)
                SetTextColour(186, 186, 186, 255)
                SetTextFont(0)
                SetTextScale(0.500, 0.500)
                SetTextWrap(0.0, 1.0)
                SetTextCentre(false)
                SetTextDropshadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 205)
                BeginTextCommandDisplayText('STRING')
                AddTextComponentSubstringPlayerName(text)
                EndTextCommandDisplayText(0.175, 0.81)
            end

            if (YVELT.SelfPlayer.isClipping) then
                --HideHudAndRadarThisFrame()

                local camCoords = GetCamCoord(NoClip.Camera)
                local right, forward, _, _ = GetCamMatrix(NoClip.Camera)
                if IsControlPressed(0, 32) then
                    local newCamPos = camCoords + forward * NoClip.Speed
                    SetCamCoord(NoClip.Camera, newCamPos.x, newCamPos.y, newCamPos.z)
                end
                if IsControlPressed(0, 8) then
                    local newCamPos = camCoords + forward * -NoClip.Speed
                    SetCamCoord(NoClip.Camera, newCamPos.x, newCamPos.y, newCamPos.z)
                end
                if IsControlPressed(0, 34) then
                    local newCamPos = camCoords + right * -NoClip.Speed
                    SetCamCoord(NoClip.Camera, newCamPos.x, newCamPos.y, newCamPos.z)
                end
                if IsControlPressed(0, 9) then
                    local newCamPos = camCoords + right * NoClip.Speed
                    SetCamCoord(NoClip.Camera, newCamPos.x, newCamPos.y, newCamPos.z)
                end
                if IsControlPressed(0, 334) then
                    if (NoClip.Speed - 0.1 >= 0.1) then
                        NoClip.Speed = NoClip.Speed - 0.1
                    end
                end
                if IsControlPressed(0, 335) then
                    if (NoClip.Speed + 0.1 >= 0.1) then
                        NoClip.Speed = NoClip.Speed + 0.1
                    end
                end

                SetEntityCoords(YVELT.SelfPlayer.ped, camCoords.x, camCoords.y, camCoords.z)

                local xMagnitude = GetDisabledControlNormal(0, 1)
                local yMagnitude = GetDisabledControlNormal(0, 2)
                local camRot = GetCamRot(NoClip.Camera)
                local x = camRot.x - yMagnitude * 10
                local y = camRot.y
                local z = camRot.z - xMagnitude * 10
                if x < -75.0 then
                    x = -75.0
                end
                if x > 100.0 then
                    x = 100.0
                end
                SetCamRot(NoClip.Camera, x, y, z)
            end

            if (YVELT.SelfPlayer.isGamerTagEnabled) then
                for i, v in pairs(YVELT.GamerTags) do
                    local target = GetEntityCoords(v.ped, false);

                    if #(target - GetEntityCoords(PlayerPedId())) < 120 then
                        SetMpGamerTagVisibility(v.tags, 0, true)
                        SetMpGamerTagVisibility(v.tags, 2, true)

                        SetMpGamerTagVisibility(v.tags, 4, NetworkIsPlayerTalking(v.player))
                        SetMpGamerTagAlpha(v.tags, 2, 255)
                        SetMpGamerTagAlpha(v.tags, 4, 255)

                        local colors = {
                            ["_dev"] = 50,
                            ["superadmin"] = 25,
                            ["owner"] = 25,
                            ["admin"] = 8,
                            ["mod"] = 40,
                            ["help"] = 21,
                        }
                        SetMpGamerTagColour(v.tags, 0, colors[v.group] or 0)
                    else
                        RemoveMpGamerTag(v.tags)
                        YVELT.GamerTags[i] = nil;
                    end
                end


            end

        end
    end
end)

Citizen.CreateThread(function()
    while true do
        YVELT.SelfPlayer.ped = GetPlayerPed(-1);
        if (YVELT.SelfPlayer.isStaffEnabled) then
            if (YVELT.SelfPlayer.isGamerTagEnabled) then
                YVELT.Helper:OnRequestGamerTags();
            end
        end
        Citizen.Wait(1000)
    end
end)


RegisterNetEvent('YVELT:teleport')
AddEventHandler('YVELT:teleport', function(coords)
    if (YVELT.SelfPlayer.isClipping) then
        SetCamCoord(NoClip.Camera, coords.x, coords.y, coords.z)
        SetEntityCoords(YVELT.SelfPlayer.ped, coords.x, coords.y, coords.z)
    else
        ESX.Game.Teleport(PlayerPedId(), coords)
    end
end)

RegisterNetEvent('YVELT:spawnVehicle')
AddEventHandler('YVELT:spawnVehicle', function(model)
    if (YVELT.SelfPlayer.isStaffEnabled) then
        model = (type(model) == 'number' and model or GetHashKey(model))

        if IsModelInCdimage(model) then
            local playerPed = PlayerPedId()
            local plyCoords = GetEntityCoords(playerPed)

            ESX.Game.SpawnVehicle(model, plyCoords, 90.0, function(vehicle)
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            end)
        else
            ESX.ShowNotification('Modèle de véhicule invalide.', 5000)
        end
    end
end)

local disPlayerNames = 5
local playerDistances = {}

local function DrawText3D(x, y, z, text, r, g, b)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0 * scale, 0.55 * scale)
        else
            SetTextScale(0.0 * scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

Citizen.CreateThread(function()
    Wait(500)
    while true do
        if (YVELT.SelfPlayer.isGamerTagEnabled) then
            for _, id in ipairs(GetActivePlayers()) do
                local serverId = GetPlayerServerId(id)
                local CCS = {
                    ["_dev"] = "~u~",
                    ["owner"] = "~r~",
                    ["superadmin"] = "~r~",
                    ["admin"] = "~q~",
                    ["modo"] = "~r~",
                    ["help"] = "~g~",
                    ["user"] = "",
                }

                local formatted = nil;
                if group == '_dev' then
                    formatted = string.format('~h~~u~[Fondateur] ~w~%s~w~', GetPlayerName(id))
                end
                if playerDistances[id] then
                    if (playerDistances[id] < disPlayerNames) then
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                        if NetworkIsPlayerTalking(id) then
                        else
                        end
                    elseif (playerDistances[id] < 25) then
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                        if NetworkIsPlayerTalking(id) then
                        end
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
	while true do
		Wait(1)
		if blips then
			for _, player in pairs(GetActivePlayers()) do
				local found = false
				if player ~= PlayerId() then
					local ped = GetPlayerPed(player)
					local blip = GetBlipFromEntity( ped )
					if not DoesBlipExist( blip ) then
						blip = AddBlipForEntity(ped)
						SetBlipCategory(blip, 7)
						SetBlipScale( blip,  0.85 )
						ShowHeadingIndicatorOnBlip(blip, true)
						SetBlipSprite(blip, 1)
						SetBlipColour(blip, 0)
					end
					
					SetBlipNameToPlayerName(blip, player)
					
					local veh = GetVehiclePedIsIn(ped, false)
					local blipSprite = GetBlipSprite(blip)
					
					if IsEntityDead(ped) then
						if blipSprite ~= 303 then
							SetBlipSprite( blip, 303 )
							SetBlipColour(blip, 1)
							ShowHeadingIndicatorOnBlip( blip, false )
						end
					elseif veh ~= nil then
						if IsPedInAnyBoat( ped ) then
							if blipSprite ~= 427 then
								SetBlipSprite( blip, 427 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						elseif IsPedInAnyHeli( ped ) then
							if blipSprite ~= 43 then
								SetBlipSprite( blip, 43 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						elseif IsPedInAnyPlane( ped ) then
							if blipSprite ~= 423 then
								SetBlipSprite( blip, 423 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						elseif IsPedInAnyPoliceVehicle( ped ) then
							if blipSprite ~= 137 then
								SetBlipSprite( blip, 137 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						elseif IsPedInAnySub( ped ) then
							if blipSprite ~= 308 then
								SetBlipSprite( blip, 308 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						elseif IsPedInAnyVehicle( ped ) then
							if blipSprite ~= 225 then
								SetBlipSprite( blip, 225 )
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, false )
							end
						else
							if blipSprite ~= 1 then
								SetBlipSprite(blip, 1)
								SetBlipColour(blip, 0)
								ShowHeadingIndicatorOnBlip( blip, true )
							end
						end
					else
						if blipSprite ~= 1 then
							SetBlipSprite( blip, 1 )
							SetBlipColour(blip, 0)
							ShowHeadingIndicatorOnBlip( blip, true )
						end
					end
					if veh then
						SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) )
					else
						SetBlipRotation( blip, math.ceil( GetEntityHeading( ped ) ) )
					end
				end
			end
		else
			for _, player in pairs(GetActivePlayers()) do
				local blip = GetBlipFromEntity( GetPlayerPed(player) )
				if blip ~= nil then
					RemoveBlip(blip)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        if (YVELT.SelfPlayer.isGamerTagEnabled) then
            for _, id in ipairs(GetActivePlayers()) do

                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(#(vector3(x1, y1, z1) - vector3(x2, y2, z2)))
                playerDistances[id] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)

function refreshFouilleStaff(thePlayer)
	ESX.TriggerServerCallback('staff:getOtherPlayerData', function(data)
		fouilleElements = {}

		for i = 1, #data.accounts, 1 do
			if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
				table.insert(fouilleElements, {
					label = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value = 'dirtycash',
					itemType = 'item_account',
					amount = data.accounts[i].money
				})

				break
			end
		end

		table.insert(fouilleElements, {
			label = _U('inventory_label'),
			value = nil
		})

		for i = 1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(fouilleElements, {
					label = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value = data.inventory[i].name,
					itemType = 'item_standard',
					amount = data.inventory[i].count
				})
			end
		end

		table.insert(fouilleElements, {
			label = _U('guns_label'),
			value = nil
		})

		for i = 1, #data.weapons, 1 do
			table.insert(fouilleElements, {
				label = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value = data.weapons[i].name,
				itemType = 'item_weapon',
				amount = data.weapons[i].ammo
			})
		end
	end, GetPlayerServerId(thePlayer))
end