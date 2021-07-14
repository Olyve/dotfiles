local api = vim.api
local fn = vim.fn

local saga = require 'lspsaga'
require'lspconfig'.jsonls.setup{}
require'lspconfig'.dockerls.setup{}
require'null-ls'.setup{}
-- require'lspfuzzy'.setup{}

-- Saga setup
saga.init_lsp_saga()

-- TypeScript LSP Setup
require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    require 'lsp_signature'.on_attach({
      bind = true,
      doc_lines = 2,
      handler_opts = {
        border = 'single'
      }
    })

    client.resolved_capabilities.document_formatting = false

    -- define an alias
    vim.cmd('command -buffer Formatting lua vim.lsp.buf.formatting()')

    -- format on save
    vim.cmd('autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()')

    local ts_utils = require('nvim-lsp-ts-utils')
    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = 'eslint',
      eslint_enable_diagnostics = true,

      -- formatting
      enable_formatting = true,
      formatter = 'prettier',

      -- update imports on file move
      update_imports_on_move = true,
    }

    -- required to fix code action ranges
    ts_utils.setup_client(client)
  end,
}

-- local filetypes = { typescript = 'eslint', typescriptreact = 'eslint' }
-- local linters = {
--   eslint = {
--     sourceName = 'eslint',
--     command = 'eslint',
--     rootPatterns = { '.eslintrc.js', 'package.json' },
--     debounce = 100,
--     args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--     parseJson = {
--       errorsRoot = '[0].messages',
--       line = 'line',
--       column = 'column',
--       endLine = 'endLine',
--       endColumn = 'endColumn',
--       message = '${message} [${ruleId}]',
--       security = 'severity'
--     },
--     securities = {[2] = 'error', [1] = 'warning'}
--   }
-- }
-- local formatters = {
--   prettier = { command = 'prettier', args = {'--stdin-filepath', '%filepath'} }
-- }
-- local formatFiletypes = {
--   typescript = 'prettier',
--   typescriptreact = 'prettier'
-- }
-- require'lspconfig'.diagnosticls.setup {
--   filetypes = vim.tbl_keys(filetypes),
--   init_options = {
--     filetypes = filetypes,
--     linters = linters,
--     formatters = formatters,
--     formatFiletypes = formatFiletypes,
--   }
-- }

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
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
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
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Autocomplete Setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true,
    nvim_lsp = true,
    tmux = true,
    buffer = true,
    calc = true,
    nvim_lua = true,
  };
}

