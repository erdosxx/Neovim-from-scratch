local ok, copilot = pcall(require, "copilot")
if not ok then
	return
end

copilot.setup({
	panel = {
		enabled = false,
		auto_refresh = true,
		keymap = {
			jump_next = "<c-j>",
			jump_prev = "<c-k>",
			accept = "<c-a>",
			refresh = "r",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = false,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<c-a>",
			accept_word = false,
			accept_line = false,
			next = "<c-j>",
			prev = "<c-k>",
			dismiss = "<C-e>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap.set
