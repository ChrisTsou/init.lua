local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- autocommands --
local function on_attach(client)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[autocmd BufWritePre <buffer> lua _G.personal.autoformat()]])
    end
end

null_ls.setup({
    debug = false,
    sources = {
        diagnostics.eslint,
        diagnostics.stylelint,

        formatting.prettier,
        formatting.stylua,

        -- code_actions.gitsigns
    },
    on_attach = on_attach,
})
