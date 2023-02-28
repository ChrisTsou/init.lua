local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

luasnip.setup({
    enable_autosnippets = true,
    update_events = { "TextChanged", "TextChangedI" },
    store_selection_keys = "<Tab>",
    -- clear jump points
    region_check_events = "InsertEnter",
	delete_check_events = "TextChanged,InsertLeave",
})

vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_locally_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#locally_jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#locally_jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#locally_jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/snippets" })
