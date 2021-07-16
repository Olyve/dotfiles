local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    require 'lsp_signature'.on_attach({
      bind = true,
      doc_lines = 5,
      handler_opts = {
        border = 'single'
      }
    })

    client.resolved_capabilities.document_formatting = false

    -- define an alias
    cmd('command -buffer Formatting lua vim.lsp.buf.formatting()')

    -- format on save
    cmd('autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()')

    -- show source in diagnostics (ex. typescript | eslint | prettier)
    lsp.handlers['textDocument/publishDiagnostics'] = function(_, _, params, client_id, _)
      local config = {
        underline = true,
        virtual_text = {
          prefix = '■ ',
          spacing = 4,
        },
        signs = true,
        update_in_insert = false,
      }
      local uri = params.uri
      local bufnr = vim.uri_to_bufnr(uri)

      if not bufnr then
        return
      end

      local diagnostics = params.diagnostics

      for i, v in ipairs(diagnostics) do
        diagnostics[i].message = string.format("%s: %s", v.source, v.message)
      end

      lsp.diagnostic.save(diagnostics, bufnr, client_id)

      if not api.nvim_buf_is_loaded(bufnr) then
        return
      end

      lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
    end

    -- local ts_utils = require('nvim-lsp-ts-utils')
    -- ts_utils.setup {
    --   debug = false,
    --   disable_commands = false,
    --   enable_import_on_completion = true,

    --   -- eslint
    --   eslint_enable_code_actions = true,
    --   eslint_enable_disable_comments = true,
    --   eslint_bin = 'eslint',
    --   eslint_enable_diagnostics = true,

    --   -- formatting
    --   enable_formatting = true,
    --   formatter = 'prettier',

    --   -- update imports on file move
    --   update_imports_on_move = true,
    -- }

    -- -- required to fix code action ranges
    -- ts_utils.setup_client(client)
  end,
}
