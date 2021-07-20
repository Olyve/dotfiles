require("lsp.tsserver")
require("lsp.sumneko")

-- Basic setups with no custom config
require "lspconfig".jsonls.setup {}
require "lspconfig".dockerls.setup {}
require "null-ls".setup {}
