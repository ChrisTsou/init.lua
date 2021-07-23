-- on new language, configure:
-- lsp
-- formatter
-- linter

--package manager --
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                          -- packer itself

    -- functionality --
    use 'neovim/nvim-lspconfig'                           -- lsp config
    use 'hrsh7th/nvim-compe'                              -- autocompletion
    use 'mhartington/formatter.nvim'                      -- formatter
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'windwp/nvim-autopairs'                           -- autopair paren
    use 'phaazon/hop.nvim'                                -- hop (easymotion)
    use 'qpkorr/vim-bufkill'                              -- delete buffer without closing windows
    use {                                                 -- fuzzy find anything
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }
    use 'folke/which-key.nvim'                            -- display keybinds as you type them
    use 'blackCauldron7/surround.nvim'                    -- Sandwich things
    use 'mfussenegger/nvim-lint'                          -- linter integration
    use 'b3nj5m1n/kommentary'                             -- commenting
    -- treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- appearance --
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'                     -- colorizer
    use 'kyazdani42/nvim-web-devicons'                    -- devicons
    use 'karb94/neoscroll.nvim'                           -- smooth scrolling
    use {
        'hoob3rt/lualine.nvim',                           -- statusline
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'xiyaowong/nvim-cursorword'                       -- highlight word under cursor
    use 'ray-x/lsp_signature.nvim'                        -- show function signature on type

end)
-- Neovim options --
vim.o.termguicolors = true                                -- Opaque Background
vim.o.mouse = 'a'                                         -- enable mouse scrolling
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'        -- use system clipboard by default
vim.o.tabstop = 4                                         -- tab width
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab  = true                                   -- tab key actions
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.incsearch = true                                    -- highlight text while searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.list = true                                         -- use tab to navigate in list mode
vim.o.listchars = 'trail:»,tab:»-'
vim.o.fillchars = vim.o.fillchars .. 'vert:▏'             -- requires a patched nerd font (try FiraCode)
vim.o.wrap = true                                         -- wrap long lines to the width set by tw
vim.o.breakindent = true
vim.o.encoding = 'utf-8'                                  -- text encoding
vim.o.number = true                                       -- enable numbers on the left
vim.o.relativenumber = true                               -- current line is 0
vim.o.title = true                                        -- tab title as file name
vim.o.showmode = false                                    -- dont show current mode below statusline
vim.o.showcmd = false                                     -- to get rid of display of last command
vim.o.conceallevel = 2                                    -- set this so we wont break indentation plugin
vim.o.splitright = true                                   -- open vertical split to the right
vim.o.splitbelow = true                                   -- open horizontal split to the bottom
vim.o.tw=80                                               -- auto wrap lines that are longer than that
vim.o.emoji = true                                        -- enable emojis
vim.o.history = 1000                                      -- history limit
vim.opt.backspace = {'indent', 'eol' , 'start'}           -- sensible backspacing
vim.o.undofile = true                                     -- enable persistent undo
vim.o.undodir= '/tmp'                                     -- undo temp file directory
--vim.o.foldmethod = 'syntax'                               -- fold according to syntax highlight
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99                                      -- open all folds by default
vim.o.inccommand = 'nosplit'                              -- visual feedback while substituting
vim.o.showtabline = 2                                     -- always show tabline
vim.o.grepprg = 'rg --vimgrep'                            -- use rg as default grepper
vim.o.scrolloff = 5                                       -- for context when scrolling (neoscroll needs this)
vim.o.updatetime = 10                                      -- time to trigger things like nvim-cursorword

-- performance tweaks
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.scrolljump = 5
vim.o.lazyredraw = true
vim.o.redrawtime = 10000
vim.o.synmaxcol = 180
vim.o.regexpengine = 0

-- turn off backups (we have git and other vcs anyways)
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false

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

    -- which-key --
    vim.g.timeoutlen = 500

    -- ultisnips --
    vim.g.python3_host_prog = '/usr/sbin/python3'
    vim.g.UltiSnipsExpandTrigger = "<F12>"
    vim.g.UltiSnipsJumpForwardTrigger = "<F12>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<F12>"

-- Plugin Configuration --
    -- lsp module load --
    require('lsp')

    -- formatter --
    local prettier = function()
         return {
             exe = "prettier",
             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
             stdin = true
         }
    end

    local prettier_eslint = function () -- slow, not used
        return {
            exe = 'prettier-eslint',
            args = {
                '--stdin',
                '--stdin-filepath', vim.api.nvim_buf_get_name(0),
                '--prettier-path', './node_modules/prettier',
                '--eslint-path', './node_modules/eslint'
            },
            stdin = true
        }
    end

    require('formatter').setup({
        logging = false,
        filetype = {
            lua = {
                function()
                  return {
                    exe = "lua-format",
                    stdin = true
                  }
                end
            },
            javascript = {
                prettier
            },
            javascriptreact = {
                prettier
            },
            typescript = {
                prettier
            },
            typescriptreact = {
                prettier
            },
        }
    })

    vim.cmd([[autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite]])

    -- linter --
    require('lint').linters_by_ft = {
        -- e.g.: markdown = {'vale',} / (filetype = {linter})
        javascript = {'eslint'},
        javascriptreact = {'eslint'},
        typescript = {'eslint'},
        typescriptreact = {'eslint'},
        --lua = {'luacheck'},
    }

    vim.cmd([[au InsertLeave,TextChanged,BufEnter,BufWritePost * lua require('lint').try_lint()]])

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

    -- colorscheme --
    vim.cmd('syntax on')
    vim.cmd(':colorscheme nvcode')
    vim.cmd(':hi Normal guibg=NONE ctermbg=NONE') -- darker background
    vim.cmd(':hi LineNr guibg=NONE ctermbg=NONE')

    -- lualine --
    require('lualine').setup({
        options = {theme = 'material'},
    })

    -- nvim-colorizer --
    require('colorizer').setup()

    -- neoscroll --
    require('neoscroll').setup()

    -- compe --
    vim.o.completeopt = 'menuone,noselect'
    require('compe').setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = {
            border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
            winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
            max_width = 120,
            min_width = 60,
            max_height = math.floor(vim.o.lines * 0.3),
            min_height = 1,
        };
        source = {
            path = true;
            --buffer = true;
            calc = true;
            nvim_lsp = true;
            nvim_lua = true;
            ultisnips = true;
            treesitter = true;
        };
    }

    -- Telescope --
    local actions = require('telescope.actions')
    require('telescope').setup{
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            generic_sorter = require('telescope.sorters').get_fzy_sorter,
            sorting_strategy = 'descending',
            layout_strategy = 'flex',
            layout_config = {
                vertical = {
                    mirror = true
                }
            },
            mappings = {
                i = {
                    ['<C-p>'] = actions.move_selection_next,
                    ['<C-n>'] = actions.move_selection_previous,
                    ['<C-t>'] = actions.preview_scrolling_down,
                    ['<C-s>'] = actions.preview_scrolling_up,
                },
                n = {
                    ['t'] = actions.move_selection_next,
                    ['s'] = actions.move_selection_previous,
                    ['<C-t>'] = actions.preview_scrolling_down,
                    ['<C-s>'] = actions.preview_scrolling_up,
                }
            }
        }
    }

    require('telescope').load_extension('ultisnips')

    -- nvim-autopairs --
    require('nvim-autopairs').setup()
    require('nvim-autopairs.completion.compe').setup({
        --map_cr = true, --  map <CR> on insert mode
        map_complete = true -- it will auto insert `(` after select function or method item
    })

    -- hop --
    require('hop').setup({ keys = 'cieansthbyouvwdlgxjkpfmr'})

    -- which-key --
    require("which-key").setup({
        finder_action_keys = {
            vsplit = 'v', scroll_down = '<C-t>', scroll_up = '<C-s>'
        }
    })

    -- lsp_signature --
    require('lsp_signature').setup({
        handler_opts = {
            border = 'none'
        },
        floating_window = true,
        hint_enable = false,
        hint_prefix = ''
    })

    -- treesitter --
    require('nvim-treesitter.configs').setup({
        highlight = {
            enable = true,
            custom_captures = {
              -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
              --["foo.bar"] = "Identifier",
            },
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
      enable = true,
          keymaps = {
            init_selection = "<leader>s",
            node_incremental = "<C-h>",
            scope_incremental = "<leader>s",
            node_decremental = "<C-n>",
          },
      },
    })

    -- surround.nvim --
    require "surround".setup {
        prefix = 'S'
    }

-- AutoCommands --
    -- ultisnips --
    vim.cmd('autocmd FileType javascriptreact UltiSnipsAddFiletypes javascript')

  vim.cmd([[
    au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
    au FileType help wincmd L                               " open help in vertical split
    au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
  ]])

  -- enable spell only if file type is normal text
  vim.cmd([[
    let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
    autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif
  ]])

  -- Return to last edit position when opening files
  vim.cmd([[
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  ]])

    -- format on save (e.g: *.js between BufWritePost nad FormatWrite)
        vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
        augroup END
        ]], true)

  -- WSL yank support
  vim.g.wsl_clip_exe_location = '/mnt/c/Windows/System32/clip.exe'
  vim.cmd([[
    if executable(g:wsl_clip_exe_location)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(g:wsl_clip_exe_location, @0) | endif
        augroup END
    endif
  ]])

-- Custom Functions --
    -- Utility functions for compe and luasnip
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
      local col = vim.fn.col '.' - 1
      if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
        return true
      else
        return false
      end
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menu
    --- jump to prev/next snippet's placeholder
    _G.tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
      elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return t '<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>'
      elseif check_back_space() then
        return t '<Tab>'
      else
        return vim.fn['compe#complete']()
      end
    end

    _G.s_tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
      elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return t '<C-R>=UltiSnips#JumpBackwards()<CR>'
      else
        return t '<S-Tab>'
      end
    end

-- Mappings --
    local wk = require("which-key")
    local map = vim.api.nvim_set_keymap

    -- Keyboard layout changes --
    map('', 't', 'j', {noremap = true})
    map('', 's', 'k', {noremap = true})
    map('', 'n', 'l', {noremap = true})
    map('', 'j', 't', {noremap = true})
    map('', 'k', 's', {noremap = true})
    map('', 'l', 'n', {noremap = true})

    -- Essentials --
    map('n', ' ', '', {noremap = true})
    vim.g.mapleader = ' '

    map('n', '<C-w>', ':bnext<CR>', {silent = true})
    map('n', '<C-d>', ':bprevious<CR>', {silent = true})
    map('n', '<S-Enter>', 'O', {noremap = true}) --this also requires to configure terminal to send proper keycode
    map('n', '<Enter>', 'o', {noremap = true})
    -- pane switching --
    map('n', '<C-h>', '<C-w>h', {noremap = true})
    map('n', '<C-t>', '<C-w>j', {noremap = true})
    map('n', '<C-s>', '<C-w>k', {noremap = true})
    map('n', '<C-n>', '<C-w>l', {noremap = true})
    map('i', '<C-h>', '<C- ><C-N><C-w>h', {noremap = true})
    map('i', '<C-t>', '<C- ><C-N><C-w>j', {noremap = true})
    map('i', '<C-s>', '<C- ><C-N><C-w>k', {noremap = true})
    map('i', '<C-n>', '<C- ><C-N><C-w>l', {noremap = true})
    -- disable highlight with 2 esc
    map('n', '<esc>', ':let @/=""<CR>', {noremap = true, silent = true})

    -- tab navigation --
    map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true})
    map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true})
    map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true})
    map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true})

    -- compe --
    map('i', '<CR>', [[compe#confirm({'keys': luaeval("require ('nvim-autopairs').autopairs_cr()"), 'select': v:true })]], {silent = true, expr = true})
    map('i', '<C-space>', 'compe#complete()', {silent = true, expr = true })
    map('i', '<C-v>', 'compe#close()', {silent = true, expr = true})

    -- neoscroll --
    map('', '<C-t>', [[<Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)<CR>]], {noremap = true,})
    map('', '<C-s>', [[<Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)<CR>]], {noremap = true,})

    wk.register({
        ['<leader>'] = {
            a = {':Telescope lsp_code_actions<CR>', 'code actions'},
            w = {':w<CR>', 'write buffer'},
            h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
            f = {':Format<CR>', 'format'},
            i = {':luafile init.lua<CR>', 'source'},
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
            -- lsp --
            r = {':Telescope lsp_references<CR>', 'lsp references'},
            o = {':Telescope lsp_document_symbols<CR>', 'lsp symbols'},
            d = {':Telescope lsp_document_diagnostics<CR>', 'lsp diagnostics'}
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
            a = {[[<Cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], 'code actions'},
            h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
            gl = {[[<Cmd>lua require('hop').hint_lines()<CR>]], 'line'}
        }
    }, {noremap = true, mode = 'v'})
