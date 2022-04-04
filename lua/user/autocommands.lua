-- stop annoying auto commenting on new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- open help in vertical split
vim.cmd([[au FileType help wincmd L]])

-- remove trailing whitespaces before saving
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- enable spell only if file type is normal text
vim.cmd([[
    let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
    augroup spellcheck
        au BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif
    augroup END
]])

-- Return to last edit position when opening files
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Close nvim_tree when is the last window
vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])

-- format on save (e.g: *.js between BufWritePost nad FormatWrite)
-- au('FormatAutogroup', {[[
   -- BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.html,*.vue FormatWrite
-- ]]})

-- WSL yank support
-- vim.g.wsl_clip_exe_location = '/mnt/c/Windows/System32/clip.exe'
-- vim.cmd([[
  -- if executable(g:wsl_clip_exe_location)
      -- augroup WSLYank
          -- autocmd!
          -- autocmd TextYankPost * if v:event.operator ==# 'y' | call system(g:wsl_clip_exe_location, @0) | endif
      -- augroup END
  -- endif
-- ]])
