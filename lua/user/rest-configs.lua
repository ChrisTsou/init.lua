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

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

-- neogen --
require('neogen').setup({})

require('nvim-cursorline').setup({
    cursorline = {
        enable = false,
    }
})
