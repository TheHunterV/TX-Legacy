local open = false
ESX = exports["es_extended"]:getSharedObject()


-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

RegisterNetEvent('montrer:identity')
AddEventHandler('montrer:identity', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))                                
    else
        TriggerEvent("Notify","Warning","Impossible","Il y a personne a proximité", 2400)
    end
end)

RegisterNetEvent('montrer:drive')
AddEventHandler('montrer:drive', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')                                
    else
       TriggerEvent("Notify","Warning","Impossible","Il y a personne a proximité", 2400)
    end
end)

print('By KBA - Txpac')

RegisterNetEvent('montrer:ppa')
AddEventHandler('montrer:ppa', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')                                
    else
       TriggerEvent("Notify","Warning","Impossible","Il y a personne a proximité", 2400)
    end
end)
