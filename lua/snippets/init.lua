local ls = require("luasnip")

local javascript = require('snippets.javascript')
local typescript = require('snippets.typescript')
-- local javascriptreact = require('snippets.javascriptreact')

ls.snippets = {
    javascript = javascript,
    -- javascriptreact = javascriptreact,
    typescript = typescript
}

ls.filetype_extend("typescript", { "javascript" })
