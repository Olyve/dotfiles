require("lsp.tsserver")
require("lsp.sumneko")
require("lsp.rust-analyzer")

-- Basic setups with no custom config
require "lspconfig".jsonls.setup {}
require "lspconfig".dockerls.setup {}
require "lspconfig".bashls.setup {}
-- require "null-ls".setup {}
