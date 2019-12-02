local Touches = {

        ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
        ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
        ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
        ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
        ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
        ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
        ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
        ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

    }

ToucheClavier = Touches["F6"] -- Touche d'ouverture du menu
Langue = "fr" -- Choix de la langue (Français = fr, Anglais = en, Espagnol = es)
Administration = true -- Choix de l'activation ou non du mode administration
MenuActiver = true -- Choix pour l'activation ou non du menu pour la gestion du script
TchatAdminParCommande = true -- Choix de l'activation ou non du mode commande tchat 
ChoixCommandeTchatAdmin = "tchatadmin" -- Choix du nom de la commande tchat admin
R = 255 -- Modification de la couleur du titre du message par reglage RGB
G = 0 -- Modification de la couleur du titre du message par reglage RGB
B = 0 -- Modification de la couleur du titre du message par reglage RGB


ListeBlanche = { -- whiteliste
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},

}

Locales = {
    ['fr'] = {
        ['soustitre'] = "Liste des joueurs",
        ['saisiemessage'] = "Saisir le message",
        ['titremessage'] = "ADMINISTRATION ",
        ['titrenotifimage'] = "TCHAT ADMIN",
        ['notifmauvaisecommande'] = "La commande se presente ainsi : /tchatadmin id message",
        ['notifwhiteliste'] = "~r~Vous ne faites pas parti de la whiteliste~s~",
    },

    ['en'] ={
        ['soustitre'] = "List of players",
        ['saisiemessage'] = "Enter the message",
        ['titremessage'] = "ADMINISTRATION ",
        ['titrenotifimage'] = "TCHAT ADMIN",
        ['notifmauvaisecommande'] = "The command is as follows: /tchatadmin id message",
        ['notifwhiteliste'] = "~r~You are not part of the whitelist~s~",
    },

    ['es'] ={
        ['soustitre'] = "Listado de jugadores",
        ['saisiemessage'] = "Ingrese el mensaje",
        ['titremessage'] = "ADMINISTRACIÓN ",
        ['titrenotifimage'] = "TCHAT ADMIN",
        ['notifmauvaisecommande'] = "El comando es el siguiente: /tchatadmin id message",
        ['notifwhiteliste'] = "~r~No eres parte de la lista blanca~s~",
    },
}