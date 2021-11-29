local api = vim.api
local map = api.nvim_set_keymap
local wk = require "which-key"

-- Buffer
wk.register(
  {
    b = {
      name = "buffer",
      d = {
        name = "delete",
        o = {":Bdelete other<cr>", "Delete open buffers, except current"},
        h = {":Bdelete hidden<cr>", "Delete hidden buffers"}
      }
    }
  },
  {prefix = "<leader>"}
)

-- File
wk.register(
  {
    f = {
      name = "file",
      b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffer"},
      f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "Find file"},
      m = {":Format<cr>", "Format current file using LSP"},
      r = {":Telescope frecency<cr>", "Search Frecent files"}
    }
  },
  {prefix = "<leader>"}
)

-- Line
wk.register(
  {
    l = {
      name = "line",
      a = {"mpO<esc>`p", "Add an empty line above"},
      b = {"mpo<esc>`p", "Add an empty line below"}
    }
  },
  {prefix = "<leader>"}
)

-- Marks
wk.register(
  {
    m = {
      name = "marks",
      m = {":BookmarkToggle<cr>", "Toggle bookmark"}
    }
  },
  {prefix = "<leader>"}
)

-- Nvim Tree
wk.register(
  {
    n = {
      name = "nvim tree",
      t = {":NvimTreeToggle<cr>", "Toggle NvimTree"}
    }
  },
  {prefix = "<leader>"}
)

-- Utilities
wk.register(
  {
    ["ss"] = {":w<cr>", "Save current buffer"},
    ["pg"] = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live grep cwd"},
    ["K"] = {"<cmd>lua vim.lsp.buf.hover({focusable=false})<cr>", "Show LSP documentation for symbol"}
  },
  {prefix = "<leader>"}
)

---- LSP Keymaps ----

map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", {noremap = true, silent = true})
map(
  "n",
  "<leader>gn",
  "<cmd>lua vim.lsp.diagnostic.goto_next({focusable = false})<cr>",
  {noremap = true, silent = true}
)
map(
  "n",
  "<leader>gp",
  "<cmd>lua vim.lsp.diagnostic.goto_prev({focusable = false})<cr>",
  {noremap = true, silent = true}
)

---- Movement Keymaps ----

map("n", "<leader>j", "<c-W><c-J>", {noremap = true})
map("n", "<leader>k", "<c-W><c-K>", {noremap = true})
map("n", "<leader>l", "<c-W><c-L>", {noremap = true})
map("n", "<leader>h", "<c-W><c-H>", {noremap = true})

---- Telescope (and Extensions) Keymaps ----

map("n", "<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", {noremap = true, silent = true})
map("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {noremap = true, silent = true})
map(
  "n",
  "<leader>gi",
  "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>",
  {noremap = true, silent = true}
)
map("n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {noremap = true, silent = true})
map("n", "<leader>qf", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {noremap = true, silent = true})
map(
  "v",
  "<leader>qf",
  "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>",
  {noremap = true, silent = true}
)
map("n", "<leader>ts", ":Telescope tmux sessions<cr>", {noremap = true, silent = true})
map("n", "<leader>ma", ":Telescope vim_bookmarks all<cr>", {noremap = true, silent = true})
map("n", "<leader>mf", ":Telescope vim_bookmarks current_file<cr>", {noremap = true, silent = true})
map("n", "<leader>fr", ":Telescope frecency<cr>", {noremap = true, silent = true})
map("n", "<leader>gcb", ":Telescope git_branches<cr>", {noremap = true, silent = true})
map("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find<cr>", {noremap = true, silent = true})
map("n", "<leader>km", ":Telescope mapper<cr>", {noremap = true, silent = true})

---- Terminal Keymaps ----

map("t", "<c-space>", "<c-\\><c-n>", {noremap = true})
map("n", "<leader>to", ":vsplit | :vertical resize -50 | term<cr>", {noremap = true, silent = true})

---- Utils Keymaps ----

-- map("n", "<leader>ss", ":w<cr>", {noremap = true, silent = true})
map("n", "<Leader>sp", ":luafile ~/.config/nvim/init.lua<cr>", {noremap = true, silent = true})
map("i", "<tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
map("s", "<tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
map("i", "<s-tab>", "v:lua.s_tab_complete()", {noremap = true, silent = true})
map("s", "<s-tab>", "v:lua.s_tab_complete()", {noremap = true, silent = true})
map("n", "<leader>nh", ':let @/ = ""<cr>', {noremap = true, silent = true})
