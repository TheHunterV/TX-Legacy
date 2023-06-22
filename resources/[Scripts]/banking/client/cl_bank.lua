ESX = exports['es_extended']:getSharedObject()
inMenu			= true
local blur = "MenuMGIn"

function IsNearATM()
	local objects = {}
	for _,v in pairs(Config.Banque.Atm) do
		table.insert(objects, v.prop)
	end
	
	local ped = GetPlayerPed(-1)
	local list = {}
	
	for _,v in pairs(objects) do
		local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 5.0, GetHashKey(v), false, true ,true)
		local dist = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(obj), true)
		table.insert(list, {object = obj, distance = dist})
		end
	
		local closest = list[1]
		for _,v in pairs(list) do
		if v.distance < closest.distance then
			closest = v
		end
		end
	
		local distance = closest.distance
		local object = closest.object
		

		if distance < 1.8 then
		return true
		end
end

RegisterNetEvent('atm:utiliser')
AddEventHandler('atm:utiliser', function(id)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        RequestAnimDict('anim@amb@prop_human_atm@interior@male@enter')
        if IsNearATM() then
            TaskPlayAnim(PlayerPedId(), "anim@amb@prop_human_atm@interior@male@enter","enter",8.0, 8.0, -1, 0, 0, 0, 0, 0)
            Wait(2000)
            ClearPedTasksImmediately(PlayerPedId())
       --     ExecuteCommand('hidezhud')
            StartScreenEffect(blur, 1, true)
            inMenu = true
            SetNuiFocus(true, true)
            SendNUIMessage({type = 'openGeneral'})
            TriggerServerEvent('bank:balance')
            TriggerServerEvent('cash:balance2')
        else
            ESX.ShowNotification("~r~Vous devez être devant un ATM.")
        end
	end
end)

RegisterNetEvent('bank:utiliser')
AddEventHandler('bank:utiliser', function(id)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        RequestAnimDict('anim@amb@prop_human_atm@interior@male@enter')
            TaskPlayAnim(PlayerPedId(), "anim@amb@prop_human_atm@interior@male@enter","enter",8.0, 8.0, -1, 0, 0, 0, 0, 0)
            Wait(2000)
            ClearPedTasksImmediately(PlayerPedId())
            StartScreenEffect(blur, 1, true)
            inMenu = true
            SetNuiFocus(true, true)
            SendNUIMessage({type = 'openGeneral'})
            TriggerServerEvent('bank:balance')
            TriggerServerEvent('cash:balance2')
        end
--	end
end)

Citizen.CreateThread(function()
    for _, info in pairs(Config.Banque.blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, info.scale)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)

RegisterNetEvent('currentbalance2')
AddEventHandler('currentbalance2', function(balance2)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	
	SendNUIMessage({
		type = "balanceHUD",
		balance2 = balance2,
		player = playerName
		})
end)

RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
    TriggerServerEvent('cash:balance2')
    
end)

RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
    TriggerServerEvent('cash:balance2')
end)

RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
    TriggerServerEvent('cash:balance2')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)

RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
    TriggerServerEvent('cash:balance2')
end)

RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	StopScreenEffect(blur)
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)

local atminteract = {
  {
    name = 'usecard',
    icon = 'fa-solid fa-money-check',
    label = 'Insérer votre carte',
    canInteract = function(entity, distance, coords, name, bone)
        return true
    end,
    onSelect = function()
        ESX.TriggerServerCallback('cartebancaireusetarget', function(Carte)
          if Carte == true then
            TriggerEvent("atm:utiliser")
          else 
            ESX.ShowNotification("~r~Vous n'avez pas de Carte Bancaire")
          end
      end)
    end,
},
}

local banque = {
	{
		name = 'usecard',
		icon = 'fa-solid fa-money-check',
		label = 'Ouvrir votre banque',
		canInteract = function(entity, distance, coords, name, bone)
			return true
		end,
		onSelect = function()
			ESX.TriggerServerCallback('cartebancaireusetarget', function(Carte)
			  if Carte == true then
				TriggerEvent("bank:utiliser")
			  else 
				ESX.ShowNotification("~r~Vous n'avez pas de Carte Bancaire")
			  end
		  end)
		end,
	}
}


local ped = {
	"ig_paper"
}

local models = { `prop_atm_01`, `prop_atm_02`,'prop_atm_03',`prop_fleeca_atm` } 

exports.ox_target:addModel(models, atminteract)
exports.ox_target:addModel(ped, banque)
