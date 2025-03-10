ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('disnaker:reward')
AddEventHandler('disnaker:reward', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    for _, reward in pairs(Config.yzItem) do
        local count = math.random(reward.count.min, reward.count.max)
        xPlayer.addInventoryItem(reward.name, count)
    end
end)