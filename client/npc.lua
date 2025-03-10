CreateThread(function()
    local npc = Config.NPC
    RequestModel(npc.model)
    while not HasModelLoaded(npc.model) do Wait(10) end

    local ped = CreatePed(4, npc.model, npc.coords.x, npc.coords.y, npc.coords.z, npc.coords.w, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true) 
    TaskStartScenarioInPlace(ped, npc.anim.dict, 0, true)

    exports.ox_target:addLocalEntity(ped, {
        label = npc.label,
        icon = "fas fa-clipboard",
        distance = 2.0,
        onSelect = function(data)

            local success = lib.progressBar({
                 duration = 1000,
                label = "Mengambil Pekerjaan...",
                useWhileDead = false,
                canCancel = true,
                disable = { move = true, car = true, combat = true },
                anim = { dict = 'amb@world_human_clipboard@male@base', clip = 'base' }
            })

            if success then
                lib.notify({
                    title = 'INFO',
                    description = 'Kamu sudah mengambil pekerjaan!',
                    type = 'success',
                    position = 'center-right',
                    duration = 5000
                })
                StartJob()
            else
                lib.notify({
                    title = 'INFO',
                    description = 'Gagal mengambil pekerjaan!',
                    type = 'error',
                    position = 'center-right',
                    duration = 5000
                })
            end
        end
    })
    exports.ox_target:addLocalEntity(ped, {
        label = "Berhenti Bekerja",
        icon = "fas fa-times-circle",
        distance = 2.0,
        onSelect = function(data)
            StopJob()
            lib.notify({
                title = 'INFO',
                description = 'Kamu berhenti bekerja!',
                type = 'info',
                position = 'center-right',
                duration = 5000
            })
        end
    })
end)