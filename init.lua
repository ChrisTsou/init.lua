-- on new language, configure:
-- lsp
-- formatter
-- linter
-- treesitter TSInstall

-- Neovim Globals --
-- disable standard plugins --
vim.g.loaded_gzip = 1
vim.g.loaded_msgpack = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_spec = 1
vim.g.loaded_tar = 1
vim.g.loaded_zip = 1
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- indent-blankline --
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char_list = {'│', '|', '┆', '┊'}
vim.g.indent_blankline_filetype_exclude = {'alpha', 'help'}

--package manager --
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.alpha"
require "user.autocommands"

-- Plugin Configuration --
    -- devicons --
    require'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                name = "Zsh"
            }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
    }

    -- lualine --
    require('lualine').setup({
        options = {theme = 'material'},
    })

    -- nvim-colorizer --
    require('colorizer').setup()

    -- neoscroll --
    require('neoscroll').setup({ mappings = {} })

    -- hop --
    require('hop').setup({ keys = 'cieansthbyouvwdlgxjkpfmr'})

    -- which-key --
    require("which-key").setup({
        finder_action_keys = {
            vsplit = 'v', scroll_down = '<C-t>', scroll_up = '<C-s>'
        }
    })

    -- surround.nvim --
    require "surround".setup {
        mappings_style = 'sandwich',
        prefix = 'S'
    }

    require "lsp_signature".setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        }
    })

-- Mappings --
    local wk = require("which-key")

    wk.register({
        ['<Tab>'] = { ':NvimTreeToggle<CR>', 'Explorer'},
        [ 'K' ] = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'lsp hover'},
        ['<leader>'] = {
            a = {[[<Cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>]], 'code actions'},
            w = {':w<CR>', 'write buffer'},
            h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
            f = {':Format<CR>', 'format'},
            rn = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'lsp rename'},
        },
        ['<leader>l'] = {
            name = 'list',
            l = {':Telescope builtin<CR>', 'lists'},
            f = {':Telescope find_files<CR>', 'files'},
            b = {':Telescope file_browser<CR>', 'file browser'},
            s = {':Telescope current_buffer_fuzzy_find<CR>', 'search buffer'},
            em = {':Telescope symbols<CR>', 'symbols'},
            hf = {[[<Cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>]], 'hidden files'},
            hh = {':Telescope help_tags<CR>', 'help'},
            cs = {':Telescope colorscheme<CR>', 'colorschemes'},
            g = {
                name = 'git',
                c = {':Telescope git_commits<CR>', 'commits'},
                bc = {':Telescope git_bcommits<CR>', 'buffer commits'},
                br = {':Telescope git_branches<CR>', 'branches'},
                ss = {':Telescope git_status<CR>', 'status'},
                sh = {':Telescope git_stash<CR>', 'stash'},
            },
            z = {':LazyGit<CR>', 'lazygit'},
            -- lsp --
            r = {':Telescope lsp_references<CR>', 'lsp references'},
            o = {':Telescope lsp_document_symbols<CR>', 'lsp symbols'},
            d = {':Telescope lsp_document_diagnostics<CR>', 'lsp diagnostics'},
            v = {':Telescope live_grep<CR>', 'live grep'}
        },
        ['<leader>g'] = {
            name = 'go',
            i = {':Telescope lsp_implementations<CR>', 'implementations'},
            d = {':Telescope lsp_definitions<CR>', 'definition'},
            l = {[[<Cmd>lua require('hop').hint_lines()<CR>]], 'line'}
        },
        ['<leader>c'] = {
            name = 'close',
            b = {':BD<CR>', 'buffer'},
            w = {':q<CR>', 'window'},
        },
        ['<leader>p'] = {
            name = 'Packer',
            s = {'<cmd>PackerSync<CR>', 'Sync'},
            t = {'<cmd>PackerStatus<CR>', 'Status'}
        }
    }, {noremap = true})

    wk.register({
        ['<leader>'] = {
            a = {[[<Cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor({}))<CR>]], 'code actions'},
            h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
            gl = {[[<Cmd>lua require('hop').hint_lines()<CR>]], 'line'}
        }
    }, {noremap = true, mode = 'v'})
