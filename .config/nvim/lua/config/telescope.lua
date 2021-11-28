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
    },
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*", "*/node_modules/*", "*/undodir/*"},
      workspaces = {
        ["conf"] = "/home/sam/.config/nvim",
        ["linos"] = "/home/workspace/linos-backend",
        ["paysplit"] = "/home/workspace/paysplit-for-creators-backend"
      }
    }
  }
}

-- require "telescope".load_extension("mapper")
require "telescope".load_extension("vim_bookmarks")
require "telescope".load_extension("frecency")
require "telescope".load_extension("media_files")
