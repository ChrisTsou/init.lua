local map = vim.keymap.set
local function nvimtree_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "m", api.fs.cut, opts("Cut"))
    vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
    vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
    vim.keymap.set("n", "cn", api.fs.copy.filename, opts("Copy Name"))
    vim.keymap.set("n", "cp", api.fs.copy.relative_path, opts("Copy Relative Path"))
    vim.keymap.set("n", "a", api.fs.create, opts("Create"))
    vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
    vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
    vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
    vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
    vim.keymap.set("n", "n", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "h", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "S", api.node.navigate.sibling.first, opts("First Sibling"))
    vim.keymap.set("n", "T", api.node.navigate.sibling.last, opts("Last Sibling"))
    vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
    vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
    vim.keymap.set("n", "q", api.tree.close, opts("Close"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            italic_comments = true,
            disable_nvimtree_bg = true,
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                on_attach = nvimtree_on_attach,
                sync_root_with_cwd = true,
                diagnostics = {
                    enable = true,
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                view = {
                    adaptive_size = true,
                    width = 30,
                    side = "left",
                },
            })
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = { theme = "vscode" },
        },
    },
    {
        "echasnovski/mini.cursorword",
        version = "*",
        opts = { delay = 10 },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {

            options = {
                close_command = function(bufnum)
                    require("close_buffers").delete({ type = bufnum })
                end,
                left_trunc_marker = "",
                modified_icon = "●",
                right_trunc_marker = "",
                show_close_icon = false,
                show_tab_indicators = true,
                separator_style = "slant",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text_align = "center",
                        highlight = "my_bufferline_offset",
                    },
                },
            },
            highlights = {
                -- same as vscode vscTabOutside
                separator_selected = {
                    fg = "#252526",
                },
                separator_visible = {
                    fg = "#252526",
                },
                separator = {
                    fg = "#252526",
                },
                fill = {
                    bg = "#252526",
                },
            },
        },
    },
    {
        "goolord/alpha-nvim",
        version = "*",
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", "󰍉  Find file", ":Telescope find_files <CR>"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
                dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "󰮗  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
            }

            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "Include"
            dashboard.section.buttons.opts.hl = "Keyword"

            dashboard.opts.opts.noautocmd = true
            require("alpha").setup(dashboard.opts)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            local neoscroll = require("neoscroll")
            neoscroll.setup({
                mappings = {},
            })

            map("n", "T", function()
                neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 250 })
            end)
            map("n", "S", function()
                neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 250 })
            end)
        end,
    },
}
