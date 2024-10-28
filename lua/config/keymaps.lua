local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set
-- local wk = require("which-key")

--Remap space as leader key
-- map("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

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
-- map("n", "T", function()
--     require("neoscroll").scroll(vim.wo.scroll, true, 250)
-- end)
-- map("n", "S", function()
--     require("neoscroll").scroll(-vim.wo.scroll, true, 250)
-- end)

-- leap --
-- vim.keymap.set({ "n", "x", "o" }, "<CR>", "<Plug>(leap-forward-to)", { desc = "leap forward" })
-- vim.keymap.set({ "n", "x", "o" }, "<S-CR>", "<Plug>(leap-backward-to)", { desc = "leap backward" })
--
-- local telescopeBuiltin = require("telescope.builtin")
-- local closeBuffers = require("close_buffers")
--
-- wk.add({
--     { "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "lsp hover" },
--     { "D", vim.diagnostic.open_float, desc = "diagnostic float" },
--     { "<leader>an", require("neogen").generate, desc = "annotate" },
--     { "<leader>w", ":w<CR>", desc = "write buffer" },
--     { "<leader>rn", vim.lsp.buf.rename, desc = "lsp rename" },
--     { "<leader>n", require("nvim-tree.api").tree.toggle, desc = "nvim tree" },
--     { "<leader>fb", require("telescope").extensions.file_browser.file_browser, desc = "file browser" },
--     {
--         "<leader>fm",
--         function()
--             vim.lsp.buf.format({ async = true })
--         end,
--         desc = "format",
--     },
--     { "<leader>l", group = "list" },
--     { "<leader>ll", telescopeBuiltin.builtin, desc = "lists" },
--     { "<leader>lf", telescopeBuiltin.find_files, desc = "files" },
--     { "<leader>lb", require("telescope").extensions.file_browser.file_browser, desc = "file browser" }, -- TODO
--     { "<leader>ls", telescopeBuiltin.current_buffer_fuzzy_find, desc = "search buffer" },
--     { "<leader>lem", telescopeBuiltin.symbols, desc = "symbols" },
--     {
--         "<leader>lhf",
--         function()
--             telescopeBuiltin.find_files({ hidden = true })
--         end,
--         desc = "hidden files",
--     },
--     { "<leader>lht", telescopeBuiltin.help_tags, desc = "help" },
--     { "<leader>lc", telescopeBuiltin.colorscheme, desc = "colorschemes" },
--     { "<leader>lz", ":LazyGit<CR>", desc = "lazygit" },
--     -- lsp --
--     { "<leader>lr", telescopeBuiltin.lsp_references, desc = "lsp references" },
--     { "<leader>lo", telescopeBuiltin.lsp_document_symbols, desc = "lsp symbols" },
--     {
--         "<leader>ld",
--         function()
--             telescopeBuiltin.diagnostics({ bufnr = 0 })
--         end,
--         desc = "lsp buffer diagnostics",
--     },
--     { "<leader>lD", telescopeBuiltin.diagnostics, desc = "lsp all buffers diagnostics" },
--     { "<leader>lv", telescopeBuiltin.live_grep, desc = "live grep" },
--     { "<leader>lg", group = "git" },
--     { "<leader>lgc", telescopeBuiltin.git_commits, desc = "commits" },
--     { "<leader>lgbc", telescopeBuiltin.git_bcommits, desc = "buffer commits" },
--     { "<leader>lgbr", telescopeBuiltin.git_branches, desc = "branches" },
--     { "<leader>lgss", telescopeBuiltin.git_status, desc = "status" },
--     { "<leader>lgsh", telescopeBuiltin.git_stash, desc = "stash" },
--     { "<leader>g", group = "go" },
--     { "<leader>gi", telescopeBuiltin.lsp_implementations, desc = "implementation" },
--     { "<leader>gd", telescopeBuiltin.lsp_definitions, desc = "definition" },
--     { "<leader>gt", telescopeBuiltin.lsp_type_definitions, desc = "type definition" },
--     { "<leader>c", group = "close/code/clipboard" },
--     { "<leader>ch", require("telescope").extensions.neoclip.default, desc = "clipboard history" },
--     { "<leader>ca", vim.lsp.buf.code_action, desc = "code actions", mode = { "n", "x" } },
--     {
--         "<leader>cb",
--         function()
--             closeBuffers.delete({ type = "this" })
--         end,
--         desc = "close buffer",
--     },
--     {
--         "<leader>cB",
--         function()
--             closeBuffers.delete({ type = "this", force = true })
--         end,
--         desc = "close buffer (forced)",
--     },
--     {
--         "<leader>co",
--         function()
--             closeBuffers.wipe({ type = "other" })
--         end,
--         desc = "close other buffers",
--     },
--     {
--         "<leader>cO",
--         function()
--             closeBuffers.wipe({ type = "other", force = true })
--         end,
--         desc = " close  other buffers (forced)",
--     },
--     {
--         "<leader>ce",
--         function()
--             closeBuffers.wipe({ type = "all" })
--         end,
--         desc = "close everything (buffers)",
--     },
--     {
--         "<leader>cE",
--         function()
--             closeBuffers.wipe({ type = "all", force = true })
--         end,
--         desc = "close everything (buffers) (forced)",
--     },
--     { "<leader>cw", ":q<CR>", desc = "close window" },
--     { "<leader>cv", ":qa!<CR>", desc = "close neovim (forced)" },
--     { "<leader>p", group = "packer" },
--     { "<leader>ps", "<cmd>PackerSync<CR>", desc = "Sync" },
--     { "<leader>pt", "<cmd>PackerStatus<CR>", desc = "Status" },
--     {
--         "<leader>es",
--         function()
--             require("luasnip.loaders").edit_snippet_files({})
--         end,
--         desc = "edit snippets",
--     },
--     {
--         "<C-a>",
--         "copilot#Accept('\\<CR>')",
--         desc = "copilot suggest",
--         mode = "i",
--         expr = true,
--         replace_keycodes = false,
--     },
--     { "<C-s>", "<Plug>(copilot-suggest)", desc = "copilot suggest", mode = "i" },
--     { "<C-n>", "<Plug>(copilot-next)", desc = "copilot next", mode = "i" },
--     { "<C-p>", "<Plug>(copilot-previous)", desc = "copilot previous", mode = "i" },
-- })
