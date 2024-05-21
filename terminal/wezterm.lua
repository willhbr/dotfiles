local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = false
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'Fira Code'
config.font_size = 11
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.bold_brightens_ansi_colors = false

config.scrollback_lines = 0
config.visual_bell = {
  fade_in_duration_ms = 0,
  fade_out_duration_ms = 0,
}

config.colors = {
  foreground = '#f4f4f4',
  background = '#2b2b2b',

  cursor_bg = '#c7c7c7',
  cursor_fg = '#000000',

  selection_fg = '#f4f4f4',
  selection_bg ='#464c91',

  ansi = {
    -- black
    '#000000',
    -- red
    '#c85752',
    -- green
    '#7cb083',
    -- yellow
    '#c9c895',
    -- blue
    '#74b2ca',
    -- magenta
    '#8787dd',
    -- cyan
    '#7cc1cb',
    -- white
    '#d8d8d8',
  },
  brights = {
    -- black
    '#676767',
    -- red
    '#e37878',
    -- green
    '#afd2b6',
    -- yellow
    '#dddebe',
    -- blue
    '#b0dbe7',
    -- magenta
    '#afb2e9',
    -- cyan
    '#abe4ea',
    -- white
    '#f8f8f8',
  }
}

return config
