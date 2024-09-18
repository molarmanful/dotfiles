require 'nvchad.mappings'

local set = vim.keymap.set
local del = vim.keymap.del

-- DEL

del('i', '<C-j>')
del('i', '<C-k>')

-- GENERAL

set('n', '<BS>', "<cmd> let @/ = '' <CR>", { desc = 'general Clear /' })
set('i', 'jk', '<ESC>', { desc = 'general Escape insert mode', nowait = true })
set('i', 'kj', '<ESC>', { desc = 'general Escape insert mode', nowait = true })
set('v', '>', '>gv', { desc = 'general Indent' })
set('v', '<', '<gv', { desc = 'general Dedent' })

-- NEOGIT

set('n', '<leader>go', function()
  require('neogit').open()
end, { desc = 'neogit Open neogit' })

-- TELESCOPE

set('n', '<leader>ff', '<cmd> Telescope file_browser hidden=true <CR>', { desc = 'telescope File browser' })
set(
  'n',
  '<leader>fr',
  '<cmd> Telescope file_browser hidden=true path=%:p:h <CR>',
  { desc = 'telescope File browser (relative)' }
)
set('n', '<leader>fs', '<cmd> Telescope persisted <CR>', { desc = 'telescope Find session' })
set('n', '<leader>fx', '<cmd> Telescope lsp_document_symbols <CR>', { desc = 'telescope Find LSP symbol' })
set('n', '<leader>fX', '<cmd> Telescope lsp_workspace_symbols <CR>', { desc = 'telescope Find LSP symbol' })
set('n', '<leader>q', '<cmd> Telescope diagnostics bufnr=0 <CR>', { desc = 'telescope List LSP diagnostics' })
set('n', '<leader>Q', '<cmd> Telescope diagnostics <CR>', { desc = 'telescope List LSP diagnostics' })

-- LSPCONFIG

set('n', '<leader>lf', function()
  vim.diagnostic.open_float { border = 'single' }
end, { desc = 'lspconfig Floating diagnostic' })
set('n', '[d', function()
  vim.diagnostic.goto_prev { float = { border = 'single' } }
end, { desc = 'lspconfig Goto prev' })
set('n', ']d', function()
  vim.diagnostic.goto_next { float = { border = 'single' } }
end, { desc = 'lspconfig Goto next' })

-- CODECOMPANION

-- set({ "n", "v" }, "<leader><C-a>", "<cmd> CodeCompanionActions <cr>", { desc = "codecompanion Open actions palette" })
-- set({ "n", "v" }, "<leader>a", "<cmd> CodeCompanionActions <cr>", { desc = "codecompanion Open actions palette" })
-- set("v", "ga", "<cmd> CodeCompanionAdd <cr>", { desc = "codecompanion Add visual selection to current chat buffer" })

-- DAP

set('n', '<leader>db', function()
  require('dap').toggle_breakpoint()
end, { desc = 'dap Toggle breakpoint' })
set('n', '<leader>dc', function()
  require('dap').continue()
end, { desc = 'dap Continue debugger' })
set('n', '<leader>di', function()
  require('dap').step_into()
end, { desc = 'dap Step into' })
set('n', '<leader>do', function()
  require('dap').step_over()
end, { desc = 'dap Step over' })
set('n', '<leader>dI', function()
  require('dap').step_out()
end, { desc = 'dap Step over' })
