local g = vim.g
local fn = vim.fn

g.UltiSnipsExpandTrigger = "<F12>"
g.UltiSnipsJumpForwardTrigger = "<F12>"
g.UltiSnipsJumpBackwardTrigger = "<F12>"
g.UltiSnipsSnippetDir = fn.getenv("HOME") .. "/.config/nvim/UltiSnips"
g.UltiSnipsSnippetDirectories = {
  "UltiSnips"
}
g.UltiSnipsEditSplit = "vertical"
