-- TODO Update keybindings for whichkey v3
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
