-- Example: adding `\big` to VimTeX's delimiter toggle list
vim.api.nvim_set_var(
	"vimtex_delim_toggle_mod_list",
	{ { "\\left", "\\right" }, { "\\big", "\\big" }, { "\\Big", "\\Big" } }
)

-- Other leader but `variable does not work
vim.api.nvim_set_var("vimtex_imaps_leader", "¬")

vim.api.nvim_set_var("vimtex_view_method", "zathura")

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n" }, "<localleader>v", "<Plug>(vimtex-view)", opts)

vim.api.nvim_set_keymap("n", "dsm", "<Plug>(vimtex-env-delete-math)", opts)

-- the am, im do not work because these two already mapped for items in itemize
-- and enumerate environments
vim.keymap.set({ "o", "x" }, "ax", "<Plug>(vimtex-a$)", opts)

vim.keymap.set({ "o", "x" }, "ix", "<Plug>(vimtex-i$)", opts)

vim.keymap.set({ "o", "x" }, "ai", "<Plug>(vimtex-am)", opts)

vim.keymap.set({ "o", "x" }, "ii", "<Plug>(vimtex-im)", opts)
