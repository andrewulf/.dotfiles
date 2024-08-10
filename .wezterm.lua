-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font('GeistMono NF', { weight = 600, italic = false })
config.font_size = 15


-- hide tab  and titlebar
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 400
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- For example, changing the color scheme:
config.force_reverse_video_cursor = true
-- config.color_scheme = 'Atelier Dune (base16)'

config.colors = {
  cursor_bg = "#a277ff",
  cursor_border = "#a277ff",
  cursor_fg = "#a277ff",
  foreground = "#edecee",
  selection_bg = "#29263c",
  selection_fg = "#edecee",
  scrollbar_thumb = '#6d6d6d',
  background = "#141516",


  brights = {
    '#6d6d6d',
    '#ff6767',
    '#61ffca',
    '#ffca85',
    '#a277ff',
    '#a277ff',
    '#61ffca',
    '#edecee',
  },

  ansi = {
    "#15141b",
    "#ff6767",
    '#61ffca',
    '#ffca85',
    '#a277ff',
    '#a277ff',
    '#61ffca',
    '#edecee',
  },
}

-- BACKGROUND TRANSPARENCY AND WALLPAPER
config.window_background_image = '/Users/prozod/backgrounds/lonegirl.png'
config.window_background_image_hsb = {
  brightness = 0.02,
}

--keybinds
config.keys = {
  { key = "h", mods = "CTRL", action = wezterm.action { SendString = "\x1bb" } },
  { key = "l", mods = "CTRL", action = wezterm.action { SendString = "\x1bf" } },
}

-- and finally, return the configuration to wezterm
return config
