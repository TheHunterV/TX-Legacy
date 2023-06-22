local ox_inventory = exports.ox_inventory

RegisterServerEvent('remove:clothes')
AddEventHandler('remove:clothes', function(skin1, skin2, type, metadata)
	local theType = type
	local _source = source
	ox_inventory:RemoveItem(_source, theType, 1, metadata)
end)

RegisterServerEvent('add:clothes')
AddEventHandler('add:clothes', function(skin1, skin2, type, gender)
	local _source = source
	local theType = type
	local metadata = {gender = gender,accessories = skin1, accessories2 = skin2, description = '[Gender: '..gender..'] ['..theType..' 1 #'..skin1..'] - ['..theType..' 2 #'..skin2..']'}
	local HasItem = ox_inventory:Search(_source, 'slots', theType)
	if json.encode(HasItem) == '[]' then
		ox_inventory:AddItem(_source, theType, 1, metadata)
	else
		if CheckCurrentShits(gender, skin1, skin2, theType) then
			ox_inventory:AddItem(_source, theType, 1, metadata)
		end
	end
end)

RegisterServerEvent('add:clothestorso')
AddEventHandler('add:clothestorso', function(skin1, skin2, skin3, skin4, skin5, skin6, Txpac, gender)
	local _source = source
	local clothes1 = Txpac
	local clothes2 = 'arms'
	local clothes3 = 'tshirt'
	local metadata = {gender = gender,torso1 = skin1, torso2 = skin2, arms1 = skin3, arms2 = skin4, tshirt1 = skin5, tshirt2 = skin6, description = '[Gender: '..gender..'] ['..clothes1..' 1 #'..skin1..'] [torso 2 #'..skin2..'] ['..clothes2..' 1 #'..skin3..'] [arms 2 #'..skin4..'] ['..clothes3..' 1 #'..skin5..'] [tshirt 2 #'..skin6..']' }
	local HasItem = ox_inventory:Search(_source, 'slots', 'torso')
	if json.encode(HasItem) == '[]' then
		ox_inventory:AddItem(_source, 'torso', 1, metadata)
	else
		if CheckCurrentClothes(gender, skin1, skin2, skin3, skin4, skin5, skin6) then
			ox_inventory:AddItem(_source, 'torso', 1, metadata)
		end
	end
end)

function CheckCurrentClothes(gender, skin1, skin2, skin3, skin4, skin5, skin6)
	local HasItem = ox_inventory:Search(source, 'slots', 'torso')
	local hasClothes = true
	for k,v in pairs(HasItem) do
		if v.metadata.gender == gender and v.metadata.torso1 == skin1 and v.metadata.torso2 == skin2 and v.metadata.arms1 == skin3 and v.metadata.arms2 == skin4 and v.metadata.tshirt1 == skin5 and v.metadata.tshirt2 == skin6 then
			hasClothes = false
			TriggerClientEvent('esx:showNotification', source, 'You already have this item, check your inventory!')
		else
			hasClothes = true
		end
	end	
	return hasClothes
end

function CheckCurrentShits(gender, skin1, skin2, theType)
	local _source = source
	local HasItem = ox_inventory:Search(_source, 'slots', theType)
	local hasValid = true
	for k,v in pairs(HasItem) do
		if v.metadata.gender == gender and v.metadata.accessories == skin1 and v.metadata.accessories2 == skin2 then
			hasValid = false
			TriggerClientEvent('esx:showNotification', source, 'You already have this item, check your inventory!')
		else
			hasValid = true
		end
	end	
	return hasValid
end

