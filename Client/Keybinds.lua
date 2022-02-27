if Config.KeyBinding then
local binds = {}

-----------------------------------------------------------------------------------------------------
-- Commands / Events --------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    
    binds = json.decode(GetResourceKvpString('emoteBinds'))
    
    if not binds then
        DebugPrint('[^2dpemotes^0] Creating binds cache')
        binds = {}
        SetResourceKvp('emoteBinds', json.encode(binds))
    else
        DebugPrint('[^2dpemotes^0] Found cached binds!')
    end

    for k, v in pairs(binds) do
        DebugPrint('[^2dpemotes^0] registering cached bind '..k)
        RegisterKeyMapping(k, '(Anim) Anim slot /'..k, 'keyboard', '')
        RegisterCommand(k, function()
            if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                EmoteCommandStart(nil,{v, 0})
            end
        end)
        TriggerEvent('chat:removeSuggestion', '/'..k)
    end
end)



-----------------------------------------------------------------------------------------------------
------ Functions and stuff --------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function EmoteBindsStart()
    local string = ''
    for k, v in pairs(binds) do
        string = string..Config.Languages[lang]['binds']..' ^1/'..k..'^0 - Anim ^2'..v..'^0\n'
    end

    TriggerEvent('chat:addMessage', {
        color = {0,0,0},
        multiline = true,
        args = {"^5"..Config.Languages[lang]['binds'].."^0", string ~= '' and '\n'..string or ' '..Config.Languages[lang]['binds']}
    })
end

end