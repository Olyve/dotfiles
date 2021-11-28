--local g = vim.g
--local tree_cb = require "nvim-tree.config".nvim_tree_callback

-- Setup
require "nvim-tree".setup {
  open_on_setup = true,
  auto_close = false,
  hijack_cursor = true,
  update_cwd = true,
  view = {
    auto_resize = false,
    side = "left",
    width = 35
  },
  filters = {
    custom = {
      "node_modules",
      ".git"
    }
  }
}
