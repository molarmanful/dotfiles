local M = {}

M.disabled = {}

local esc = { "<ESC>", "escape insert mode", opts = { nowait = true } }

M.neogit = {
  ["<leader>go"] = {
    function()
      require("neogit").open()
    end,
    "open neogit",
  },
}

M.abc = {

  n = {
    ["<leader>fs"] = { "<cmd> Telescope persisted <CR>", "find session" },
    ["<BS>"] = { "<cmd> let @/ = '' <CR>", "clear /" },
  },

  i = {
    ["jk"] = esc,
    ["kj"] = esc,
  },

  v = {
    [">"] = { ">gv", "indent" },
    ["<"] = { "<gv", "dedent" },
  },
}

return M
