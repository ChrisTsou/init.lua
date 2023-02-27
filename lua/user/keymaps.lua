local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keyboard layout changes --
map("n", "t", "j", opts)
map("n", "s", "k", opts)
map("n", "n", "l", opts)
map("n", "j", "t", opts)
map("n", "k", "s", opts)
map("n", "l", "n", opts)
map("x", "t", "j", opts)
map("x", "s", "k", opts)
map("x", "n", "l", opts)
map("x", "j", "t", opts)
map("x", "k", "s", opts)
map("x", "l", "n", opts)

-- Essentials --
map("n", "<C-w>", ":bnext<CR>", opts)
map("n", "<C-d>", ":bprevious<CR>", opts)
map("n", "<S-Enter>", "O", opts) --this also requires to configure terminal to send proper keycode
map("n", "<Enter>", "o", opts)
map("n", "<C-f>", "<C-]>", opts)
map("n", "<C-m>", "<C-o>", opts)

-- pane switching --
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-t>", "<C-w>j", opts)
map("n", "<C-s>", "<C-w>k", opts)
map("n", "<C-n>", "<C-w>l", opts)
map("i", "<C-h>", "<C- ><C-N><C-w>h", opts)
map("i", "<C-t>", "<C- ><C-N><C-w>j", opts)
map("i", "<C-s>", "<C- ><C-N><C-w>k", opts)
map("i", "<C-n>", "<C- ><C-N><C-w>l", opts)

-- disable highlight with 2 esc
map("n", "<esc>", ':let @/=""<CR>', opts)

-- neoscroll --
vim.keymap.set("", "<C-t>", function()
    require("neoscroll").scroll(vim.wo.scroll, true, 250)
end)
vim.keymap.set("", "<C-s>", function()
    require("neoscroll").scroll(-vim.wo.scroll, true, 250)
end)

-- for terminal copy --
-- map('n', 'Y', '', opts)
-- map('n', '<C-y>', '', opts)
