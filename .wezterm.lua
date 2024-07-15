local wezterm = require 'wezterm'
local config = {}
config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font 'RecMonoDuotone'
config.font_size = 10.0
config.line_height = 1.0
config.window_background_opacity = 0.80

config.hide_tab_bar_if_only_one_tab = true
config.keys = {
    { 
        key = 'PageUp',
        mods = 'CTRL',
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = 'PageDown',
        mods = 'CTRL',
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = 'T',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.DisableDefaultAssignment,
    },
}

config.default_prog = { '/usr/bin/fish' }

return config
