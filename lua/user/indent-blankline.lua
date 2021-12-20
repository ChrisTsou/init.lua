local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

indent_blankline.setup({
    use_treesitter = true,
    char_list = {'│', '|', '┆', '┊'},
    filetype_exclude = {'alpha', 'help', 'NvimTree'},

    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})
