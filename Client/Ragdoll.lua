-- local ragdoll = false
-- function setRagdoll(flag)
--   ragdoll = flag
--   whileRag()
-- end

-- function whileRag()
--   Citizen.CreateThread(function()
--     while ragdoll do
--       Citizen.Wait(0)
--       if ragdoll then
--         SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
--       end
--     end
--   end)
-- end

-- ragdol = true
-- RegisterNetEvent("Ragdoll")
-- AddEventHandler("Ragdoll", function()
-- 	if ( ragdol ) then
-- 		setRagdoll(true)
-- 		ragdol = false
-- 	else
-- 		setRagdoll(false)
-- 		ragdol = true
-- 	end
-- end)

-- RegisterCommand("rag", function(source, args, raw)
--     TriggerEvent("Ragdoll")
-- end)

-- RegisterKeyMapping('(Anim) Ragdoll', 'RagDoll', 'keyboard', Config.RagdollKeybind)
-- RegisterCommand('RagDoll', function()
--   TriggerEvent("Ragdoll")
-- end)