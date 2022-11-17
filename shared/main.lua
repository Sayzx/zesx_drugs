-- Path: zesx_drugs\shared\config.lua

Config = {}

zDrugs = {
    zLimite = 100, -- Maxium de drogue dans l'inventaire pour recolter
    zMinTraitement = 2, -- 
    BlipId = 22,
    TimeBlips = 3000, -- Temps en ms combien de temps va rester le blips pour le lspd 
    BlackMoney = false, -- Si BLACKMONEY = TRUE alors l'argent sera en salle sinon en argent serra en propre
    NumberD = 2, -- Ce Chiffre corespond au nombre de drogue que vous voulez retirer de votre inventaire pour en faire une autre
    Prevenir = true, -- Si Prevenir = true alors le joueurs serra prévenu que la policea arrive
    AlertLSPD = true, -- Si AlertLSPD = true alors la police serra prévenu de la vente de drogue
    Drugs = {
        {name = "coke", label = "Coke", nametraitement = "coke_pooch", labeltraitement = "Pochon de Weed", price = 100, item = "weed", posrecolte = vector3(1068.5484619141,-3169.7517089844,5.2007782936096), postraitement = vector3(1041.4770507813,-3173.8664550781,5.9007768630981), posvente = vector3(-1172.5,-1572.5,4.6631016731262)},
        {name = "meth", label = "Meth", nametraitement = "meth_pooch", labeltraitement = "Pochon de Meth", price = 100, item = "meth", posrecolte = vector3(1035.861328125,-3153.6809082031,5.900773525238), postraitement = vector3(1036.3179931641,-3144.1586914063,5.9007740020752), posvente = vector3(1065.1441650391,-3192.8203125,5.9033036231995)},
        {name = "weed", label = "Weed", nametraitement = "weed_pooch", labeltraitement = "Pochon de Weed", price = 100, item = "weed", posrecolte = vector3(1035.861328125,-3153.6809082031,5.900773525238), postraitement = vector3(1036.3179931641,-3144.1586914063,5.9007740020752), posvente = vector3(1046.5446777344,-3177.3520507813,5.9007782936096)},
    },

}	

