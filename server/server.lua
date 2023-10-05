local cdEntities = {}
local next = next
lib.locale()

RegisterNetEvent('alt_robmeter:payout', function()
    local amount = math.random(Config.MinCash,Config.MaxCash)
    local src = source
    ox_inventory:RemoveItem(src, Config.Lockpick, 1)
    ox_inventory:AddItem(src, Config.Reward, amount)
    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = locale('money', amount)
    })
end)

RegisterNetEvent('alt_robmeter:cdEntity')
AddEventHandler('alt_robmeter:cdEntity', function(entity)
    table.insert(cdEntities, {ent = entity, timer = Config.Cooldown})
end)

lib.callback.register('alt_robmeter:isTargetable', function(source)
    return cdEntities
end)

CreateThread(function()
    while true do
        Wait(1000)
        if next(cdEntities) ~= nil then
            for k, v in pairs(cdEntities) do
                v.timer = v.timer - 1000
                if v.timer <= 0 then
                    cdEntities[k] = nil
                end
            end
        end
    end
end)
