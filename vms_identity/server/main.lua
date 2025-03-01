local QBCore = exports["qb-core"]:GetCoreObject()
local playerIdentity = {}
local alreadyRegistered = {}

local dateFormat = {
    ['dd/mm/yyyy'] = '(%d%d)/(%d%d)/(%d%d%d%d)',
    ['mm/dd/yyyy'] = '(%d%d)/(%d%d)/(%d%d%d%d)',
    ['yyyy/mm/dd'] = '(%d%d%d%d)/(%d%d)/(%d%d)',
    ['yyyy/dd/mm'] = '(%d%d%d%d)/(%d%d)/(%d%d)',
}

QBCore.Commands.Add('register', Config.Translate['cmd.help_register'], {{ 
    name = 'playerid', help = Config.Translate['cmd.help_id']
}}, true, function(source, args)
    if (args[1]) then
        TriggerClientEvent('vms_identity:showRegisterIdentity', args[1])
        TriggerClientEvent('vms_multichars:notification', source, (Config.Translate['cmd.opened_register']):format(args[1]), 5500, 'success')
    end
end, 'admin')

local function checkDate(str)
    if string.match(str, dateFormat[Config.DateFormat]) ~= nil then
        local d, m, y = nil, nil, nil

        if Config.DateFormat == "dd/mm/yyyy" then
            d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')
        elseif Config.DateFormat == "mm/dd/yyyy" then
            m, d, y = string.match(str, '(%d+)/(%d+)/(%d+)')
        elseif Config.DateFormat == "yyyy/dd/mm" then
            y, d, m = string.match(str, '(%d+)/(%d+)/(%d+)')
        elseif Config.DateFormat == "yyyy/mm/dd" then
            y, m, d = string.match(str, '(%d+)/(%d+)/(%d+)')
        end

        m = tonumber(m)
        d = tonumber(d)
        y = tonumber(y)

        if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= Config.LimitYear[1]) or (y > Config.LimitYear[2])) then
            return false
        elseif m == 4 or m == 6 or m == 9 or m == 11 then
            if d > 30 then
                return false
            else
                return true
            end
        elseif m == 2 then
            if y % 400 == 0 or (y % 100 ~= 0 and y % 4 == 0) then
                if d > 29 then
                    return false
                else
                    return true
                end
            else
                if d > 28 then
                    return false
                else
                    return true
                end
            end
        else
            if d > 31 then
                return false
            else
                return true
            end
        end
    else
        return false
    end
end

local function checkAlphanumeric(str)
    return (string.match(str, "%W"))
end

local function checkForNumbers(str)
    return (string.match(str, "%d"))
end

local function checkNameFormat(name)
    if not checkAlphanumeric(name) then
        if not checkForNumbers(name) then
            local stringLength = string.len(name)
            if stringLength > 0 and stringLength < Config.MaxNameLength then
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

local function checkDOBFormat(dob)
    local date = tostring(dob)
    if checkDate(date) then
        return true
    else
        return false
    end
end

local function checkSexFormat(sex)
    if sex == "m" or sex == "M" or sex == "f" or sex == "F" then
        return true
    else
        return false
    end
end

local function checkHeightFormat(height)
    local numHeight = tonumber(height)
    if numHeight < Config.LimitHeight[1] or numHeight > Config.LimitHeight[2] then
        return false
    else
        return true
    end
end

QBCore.Functions.CreateCallback('vms_identity:registerIdentity', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.UseLatinAlphabetChecker and not checkNameFormat(data.firstname) then
        return cb(Config.Translate['invalid_firstname'])
    end
    if Config.UseLatinAlphabetChecker and not checkNameFormat(data.lastname) then
        return cb(Config.Translate['invalid_lastname'])
    end
    if not checkSexFormat(data.sex) then
        return cb(Config.Translate['invalid_sex'])
    end
    if not checkDOBFormat(data.dateofbirth) then
        return cb(Config.Translate['invalid_dob'])
    end
    if not checkHeightFormat(data.height) then
        return cb(Config.Translate['invalid_height'])
    end
    if Player then
        alreadyRegistered[Player.PlayerData.citizenid] = true
    end
    cb(true)
end)