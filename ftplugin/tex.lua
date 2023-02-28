local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- vim.opt.conceallevel = 1

-- omni completion for cmp --
-- not sure if this works --
local cmp = require('cmp')
local sources = cmp.get_config().sources
table.insert(sources, 1, { name = 'omni' })
cmp.setup.buffer({ sources = sources })

-- ported snippets --
require("snippets.tex.castel-ported").setup()

local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["<leader>"] = {
        t = {
            -- name = "+vimtex",
            ds = {
                name = "+delete surrounding",
                e = { "<plug>(vimtex-env-delete)", "env" },
                c = { "<plug>(vimtex-cmd-delete)", "cmd" },
                ["$"] = { "<plug>(vimtex-env-delete-math)", "math" },
                d = { "<plug>(vimtex-delim-delete)", "delim" },
            },
            cs = {
                name = "+change surrounding",
                e = { "<plug>(vimtex-env-change)", "env" },
                c = { "<plug>(vimtex-cmd-change)", "cmd" },
                ["$"] = { "<plug>(vimtex-env-change-math)", "math" },
                d = { "<plug>(vimtex-delim-change-math)", "delim" },
            },
            t = {
                name = "+toggle",
                f = { "<plug>(vimtex-cmd-toggle-frac)", "frac" },
                s = { "<plug>(vimtex-cmd-toggle-star)", "cmd star" },
                e = { "<plug>(vimtex-env-toggle-star)", "env star" },
                ["$"] = { "<plug>(vimtex-env-toggle-math)", "env math" },
                d = { "<plug>(vimtex-delim-toggle-modifier)", "mod" },
                D = { "<plug>(vimtex-delim-toggle-modifier-reverse)", "mod reverse" },
                -- t = { "<plug>(vimtex-toc-open)", "toc open" },
                c = { "<plug>(vimtex-toc-toggle)", "toc toggle" },
            },
            -- i = { "<plug>(vimtex-info)", "info" },
            -- I = { "<plug>(vimtex-info-full)", "info full" },
            -- q = { "<plug>(vimtex-log)", "log" },
            -- v = { "<plug>(vimtex-view)", "view" },
            -- r = { "<plug>(vimtex-reverse-search)", "rev search" },
            -- l = { "<plug>(vimtex-compile)", "compile" },
            -- L = { "<plug>(vimtex-compile-selected)", "compile selected" },
            -- k = { "<plug>(vimtex-stop)", "stop" },
            -- K = { "<plug>(vimtex-stop-all)", "stop all" },
            -- e = { "<plug>(vimtex-errors)", "errors" },
            -- o = { "<plug>(vimtex-compile-output)", "compile output" },
            -- g = { "<plug>(vimtex-status)", "status" },
            -- G = { "<plug>(vimtex-status-all)", "status all" },
            -- -- c = { "<plug>(vimtex-clean)", "" },
            -- C = { "<plug>(vimtex-clean-full)", "clean full" },
            -- m = { "<plug>(vimtex-imaps-list)", "imaps list" },
            -- x = { "<plug>(vimtex-reload)", "reload" },
            -- X = { "<plug>(vimtex-reload-state)", "reload state" },
            -- M = { "<plug>(vimtex-toggle-main)", "toggle main" },
            -- a = { "<plug>(vimtex-context-menu)", "context menu" },
        },
    },
}

which_key.register(mappings, opts)
--
-- local visual_opts = {
--     mode = "n", -- NORMAL mode
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local visual_mappings = {
--     ["<leader>"] = {
--         t = {
--             s = {
--                 f = { "<plug>(vimtex-cmd-toggle-frac)", "" },
--                 d = { "<plug>(vimtex-delim-toggle-modifier)", "" },
--                 D = { "<plug>(vimtex-delim-toggle-modifier-reverse)", "" },
--             },
--         },
--     },
-- }
--
-- which_key.register(visual_mappings, visual_opts)
