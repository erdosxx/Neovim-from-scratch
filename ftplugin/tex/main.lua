-- conceallevel = 2 recommended in vimtex. See :h vimtex-syntax-conceal
vim.cmd("set conceallevel=2")
-- this does not work
--[[ vim.api.nvim_set_option("conceallevel", 2) ]]

vim.api.nvim_set_var("vimtex_syntax_conceal", {
	accents = 1,
	ligatures = 1,
	cites = 1,
	fancy = 1,
	spacing = 1,
	greek = 1,
	math_bounds = 1,
	math_delimiters = 1,
	math_fracs = 1,
	math_super_sub = 0, -- disable conceal for super and sub script
	math_symbols = 1,
	sections = 0, -- disable conceal for sections. \section{Test} -> # Test
	styles = 1,
})

-- Example: adding `\big` to VimTeX's delimiter toggle list
vim.api.nvim_set_var(
	"vimtex_delim_toggle_mod_list",
	{ { "\\left", "\\right" }, { "\\big", "\\big" }, { "\\Big", "\\Big" } }
)

-- See :h vimtex_quickfix_mode = 2 (default value)
vim.api.nvim_set_var("vimtex_quickfix_mode", 2)

-- set by default, latex by vimtex
vim.api.nvim_set_var("let g:tex_flavor", "latex")

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n" }, "<localleader>v", "<Plug>(vimtex-view)", opts)

vim.api.nvim_set_keymap("n", "dsm", "<Plug>(vimtex-env-delete-math)", opts)

-- the am, im do not work because these two already mapped for items in itemize
-- and enumerate environments
vim.keymap.set({ "o", "x" }, "ax", "<Plug>(vimtex-a$)", opts)

vim.keymap.set({ "o", "x" }, "ix", "<Plug>(vimtex-i$)", opts)

vim.keymap.set({ "o", "x" }, "ai", "<Plug>(vimtex-am)", opts)

vim.keymap.set({ "o", "x" }, "ii", "<Plug>(vimtex-im)", opts)
