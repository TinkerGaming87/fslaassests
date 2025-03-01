Config = {}

Config.CanDelete = true

-- @WeatherSync: "cd_easytime", "qb-weathersync"
Config.WeatherSync = "qb-weathersync"
Config.Weather = "CLEAR"

-- @SkinManager: "qb-clothing" / "fivem-appearance" / "illenium-appearance"
Config.SkinManager = "qb-clothing"


Config.SelectFirstChar = true -- it will select first possible player character by first connection on the server

-- @UseCustomSkinCreator: if you use qb-clothing / illenium-appearance / fivem-appearance for character creator set it to false
-- if you use custom character creator set it to true and change in @vms_multichars/config/config_client.lua function openCharacterCreator(skin)
Config.UseCustomSkinCreator = false
Config.RelogCommand = true -- @vms_multichars/config/config_client.lua:60

-- @UseCustomSpawnSelector: if you want to use vms_spawnselector, set it true, but if you have other custom spawnselector, change it in @vms_multichars/config/config_server.lua function openSpawnSelector()
Config.UseCustomSpawnSelector = false
Config.SkipSpawnSelector = false -- Skip the spawn selection and spawns the player at the last location.

-- @UseRoutingBuckets: This moves the player into their own virtual world which also removes any collisions between players
Config.UseRoutingBuckets = true

Config.ToLeft = vector3(919.61, -295.44, 64.73) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords
Config.Spawn = vector4(917.4, -293.36, 64.63, 280.76) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords
Config.FromRight = vector3(917.7, -291.62, 64.63) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords

Config.CameraHeightPoint = 1.5 -- + 1.5
Config.CameraHeight = 0.5
Config.CameraForward = 1.0

Config.SpawnLocation = vector3(-816.48, -2407.86, 14.57) -- here you can set the coordinates in which the player will spawn after creating a character ! IMPORTANT, if you use Config.UseCustomSkinCreator, it won't work, you need to set in charcreator e.g. vms_charcreator !

Config.ChangeCharacterPoint = {
	enable = false	,
	coords = vector3(-1045.07, -2750.11, 21.36),
	marker = {
		id = 2,
		rgba = {255, 215, 25, 100},
		size = vec(0.75, 0.75, 0.75),
		rotate = true
	},
	blip = {
		sprite = 480,
		color = 2,
		scale = 1.0,
		name = "Character Selector"
	}
}

Config.Notification = function(message, time, type)
	if type == "success" then
		--exports["vms_notify"]:Notification("MULTICHARACTERS", message, time, "#27FF09", "fa-solid fa-users")
		TriggerEvent('QBCore:Notify', message, 'success', time)
		
	elseif type == "error" then
		--exports["vms_notify"]:Notification("MULTICHARACTERS", message, time, "#FF0909", "fa-solid fa-users")
		TriggerEvent('QBCore:Notify', message, 'error', time)

	end
end

Config.Hud = {
    Enable = function()
        -- exports['vms_hud']:Display(true)
    end,
    Disable = function()
        -- exports['vms_hud']:Display(false)
    end
}

Config.Translate = {
	["cmd.help_citizenid"] = "Player citizenid",
	["cmd.help_identifier"] = "Player identifier (license:xxxxx)",
	["cmd.setslots"] = "Setting the available characters slots for a player",
	["cmd.help_slots"] = "Enter the number of characters slots the player is expected to have",
	["slots_added"] = "Set %s slots for player %s",
	["slots_edited"] = "You changed the slots to %s for player %s",
	["cmd.removeslots"] = "Removal of custom number of slots",
	["slots_removed"] = "Removed custom slot count for %s",
	["cmd.help_enablechar"] = "Re-enabling the character",
	["charenabled"] = "The character with the identifier %s has been enabled",
	["cmd.help_disablechar"] = "Temporary disabling of character",
	["chardisabled"] = "The character with the identifier %s has been temporarily disabled",
	["charnotfound"] = "The character with the identifier %s was not found!",
	["cmd.help_deletecharacter"] = "Permanent character removal",
	["cmd.success_deleted_character"] = "Successfully removed player character %s",
	["cmd.help_logout"] = "Logout",
	["cannot_remove_character"] = "You can't delete a character, for this purpose go to the administrator.", -- If you have Config.CanDelete on true, the player will receive this notification when trying to delete
	["helpnotification.change_character"] = "Press E to change the character"
}

Config.Default = {
	["face"] = {item = 21, texture = 0, defaultItem = 0, defaultTexture = 0},
	["face2"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["facemix"] = {skinMix = 50, shapeMix = 50, defaultSkinMix = 0.0, defaultShapeMix = 0.0},
	["ageing"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["eye_color"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["eye_opening"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["eyebrows"] = {item = -1, texture = 1, defaultItem = -1, defaultTexture = 1},
	["eyebrown_high"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["eyebrown_forward"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["neck_thikness"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["jaw_bone_width"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_0"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_1"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_2"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_3"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_4"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["nose_5"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["chimp_hole"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["chimp_bone_width"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["chimp_bone_lowering"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["chimp_bone_lenght"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["cheek_1"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["cheek_2"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["cheek_3"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["jaw_bone_back_lenght"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["lips_thickness"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["moles"] = {item = 0, texture = 0, defaultItem = -1, defaultTexture = 0},
	["blush"] = {item = -1, texture = 1, defaultItem = -1, defaultTexture = 1},
	["lipstick"] = {item = -1, texture = 1, defaultItem = -1, defaultTexture = 1},
	["makeup"] = {item = -1, texture = 1, defaultItem = -1, defaultTexture = 1},
	["hair"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["beard"] = {item = -1, texture = 1, defaultItem = -1, defaultTexture = 1},
	
	["ear"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["arms"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["decals"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["accessory"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["hat"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["glass"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["mask"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["shoes"] = {item = 0, texture = 0, defaultItem = 1, defaultTexture = 0},
	["t-shirt"] = {item = 0, texture = 0, defaultItem = 1, defaultTexture = 0},
	["bracelet"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["watch"] = {item = -1, texture = 0, defaultItem = -1, defaultTexture = 0},
	["torso2"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["bag"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["vest"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
	["pants"] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0},
}