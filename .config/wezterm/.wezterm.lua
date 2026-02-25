-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

local function read_file(path)
	local f = io.open(path, "r")
	if not f then
		return nil
	end
	local s = f:read("*l")
	f:close()
	return s
end

local scheme = read_file(os.getenv("HOME") .. "/.local/share/tinted-theming/tinty/artifacts/current_scheme")
-- The config for wezterm

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = "Catppuccin Mocha"

config.window_frame = {
	-- The font used in the tab bar.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 9.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}

-- Window padding styling
config.window_padding = {
	left = 3,
	right = 3,
	top = 0,
	bottom = 1,
}

-- Inactive pane styling
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.6,
}

-- Attach an image to the background of the wezterm window, uncomment below.
-- config.window_background_image = '/path/to/wallpaper.jpg'

-- config.window_background_image_hsb = {
-- brightness = 0.3,
-- hue = 1.0,
-- saturation = 1.0,
-- }

-- config.window_background_gradient = {
--   colors = { '#1d2021', '#323027' },
--   orientation = {
--     Radial = {
--       -- Specifies the x coordinate of the center of the circle,
--       -- in the range 0.0 through 1.0.  The default is 0.5 which
--       -- is centered in the X dimension.
--       cx = 0.75,
--
--       -- Specifies the y coordinate of the center of the circle,
--       -- in the range 0.0 through 1.0.  The default is 0.5 which
--       -- is centered in the Y dimension.
--       cy = 0.75,
--
--       -- Specifies the radius of the notional circle.
--       -- The default is 0.5, which combined with the default cx
--       -- and cy values places the circle in the center of the
--       -- window, with the edges touching the window edges.
--       -- Values larger than 1 are possible.
--       radius = 1.25,
--     },
--   },
-- }

-- Background opacity
config.window_background_opacity = 1.0

-- Text background opacity
config.text_background_opacity = 0.5

-- Spawn a fish shell in login mode
-- config.default_prog = { '/usr/local/bin/fish', '-l' }

-- Launching a different program as a one off via the CLI
-- wezterm start -- vim ~/.wezterm.lua
config.font = wezterm.font("Fira Code")
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })

-- Key Binding

-- Finally, return the configuration to wezterm:
return config
