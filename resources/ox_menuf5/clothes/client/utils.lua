Txpac = {}

function Txpac.PlayAnim(dict, anim, wait)
    Txpac.LoadAnimDict(dict)
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Citizen.Wait(wait)
    ClearPedSecondaryTask(PlayerPedId()) 
end

function Txpac.LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end