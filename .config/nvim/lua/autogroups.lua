local utils = require('utils')
local definitions = {}

definitions['nerd_tree'] = {
  "StdinReadPre * let s:std_in=1",
  -- automatically open NERDTree when vim starts
  "VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif",
  -- Prevent other buffers from replacing NERDTree in its window
  [[BufEnter * if bufname('#') =~ 'NERD_tree\d\+' && bufname('%') !~ 'NERD_tree\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 'normal! \<c-W>w' | execute 'buffer'.buf | endif]],
  -- Exit Vim if NERDTree is the only window left
  [[BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
}
utils.nvim_create_augroups(definitions)
