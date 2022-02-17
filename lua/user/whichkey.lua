local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    finder_action_keys = {
        vsplit = 'v', scroll_down = '<C-t>', scroll_up = '<C-s>'
    }
}

which_key.setup(setup)

local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- functions --
local function autoFormatToggle()
    vim.g.personal_autoformat = not vim.g.personal_autoformat
    print('autoformat:', vim.g.personal_autoformat)
end

-- normal mode --
local mappings = {
    ['<Tab>'] = { ':NvimTreeToggle<CR>', 'Explorer'},
    [ 'K' ] = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'lsp hover'},
    ['D'] = {function() vim.diagnostic.open_float() end, 'diagnostic float'},
    ['<leader>'] = {
        a = {[[<Cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>]], 'code actions'},
        w = {':w<CR>', 'write buffer'},
        h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
        tf = {autoFormatToggle, 'auto format toggle'},
        f = {function() vim.lsp.buf.formatting() end, 'format'},
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
        d = {':Telescope diagnostics bufnr=0<CR>', 'lsp diagnostics'},
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
        b = {':Bdelete<CR>', 'buffer'},
        w = {':q<CR>', 'window'},
    },
    ['<leader>p'] = {
        name = 'Packer',
        s = {'<cmd>PackerSync<CR>', 'Sync'},
        t = {'<cmd>PackerStatus<CR>', 'Status'}
    },
    ['<leader>e'] = {':!npm run lint:fix<CR>', 'lint fix'}
}
which_key.register(mappings, opts)

-- visual mode --
local visualOpts = {
    mode = "v",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local visualMappings = {
    ['<leader>'] = {
        a = {[[<Cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor({}))<CR>]], 'code actions'},
        h = {[[<Cmd>lua require('hop').hint_words()<CR>]], 'hop'},
        gl = {[[<Cmd>lua require('hop').hint_lines()<CR>]], 'line'}
    }
}

which_key.register(visualMappings, visualOpts)
