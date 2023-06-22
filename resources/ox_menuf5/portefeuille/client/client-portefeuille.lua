RegisterNetEvent('montrer:identity')
AddEventHandler('montrer:identity', function()
    lib.progressBar({
        duration = 1000,
        label = 'Entrain de montrer votre identité',
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'paper_1_rcm_alt1-8',
            clip = 'player_one_dual-8'
        },
    })
   TriggerEvent('jsfour-idcard:openuseid', GetPlayerServerId(NetworkGetPlayerIndexFromPed()))
end)

RegisterNetEvent('montrer:drive')
AddEventHandler('montrer:drive', function()
    lib.progressBar({
        duration = 1000,
        label = 'Entrain de montrer votre permis',
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'paper_1_rcm_alt1-8',
            clip = 'player_one_dual-8'
        },
    })
    TriggerEvent('jsfour-idcard:openusedriver', GetPlayerServerId(NetworkGetPlayerIndexFromPed()))
end)

RegisterNetEvent('montrer:ppa')
AddEventHandler('montrer:ppa', function()
    lib.progressBar({
        duration = 1000,
        label = 'Entrain de montrer votre permis de arme',
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'paper_1_rcm_alt1-8',
            clip = 'player_one_dual-8'
        },
    })
    TriggerEvent('jsfour-idcard:openuseweapon', GetPlayerServerId(NetworkGetPlayerIndexFromPed()))
end)