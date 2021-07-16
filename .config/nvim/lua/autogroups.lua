local utils = require('utils')
local definitions = {}

definitions['nerd_tree'] = {
  "StdinReadPre * let s:std_id=1",
  -- automatically open NERDTree when vim starts
  "VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif",
  -- Prevent other buffers from replacing NERDTree in its window
  [[BufEnter * if bufname('#') =~ 'NERD_tree\d\+' && bufname('%') !~ 'NERD_tree\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 'normal! \<c-W>w' | execute 'buffer'.buf | endif]],
  -- Exit Vim if NERDTree is the only window left
  [[BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
}
definitions['lsp']= {
  "CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics()"
}
utils.nvim_create_augroups(definitions)
