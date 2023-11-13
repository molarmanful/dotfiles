local cmp = require "cmp"
local opts = require "plugins.configs.cmp"

vim.list_extend(opts.sources, { { name = "copilot" }, { name = "conjure" } })

for k, v in pairs {
  ["<Tab>"] = cmp.mapping.confirm(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<S-Tab>"] = cmp.config.disable,
  ["<CR>"] = cmp.config.disable,
} do
  opts.mapping[k] = v
end

opts.sorting = {
  priority_weight = 2,
  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    require("copilot_cmp.comparators").prioritize,
    cmp.config.compare.score,
    cmp.config.compare.recently_used,
    cmp.config.compare.locality,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
}

cmp.setup(opts)
