-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font("MesloLGS NF")
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = { bottom = 0 }

local plainLayer = {
	source = {
		Gradient = {
			orientation = "Vertical",
			colors = {
				"#24283b", -- bg
				"#1f2335", -- bg_dark
				-- "#1b1e2d", -- bg_dark1
			},
		},
	},
	width = "100%",
	height = "100%",
	opacity = 1,
}

local solidLayer = {
	source = {
		Gradient = {
			orientation = "Vertical",
			colors = {
				"#24283b", -- bg
				"#1f2335", -- bg_dark
				-- "#1b1e2d", -- bg_dark1
			},
		},
	},
	width = "100%",
	height = "100%",
	opacity = 0.95,
}

local imageLayer = {
	source = {
		File = "/Users/louie/wallpaper.jpg",
	},
	repeat_x = "NoRepeat",
	opacity = 0.04,
}

local background = {
	solidLayer,
	imageLayer,
}

config.background = background

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.background or #overrides.background == 2 then
		overrides.background = { plainLayer }
	else
		overrides.background = { solidLayer, imageLayer }
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "B",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}

return config
