function StartPayCheck()
  CreateThread(function()
    while true do
      Wait(Config.PaycheckInterval)

      for player, xPlayer in pairs(ESX.Players) do
        local job = xPlayer.job.grade_name
        local salary = xPlayer.job.grade_salary

        if salary > 0 then
          if job == 'unemployed' then -- unemployed
            xPlayer.addAccountMoney('bank', salary, "Welfare Check")
            TriggerClientEvent('ox_lib:notify', player, {position = 'top-right', icon = 'fa-solid fa-money-bill-transfer', style = { backgroundColor = '#191919' }, duration = 6000, title = 'S.A State Controllers Office', type = 'success', description = ('Vous avez perçu une allocation : '..salary..'$') })
          elseif Config.EnableSocietyPayouts then -- possibly a society
            TriggerEvent('esx_society:getSociety', xPlayer.job.name, function(society)
              if society ~= nil then -- verified society
                TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
                  if account.money >= salary then -- does the society money to pay its employees?
                    xPlayer.addAccountMoney('bank', salary, "Paycheck")
                    account.removeMoney(salary)

                    xPlayer.addAccountMoney('bank', salary, "Paycheck")
            TriggerClientEvent('ox_lib:notify', player, {position = 'top-right', icon = 'fa-solid fa-money-bill-transfer', style = { backgroundColor = '#191919' }, duration = 6000, title = 'Service des Impots', type = 'success', description = ('Vous avez été payé : '..salary..'$') })
                  else
                    TriggerClientEvent('ox_lib:notify', player, {position = 'top-right', icon = 'fa-solid fa-money-bill-transfer', style = { backgroundColor = '#191919' }, duration = 6000, title = 'Service des Impots', type = 'error', description = ('La socitete a plus de sous : '..salary..'$') })
                  end
                end)
              else -- not a society
                xPlayer.addAccountMoney('bank', salary, "Paycheck")
                TriggerClientEvent('ox_lib:notify', player, {position = 'top-right', icon = 'fa-solid fa-money-bill-transfer', style = { backgroundColor = '#191919' }, duration = 6000, title = 'S.A State Controllers Office', type = 'success', description = ('Vous avez été payé : '..salary..'$') })
              end
            end)
          else -- Job
            xPlayer.addAccountMoney('bank', salary, "Paycheck")
            TriggerClientEvent('ox_lib:notify', player, {position = 'top-right', icon = 'fa-solid fa-money-bill-transfer', style = { backgroundColor = '#191919' }, duration = 6000, title = 'S.A State Controllers Office', type = 'success', description = ('Vous avez été payé : '..salary..'$') })
          end
        end
      end
    end
  end)
end