local lsps = {
  'lua_ls',
  'html',
  'svelte',
  'unocss',
  'eslint',
  'bashls',
  'marksman',
  'rust_analyzer',
  'stylelint_lsp',
  'dockerls',
  'yamlls',
  'tailwindcss',
  'unocss',
  'hls',
  'gopls',
  'clangd',
  'clojure_lsp',
  'perlnavigator',
  'markdown_oxide',
  'vtsls',
  'emmet_language_server',
  'nil_ls',
}

local fmts = {
  'prettierd',
  'black',
  'pylint',
  'stylua',
  'fixjson',
  'markdownlint',
  'shfmt',
  'sqlfmt',
  'gitsigns',
  'shellharden',
  'yamllint',
  'yamlfix',
  'gci',
  'golines',
  'hadolint',
  'zprint',
  'clang-format',
  'actionlint',
  'fourmolu',
  'perlimports',
  'perltidy',
  'gdtoolkit',
  'nixfmt',
  'statix',
  'deadnix',
}

local syns = {
  'vim',
  'lua',
  'html',
  'css',
  'javascript',
  'typescript',
  'tsx',
  'json',
  'svelte',
  'c',
  'go',
  'zig',
  'scala',
  'haskell',
  'perl',
  'markdown',
  'markdown_inline',
  'toml',
  'yaml',
  'rust',
  'bash',
  'java',
  'clojure',
  'fish',
  'comment',
  'gdscript',
  'nix',
}

local daps = {
  'js',
  'firefox',
  'delve',
  'python',
  'haskell',
}

return {

  { 'mfussenegger/nvim-lint', enabled = false },
  { 'stevearc/conform.nvim',  enabled = false },

  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {},
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('nvchad.configs.lspconfig').defaults()
      require 'configs.lspconfig' (lsps)
    end,
  },

  {
    'nvimtools/none-ls.nvim',
    config = function()
      require 'configs.null-ls'
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    opts = require 'configs.mason-null-ls' (fmts),
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mxsdev/nvim-dap-vscode-js',
      'leoluz/nvim-dap-go',
      'mfussenegger/nvim-dap-python',
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        },
      },
    },
    -- config = function()
    --   require "configs.dap"
    -- end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      ensure_installed = daps,
    },
  },

  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    ft = { 'scala', 'sbt', 'java' },
    config = require 'configs.nvim-metals',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = syns,
      indent = {
        disable = { 'markdown' },
      },
    },
    config = function(_, opts)
      require 'configs.treesitter' (opts)
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    opts = {},
  },

  {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'configs.cmp'
    end,
  },

  {
    'olimorris/persisted.nvim',
    priority = 100,
    lazy = false,
    opts = {
      use_git_branch = true,
      autoload = true,
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    opts = require 'configs.telescope',
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = true,
  },

  {
    'ggandor/leap.nvim',
    lazy = false,
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  {
    'ggandor/flit.nvim',
    lazy = false,
    opts = {},
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
    },
    config = true,
  },

  {
    'NvChad/nvterm',
    opts = {
      behavior = {
        auto_insert = false,
      },
    },
  },

  {
    'gpanders/nvim-parinfer',
    ft = { 'clojure', 'scheme', 'lisp' },
  },

  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'python' },
    dependencies = {
      'PaterJason/cmp-conjure',
    },
    config = function()
      require('conjure.main').main()
      require('conjure.mapping')['on-filetype']()
    end,
  },

  {
    'lukas-reineke/headlines.nvim',
    ft = { 'markdown', 'rmd', 'norg', 'org' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },

  {
    'preservim/vim-markdown',
    ft = { 'markdown' },
    branch = 'master',
  },

  {
    'lambdalisue/vim-suda',
    lazy = false,
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      workspaces = {
        {
          name = '0',
          path = '~/obsidian/0',
        },
      },
      disable_frontmatter = true,
    },
  },
}
