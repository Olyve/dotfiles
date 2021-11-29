local g = vim.g

g.minimap_auto_start = 1
g.minimap_auto_start_win_enter = 1
g.minimap_width = 10
g.minimap_block_filetypes = {
  "fugitive",
  "nvimtree",
  "gitcommit"
}
g.minimap_block_buftypes = {
  "nofile",
  "nowrite",
  "quickfix",
  "terminal",
  "prompt"
}
g.minimap_close_filetypes = {
  "startify",
  "netrw",
  "packer"
}
