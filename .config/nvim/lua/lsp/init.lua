require("lsp.tsserver")
require("lsp.sumneko")
require("lsp.compe")
require("lsp.formatter")

-- Basic setups with no custom config
require "lspconfig".jsonls.setup {}
require "lspconfig".dockerls.setup {}
require "null-ls".setup {}

require "telescope".setup {
  defaults = {
    file_ignore_patterns = {
      "*.png",
      "*.jpg"
    }
  }
}

