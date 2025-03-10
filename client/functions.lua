local cows = {}

function SpawnCow(coords)
    local model = `a_c_cow`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local cow = CreatePed(4, model, coords.x, coords.y, coords.z, coords.w, true, true)
    SetEntityAsMissionEntity(cow, true, true)
    SetModelAsNoLongerNeeded(model)
    SetPedMoveRateOverride(cow, 0.1)
    SetEntityHealth(cow, 100)
    local blip = AddBlipForEntity(cow)
    SetBlipSprite(blip, Config.yzBlipssapi.sprite)
    SetBlipColour(blip, Config.yzBlipssapi.color)
    SetBlipScale(blip, Config.yzBlipssapi.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.yzBlipssapi.label)
    EndTextCommandSetBlipName(blip)

    cows[#cows + 1] = { cow = cow, blip = blip }
    TaskWanderStandard(cow, 10.0, 10)

    return cow
end

function StartJob()
    for i = 1, Config.yzJumlahSapi do
        local cowCoords = Config.yzSpawnSapi[math.random(#Config.yzSpawnSapi)]
        local cow = SpawnCow(cowCoords)


        CreateThread(function()
            while DoesEntityExist(cow) and not IsEntityDead(cow) do
                Wait(1000) 
            end
            if IsEntityDead(cow) then
                exports.ox_target:addLocalEntity(cow, {
                    label = "Potong Sapi",
                    icon = "fas fa-skull",
                    distance = 2.0,
                    onSelect = function(data)
                        local success = lib.progressBar({
                            duration = 5000,
                            label = "Memotong Sapi...",
                            useWhileDead = false,
                            canCancel = true,
                            disable = { move = true, car = true, combat = true },
                            anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer'}
                })


                        if success then
                            TriggerServerEvent('disnaker:reward')
                            DeleteEntity(cow)
                            RemoveBlip(cows[i].blip)
                            cows[i] = nil
                        end
                    end
                })
            end
        end)
    end
end

function StopJob()
    if not cows or #cows == 0 then
        print("gk ada sapi") 
        return
    end

    for i = 1, #cows do
        if cows[i] then 
            if DoesEntityExist(cows[i].cow) then
                DeleteEntity(cows[i].cow)
            end
            if DoesBlipExist(cows[i].blip) then
                RemoveBlip(cows[i].blip)
            end
        end
    end
    cows = {} 
    print("blips gk ada")
end