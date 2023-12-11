local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local status_ok_commentstring, commentstring = pcall(require, "ts_context_commentstring")
if not status_ok_commentstring then
    return
end

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#plugins-with-a-pre-comment-hook
commentstring.setup {
  enable_autocmd = false,
}

comment.setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
