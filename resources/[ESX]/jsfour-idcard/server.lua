local ESX = nil
-- ESX
ESX = exports["es_extended"]:getSharedObject()

-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local show       = false

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						end
					end
				else
					show = true
				end

				if show then
					local array = {
						user = user,
						licenses = licenses
					}
					TriggerClientEvent('jsfour-idcard:open', _source, array, type)
				else
					TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ce type de licence...")
				end
			end)
		end
	end)
end)

ESX.RegisterUsableItem('carteidentite', function(source)
   local _source = source
   local xPlayer = ESX.GetPlayerFromId(_source)
   
   TriggerClientEvent('montrer:identity', source)
end)

ESX.RegisterUsableItem('drive', function(source)
   local _source = source
   local xPlayer = ESX.GetPlayerFromId(_source)

   TriggerClientEvent('montrer:drive', source)
end)

ESX.RegisterUsableItem('ppa', function(source)
   local _source = source
   local xPlayer = ESX.GetPlayerFromId(_source)

   TriggerClientEvent('montrer:ppa', source)
end)
