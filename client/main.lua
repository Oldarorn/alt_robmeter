lib.locale()

local function delPmeter(ent)
    TriggerServerEvent('alt_robmeter:cdEntity', ent)
end

local function main()
    local close = lib.getClosestObject(GetEntityCoords(cache.ped))
    local count = ox_inventory:Search('count', Config.Lockpick)
    if count > 0 then
        lib.callback('alt_robmeter:isTargetable', false, function(canRob)
            if canRob then
                local result
                if Config.UseLock then
                    result = exports['lockpick']:startLockpick()
                else
                    result = lib.skillCheck({'easy', 'easy', 'easy'}, Config.Inputs)
                end

                if result then
                    if lib.progressBar({
                        duration = 15000,
                        label = '',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                            mouse = true
                        },
                        anim = {
                            dict = 'anim@gangops@facility@servers@',
                            clip = 'hotwire',
                            flag = 16
                        },
                        prop = {
                            model = `bzzz_props_lockpick_03`,
                            pos = vec3(0.17, 0.15, -0.04),
                            rot = vec3(-36.0, -46.0, 0.0),
                            bone = 18905
                        },
                    }) then
                        TriggerServerEvent('alt_robmeter:payout')
                        delPmeter(close)
                    else
                        ClearPedTasks(cache.ped) 
                    end
                else
                    -- You should alert the police about what you've done you criminal !
                    -- And maybe remove the used lockpick
                    -- Insert function or event of whatever thing to trigger to send an alert
                end
            else
                lib.notify({type='error', description=locale('alreadyRobbed')})
            end
        end, close)
    else
        lib.notify({type='error', description=locale('noLockpick'), icon="fas fa-screwdriver"})
    end
end



CreateThread(function()
    local options = {
        label = locale('robMeter'),
        icon = "fad fa-screwdriver",
        distance = 1.5,
        onSelect = function()
            main()
        end

    }
    exports.ox_target:addModel(Config.Models, options)
end)


