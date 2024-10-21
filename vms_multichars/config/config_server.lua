Config.Slots = 2

Config.EnableStarterItems = true
Config.StarterItems = {
    {name = 'sandwich', count = 5},
    {name = 'water', count = 5},
    {name = 'phone', count = 1},
    {name = 'driver_license', count = 1},
}

Config.EnableStarterMoney = true
Config.StarterMoney = {
    {account = 'cash', amount = 5000},
    {account = 'bank', amount = 50000},
}

openSpawnSelector = function(src, cData)
    if Config.UseCustomSpawnSelector then
        TriggerClientEvent('vms_spawnselector:open', src)
    else
        TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
    end
end