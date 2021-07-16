local api,fn = vim.api,vim.fn

-- Lua LSP Setup
local system_name
if fn.has('mac') == 1 then
  system_name = 'macOS'
elseif fn.has('unix') == 1 then
  system_name = 'Linux'
elseif fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = fn.getenv('HOME')..'/clones/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/'..system_name..'/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require'lspconfig'.sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' };
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
        preloadFileSize = 250,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
