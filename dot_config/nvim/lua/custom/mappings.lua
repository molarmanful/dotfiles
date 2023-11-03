local M = {}

local esc = { "<ESC>", "Escape insert mode", opts = { nowait = true } }

M.disabled = {}

M.neogit = {

  n = {
    ["<leader>go"] = {
      function()
        require("neogit").open()
      end,
      "Open neogit",
    },
  },
}

M.telescope = {

  n = {
    ["<leader>fs"] = { "<cmd> Telescope persisted <CR>", "Find symbol" },
    ["<leader>fx"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find session" },
  },
}

M.general = {

  n = {
    ["<BS>"] = { "<cmd> let @/ = '' <CR>", "Clear /" },
  },

  i = {
    ["jk"] = esc,
    ["kj"] = esc,
  },

  v = {
    [">"] = { ">gv", "Indent" },
    ["<"] = { "<gv", "Dedent" },
  },
}

return M
