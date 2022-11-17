ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("zesx_drugs:recolte")
AddEventHandler("zesx_drugs:recolte", function(drug)
    print(drug)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = xPlayer.getInventoryItem(drug).count
    if item < zDrugs.zLimite then

        xPlayer.addInventoryItem(drug, 1)
        print("Vous avez récolté "..drug)
    else
        TriggerClientEvent("esx:showNotification", _src, "Vous n'avez plus de place dans votre inventaire")
        print("Vous n'avez plus de place dans votre inventaire")
        
    end
end)


RegisterNetEvent("zesx_drugs:traitement")
AddEventHandler("zesx_drugs:traitement", function(drug, drugt)
    print(drug)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = xPlayer.getInventoryItem(drug).count
    if item == zDrugs.zMinTraitement or item < zDrugs.zMinTraitement then
    TriggerClientEvent("esx:showNotification", _src, "Vous n'avez pas assez de "..drug.." dans votre inventaire")
    else
        xPlayer.removeInventoryItem(drug, zDrugs.NumberD)
        xPlayer.addInventoryItem(drugt, 1)
        
    end
end)

RegisterNetEvent("zesx_drugs:vente")
AddEventHandler("zesx_drugs:vente", function(drug, price)
    print(drug)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = xPlayer.getInventoryItem(drug).count
    if item > 1 then
        
        if zDrugs.BlackMoney == true then 
            xPlayer.addAccountMoney('black_money', price)
            xPlayer.removeInventoryItem(drug, zDrugs.NumberD)
            TriggerClientEvent("esx:showNotification", _src, "Vous avez vendu "..zDrugs.NumberD.." "..drug.." pour "..price.." $ sale")
            if zDrugs.Prevenir == true then 
                TriggerClientEvent("esx:showNotification", _src, "La LSPD a été prévenu de votre activité")
            end
        else
            xPlayer.addMoney(price)
            xPlayer.removeInventoryItem(drug, zDrugs.NumberD)
            TriggerClientEvent("esx:showNotification", _src, "Vous avez vendu "..zDrugs.NumberD.." "..drug.." pour "..price.." $ propre")
            if zDrugs.Prevenir == true then 
                TriggerClientEvent("esx:showNotification", _src, "La LSPD a été prévenu de votre activité")
            end
        end
    else
         TriggerClientEvent("esx:showNotification", _src, "Vous n'avez pas assez de "..drug.." dans votre inventaire")

    end
        xTargets = ESX.GetPlayers()
        for i=1, #xTargets, 1 do
            local xTarget = ESX.GetPlayerFromId(xTargets[i])
            if xTarget.job.name == 'police' then
                -- print(print(ESX.DumpTable(xPlayer.getCoords())))
                TriggerClientEvent('zesx_drugs:alert', xTarget.source, xPlayer.getCoords())
                TriggerClientEvent('esx:showNotification', -1, "Un citoyen a été signalé pour trafic de drogue")
            end
        end
end)


