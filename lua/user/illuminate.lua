local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
keymap(
	"n",
	"<localleader>9",
	'<cmd>lua require("illuminate").next_reference{wrap=true}<cr>',
	opts
)
keymap(
	"n",
	"<localleader>8",
	'<cmd>lua require("illuminate").next_reference{reverse=true, wrap=true}<cr>',
	opts
)

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 200,
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"alpha",
		"NvimTree",
		"packer",
		"neogitstatus",
		"Trouble",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"DressingSelect",
		"TelescopePrompt",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	providers_regex_syntax_denylist = {},
	providers_regex_syntax_allowlist = {},
	under_cursor = true,
})
