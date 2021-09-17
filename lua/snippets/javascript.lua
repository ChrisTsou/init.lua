local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty

return {
    s({trig = 'af', name='arrow function'}, {
        t({'() => '}), i(0)
    }),
    s({trig = 'afb', name='arrow function block'}, {
        t({'() => {',
        '\t'}), i(0),
        t({'', '}'}),
    }),
    s({trig = 'fn', name='named arrow function'}, {
        t('const '), i(1), t(' = ('), i(2), t(') => {'),
        t({'', '\t'}), i(0),
        t({'', '}'})
    }),
    s({trig="im", name="import"}, {
        t("import "), i(1), t(" from "), t("'"), i(2), t("'")
    }),
}
