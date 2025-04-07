vim.api.nvim_set_var("vimtex_imaps_leader", "¬")
vim.api.nvim_set_var("vimtex_view_method", "zathura")

vim.cmd([[
  :setlocal spell spelllang=en_us,en_gb
]])

local opts = { noremap = true, silent = true }

-- Ref: https://castel.dev/post/lecture-notes-1
-- It basically jumps to the previous spelling mistake [s,
-- then picks the first suggestion 1z=, and then jumps back `]a.
-- The <c-g>u in the middle make it possible to undo the spelling correction quickly.
vim.keymap.set({ "i" }, "<C-y>", "<C-g>u<ESC>[s1z=`]a<C-g>u", opts)
