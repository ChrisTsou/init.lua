local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    finder_action_keys = {
        vsplit = "v",
        scroll_down = "<C-t>",
        scroll_up = "<C-s>",
    },
}

which_key.setup(setup)

local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local telescopeBuiltin = require("telescope.builtin")
local telescope = require("telescope")
local closeBuffers = require("close_buffers")

-- normal mode --
local mappings = {
    -- ["<CR>"] = { require("hop").hint_words, "hop" },
    ["<CR>"] = { "<Plug>(leap-forward-to)", "leap forward" },
    ["<S-CR>"] = { "<Plug>(leap-backward-to)", "leap back" },
    ["<C-CR>"] = { "<Plug>(leap-form-window)", "leap back" },
    ["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "lsp hover" },
    ["D"] = {
        function()
            vim.diagnostic.open_float()
        end,
        "diagnostic float",
    },
    ["<leader>"] = {
        an = { require("neogen").generate, "annotate" },
        w = { ":w<CR>", "write buffer" },
        rn = { vim.lsp.buf.rename, "lsp rename" },
        n = { function () require("nvim-tree.api").tree.toggle() end, "nvim tree" },
    },
    ["<leader>f"] = {
        b = { telescope.extensions.file_browser.file_browser, "file browser" },
        m = {
            function()
                vim.lsp.buf.format({ async = true })
            end,
            "format",
        },
        l = { ":!npm run lint:fix<CR>", "lint fix" },
    },
    ["<leader>l"] = {
        name = "list",
        l = { telescopeBuiltin.builtin, "lists" },
        f = { telescopeBuiltin.find_files, "files" },
        b = { ":Telescope file_browser<CR>", "file browser" }, -- TODO
        s = { telescopeBuiltin.current_buffer_fuzzy_find, "search buffer" },
        em = { telescopeBuiltin.symbols, "symbols" },
        hf = {
            function()
                telescopeBuiltin.find_files({ hidden = true })
            end,
            "hidden files",
        },
        ht = { telescopeBuiltin.help_tags, "help" },
        cs = { telescopeBuiltin.colorscheme, "colorschemes" },
        g = {
            name = "git",
            c = { telescopeBuiltin.git_commits, "commits" },
            bc = { telescopeBuiltin.git_bcommits, "buffer commits" },
            br = { telescopeBuiltin.git_branches, "branches" },
            ss = { telescopeBuiltin.git_status, "status" },
            sh = { telescopeBuiltin.git_stash, "stash" },
        },
        z = { ":LazyGit<CR>", "lazygit" },
        -- lsp --
        r = { telescopeBuiltin.lsp_references, "lsp references" },
        o = { telescopeBuiltin.lsp_document_symbols, "lsp symbols" },
        d = {
            function()
                telescopeBuiltin.diagnostics({ bufnr = 0 })
            end,
            "lsp buffer diagnostics",
        },
        D = { telescopeBuiltin.diagnostics, "lsp all buffers diagnostics" },
        v = { telescopeBuiltin.live_grep, "live grep" },
    },
    ["<leader>g"] = {
        name = "go",
        i = { telescopeBuiltin.lsp_implementations, "implementations" },
        d = { telescopeBuiltin.lsp_definitions, "definition" },
        td = { telescopeBuiltin.lsp_type_definitions, "type definition" },
        -- l = { require("hop").hint_lines, "line" },
    },
    ["<leader>c"] = {
        a = { vim.lsp.buf.code_action, "code actions" },
        b = { function() closeBuffers.delete({ type = 'this' }) end, "close buffer" },
        B = { function() closeBuffers.delete({ type = 'this', force = true }) end , "force close buffer"},
        o = { function() closeBuffers.wipe({ type = 'other' }) end , "close all other buffers"},
        O = { function() closeBuffers.wipe({ type = 'other', force = true }) end , "force close all other buffers"},
        e = { function() closeBuffers.wipe({ type = 'all' }) end , "close all buffers"},
        E = { function() closeBuffers.wipe({ type = 'all', force = true }) end , "close all buffers"},
        w = { ":q<CR>", "close window" },
        V = { ":qa!<CR>", "force close neovim"}
    },
    ["<leader>p"] = {
        s = { "<cmd>PackerSync<CR>", "Sync" },
        t = { "<cmd>PackerStatus<CR>", "Status" },
        h = { telescope.extensions.neoclip.default, "clipboard history" },
    },
    ["<leader>e"] = {
        s = {
            function()
                require("luasnip.loaders").edit_snippet_files({})
            end,
            "edit snippets",
        },
    },
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
    ["<CR>"] = { "<Plug>(leap-forward-to)", "leap forward" },
    ["<S-CR>"] = { "<Plug>(leap-backward-to)", "leap back" },
    ["<C-CR>"] = { "<Plug>(leap-form-window)", "leap back" },
    ["<leader>"] = {
        ca = { vim.lsp.buf.code_action, "code actions" },
        -- h = { [[<Cmd>lua require('hop').hint_words()<CR>]], "hop" },
        -- gl = { [[<Cmd>lua require('hop').hint_lines()<CR>]], "line" },
    },
}

which_key.register(visualMappings, visualOpts)

local insertOpts = {
    mode = "i",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local insertMappings = {
    ["<C-s>"] = { "<Plug>(copilot-suggest)", "copilot suggest"},
    ["<C-n>"] = { "<Plug>(copilot-next)", "copilot next"},
    ["<C-p>"] = { "<Plug>(copilot-next)", "copilot previous"},
}
which_key.register(
    {["<C-a>"] = { "copilot#Accept('')", "copilot accept" }},
    vim.tbl_extend("force", insertOpts, { expr = true })
)

which_key.register(insertMappings, insertOpts)
