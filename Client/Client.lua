RegisterCommand('openemote', function()
    SetNuiFocus(true, true)

    
    SetNuiFocusKeepInput(true)


    SendNUIMessage({
        action = 'open'
    })   
    Animaciones_isOpen = true

    CreateThread(function()
        while Animaciones_isOpen do
            DisableDisplayControlActions()
            Wait(1)
        end
    end)

end)



function DisableDisplayControlActions()

    DisableControlAction(0, 1, true) -- disable mouse look
    DisableControlAction(0, 2, true) -- disable mouse look
    DisableControlAction(0, 3, true) -- disable mouse look
    DisableControlAction(0, 4, true) -- disable mouse look
    DisableControlAction(0, 5, true) -- disable mouse look
    DisableControlAction(0, 6, true) -- disable mouse look
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 177, true) -- disable escape
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 202, true) -- disable escape
    DisableControlAction(0, 322, true) -- disable escape
    DisableControlAction(0, 245, true) -- disable chat
    DisableControlAction(0, 37, true) -- disable TAB
    DisableControlAction(0, 261, true) -- disable mouse wheel
    DisableControlAction(0, 262, true) -- disable mouse wheel
    HideHudComponentThisFrame(19)
end

RegisterKeyMapping('openemote', 'Open Roda Animations', 'keyboard', Config.OpenKey)

RegisterNUICallback("callAnimations" , function(data, cb)
    for a,b in pairsByKeys(DP.Emotes) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'LoadEmotes';
            emotes = z;
            emotename = a;
        })
    end

    for a,b in pairsByKeys(DP.PropEmotes) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'LoadObjects';
            emotes = z;
            emotename = a;
        })
    end
    for a,b in pairsByKeys(DP.Dances) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'LoadDances';
            emotes = z;
            emotename = a;
        })
    end  

    for a,b in pairsByKeys(DP.Shared) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'LoadShared';
            emotes = z;
            emotename = a;
        })
    end 
    for a,b in pairsByKeys(DP.Walks) do
        x = table.unpack(b)
        SendNUIMessage({
            action = 'LoadWalk';
            emotes = a;
            emotename = a;
        })
    end

    for a,b in pairsByKeys(DP.Dances) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'sharedDances';
            emotes = z;
            emotename = a;
        })
    end 

    for a,b in pairsByKeys(DP.Expressions) do
        x,y,z = table.unpack(b)
        SendNUIMessage({
            action = 'Expresions';
            emotes = a;
            emotename = y;
        })
    end

    for a,b in pairsByKeys(DP.Aim) do
        x = table.unpack(b)
        SendNUIMessage({
            action = 'LoadAim';
            emotes = a;
            emotename = x;
        })
    end
end)


RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    Animaciones_isOpen = false
    SendNUIMessage({
        action = 'exit'
    })
end)


RegisterNUICallback("executeemote" , function(data, cb)
    local playerPed = PlayerPedId()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'exit'
    })
    Animaciones_isOpen = false
    if data.type == 'walk' then 
        ExecuteCommand('walk '..data.emote)
    elseif data.type == 'emote' then 
        ExecuteCommand('e '..data.emote)
    elseif data.type == 'shared' then 
        ExecuteCommand('nearby '..data.emote)
    elseif data.type == 'sharedance' then
        ExecuteCommand('neardance '..data.emote) 
    elseif data.type == 'expresion' then 
        SetFacialIdleAnimOverride(playerPed, data.emote, 0)
    elseif data.type == 'aim' then 
        SetWeaponAnimationOverride(PlayerPedId(), GetHashKey(data.emote))
    end
end)


