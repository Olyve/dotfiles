local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

require "lspconfig".tsserver.setup {
  on_attach = function(client)
    require "lsp_signature".on_attach(
      {
        bind = true,
        doc_lines = 5,
        handler_opts = {
          border = "single"
        }
      }
    )

    client.resolved_capabilities.document_formatting = false

    -- define an alias
    cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")

    -- format on save
    cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")

    -- show source in diagnostics (ex. typescript | eslint | prettier)
    lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _)
      local config = {
        underline = true,
        virtual_text = {
          prefix = "■ ",
          spacing = 4
        },
        signs = true,
        update_in_insert = false
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
  end
}
