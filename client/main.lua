ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function VisualSubtitle(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end


CreateThread(function()
    while true do
        interval = 850  
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for k,v in pairs(zDrugs.Drugs) do
            local distance = #(coords - v.posrecolte)
            if distance < 5.5 then
                interval = 0
                VisualSubtitle("Appuyez sur ~b~[E] ~s~pour récolter "..v.label, 1)
                DrawMarker(zDrugs.BlipId, v.posrecolte.x, v.posrecolte.y, v.posrecolte.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 100, 100, 255, 0, 0, 0, 1, 0, 0, 0)

                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("zesx_drugs:recolte", v.name)
                end
            end

            local distance2 = #(coords - v.postraitement)
            if distance2 < 5.5 then
                interval = 0
                VisualSubtitle("Appuyez sur ~b~[E] ~s~pour traiter "..v.label, 1)
                DrawMarker(21, v.postraitement.x, v.postraitement.y, v.postraitement.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 100, 100, 255, 0, 0, 0, true, 0, 0, 0)
                -- DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)

                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("zesx_drugs:traitement", v.name, v.nametraitement)
                end
            end

            local distance3 = #(coords - v.posvente)
            if distance3 < 5.5 then
                interval = 0
                VisualSubtitle("Appuyez sur ~b~[E] ~s~pour vendre "..v.label, 1)
                DrawMarker(21, v.posvente.x, v.posvente.y, v.posvente.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 100, 100, 255, 0, 0, 1, 0, 0, 0, 0)

                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("zesx_drugs:vente", v.nametraitement, v.price)
                end
            end
        end
        Wait(interval)
    end
end)

-- create blips for lspd alert
RegisterNetEvent('zesx_drugs:alert')
AddEventHandler('zesx_drugs:alert', function(pos)
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 2.0)
    SetBlipColour(blip, 1)
    PulseBlip(blip)
    Wait(zDrugs.TimeBlips)
    RemoveBlip(blip)
end)


                   