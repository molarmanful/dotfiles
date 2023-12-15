local M = {}

local esc = { "<ESC>", "Escape insert mode", opts = { nowait = true } }

M.disabled = {

  i = {
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

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
    ["<leader>ff"] = { "<cmd> Telescope file_browser hidden=true <CR>", "File browser" },
    ["<leader>fs"] = { "<cmd> Telescope persisted <CR>", "Find session" },
    ["<leader>fx"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find LSP symbol" },
    ["<leader>fX"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Find LSP symbol" },
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Find LSP definitions" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Find LSP references" },
    ["<leader>q"] = { "<cmd> Telescope diagnostics bufnr=0 <CR>", "List LSP diagnostics" },
    ["<leader>Q"] = { "<cmd> Telescope diagnostics <CR>", "List LSP diagnostics" },
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

M.lspconfig = {

  n = {
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "single" }
      end,
      "Floating diagnostic",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "single" } }
      end,
      "Goto prev",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "single" } }
      end,
      "Goto next",
    },
  },
}

return M
