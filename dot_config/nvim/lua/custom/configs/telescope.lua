local telescope = require "telescope"

telescope.setup {
  defaults = {
    border = false,
  },
}

telescope.load_extension "fzf"
telescope.load_extension "persisted"
