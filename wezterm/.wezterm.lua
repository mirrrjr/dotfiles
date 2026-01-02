-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", italic = false })
config.color_scheme = "Firefly Traditional"
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 1,
	top = 1,
	right = 1,
	bottom = 0,
}

-- Finally, return the configuration to wezterm:
return config
