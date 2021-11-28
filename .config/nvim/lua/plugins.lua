local g = vim.g

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Load early to use with other plugins keymaps
    -- use {
    --   "lazytanuki/nvim-mapper",
    --   config = function()
    --     require "nvim-mapper".setup {no_map = true}
    --   end,
    --   before = "telescope.nvim"
    -- }

    -- Which Key for key mappings
    use "folke/which-key.nvim"

    -- Statusline & Symbols
    use "airblade/vim-gitgutter"
    use "bling/vim-bufferline"
    use "itchyny/lightline.vim"

    -- Tmux Integrations
    use "christoomey/vim-tmux-navigator"
    use "edkolev/tmuxline.vim"

    -- Session Management
    use "tpope/vim-obsession"

    -- Nvim Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    }

    -- Editor Improvements
    use "Asheq/close-buffers.vim"
    use "christoomey/vim-system-copy"
    use "jiangmiao/auto-pairs"
    use "liuchengxu/vista.vim"
    use "MattesGroeger/vim-bookmarks"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use "tpope/vim-fugitive"
    use "wfxr/minimap.vim"

    -- Language/Syntax
    use "editorconfig/editorconfig-vim"
    use "elzr/vim-json"
    use "HerringtonDarkholme/yats.vim"
    use "jparise/vim-graphql"
    use "mattn/emmet-vim"
    use "ray-x/lsp_signature.nvim"
    use "rust-lang/rust.vim"

    -- Fzf
    use "junegunn/fzf"
    use {"junegunn/fzf.vim", requires = {"junegunn/fzf"}}

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"camgraff/telescope-tmux.nvim", requires = {"norcalli/nvim-terminal.lua"}}
    use {"tom-anders/telescope-vim-bookmarks.nvim"}
    use {"nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sql.nvim"}}
    use {
      "nvim-telescope/telescope-media-files.nvim",
      requires = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
      }
    }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- LSP Config
    use "neovim/nvim-lspconfig"
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "mhartington/formatter.nvim"

    -- nvim-cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- snippets
    use "honza/vim-snippets"
    use "SirVer/ultisnips"

    -- Utils
    use "nvim-lua/plenary.nvim"

    -- Tabout
    use {
      "abecodes/tabout.nvim",
      config = function()
        require("tabout").setup {
          tabkey = "<Tab>",
          backwards_tabkey = "<S-Tab>",
          act_as_tab = true,
          act_as_shift_tab = false,
          enable_backwards = true,
          completion = true,
          tabouts = {
            {open = "'", close = "'"},
            {open = '"', close = '"'},
            {open = "`", close = "`"},
            {open = "(", close = ")"},
            {open = "[", close = "]"},
            {open = "{", close = "}"}
          },
          ignore_beginning = true,
          exclude = {}
        }
      end,
      wants = {"nvim-treesitter"},
      after = {"nvim-cmp"}
    }

    -- Rust Tools
    use {
      "simrat39/rust-tools.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap"
      }
    }

    -- Local Plugins
    --     use "~/workspace/neovim/plugins/testing"
    --     use "~/workspace/neovim/plugins/specterm"

    -- Load Last
    use "ryanoasis/vim-devicons"

    ---- Plugin Settings ----

    -- Bookmarks --
    g.bookmark_no_default_key_mappings = 1
    g.bookmark_save_per_working_dir = 1
    g.bookmark_auto_save = 1
    g.bookmark_manage_per_buffer = 1
    g.bookmark_center = 1
    g.bookmark_auto_close = 1
    g.bookmark_disable_ctrlp = 1

    -- Lightline --
    g.lightline = {
      colorscheme = "ayu_dark",
      active = {
        left = {
          {"mode", "paste"},
          {"gitbranch", "readonly", "filename", "modified"}
        },
        right = {
          {"lineinfo"},
          {"percent"},
          {
            "fileformat",
            "fileencoding",
            "filetype"
          }
        }
      },
      component_function = {
        gitbranch = "FugitiveHead",
        fileformat = "v:lua.LightlineFileFormat()",
        fileencoding = "v:lua.LightlineFileEncoding()"
      }
    }

    -- Vista Config --
    g.vista_default_executive = "nvim_lsp"
    g.vista_sidebar_width = 50
    g.vista_disable_statusline = 1
    g.vista_enable_markdown_extension = 0
  end
)
