local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu-22.04"
-- config.color_scheme = 'AdventureTime'

wezterm.on("gui-startup", function()
	local window = mux.spawn_window({})
	window:gui_window():fullscreen()
end)

return config
