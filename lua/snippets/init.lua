local ls = require("luasnip")

local javascript = require('snippets.javascript')
--local javascriptreact = require('snippets.javascriptreact')

ls.snippets = {
    javascript = javascript,
    --[[ javascriptreact = vim.tbl_extend('force',
        javascript,
        javascriptreact
        --not working fix
    ) ]]
}
