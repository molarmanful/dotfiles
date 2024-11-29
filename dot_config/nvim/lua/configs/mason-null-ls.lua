return function(fmts)
  return function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting

    return {
      ensure_installed = fmts,
      automatic_installation = false,
      handlers = {
        gci = function() end,
        golines = function()
          null_ls.register(formatting.golines.with {
            generator_opts = {
              command = 'golines',
              args = { '--base-formatter', 'gci', '--', '$FILENAME' },
              to_stdin = true,
            },
          })
        end,
        prettierd = function()
          null_ls.register(formatting.prettier.with {
            extra_filetypes = { 'svelte' },
            disabled_filetypes = { 'markdown' },
          })
        end,
        gdformat = function()
          null_ls.register(formatting.gdformat.with {
            args = { '--line-length', '80' },
          })
        end,
      },
    }
  end
end
