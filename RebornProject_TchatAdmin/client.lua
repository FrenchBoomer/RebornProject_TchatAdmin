if Langue == "fr" then
    LangueChoisie = Locales.fr
elseif Langue == "en" then
    LangueChoisie = Locales.en
elseif Langue == "es" then
    LangueChoisie = Locales.es
end

RegisterNetEvent("RebornProject:RecuperationSteamID_Client")
AddEventHandler('RebornProject:RecuperationSteamID_Client', function(SteamID)
    IDENTIFIANTDUJOUEUR = SteamID
end)

RegisterNetEvent('RebornProject:EnvoieDuMessageAdminAuJoueur')
AddEventHandler("RebornProject:EnvoieDuMessageAdminAuJoueur", function(MessageAuJoueur)
    TriggerEvent('chat:addMessage', {
      color = { R, G, B},
      multiline = true,
      args = {LangueChoisie.titremessage, MessageAuJoueur}
    })
end)

RegisterNetEvent('RebornProject:NotificationImage')
AddEventHandler("RebornProject:NotificationImage", function(image, type, envoi, titre, texte)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(texte)
    SetNotificationMessage(image, image, true, type, envoi, titre, texte)
    DrawNotification(false, true)
end)

function VerificationWhiteListe()
    for k, v in ipairs(ListeBlanche) do
        if IDENTIFIANTDUJOUEUR == v.steam then
            return true
        end     
    end
end

RegisterCommand(ChoixCommandeTchatAdmin, function(source, args, rawCommand)
  if TchatAdminParCommande == true then
    TriggerServerEvent("RebornProject:RecuperationSteamID_Serveur")
    Wait(100)
    local VerifWL = VerificationWhiteListe()
    Wait(100)
      if VerifWL == true then
        if args[1] ~= nil and args[2] ~= nil then
          TriggerServerEvent("RebornProject:TchatEnvoiParLadmin", args[1], table.concat(args, " "))
        else
          TriggerEvent("RebornProject:NotificationImage", "CHAR_PROPERTY_BAR_IRISH", 7, LangueChoisie.titrenotifimage, false, LangueChoisie.notifmauvaisecommande)
        end
      else
        PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        TriggerEvent("RebornProject:NotificationImage", "CHAR_PROPERTY_BAR_IRISH", 7, LangueChoisie.titrenotifimage, false, LangueChoisie.notifwhiteliste)
      end
  end
end, false)

Citizen.CreateThread(function()

    WarMenu.CreateMenu('ListeTchatAdmin', '')
    WarMenu.SetTitleBackgroundSprite("ListeTchatAdmin", "TchatAdmin", "TchatAdmin")
    WarMenu.SetMenuButtonPressedSound('ListeTchatAdmin', "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET")
    WarMenu.SetTitleBackgroundColor('ListeTchatAdmin', 255, 255, 255, 255)
    WarMenu.SetMenuX('ListeTchatAdmin', 0.02)
    WarMenu.SetMenuY('ListeTchatAdmin', 0.05)

    while true do
        if WarMenu.IsMenuOpened('ListeTchatAdmin') then
            players = {}
            local localplayers = {}
            for i = 0, 256 do
                if NetworkIsPlayerActive(i) then
                    table.insert( localplayers, GetPlayerServerId(i) )
                end
            end
                table.sort(localplayers)
            for i,thePlayer in ipairs(localplayers) do
                table.insert(players,GetPlayerFromServerId(thePlayer))
            end

            for i,thePlayer in ipairs(players) do
                if WarMenu.Button(GetPlayerName(thePlayer).." ~b~ ["..GetPlayerServerId(thePlayer).."]~s~") then

                  AddTextEntry('FMMC_KEY_TIPS', LangueChoisie.saisiemessage)
                  DisplayOnscreenKeyboard(1, "FMMC_KEY_TIPS", "", "", "", "", "", 45)
                  while (UpdateOnscreenKeyboard() == 0) do
                  DisableAllControlActions(0)
                  Wait(0)
                  end
                  if (GetOnscreenKeyboardResult()) then
                    local MessageAuJoueur = tostring(GetOnscreenKeyboardResult())  
                    TriggerServerEvent("RebornProject:TchatEnvoiParLadmin", GetPlayerServerId(thePlayer), MessageAuJoueur)
                    WarMenu.CloseMenu()
                  end
                    
                end
            end
            WarMenu.SetSubTitle("ListeTchatAdmin", LangueChoisie.soustitre)
            WarMenu.Display()
        end
          if IsControlJustPressed(1, ToucheClavier) then
              TriggerServerEvent("RebornProject:RecuperationSteamID_Serveur")
              Wait(100)
              if MenuActiver == true then
                if Administration == true then
                  local VerifWL = VerificationWhiteListe()
                  Wait(100)
                  if VerifWL == true then
                    WarMenu.OpenMenu("ListeTchatAdmin")
                  else
                    PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
                    TriggerEvent("RebornProject:NotificationImage", "CHAR_PROPERTY_BAR_IRISH", 7, LangueChoisie.titrenotifimage, false, LangueChoisie.notifwhiteliste)
                  end
                else
                  WarMenu.OpenMenu("ListeTchatAdmin")
                end
              end
          end
        if WarMenu.IsMenuAboutToBeClosed("ListeTchatAdmin") then
            -- ICI METTRE LES APPELS NECESSAIRES LORS DE LA FERMETURE DU MENU
        end
        Wait(0)
    end
end)
