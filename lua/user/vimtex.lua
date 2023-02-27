local M = {}

M.setup_options = function()
    vim.g.vimtex_mappings_prefix = "<leader>t"
    -- vim.g.vimtex_mappings_enabled = 0
    -- vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_mappings_disable = {
        n = { "tse", "ts$", "tsc", "tsf", "tsd", "tsD" },
        x = { "tsf", "tsd", "tsD" },
    }
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    -- vim.g.tex_conceal = "abdmg"

    vim.g.vimtex_compiler_latexmk = {
        build_dir = "out",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
            "-verbose",
            "-file-line-error",
            "-synctex=1",
            "-interaction=nonstopmode",
        },
    }
end

return M
