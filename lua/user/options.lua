local options = {
    termguicolors = true, -- 24bit color
    mouse = "a", -- enable mouse scrollin
    clipboard = "unnamedplus", -- use system clipboard by default (slow startup wsl)
    tabstop = 4, -- tab width
    softtabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,
    expandtab = true, -- tab key actions
    smarttab = true,
    incsearch = true, -- highlight text while searching
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    list = true, -- use tab to navigate in list mode
    listchars = "trail:»,tab:»-",
    fillchars = vim.o.fillchars .. "vert:▏", -- requires a patched nerd font (try FiraCode)
    wrap = true, -- wrap long lines to the width set by tw
    breakindent = true,
    encoding = "utf-8", -- text encoding
    number = true, -- enable numbers on the left
    relativenumber = true, -- current line is 0
    title = true, -- tab title as file name
    showmode = false, -- dont show current mode below statusline
    showcmd = false, -- to get rid of display of last command
    conceallevel = 2, -- set this so we wont break indentation plugin
    splitright = true, -- open vertical split to the right
    splitbelow = true, -- open horizontal split to the bottom
    tw = 80, -- auto wrap lines that are longer than that
    emoji = true, -- enable emojis
    history = 1000, -- history limit
    backspace = { "indent", "eol", "start" }, -- sensible backspacing
    undofile = true, -- enable persistent undo
    undodir = "/tmp", -- undo temp file directory
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldlevel = 99, -- open all folds by default
    inccommand = "nosplit", -- visual feedback while substituting
    showtabline = 2, -- always show tabline
    grepprg = "rg --vimgrep", -- use rg as default grepper
    scrolloff = 8, -- for context when scrolling (neoscroll needs this)
    sidescrolloff = 8,
    hidden = true, -- switch buffer without saving
    timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 1000, -- time to trigger things like nvim-cursorword (if not using plugin)
    completeopt = { "menuone", "noselect" }, -- for cmp
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time

    -- performance tweaks
    cursorline = false,
    cursorcolumn = false,
    scrolljump = 5,
    lazyredraw = true,
    redrawtime = 10000,
    synmaxcol = 180,
    regexpengine = 0,

    -- turn off backups (we have git and other vcs anyways)
    backup = false,
    wb = false,
    swapfile = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- show spaces and eol as --
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
