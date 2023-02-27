local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- stylua: ignore start
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'                          -- packer itself

    -- copilot --
    use "github/copilot.vim"

    -- lsp --
    use({
		"williamboman/mason.nvim",                        -- lsp,linter,formatter,debugger manager
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("jose-elias-alvarez/null-ls.nvim")                -- for formatters and linters

    use 'ray-x/lsp_signature.nvim'
    use "b0o/schemastore.nvim"                            -- schemastore to use with jsonls use "b0o/schemastore.nvim"

    -- telescope --
    use {                                                 -- fuzzy find anything
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'},
        }
    }
    -- telescope extensions
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use "benfowler/telescope-luasnip.nvim"

    -- cmp/snips --
    use 'hrsh7th/nvim-cmp'                                -- nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'                        -- nvim-cmp luansip source
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-omni'
    use 'onsails/lspkind.nvim'                            -- completion menu icons
    use "L3MON4D3/LuaSnip"                                -- snippet
    use 'rafamadriz/friendly-snippets'                    -- actual snippets

    use 'folke/which-key.nvim'                            -- display keybinds as you type them
    use 'danymat/neogen'                                  -- function comment annotation
    use "kylechui/nvim-surround"                          -- edit sourrounding

    -- treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'numToStr/Comment.nvim'                           -- Easily comment stuff
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'windwp/nvim-autopairs'                           -- autopair paren
    use 'windwp/nvim-ts-autotag'                          -- autotag html

    -- Git --
    use "lewis6991/gitsigns.nvim"
    use {
        'kdheepak/lazygit.nvim',                          -- lazygit integration
        branch = 'main'
    }

    -- appearance --
    use 'Mofiqul/vscode.nvim'                             -- colorscheme
    use 'NvChad/nvim-colorizer.lua'
    use 'karb94/neoscroll.nvim'                           -- smooth scrolling
    use {
        'hoob3rt/lualine.nvim',                           -- statusline
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'yamatsum/nvim-cursorline'
    use {
        'akinsho/bufferline.nvim',                        -- tabs
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use "goolord/alpha-nvim"                              -- dashboard
    use {
        'kyazdani42/nvim-tree.lua',                       -- file tree
        commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c", -- TODO remove when bug is fixed
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'antosha417/nvim-lsp-file-operations',            -- e.g. for renaming imports after file rename
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kyazdani42/nvim-tree.lua" },
        }
    }
    use "lukas-reineke/indent-blankline.nvim"             -- indent lines

    -- Other --
    use 'AckslD/nvim-neoclip.lua'                         -- clipboard history
    use 'phaazon/hop.nvim'                                -- hop (easymotion)
    use 'kazhala/close-buffers.nvim'
    use 'lervag/vimtex'                                   -- latex

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
-- stylua: ignore end
