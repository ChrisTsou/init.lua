local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keyboard layout changes --
map('', 't', 'j', opts)
map('', 's', 'k', opts)
map('', 'n', 'l', opts)
map('', 'j', 't', opts)
map('', 'k', 's', opts)
map('', 'l', 'n', opts)

-- Essentials --
map('n', '<C-w>', ':bnext<CR>', opts)
map('n', '<C-d>', ':bprevious<CR>', opts)
map('n', '<S-Enter>', 'O', opts) --this also requires to configure terminal to send proper keycode
map('n', '<Enter>', 'o', opts)
map('n', '<C-f>', '<C-]>', opts)
map('n', '<C-m>', '<C-o>', opts)

-- pane switching --
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-t>', '<C-w>j', opts)
map('n', '<C-s>', '<C-w>k', opts)
map('n', '<C-n>', '<C-w>l', opts)
map('i', '<C-h>', '<C- ><C-N><C-w>h', opts)
map('i', '<C-t>', '<C- ><C-N><C-w>j', opts)
map('i', '<C-s>', '<C- ><C-N><C-w>k', opts)
map('i', '<C-n>', '<C- ><C-N><C-w>l', opts)

-- disable highlight with 2 esc
map('n', '<esc>', ':let @/=""<CR>', opts)

-- neoscroll --
map('', '<C-t>', [[<Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)<CR>]], opts)
map('', '<C-s>', [[<Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)<CR>]], opts)

-- for terminal copy --
-- map('n', 'Y', '', opts)
-- map('n', '<C-y>', '', opts)

