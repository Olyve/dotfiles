require "formatter".setup {
  logging = false,
  filetype = {
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end,
      -- linter
      function()
        return {
          exe = "eslint",
          args = {
            "--stdin-filename",
            vim.api.nvim_buf_get_name(0),
            "--fix",
            "--cache"
          },
          stdin = false
        }
      end
    },
    json = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }
  }
}
