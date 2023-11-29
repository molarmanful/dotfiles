local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local cfg = {}

if wezterm.config_builder then
	cfg = wezterm.config_builder()
end

cfg.default_domain = "WSL:Ubuntu-22.04"
cfg.webgpu_power_preference = "HighPerformance"
cfg.use_dead_keys = false
cfg.scrollback_lines = 5000

cfg.color_scheme = "Mathias (Gogh)"
cfg.colors = {
	tab_bar = {
		background = "#000000",
	},
}
cfg.use_fancy_tab_bar = false

local font = function(fam, size, scale)
	local f = fam
	if type(fam) == "table" then
		f = { family = fam[1], weight = "Medium" }
	end
	cfg.font = wezterm.font_with_fallback({ f, { family = "Symbols Nerd Font", scale = scale } })
	cfg.font_size = size
end

font({ "scientifica" }, 8, 0.7)
font({ "TamzenForPowerline" }, 9, 0.8)
font({ "CozetteVector" }, 9.4, 0.7)
font("Greybeard 11px", 8, 0.8)
-- cfg.cell_width = 0.5
-- cfg.line_height = 1.2
-- cfg.freetype_load_flags = "NO_HINTING"
-- cfg.freetype_load_target = "Mono"

cfg.disable_default_key_bindings = true
cfg.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
cfg.keys = {
	{ key = "Backspace", mods = "CTRL", action = act.SendString("\x17") },
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },

	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "H", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "J", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "K", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "LEADER", action = act.SpawnWindow },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "s", mods = "LEADER|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "LEADER|CTRL", action = act.SpawnWindow },
	{ key = "w", mods = "LEADER|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "x", mods = "LEADER|CTRL", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "t", mods = "LEADER|CTRL", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },
}

wezterm.on("gui-startup", function()
	local window = mux.spawn_window({})
	window:fullscreen()
end)

return cfg
