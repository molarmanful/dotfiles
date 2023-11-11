local opt = vim.opt
local g = vim.g
local api = vim.api
local cmd = vim.cmd
local filetype = vim.filetype

opt.scrolloff = 999
opt.whichwrap = "b,s"
opt.wrap = false

filetype.add { extension = { sclin = "sclin" } }
