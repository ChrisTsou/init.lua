local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
    return
end

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- ! keep these icons couldn't find them easily --

--   פּ ﯟ   some other good icons
--[[ local kind_icons = { ]]
--[[ 	Text = "", ]]
--[[ 	Method = "m", ]]
--[[ 	Function = "", ]]
--[[ 	Constructor = "", ]]
--[[ 	Field = "", ]]
--[[ 	Variable = "", ]]
--[[ 	Class = "", ]]
--[[ 	Interface = "", ]]
--[[ 	Module = "", ]]
--[[ 	Property = "", ]]
--[[ 	Unit = "", ]]
--[[ 	Value = "", ]]
--[[ 	Enum = "", ]]
--[[ 	Keyword = "", ]]
--[[ 	Snippet = "", ]]
--[[ 	Color = "", ]]
--[[ 	File = "", ]]
--[[ 	Reference = "", ]]
--[[ 	Folder = "", ]]
--[[ 	EnumMember = "", ]]
--[[ 	Constant = "", ]]
--[[ 	Struct = "", ]]
--[[ 	Event = "", ]]
--[[ 	Operator = "", ]]
--[[ 	TypeParameter = "", ]]
--[[ } ]]
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-c>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- tab defined here instead of whichkey because of fallback for tab
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif check_backspace() then
        --         -- cmp.complete()
        --         fallback()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        --
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
    },
})
