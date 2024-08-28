require "nvchad.options"

local opt = vim.opt
local g = vim.g
local api = vim.api
local cmd = vim.cmd
local filetype = vim.filetype

g.vim_markdown_folding_disabled = 1
opt.scrolloff = 999
opt.whichwrap = "b,s"
opt.wrap = false
opt.conceallevel = 1

filetype.add { extension = { sclin = "sclin" } }

-- cmd [[cab cc CodeCompanion]]
-- cmd [[cab ccb CodeCompanionWithBuffers]]
