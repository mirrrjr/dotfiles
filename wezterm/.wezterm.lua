local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "f",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.font_size = 10
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", italic = false })
config.color_scheme = "Firefly Traditional"
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	top = 0,
	right = 0,
	bottom = 0,
}

config.line_height = 0.90
config.cell_width = 1.0

config.font_size = 10.0

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.underline_position = -2

-- Finally, return the configuration to wezterm:
return config
