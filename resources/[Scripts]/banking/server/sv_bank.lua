ESX = exports['es_extended']:getSharedObject()
RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('esx:showNotification', source, ('~r~Montant invalide.'))
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('esx:showNotification', source, ("~s~Vous avez déposé un montant de ~b~"..tonumber(amount).."$."))
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('esx:showNotification', source, ('~r~Montant invalide.'))
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('esx:showNotification', source, ("~s~Vous avez retiré un montant de ~b~"..tonumber(amount).."$."))
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
end)

RegisterServerEvent('cash:balance2')
AddEventHandler('cash:balance2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('money').money
	TriggerClientEvent('currentbalance2', _source, balance)
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0

	if(zPlayer == nil or zPlayer == -1) then
		TriggerClientEvent('esx:showNotification', source, ('~r~Destinataire introuvable'))
	else
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('esx:showNotification', source, ('~r~Vous ne pouvez pas faire de transfert à vous même.'))
			TriggerClientEvent('bank:result', _source, "error", "")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('esx:showNotification', source, ("~r~Vous n'avez pas assez d'argent en banque."))
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				TriggerClientEvent('esx:showNotification', source, ("~s~Vous avez transféré un montant de ~g~"..tonumber(amount).."$."))
			end
		end
	end
end)

ESX.RegisterUsableItem('cartebancaire', function(source)
    TriggerClientEvent('atm:utiliser', source) 
    Citizen.Wait(5000000000) 
 end)   

 ESX.RegisterServerCallback('cartebancaireusetarget', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("cartebancaire").count >= 1 then
		cb(true)
    else
        cb(false)
	end
end)