local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = "all", -- put the language you want in this array
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    indent = {
        enable = true,
        disable = { "python", "css" },
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

    -- plugins
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
