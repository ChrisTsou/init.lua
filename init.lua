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

-- copilot --
vim.g.copilot_no_tab_map = true

-- ts_context_commentstring
vim.g.skip_ts_context_commentstring_module = true

-- wsl clipboard --
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("wl-copy") == 0 then
        print("wl-clipboard not found, clipboard integration won't work")
    else
        vim.g.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = "wl-copy --foreground --type text/plain",
                ["*"] = "wl-copy --foreground --primary --type text/plain",
            },
            paste = {
                ["+"] = function()
                    return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
                end,
                ["*"] = function()
                    return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
                end,
            },
            cache_enabled = true,
        }
    end
end

require("config.options")
require("config.lazy")
require("config.keymaps")

-- vimtex --
-- require("user.vimtex").setup_options()

--package manager --
-- require("user.options")
-- require("user.keymaps")
-- require("user.plugins")
-- require("user.colorscheme")
-- require("user.luasnip")
-- require("user.cmp")
-- require("user.lsp")
-- require("user.telescope")
-- require("user.treesitter")
-- require("user.autopairs")
-- require("user.comment")
-- require("user.gitsigns")
-- require("user.nvim-tree")
-- require("user.bufferline")
-- require("user.alpha")
-- require("user.indent-blankline")
-- require("user.leap")
-- require("user.rest-configs")
-- require("user.autocommands")
