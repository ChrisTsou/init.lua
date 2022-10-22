local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        generic_sorter = require("telescope.sorters").get_fzy_sorter,
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
            prompt_position = "top",
            vertical = {
                mirror = true,
            },
        },

        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-t>"] = actions.preview_scrolling_down,
                ["<C-s>"] = actions.preview_scrolling_up,
            },
            n = {
                ["t"] = actions.move_selection_next,
                ["s"] = actions.move_selection_previous,
                ["<C-t>"] = actions.preview_scrolling_down,
                ["<C-s>"] = actions.preview_scrolling_up,
            },
        },
    },
    extensions = {
        file_browser = {
            --[[ hijack_netrw = true, ]]
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
})

-- extensions --
telescope.load_extension("file_browser")
