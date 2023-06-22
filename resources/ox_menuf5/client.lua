ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

lib.registerContext({
    id = 'menuf5',
    title = 'VETEMENTS',
    options = {
        -- {
        --     title = '🎒 Portefeuille',
        --     arrow = true,
        --     icon = 'bars',
        --     menu = 'portefeuille',   
        -- },
        {
            title = '👕 Menu Vetements',
            arrow = true,
            icon = 'bars',
            menu = 'vetements',   
        },
    }
})

lib.registerContext({
    id = 'vetements',
    title = 'Vetements',
    options = {
        {
            title = '👕Torse',
            description = 'Retirez votre chemise',
            event = 'remove:torso',
        },
        {
            title = '👖Pantalon',
            description = 'Retirez votre pantalon',
            event = 'remove:pants',
        },
        {
            title = '👞Chaussures',
            description = 'Retirez vos chaussures',
            event = 'remove:shoes',
        },
        {
            title = '😷Masque',
            description = 'Retirez votre masque',
            event = 'remove:mask',
        },
        {
            title = '🧢Chapeau',
            description = 'Retirez votre chapeau',
            event = 'remove:hat',
        },
        {
            title = '💼Sac',
            description = 'Retirez votre sac',
            event = 'remove:bag',
        },
        {
            title = '👓Lunettes',
            description = 'Retirez vos lunettes',
            event = 'remove:glasses',
        },
        {
            title = '🦺Gillet',
            description = 'Retirez votre gilet',
            event = 'remove:vest',
        },
        {
            title = '👂Boucle d\'oreilles',
            description = 'Retirez vos boucles d\'oreilles',
            event = 'remove:ears',
        },
        {
            title = '⛓️Chaine',
            description = 'Retirez votre chaîne',
            event = 'remove:chain',
        },
        {
            title = 'Retour',
            menu = 'menuf5',
        },
        
    }
})


-- lib.registerContext({
--     id = 'portefeuille',
--     title = 'Porte Feuille',
--     options = {
--         {
--             title = '📎 Carte identité',
--             event = 'montrer:identity'
--         },
--         {
--             title = '📎 Permis Conduire',
--             event = 'montrer:drive'
--         },
--         {
--             title = '📎 Permis Arme',
--             event = 'montrer:ppa'
--         },
--         {
--             title = 'Go Back',
--             menu = 'menuf5',
--         },
--     }
-- })

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 166) then -- para baguhin ang menu key https://docs.fivem.net/docs/game-references/controls/ pour changer la touche, to change the key
        lib.showContext('menuf5')
      end
    end
  end)
  