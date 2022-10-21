-- on new language, configure:
-- lsp
-- formatter
-- linter
-- treesitter TSInstall

-- Neovim Globals --
-- disable standard plugins --
vim.g.loaded_gzip = 1
vim.g.loaded_msgpack = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_spec = 1
vim.g.loaded_tar = 1
vim.g.loaded_zip = 1
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- cursorHold --
vim.g.cursorhold_updatetime = 500

--package manager --
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.alpha"
require "user.whichkey"
require "user.indent-blankline"
require "user.rest-configs"
require "user.autocommands"
