local wezterm = require 'wezterm'

local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

return {
    colors = theme.colors(),
    window_frame = theme.window_frame(), -- needed only if using fancy tab bar
    window_background_opacity = 0.8,
    font = wezterm.font 'Hack Nerd Font Mono',
    font_size = 9,
    enable_tab_bar = false,
    window_decorations = "NONE",
    front_end = "WebGpu",
    max_fps = 120,
}
