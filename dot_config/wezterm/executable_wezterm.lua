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
config.use_fancy_tab_bar = false
config.colors = {
	tab_bar = { background = "#000000" },
}
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Light" })
config.font_size = 8
config.cell_width = 0.8
config.use_dead_keys = false
config.scrollback_lines = 5000

config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "Backspace", mods = "CTRL", action = act.SendString("\x17") },
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },

	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "h", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER|CTRL", action = act.ActivatePaneDirection("Right") },

	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "LEADER", action = act.SpawnWindow },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },
}

wezterm.on("gui-startup", function()
	local window = mux.spawn_window({})
	window:fullscreen()
end)

return config
