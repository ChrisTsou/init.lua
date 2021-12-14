local ls = require("luasnip")

local javascript = require('snippets.javascript')
local javascriptreact = require('snippets.javascriptreact')

ls.snippets = {
    javascript = javascript,
    javascriptreact = javascriptreact,
}

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascriptreact", "typescript", "javascript" })

require("luasnip/loaders/from_vscode").lazy_load()
