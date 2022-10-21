local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	finder_action_keys = {
		vsplit = "v",
		scroll_down = "<C-t>",
		scroll_up = "<C-s>",
	},
}

which_key.setup(setup)

local opts = {
	mode = "n", -- NORMAL mode
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local telescopeBuiltin = require("telescope.builtin")

-- normal mode --
local mappings = {
	["<Tab>"] = { ":NvimTreeToggle<CR>", "Explorer" },
	["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "lsp hover" },
	["D"] = {
		function()
			vim.diagnostic.open_float()
		end,
		"diagnostic float",
	},
	["<leader>"] = {
		-- TODO
		-- a = {[[<Cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>]], 'code actions'},
		a = { vim.lsp.buf.code_action, "code actions" },
		w = { ":w<CR>", "write buffer" },
		h = { require("hop").hint_words, "hop" },
		f = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"format",
		},
		rn = { vim.lsp.buf.rename, "lsp rename" },
	},
	["<leader>l"] = {
		name = "list",
		l = { telescopeBuiltin.builtin, "lists" },
		f = { telescopeBuiltin.find_files, "files" },
		b = { ":Telescope file_browser<CR>", "file browser" }, -- TODO
		s = { telescopeBuiltin.current_buffer_fuzzy_find, "search buffer" },
		em = { telescopeBuiltin.symbols, "symbols" },
		hf = {
			function()
				telescopeBuiltin.find_files({ hidden = true })
			end,
			"hidden files",
		},
		ht = { telescopeBuiltin.help_tags, "help" },
		cs = { telescopeBuiltin.colorscheme, "colorschemes" },
		g = {
			name = "git",
			c = { telescopeBuiltin.git_commits, "commits" },
			bc = { telescopeBuiltin.git_bcommits, "buffer commits" },
			br = { telescopeBuiltin.git_branches, "branches" },
			ss = { telescopeBuiltin.git_status, "status" },
			sh = { telescopeBuiltin.git_stash, "stash" },
		},
		z = { ":LazyGit<CR>", "lazygit" },
		-- lsp --
		r = { telescopeBuiltin.lsp_references, "lsp references" },
		o = { telescopeBuiltin.lsp_document_symbols, "lsp symbols" },
		d = {
			function()
				telescopeBuiltin.diagnostics({ bufnr = 0 })
			end,
			"lsp buffer diagnostics",
		},
		D = { telescopeBuiltin.diagnostics, "lsp all buffers diagnostics" },
		v = { telescopeBuiltin.live_grep, "live grep" },
	},
	["<leader>g"] = {
		name = "go",
		i = { telescopeBuiltin.lsp_implementations, "implementations" },
		d = { telescopeBuiltin.lsp_definitions, "definition" },
		td = { telescopeBuiltin.lsp_type_definitions, "type definition" },
		l = { require("hop").hint_lines, "line" },
	},
	["<leader>c"] = {
		name = "close",
		b = { ":Bdelete<CR>", "buffer" },
		w = { ":q<CR>", "window" },
	},
	["<leader>p"] = {
		s = { "<cmd>PackerSync<CR>", "Sync" },
		t = { "<cmd>PackerStatus<CR>", "Status" },
        h = { require('telescope').extensions.neoclip.default, "clipboard history" },
	},
	["<leader>e"] = { ":!npm run lint:fix<CR>", "lint fix" },
}
which_key.register(mappings, opts)

-- visual mode --
local visualOpts = {
	mode = "v",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local visualMappings = {
	["<leader>"] = {
		a = {
			[[<Cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor({}))<CR>]],
			"code actions",
		},
		h = { [[<Cmd>lua require('hop').hint_words()<CR>]], "hop" },
		gl = { [[<Cmd>lua require('hop').hint_lines()<CR>]], "line" },
	},
}

which_key.register(visualMappings, visualOpts)
