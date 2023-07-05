require("bufferline").setup({
    options = {
        close_command = function (bufnum)
            require('close_buffers').delete({ type = bufnum })
        end,
        -- buffer_close_icon = "",
        -- close_icon = "",
        left_trunc_marker = "",
        modified_icon = "●",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
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
})
