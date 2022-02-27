


RegisterCommand('openemote', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open'
    })   
end)


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


