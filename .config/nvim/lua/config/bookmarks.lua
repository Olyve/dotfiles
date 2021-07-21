local utils = require("utils")
local map = utils.map
local unmap = utils.unmap

local M = {}

M.BookmarkMapKeys = function()
  map("n", "mm", ":BookmarkToggle<cr>")
end

M.BookmarkUnmapKeys = function()
  unmap("n", "mm")
end

return M
