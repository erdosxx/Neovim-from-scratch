local opts = { noremap = true, silent = true }
local opts_remap = { noremap = false, silent = true }
local opts_remap_echo = { noremap = false, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

--- Jupyter vim ---
keymap("n", "<localleader>o", "<cmd>JupyterConnect<CR>", opts)

keymap("n", "<localleader>u", "<cmd>JupyterSendRange<CR>", opts)

keymap(
	"v",
	"<localleader>u",
	"V<cmd>normal! <Plug>JupyterRunVisual<CR> <cmd>normal! `><CR><ESC>",
	opts
)
keymap(
	"v",
	"<localleader>k",
	"<Plug>JupyterRunVisual<CR> <cmd>normal! `><CR>",
	opts
)
-- [m: Previous method start
-- ]M: Next method ned
keymap(
	"n",
	"<localleader>/",
	"[m:Format<CR>]MV[m:JupyterSendRange<CR> <cmd>normal! `><CR>",
	opts_remap -- for using %, need to use remap
)

keymap(
	"n",
	"<localleader>.",
	"%:Format<CR>v%:JupyterSendRange<CR>%$",
	opts_remap -- for using %, need to use remap
)
