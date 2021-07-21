require "telescope".setup {
  defaults = {
    file_ignore_patterns = {
      "*.png",
      "*.jpg"
    }
  },
  extensions = {
    media_files = {
      filetypes = {"png", "jpg", "jpeg", "pdf"},
      find_cmd = "rg"
    }
  }
}
require("telescope").load_extension("vim_bookmarks")
require "telescope".load_extension("frecency")
