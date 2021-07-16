require('lsp.tsserver')
require('lsp.sumneko')
require('lsp.compe')

-- Basic setups with no custom config
require'lspconfig'.jsonls.setup{}
require'lspconfig'.dockerls.setup{}
require'null-ls'.setup{}
