local g = vim.g

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Statusline & Symbols
  use 'airblade/vim-gitgutter'
  use 'bling/vim-bufferline'
  use 'itchyny/lightline.vim'

  -- Tmux Integrations
  use 'christoomey/vim-tmux-navigator'
  use 'edkolev/tmuxline.vim'
  use { 'andersevenrud/compe-tmux', requires = { 'hrsh7th/nvim-compe' } }

  -- Session Management
  use 'tpope/vim-obsession'

  -- NERDTree File Tree Viewer
  use 'preservim/nerdtree'
  use 'scrooloose/nerdtree-project-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'

  -- Editor Improvements
  use 'Asheq/close-buffers.vim'
  use 'christoomey/vim-system-copy'
  use 'jiangmiao/auto-pairs'
  use 'liuchengxu/vista.vim'
  use 'MattesGroeger/vim-bookmarks'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'

  -- Language/Syntax
  use 'editorconfig/editorconfig-vim'
  use 'elzr/vim-json'
  use 'HerringtonDarkholme/yats.vim'
  use 'jparise/vim-graphql'
  use 'mattn/emmet-vim'
  use 'ray-x/lsp_signature.nvim'
  use 'rust-lang/rust.vim'

  -- Fzf
  use 'junegunn/fzf'
  use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' } }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP Config
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- nvim-compe
  use 'hrsh7th/nvim-compe'

  -- Neorg
  use {
    'vhyrro/neorg',
    config = function()
      require('neorg').setup {
        -- tell Neorg what modules to load
        load = {
          ['core.defaults'] = {}, -- load all the default modules
          ['core.neorg.concealer'] = {}, -- allows for use of icons
          ['core.norg.dirman'] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = '~/neorg'
              }
            }
          }
        },
      }
    end,
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Utils
  use 'nvim-lua/plenary.nvim'

  -- Load Last
  use 'ryanoasis/vim-devicons'

  ---- Plugin Settings ----

  -- Bookmarks --
  g.bookmark_save_per_working_dir = 1
  g.bookmark_auto_save = 1
  g.bookmark_manage_per_buffer = 1
  g.bookmark_center = 1
  g.bookmark_auto_close = 1
  g.bookmark_disable_ctrlp = 1

  -- Lightline --
  g.lightline = {
    colorscheme = 'ayu_dark',
    active = {
      left = {
        { 'mode', 'paste' },
        { 'gitbranch', 'readonly', 'filename', 'modified' }
      },
      right = {
        { 'lineinfo' },
        { 'percent' },
        {
          'fileformat', 'fileencoding', 'filetype',
        },
      },
    },
    component_function = {
      gitbranch = 'FugitiveHead',
      fileformat = 'v:lua.LightlineFileFormat()',
      fileencoding = 'v:lua.LightlineFileEncoding()'
    },
  }

  -- NERDTree --
  g.NERDTreeIgnore = { 'node_modules', 'dist', 'build' }
  g.NERDTreeDirArrowExpandable = ''
  g.NERDTreeDirArrowCollapsible = ''
  g.NERDTreeFileExtensionHighlightFullName = 1
  g.NERDTreeExactMatchHighlightFullName = 1
  g.NERDTreePatternMatchHighlightFullName = 1

  -- Vista Config --
  g.vista_default_executive = 'nvim_lsp'
  g.vista_sidebar_width = 50
  g.vista_disable_statusline = 1
  g.vista_enable_markdown_extension = 0

end)
