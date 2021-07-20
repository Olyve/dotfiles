local utils = require("utils")
local map = utils.map

---- Builtin Remaps ----

-- Remap ';' to be used for commands to eliminate extra shift press
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- Pane navigation made easier
map("n", "<leader>j", "<c-W><c-J>")
map("n", "<leader>k", "<c-W><c-K>")
map("n", "<leader>l", "<c-W><c-L>")
map("n", "<leader>h", "<c-W><c-H>")

-- Faster buffer saving
map("n", "<Leader>ss", ":w<cr>")

-- Shortcut for reloading init.lua
map("n", "<Leader>sp", ":luafile ~/.config/nvim/init.lua<cr>", {silent = true})

-- Use K to show documentation in the preview window
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {silent = true})

-- Symbol renaming
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", {silent = true})

-- LSP Diagnostics
map("n", "<leader>gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", {silent = true})
map("n", "<leader>gp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", {silent = true})
map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", {silent = true})

-- Use Tab and S-Tab to navigate popup window
map("i", "<tab>", "v:lua.tab_complete()", {expr = true, silent = true})
map("s", "<tab>", "v:lua.tab_complete()", {expr = true, silent = true})
map("i", "<s-tab>", "v:lua.s_tab_complete()", {silent = true})
map("s", "<s-tab>", "v:lua.s_tab_complete()", {silent = true})

-- Add space above or below current line
map("n", "<leader>lb", "mpo<esc>`p")
map("n", "<leader>la", "mpO<esc>`p")

-- Buffer closing shortcuts using :Bdelete
map("n", "<leader>bdo", ":Bdelete other<cr>")
map("n", "<leader>bdh", ":Bdelete hidden<cr>")

-- Clear highlighting
map("n", "<leader>nh", ':let @/ = ""<cr>', {silent = true})

---- Plugin Mappings ----

-- NERDTree
map("n", "<leader>nt", ":NERDTreeToggle<cr>", {silent = true})

-- Vim-Bookmarks
map("n", "<leader>mm", ":BookmarkToggle<cr>", {silent = true})

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", {silent = true})
map("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {silent = true})
map("n", "<leader>gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", {silent = true})
map("n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {silent = true})
map("n", "<leader>qf", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {silent = true})
map("v", "<leader>qf", "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", {silent = true})
map("n", "<leader>ts", ":Telescope tmux sessions<cr>", {silent = true})
map("n", "<leader>ma", ":Telescope vim_bookmarks all<cr>", {silent = true})
map("n", "<leader>mf", ":Telescope vim_bookmarks current_file<cr>", {silent = true})

-- Compe
map("i", "<c-space>", "compe#confirm()", {expr = true, silent = true})
map("i", "<cr>", "compe#confirm('<cr>')", {expr = true, silent = true})
map("i", "<c-e>", "compe#close('<c-e>')", {expr = true, silent = true})

-- Formatter
map("n", "<leader>fr", ":Format<cr>", {silent = true})

-- Vista
map("n", "<leader>vt", ":Vista!!<cr>")
map("n", "<leader>vf", ":Vista finder<cr>")
