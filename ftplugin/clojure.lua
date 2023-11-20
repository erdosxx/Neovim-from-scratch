local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Conjure
keymap("n", "<localleader>o", "<cmd>ConjureCljRefreshAll<cr>", opts)
keymap("n", "<localleader>r", "<cmd>ConjureCljRefreshChanged<cr>", opts)
