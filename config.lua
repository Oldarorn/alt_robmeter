Config = {}
ox_inventory = exports.ox_inventory

Config.MinCash = 500
Config.MaxCash = 2000
Config.Cooldown = 60000 -- In ms
Config.UseLock = false -- Depends if you want to use lockpick or skillcheck
Config.Reward = 'money' -- Set it with the item you want to give when the rob is done
Config.Lockpick = 'lockpick' -- The required item to rob !


Config.Models = {
    'prop_parknmeter_02', -- -1940238623
    'prop_parknmeter_01' -- 2108567945
}

Config.Inputs = {'z', 'q', 's', 'd'} -- AZERTY keyboards FTW ! But feel free to edit it as QWERTY or whatever keyboard you use