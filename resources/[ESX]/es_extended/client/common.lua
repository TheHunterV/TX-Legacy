exports('getSharedObject', function()
   return ESX
end)

if GetResourceState('ox_intentory') ~= "missing" then
	Config.OxInventory = true
end

AddEventHandler("esx:getSharedObject", function(cb)
   cb(ESX)
end)