local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu-22.04"
config.webgpu_power_preference = "HighPerformance"
config.color_scheme = "rose-pine"
config.colors = {
	tab_bar = { background = "#000000" },
}
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Light" })
config.font_size = 8
config.cell_width = 0.8

config.keys = {
	{ key = "Backspace", mods = "CTRL", action = act.SendString("\x17") },
}

wezterm.on("gui-startup", function()
	local window = mux.spawn_window({})
	window:fullscreen()
end)

return config
