local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = {"src/parser.c"},
    branch = "main"
  }
}

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {} -- list of languages to disable highlighting
  }
}
