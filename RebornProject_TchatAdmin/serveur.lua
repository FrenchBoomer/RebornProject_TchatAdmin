RegisterServerEvent("RebornProject:RecuperationSteamID_Serveur")
AddEventHandler("RebornProject:RecuperationSteamID_Serveur", function()
  local source = source
  local SteamID = GetPlayerIdentifiers(source)[1]
    TriggerClientEvent("RebornProject:RecuperationSteamID_Client", source, SteamID)
end)

RegisterServerEvent("RebornProject:TchatEnvoiParLadmin")
AddEventHandler("RebornProject:TchatEnvoiParLadmin", function(thePlayer, MessageAuJoueur)
    TriggerClientEvent("RebornProject:EnvoieDuMessageAdminAuJoueur", thePlayer, MessageAuJoueur)
end)

-- NE PAS TOUCHER !!!

local CurrentVersion = '1.0.0'
local GithubResourceName = GetCurrentResourceName()
local Name = 'Walter White'

PerformHttpRequest('https://raw.githubusercontent.com/WalterWhite84/'.. GithubResourceName .. '/master/Version', function(Error, NewestVersion, Header)
    print('\n')
    print('\n')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print("## Nom de la ressource : "..GithubResourceName)
    print('## Production: ' .. Name)
    print('## Derniere version : ' .. NewestVersion)
    print('## Version en cours : ' .. CurrentVersion)
    print('Lien de telechargement de telechargement du script : https://github.com/WalterWhite84/RebornProject_TchatAdmin')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print('\n')
    print('\n')
end)

-- FIN
