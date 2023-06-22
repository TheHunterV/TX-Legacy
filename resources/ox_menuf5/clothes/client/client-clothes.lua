local IsAnim = false
local ox_inventory = exports.ox_inventory


exports('chain', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'chain'
    local theGender = data.metadata.gender
    local chain1 = data.metadata.accessories
    local chain2 = data.metadata.accessories2
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 7) == Config.Male.Chain and not IsAnim  then
                LocalPlayer.state.invBusy = true
                IsAnim = true
                chainonoff2()
                SetPedComponentVariation(ped, 7, chain1, chain2, 0)
                TriggerServerEvent('remove:clothes', chain1, chain2, theType, gender)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 7) == Config.Female.Chain and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                chainonoff2()
                SetPedComponentVariation(ped, 7, chain1, chain2, 0)
                TriggerServerEvent('remove:clothes', chain1, chain2, theType)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('helmet', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'helmet'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local helmet1 = data.metadata.accessories
    local helmet2 = data.metadata.accessories2
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if theGender == gender then
            if GetPedPropIndex(ped,0) == Config.Male.Hat and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                hatofon2()
                SetPedPropIndex(ped, 0, helmet1, helmet2, true)
                TriggerServerEvent('remove:clothes', helmet1, helmet2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
        
    elseif gender == 'Female' then
        if theGender == gender then 
            if GetPedPropIndex(ped, 0) == Config.Female.Hat and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                hatofon2()
                SetPedPropIndex(ped, 0, helmet1, helmet2, true)
                TriggerServerEvent('remove:clothes', helmet1, helmet2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)


exports('torso', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'torso'
    local theGender = data.metadata.gender
    local torso1 = data.metadata.torso1
    local torso2 = data.metadata.torso2
    local arms1 = data.metadata.arms1
    local arms2 = data.metadata.arms2
    local tshirt1 = data.metadata.tshirt1
    local tshirt2 = data.metadata.tshirt2
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 11) == Config.Male.Torso and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true 
                torsoonoff2()
                SetPedComponentVariation(ped, 11, torso1, torso2, 3) -- Torso 1
                SetPedComponentVariation(ped, 3, arms1, arms2, 0) -- Arms 1
                SetPedComponentVariation(ped, 8, tshirt1, tshirt2, 2) -- Tshirt 1
                TriggerServerEvent('remove:clothes', torso1, torso2, theType, data.metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 11) == Config.Female.Torso and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                torsoonoff2()
                SetPedComponentVariation(ped, 11, torso1, torso2, 3) -- Torso 1
                SetPedComponentVariation(ped, 3, arms1, arms2, 0) -- Arms 1
                SetPedComponentVariation(ped, 8, tshirt1, tshirt2, 2) -- Tshirt 1
                TriggerServerEvent('remove:clothes', torso1, torso2, theType, data.metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('pants', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'pants'
    local metadata = data.metadata
    local theGender = data.metadata.gender
    local pants1 = data.metadata.accessories
    local pants2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 4) == Config.Male.Pants and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                pantsonoff2()
                SetPedComponentVariation(ped, 4, pants1, pants2, 0)  
                TriggerServerEvent('remove:clothes', pants1, pants2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
        
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 4) == Config.Female.Pants and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                pantsonoff2()
                SetPedComponentVariation(ped, 4, pants1, pants2, 0)  
                TriggerServerEvent('remove:clothes', pants1, pants2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('shoes', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'shoes'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local shoes1 = data.metadata.accessories
    local shoes2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 6) == Config.Male.Shoes and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                shoesonoff2()
                SetPedComponentVariation(ped, 6, shoes1, shoes2, 2)  
                TriggerServerEvent('remove:clothes', shoes1, shoes2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
        
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 6) == Config.Female.Shoes and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                shoesonoff2()
                SetPedComponentVariation(ped, 6, shoes1, shoes2, 2)  
                TriggerServerEvent('remove:clothes', shoes1, shoes2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('bag', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'bag'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local bag1 = data.metadata.accessories
    local bag2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 5) == Config.Male.Bag and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                bagonoff2()
                SetPedComponentVariation(ped, 5, bag1, bag2, 2)  
                TriggerServerEvent('remove:clothes', bag1, bag2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end

        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then 
            if GetPedDrawableVariation(ped, 5) == Config.Female.Bag and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                bagonoff2()
                SetPedComponentVariation(ped, 5, bag1, bag2, 2)  
                TriggerServerEvent('remove:clothes', bag1, bag2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('mask', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'mask'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local mask1 = data.metadata.accessories
    local mask2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 1) == Config.Male.Mask and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                maskonoff2()
                SetPedComponentVariation(ped, 1, mask1, mask2, 3) 
                TriggerServerEvent('remove:clothes', mask1, mask2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
        
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 1) == Config.Female.Mask and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                maskonoff2()
                SetPedComponentVariation(ped, 1, mask1, mask2, 3) 
                TriggerServerEvent('remove:clothes', mask1, mask2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('ears', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'ears'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local ears1 = data.metadata.accessories
    local ears2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedPropIndex(ped, 2) == Config.Male.Ears and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                earsonoff2()
                SetPedPropIndex(ped, 2, ears1, ears2, true)
                TriggerServerEvent('remove:clothes', ears1, ears2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedPropIndex(ped, 2) == Config.Female.Ears and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                earsonoff2()
                SetPedPropIndex(ped, 2, ears1, ears2, true)
                TriggerServerEvent('remove:clothes', ears1, ears2, theType, metadata)
                LocalPlayer.state.invBusy = false
                IsAnim = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('glasses', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'glasses'
    local theGender = data.metadata.gender
    local metadata = data.metadata
    local glasses1 = data.metadata.accessories
    local glasses2 = data.metadata.accessories2
    local Drawable = GetPedPropIndex(ped, 1)
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if Drawable == Config.Male.Glasses and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                glassesonoff2()
                SetPedPropIndex(ped, 1, glasses1, glasses2, true)
                TriggerServerEvent('remove:clothes',  glasses1, glasses2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then
            if Drawable == Config.Female.Glasses and not IsAnim  then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                glassesonoff2()
                SetPedPropIndex(ped, 1, glasses1, glasses2, true)
                TriggerServerEvent('remove:clothes',  glasses1, glasses2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

exports('vest', function(slot, data)
    local ped = PlayerPedId()
    local theType = 'vest'
    local metadata = data.metadata
    local theGender = data.metadata.gender
    local vest1 = data.metadata.accessories
    local vest2 = data.metadata.accessories2
    local gender = IsMpPed(ped)
    if gender == 'Male' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 9) == Config.Male.Vest and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                vestonoff2()
                SetPedComponentVariation(ped, 9, vest1, vest2, 0) 
                TriggerServerEvent('remove:clothes', vest1, vest2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
          ESX.ShowNotification('Vous n\'êtes pas une femme.')
        end
    elseif gender == 'Female' then
        if theGender == gender then
            if GetPedDrawableVariation(ped, 9) == Config.Female.Vest and not IsAnim then
                IsAnim = true
                LocalPlayer.state.invBusy = true
                vestonoff2()
                SetPedComponentVariation(ped, 9, vest1, vest2, 0) 
                TriggerServerEvent('remove:clothes', vest1, vest2, theType, metadata)
                IsAnim = false
                LocalPlayer.state.invBusy = false
            else
                ESX.ShowNotification('Vous avez déjà un vêtement identique ou similaire !')
            end
        else
            ESX.ShowNotification('Vous n\'êtes pas un homme.')
        end
    end
end)

RegisterNetEvent('remove:torso')
AddEventHandler('remove:torso', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'torso'
    local DrawableTorso = GetPedDrawableVariation(ped, 11) -- Torso 1
    local TextureTorso = GetPedTextureVariation(ped, 11) -- Torso 2
    local DrawableGloves = GetPedDrawableVariation(ped, 3) -- Arms 1
    local TextureGloves = GetPedTextureVariation(ped, 3) -- Arms 2
    local DrawableTshirt = GetPedDrawableVariation(ped, 8) -- Tshirt 1
    local TextureTshirt = GetPedTextureVariation(ped, 8) -- Tshirt 2
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if DrawableTorso ~= Config.Male.Torso and not IsAnim then
            IsAnim = true
            torsoonoff()
            SetPedComponentVariation(ped, 11, Config.Male.Torso, 0, 0)
            SetPedComponentVariation(ped, 8,  Config.Male.Shirt, 0, 0)
            if DrawableGloves ~= Config.Male.Gloves then
                SetPedComponentVariation(ped, 3, Config.Male.Gloves, 0, 0)
                ESX.ShowNotification("Vous avez enlevé votre chemise !")
            end
            TriggerServerEvent('add:clothestorso', DrawableTorso, TextureTorso, DrawableGloves, TextureGloves, DrawableTshirt, TextureTshirt, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification("Vous avez enlevé votre chemise !")
        end
    elseif gender == 'Female' then
        if DrawableTorso ~= Config.Female.Torso and not IsAnim then
            IsAnim = true
            torsoonoff()
            SetPedComponentVariation(ped, 11, Config.Female.Torso, 0, 0)
            SetPedComponentVariation(ped, 8,  Config.Female.Shirt, 0, 0)
            ESX.ShowNotification("Vous avez enlevé votre chemise !")
            if DrawableGloves ~= Config.Female.Gloves then
                SetPedComponentVariation(ped, 3, Config.Female.Gloves, 0, 0)
            end
            TriggerServerEvent('add:clothestorso', DrawableTorso, TextureTorso, DrawableGloves, TextureGloves, DrawableTshirt, TextureTshirt, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification("Vous avez enlevé votre chemise !")
        end
    end
end, false) 

RegisterNetEvent('remove:pants')
AddEventHandler('remove:pants', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'pants'
    local Drawable = GetPedDrawableVariation(ped, 4)
    local Texture = GetPedTextureVariation(ped, 4)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Pants and not IsAnim then
            IsAnim = true
            pantsonoff()
            SetPedComponentVariation(ped, 4, Config.Male.Pants, 1, 2)
            ESX.ShowNotification("Vous avez enlevé votre pantalon !")
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            IsAnim = false
            ESX.ShowNotification("Vous avez déjà enlevé votre pantalon !")
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Pants and not IsAnim then
            IsAnim = true
            pantsonoff()
            SetPedComponentVariation(ped, 4, Config.Female.Pants, 1, 2)
            ESX.ShowNotification("Vous avez enlevé votre pantalon !")
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            IsAnim = false
            ESX.ShowNotification("Vous avez déjà enlevé votre pantalon !")
        end
    end
    
end, false) 

RegisterNetEvent('remove:shoes')
AddEventHandler('remove:shoes', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'shoes'
    local Drawable = GetPedDrawableVariation(ped, 6)
    local Texture = GetPedTextureVariation(ped, 6)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Shoes and not IsAnim then
            IsAnim = true
            shoesonoff()
            SetPedComponentVariation(ped, 6, Config.Male.Shoes, 0, 2)
            ESX.ShowNotification('Vous avez enlevé vos chaussures!')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            IsAnim = false
            ESX.ShowNotification("Vous avez déjà enlevé vos chaussures !")
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Shoes and not IsAnim then
            IsAnim = true
            shoesonoff()
            SetPedComponentVariation(ped, 6, Config.Female.Shoes, 0, 2)
            ESX.ShowNotification('Vous avez enlevé vos chaussures')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            IsAnim = false
            ESX.ShowNotification("Vous avez déjà enlevé vos chaussures !")
        end
    end
end, false) 

RegisterNetEvent('remove:mask')
AddEventHandler('remove:mask', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'mask'
    local Drawable = GetPedDrawableVariation(ped, 1)
    local Texture = GetPedTextureVariation(ped, 1)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Mask and not IsAnim then
            IsAnim = true
            maskonoff()
            SetPedComponentVariation(ped, 1, Config.Male.Mask, 0, 2)
            ESX.ShowNotification('Vous avez enlevé votre masque')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            IsAnim = false
            ESX.ShowNotification('Tu n\'as pas de masque')
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Mask and not IsAnim then
            IsAnim = true
            maskonoff()
            SetPedComponentVariation(ped, 1, Config.Female.Mask, 0, 2)
            ESX.ShowNotification('Vous avez enlevé votre masque')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('Tu n\'as pas de masque!')
        end
    end
end, false) 

RegisterNetEvent('remove:hat')
AddEventHandler('remove:hat', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'helmet'
    local Drawable = GetPedPropIndex(ped, 0)
    local Texture = GetPedPropTextureIndex(ped, 0)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Hat and not IsAnim then
            IsAnim = true
            hatofon()
            ClearPedProp(ped, 0)
            ESX.ShowNotification('Vous avez enlevé votre chapeau')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('Tu as pas de chapeau')
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Hat and not IsAnim then
            IsAnim = true
            hatofon()
            ClearPedProp(ped, 0)
            ESX.ShowNotification('Vous avez enlevé votre chapeau')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have hat!')
        end
    end
end, false) 

RegisterNetEvent('remove:bag')
AddEventHandler('remove:bag', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'bag'
    local Drawable = GetPedDrawableVariation(ped, 5)
    local Texture = GetPedTextureVariation(ped, 5)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Bag and not IsAnim then
            IsAnim = true
            bagonoff()
            SetPedComponentVariation(ped, 5, Config.Male.Bag, 0, 2)
            ESX.ShowNotification('You removed your bag!')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have bag!')
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Bag and not IsAnim  then
            IsAnim = true
            bagonoff()
            SetPedComponentVariation(ped, 5, Config.Female.Bag, 0, 2)
            ESX.ShowNotification('You removed your bag!')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have bag!')
        end
    end
end, false) 

RegisterNetEvent('remove:glasses')
AddEventHandler('remove:glasses', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theProp = 'glasses'
    local Drawable = GetPedPropIndex(ped, 1)
    local Texture = GetPedPropTextureIndex(ped, 1)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if Drawable ~= Config.Male.Glasses and not IsAnim then
            IsAnim = true
            glassesonoff()
            ClearPedProp(ped, 1)
            ESX.ShowNotification('You removed your glasses!')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have glasses!')
        end
    elseif gender == 'Female' then
        if Drawable ~= Config.Female.Glasses and not IsAnim  then
            IsAnim = true
            glassesonoff()
            ClearPedProp(ped, 1)
            ESX.ShowNotification('You removed your glasses!')
            TriggerServerEvent('add:clothes', Drawable, Texture, theProp, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have glasses!')
        end
    end
end, false) 
              
RegisterNetEvent('remove:vest')
AddEventHandler('remove:vest', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theType = 'vest'
    local vest1 = GetPedDrawableVariation(ped, 9)
    local vest2 = GetPedTextureVariation(ped, 9)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if vest1 ~= Config.Male.Vest and not IsAnim then
            IsAnim = true
            vestonoff()
            SetPedComponentVariation(ped, 9, Config.Male.Vest, 0, 0)
            ESX.ShowNotification('You removed your vest!')
            TriggerServerEvent('add:clothes', vest1, vest2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have vest!')
        end
    elseif gender == 'Female' then
        if vest1 ~= Config.Female.Vest and not IsAnim then
            IsAnim = true
            vestonoff()
            SetPedComponentVariation(ped, 9, Config.Female.Vest, 0, 0)
            ESX.ShowNotification('You removed your vest!')
            TriggerServerEvent('add:clothes', vest1, vest2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have vest!')
        end
    end
    
end, false) 

RegisterNetEvent('remove:ears')
AddEventHandler('remove:ears', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theType = 'ears'
    local skin1 = GetPedPropIndex(ped, 2)
    local skin2 = GetPedPropTextureIndex(ped, 2)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if GetPedPropIndex(ped, 2) ~= Config.Male.Ears and not IsAnim  then
            IsAnim = true
            earsonoff()
            ClearPedProp(ped, 2)
            ESX.ShowNotification('You removed your earrings!')
            TriggerServerEvent('add:clothes', skin1, skin2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have earrings!')
        end
    elseif gender == 'Female' then
        if GetPedPropIndex(ped, 2) ~= Config.Female.Ears and not IsAnim  then
            IsAnim = true
            earsonoff()
            ClearPedProp(ped, 2)
            ESX.ShowNotification('You removed your earrings!')
            TriggerServerEvent('add:clothes', skin1, skin2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have earrings!')
        end
    end
end, false) 

RegisterNetEvent('remove:chain')
AddEventHandler('remove:chain', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local theType = 'chain'
    local skin1 = GetPedDrawableVariation(ped, 7)
    local skin2 = GetPedTextureVariation(ped,7)
    local gender = IsMpPed(ped) 
    if gender == 'Male' then
        if GetPedDrawableVariation(ped, 7) ~= Config.Male.Chain and not IsAnim  then
            IsAnim = true
            chainonoff()
            SetPedComponentVariation(ped, 7, Config.Male.Chain, 0, 2)
            ESX.ShowNotification('You removed your chain!')
            TriggerServerEvent('add:clothes', skin1, skin2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have chain!')
        end
    elseif gender == 'Female' then
        if GetPedDrawableVariation(ped, 7) ~= Config.Female.Chain and not IsAnim  then
            IsAnim = true
            chainonoff()
            SetPedComponentVariation(ped, 7, Config.Female.Chain, 0, 2)
            ESX.ShowNotification('You removed your chain!')
            TriggerServerEvent('add:clothes', skin1, skin2, theType, gender)
            IsAnim = false
        else
            ESX.ShowNotification('You dont have chain!')
        end
    end
end, false) 

function IsMpPed(ped)
	local Male = GetHashKey("mp_m_freemode_01") 
    local Female = GetHashKey("mp_f_freemode_01")
	local CurrentModel = GetEntityModel(ped)
	if CurrentModel == Male then 
        return "Male" 
    elseif CurrentModel == Female then 
        return "Female" 
    else 
        return false 
    end
end

function torsoonoff()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)
    progressvetement()
end
			
function hatofon()
    Txpac.PlayAnim("mp_masks@standard_car@ds@", "put_on_mask", 600)  
    progressvetement()
end
					
function maskonoff()				
    Txpac.PlayAnim("mp_masks@standard_car@ds@", "put_on_mask", 600)  
    progressvetement()
end

function earsonoff()
    Txpac.PlayAnim("mp_cp_stolen_tut", "b_think", 600)  
    progressvetement()			             
end			
function tshirtonoff()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)	
    progressvetement()		           
end
			
function armsonoff()	
    Txpac.PlayAnim("nmt_3_rcm-10", "cs_nigel_dual-10", 600) 	
    progressvetement()			            
end
			
function pantsonoff()
    Txpac.PlayAnim("re@construction", "out_of_breath", 1300)	
    progressvetement()			           
end
			
function shoesonoff()
    Txpac.PlayAnim("random@domestic", "pickup_low", 1300)		
    progressvetement()
end
			
function bagonoff()
    Txpac.PlayAnim("anim@heists@ornate_bank@grab_cash", "intro", 1300)	
    progressvetement()				            
end
			
function chainonoff()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)	
    progressvetement()
end
			
function glassesonoff()
    Txpac.PlayAnim("clothingspecs", "take_off", 1300)	
    progressvetement()
end

function vestonoff()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)
    progressvetement()
end

--- put back

function torsoonoff2()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)
    puttingback()
end
			
function hatofon2()
    Txpac.PlayAnim("mp_masks@standard_car@ds@", "put_on_mask", 600)  
    puttingback()
end
					
function maskonoff2()				
    Txpac.PlayAnim("mp_masks@standard_car@ds@", "put_on_mask", 600)  
    puttingback()
end

function earsonoff2()
    Txpac.PlayAnim("mp_cp_stolen_tut", "b_think", 600)  		
    puttingback()	             
end			
function tshirtonoff2()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)	
    puttingback()		           
end
			
function armsonoff2()	
    Txpac.PlayAnim("nmt_3_rcm-10", "cs_nigel_dual-10", 600) 	
    puttingback()			            
end
			
function pantsonoff2()
    Txpac.PlayAnim("re@construction", "out_of_breath", 1300)		
    puttingback()		           
end
			
function shoesonoff2()
    Txpac.PlayAnim("random@domestic", "pickup_low", 1300)		
    puttingback()
end
			
function bagonoff2()
    Txpac.PlayAnim("anim@heists@ornate_bank@grab_cash", "intro", 1300)		
    puttingback()			            
end
			
function chainonoff2()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)	
    puttingback()
end
			
function glassesonoff2()
    Txpac.PlayAnim("clothingspecs", "take_off", 1300)	
    puttingback()
end

function vestonoff2()
    Txpac.PlayAnim("clothingtie", "try_tie_positive_a", 1500)
    puttingback()
end

function progressvetement()
    lib.progressBar({
        duration = 2000,
        label = Config.Label_RemoveClothes,
        disable = {
            move = true,
            car = true,
            combat = true,
        }
    })
end

function puttingback()
    lib.progressBar({
        duration = 2000,
        label = Config.Label_PutBackClothes,
        disable = {
            move = true,
            car = true,
            combat = true,
        }
    })
end