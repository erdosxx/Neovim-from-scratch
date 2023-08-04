vim.api.nvim_set_var("vimtex_imaps_leader", "¬")
vim.api.nvim_set_var("vimtex_view_method", "zathura")

vim.cmd([[
  :setlocal spell spelllang=en_us
]])

local opts = { noremap = true, silent = true }

-- Ref: https://castel.dev/post/lecture-notes-1
vim.keymap.set({ "i" }, "<C-y>", "<C-g>u<ESC>[s1z=`]a<C-g>u", opts)
