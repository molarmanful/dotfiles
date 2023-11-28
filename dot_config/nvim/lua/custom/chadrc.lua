local M = {}

function GenBase(m)
  m.statusline_bg = m.black2
  m.lightbg = m.one_bg2
  return {
    base_16 = {
      base00 = m.black,
      base01 = m.one_bg,
      base02 = m.one_bg2,
    },
    base_30 = m,
  }
end

M.ui = {
  changed_themes = {
    ["bearded-arc"] = GenBase {
      black = "#000000",
      darker_black = "#07080d",
      black2 = "#0e101a",
      one_bg = "#151826",
      one_bg2 = "#1c2033",
      one_bg3 = "#232840",
    },
  },
  theme = "bearded-arc",
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
