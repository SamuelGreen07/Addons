-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, plugin	= ...
-- ----------------------------------------------------------------------------
plugin.defaults = {
	profile = {
		icon_scale = 1.0,
		icon_alpha = 1.0,
		completed = false,
	},
}

plugin.options = {
    type = "group",
    name = FOLDER_NAME:gsub("HandyNotes_", ""),
    get = function(info) return plugin.db[info[#info]] end,
    set = function(info, v)
        plugin.db[info[#info]] = v
        plugin.HL:SendMessage("HandyNotes_NotifyUpdate", FOLDER_NAME:gsub("HandyNotes_", ""))
    end,
    args = {
        icon = {
            type = "group",
            name = "Icon settings",
            inline = true,
            args = {
                desc = {
                    name = "These settings control the look and feel of the icon.",
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = "Icon Scale",
                    desc = "The scale of the icons",
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = "Icon Alpha",
                    desc = "The alpha transparency of the icons",
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
            },
        },
    },
}