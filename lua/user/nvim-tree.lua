-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
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
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = true,
            list = {
                { key = "m", cb = tree_cb("cut") },
                { key = "y", cb = tree_cb("copy") },
                { key = "p", cb = tree_cb("paste") },
                { key = "cn", cb = tree_cb("copy_name") },
                { key = "cp", cb = tree_cb("copy_path") },
                { key = "a", cb = tree_cb("create") },
                { key = "d", cb = tree_cb("remove") },
                { key = "r", cb = tree_cb("rename") },
                { key = "I", cb = tree_cb("toggle_git_ignored") },
                { key = "H", cb = tree_cb("toggle_dotfiles") },
                { key = "R", cb = tree_cb("refresh") },
                { key = "n", mode = "n", cb = tree_cb("cd") },
                { key = "h", mode = "n", cb = tree_cb("dir_up") },
                { key = { "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
                { key = "<C-v>", cb = tree_cb("vsplit") },
                { key = "<C-x>", cb = tree_cb("split") },
                { key = "P", cb = tree_cb("parent_node") },
                { key = "<BS>", cb = tree_cb("close_node") },
                { key = "<S-CR>", cb = tree_cb("close_node") },
                { key = "S", cb = tree_cb("first_sibling") },
                { key = "T", cb = tree_cb("last_sibling") },
                { key = "<C-r>", cb = tree_cb("full_rename") },
                { key = "gy", cb = tree_cb("copy_absolute_path") },
                { key = "[c", cb = tree_cb("prev_git_item") },
                { key = "]c", cb = tree_cb("next_git_item") },
                { key = "q", cb = tree_cb("close") },
                { key = "g?", cb = tree_cb("toggle_help") },
            },
        },
    },
})

local function open_nvim_tree(data)
  local IGNORED_FT = {
        "alpha",
        "startify",
        "dashboard",
  }

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree but don't focus it
  require("nvim-tree.api").tree.open({ focus = false })
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
