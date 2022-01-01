local autoformat = function()
    if vim.g.personal_autoformat then
        vim.lsp.buf.formatting_sync()
    end
end

-- functions --
_G.personal = {
    autoformat = autoformat
}

-- vars --
-- dont use personal.var, known issue
vim.g.personal_autoformat = false
