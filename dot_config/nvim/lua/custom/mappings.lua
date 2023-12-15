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
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

return M
