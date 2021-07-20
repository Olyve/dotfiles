local utils = require("utils")

-- Remap ';' to be used for commands to eliminate extra shift press
utils.map("n", ";", ":")
utils.map("n", ":", ";")
utils.map("v", ";", ":")
utils.map("v", ":", ";")

-- Pane navigation made easier
utils.map("n", "<leader>j", "<c-W><c-J>")
utils.map("n", "<leader>k", "<c-W><c-K>")
utils.map("n", "<leader>l", "<c-W><c-L>")
utils.map("n", "<leader>h", "<c-W><c-H>")

-- Faster buffer saving
utils.map("n", "<Leader>ss", ":w<cr>")

-- Shortcut for reloading init.lua
utils.map("n", "<Leader>sp", ":luafile ~/.config/nvim/init.lua<cr>", {silent = true})

-- Open the NERDTree file tree
utils.map("n", "<leader>nt", ":NERDTreeToggle<cr>", {silent = true})

-- Open FZF in the current directory
utils.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- GoTo code navigation
utils.map("n", "<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", {silent = true})
utils.map("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {silent = true})
utils.map("n", "<leader>gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", {silent = true})
utils.map("n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {silent = true})

-- Use K to show documentation in the preview window
utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {silent = true})

-- Symbol renaming
utils.map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", {silent = true})

-- Quick Fix
utils.map("n", "<leader>qf", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {silent = true})
utils.map("v", "<leader>qf", "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", {silent = true})

-- LSP Diagnostics
utils.map("n", "<leader>gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", {silent = true})
utils.map("n", "<leader>gp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", {silent = true})
utils.map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", {silent = true})

-- Formatting
utils.map("n", "<leader>fr", "<cmd>lua vim.lsp.buf.formatting()<cr>", {silent = true})

-- Use Tab and S-Tab to navigate popup window
utils.map("i", "<tab>", "v:lua.tab_complete()", {expr = true, silent = true})
utils.map("s", "<tab>", "v:lua.tab_complete()", {expr = true, silent = true})
utils.map("i", "<s-tab>", "v:lua.s_tab_complete()", {silent = true})
utils.map("s", "<s-tab>", "v:lua.s_tab_complete()", {silent = true})

-- Telescope Integrations
utils.map("n", "<leader>ts", ":Telescope tmux sessions<cr>", {silent = true})

-- Modify behavior of Enter when popup window is visible to work like <c-Y>
-- and select the highlighted option (should prevent the extra return being inserted)
--utils.map('i', '<cr>', 'v:lua.modify_enter_mapping()', { expr = true })

-- Add space above or below current line
utils.map("n", "<leader>lb", "mpo<esc>`p")
utils.map("n", "<leader>la", "mpO<esc>`p")

-- Buffer closing shortcuts using :Bdelete
utils.map("n", "<leader>bdo", ":Bdelete other<cr>")
utils.map("n", "<leader>bdh", ":Bdelete hidden<cr>")

-- Clear highlighting
utils.map("n", "<leader>nh", ':let @/ = ""<cr>', {silent = true})

-- Toggle Vista sidebar & open Vista FZF search
utils.map("n", "<leader>vt", ":Vista!!<cr>")
utils.map("n", "<leader>vf", ":Vista finder<cr>")
