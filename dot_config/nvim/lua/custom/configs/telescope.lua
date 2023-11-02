local telescope = require "telescope"

telescope.setup {
  extensions = {
    fzf = {},
  },
}

telescope.load_extension "fzf"
telescope.load_extension "persisted"
