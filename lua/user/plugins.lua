local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'                          -- packer itself

    -- lsp --
    use 'neovim/nvim-lspconfig'                           -- lsp config
    use 'williamboman/nvim-lsp-installer'                 -- lsp installer
    use 'ray-x/lsp_signature.nvim'

    -- cmp/snips --
    use 'hrsh7th/nvim-cmp'                                -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'                        -- nvim-cmp luansip source
    use 'L3MON4D3/LuaSnip'                                -- snippet
    use 'rafamadriz/friendly-snippets'                    -- actual snippets

    use 'jose-elias-alvarez/null-ls.nvim'                 -- for formatters and linters
    use 'windwp/nvim-autopairs'                           -- autopair paren
    use 'windwp/nvim-ts-autotag'                          -- autotag html
    use 'phaazon/hop.nvim'                                -- hop (easymotion)
    use {                                                 -- fuzzy find anything
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'},
        }
    }
    use 'folke/which-key.nvim'                            -- display keybinds as you type them
    use 'numToStr/Comment.nvim'                           -- Easily comment stuff
    use 'danymat/neogen'                                  -- function comment annotation
    use 'tpope/vim-surround'                              -- surround/sandwich

    -- treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Git --
    use "lewis6991/gitsigns.nvim"
    use {
        'kdheepak/lazygit.nvim',                          -- lazygit integration
        branch = 'main'
    }

    -- appearance --
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'                     -- colorizer
    use 'karb94/neoscroll.nvim'                           -- smooth scrolling
    use {
        'hoob3rt/lualine.nvim',                           -- statusline
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'xiyaowong/nvim-cursorword'                       -- highlight word under cursor
    use {
        'akinsho/bufferline.nvim',                    -- tabs
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use "moll/vim-bbye"                                   -- better bdelete
    use "goolord/alpha-nvim"
    use {
        'kyazdani42/nvim-tree.lua',                       -- file tree
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use "lukas-reineke/indent-blankline.nvim"             -- indent lines

    -- Other --
    use 'antoinemadec/FixCursorHold.nvim'                 -- decouple cursorhold from updatetime

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
