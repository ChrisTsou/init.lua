-- devicons --
require("nvim-web-devicons").setup({
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh",
        },
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
})

-- lualine --
require("lualine").setup({
    options = { theme = "vscode" },
})

-- nvim-colorizer --
require("colorizer").setup()

-- neoscroll --
require("neoscroll").setup({ mappings = {} })

-- hop --
require("hop").setup({ keys = "cieansthbyouvwdlgxjkpfmr" })

-- neogen --
require("neogen").setup({ snippet_engine = "luasnip" })

-- cursorline --
require("nvim-cursorline").setup({
    cursorline = {
        enable = false,
    },
})

-- neoclip --
require("neoclip").setup()

-- nvim-surround --
require("nvim-surround").setup()

-- lsp_signature --
require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded",
    },
    padding = " ",
    max_width = 120,
})

-- close-buffers --
require("close_buffers").setup({
    -- preserve_window_layout = {},
    next_buffer_cmd = function(windows)
        require("bufferline").cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
            vim.api.nvim_win_set_buf(window, bufnr)
        end
    end,
})
