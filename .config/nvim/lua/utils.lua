local utils = {}
local api = vim.api
local fn = vim.fn

-- Global utils

function _G.load(file)
  require("plenary.reload").reload_module(file, true)
  return require(file)
end

function _G.tab_complete()
  if fn.pumvisible() == 1 then
    return utils.t "<c-n>"
  elseif utils.check_back_space() then
    return utils.t "<tab>"
  else
    return fn["compe#complete"]()
  end
end

function _G.s_tab_complete()
  if fn.pumvisible() == 1 then
    return utils.t "<c-p>"
  else
    return utils.t "<c-h>"
  end
end

function _G.modify_enter_mapping()
  if fn.pumvisible() == 1 then
    return utils.t "<c-y>"
  else
    return utils.t "<c-g>u<cr>"
  end
end

function _G.LightlineFileFormat()
  if vim.api.nvim_win_get_width(0) > 70 and vim.api.buffer_filetype ~= "nerdtree" then
    if vim.api.buffer_filetype ~= "" then
      return "&fileformat"
    end
  else
    return ""
  end
end

function _G.LightlineFileEncoding()
  if vim.api.nvim_win_get_width(0) > 70 and vim.api.buffer_filetype ~= "nerdtree" then
    if vim.api.buffer_filetype ~= "" then
      return "&filetype"
    else
      return "no ft"
    end
  else
    return ""
  end
end

-- Utils methods

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.unmap(mode, lhs)
  api.nvim_set_keymap(mode, lhs)
end

function utils.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup " .. group_name)
    api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      api.nvim_command(command)
    end
    api.nvim_command("augroup END")
  end
end

function utils.t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function utils.check_back_space()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

return utils
