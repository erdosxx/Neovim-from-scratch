local opts = { noremap = true, silent = true }
local opts_remap = { noremap = false, silent = true }
local opts_remap_echo = { noremap = false, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Julia
keymap("n", "<localleader>o", "<cmd>JuliaREPLConnect<cr>", opts)
keymap("n", "<localleader>u", "<cmd>JuliaREPLSend<cr>", opts)
keymap(
	"v",
	"<localleader>u",
	-- Extend visual section to all lines and move to the last position(`>)
	--[[ "V:JuliaREPLSendRegion<CR> :<C-u>normal! `><CR>", ]]
	--[[ "V:JuliaREPLSendRegion<CR> <cmd>normal! `><CR>", ]]
	":JuliaREPLSend<CR>",
	opts
)
keymap(
	"v",
	"<localleader>k",
	":JuliaREPLSendRegion<CR> <cmd>normal! `><CR>",
	opts
)
keymap(
	"n",
	"<localleader>/",
	"%:Format<CR>v%:JuliaREPLSend<CR>%$",
	opts_remap -- for using %, need to use remap
)
-- when cmp give choices,
-- abort it and move forward to next input for snippet.
keymap("i", "<F2>", "<ESC>i<C-j>", opts_remap_echo)
-- remove comment string and add normal input for coding.
keymap("i", "<F3>", "<ESC>gcci", opts_remap_echo)
