local opts = { noremap = true, silent = true }
local opts_remap = { noremap = false, silent = true }
local opts_remap_echo = { noremap = false, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = "-"
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator-pening = "o"

-- Normal --
-- Don't use Ex mode, use Q for formatting
-- gq: apply format, such as line width for that area.
-- For example, :setlocal tw=N
-- See: https://www.vim.org/scripts/script.php?script_id=4924
keymap("n", "Q", "gq", opts)

-- change word to upper case in normal mode.
keymap("n", "<leader><C-u>", "viwUw", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize to full windth window
keymap("n", "<localleader>|", "<C-w>|", opts)
-- Resize to equal windth window
keymap("n", "<localleader>=", "<C-w>=", opts)

-- Put file explore to Left with size 30
-- keymap("n", "<localleader>e", ":Lexplore 30<cr>", opts)

-- Edit $MYVIMRC in vertical split window
keymap("n", "<leader>nv", ":vsplit $MYNVIMLUARC<CR>", opts)
-- Read and apply $MYVIMRC
-- keymap("n", "<leader>sv", ":source $MYNVIMLUARC<CR>", opts)
-- Ref: https://stackoverflow.com/questions/72412720/how-to-source-init-lua-without-restarting-neovim
keymap("n", "<leader>sv", "<cmd>lua ReloadConfig()<CR>", opts)
-- Edit $MYURXVTRC in vertical split window
keymap("n", "<leader>uv", ":vsplit $MYURXVTRC<CR>", opts)
-- Read and apply $MYURXVTRC
keymap("n", "<leader>su", "!xrdb $HOME/.Xresources<CR>", opts)

-- Add " to start and end of word. Ex) word -> "word"
keymap("n", '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', opts)
-- Add ' to start and end of word. Ex) word -> 'word'
keymap("n", "<leader>'", "viw<esc>a'<esc>bi'<esc>lel", opts)

-- Go to the beginning of the current line
keymap("n", "H", "^", opts)
-- Go to the end of the current line
keymap("n", "L", "$", opts)

-- Resize window
keymap("n", "<localleader><Up>", ":resize -2<CR>", opts)
keymap("n", "<localleader><Down>", ":resize +2<CR>", opts)
keymap("n", "<localleader><Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<localleader><Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- use <leader>b and select instead. see whichkey.lua
--[[ keymap("n", "<localleader>0", ":bnext<CR>", opts) ]]
--[[ keymap("n", "<localleader>7", ":bprevious<CR>", opts) ]]

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- change word to upper case in insert mode.
keymap("i", "<leader><C-u>", "<ESC>lviwUwi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- paste text in visual area
keymap("v", "p", '"_dP', opts)

-- Add " to start and end of word. Ex) word -> "word"
keymap("v", '<leader>"', '<ESC>`>a"<ESC>`<i"<ESC>', opts)
-- Add ' to start and end of word. Ex) word -> 'word'
keymap("v", "<leader>'", "<ESC>`>a'<ESC>`<i'<ESC>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- local term_opts = { silent = true }
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--- Jupyter vim ---
keymap(
	"v",
	"<localleader>r",
	":JupyterSendRange<CR> :<C-u>normal! `><CR>",
	opts
)

-- Nvimtree
--[[ keymap("n", "<localleader>e", ":NvimTreeToggle<cr>", opts) ]]

-- See handlers.lua for the definition of Format
keymap("n", "<localleader>f", ":Format<cr>", opts)

-- Telescope
keymap("n", "<C-s>", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", opts)

--Buffer line
-- wipeout current buffer
keymap("n", "<localleader>v", "<cmd>Bdelete!<cr>", opts)

-- ChatGPT

keymap("n", "<localleader>p", "<cmd>ChatGPT<cr>", opts)
keymap("n", "<localleader>n", "<cmd>NeoAI<cr>", opts)
keymap("n", "<localleader>t", "<cmd>NeoAIToggle<cr>", opts)
keymap("v", "<localleader>c", "<cmd>NeoAIContext<cr>", opts)

-- Packer & Mason
-- Use <leader>ps instead. Ref whichkey.lua
--[[ keymap("n", "<localleader>4", "<cmd>PackerSync<cr>", opts) ]]
-- Use <leader>pm instead. Ref whichkey.lua
--[[ keymap("n", "<localleader>5", "<cmd>Mason<cr>", opts) ]]

-- when cmp give choices,
-- abort it and move forward to next input for snippet.
keymap("i", "<F2>", "<ESC>i<C-j>", opts_remap_echo)
-- remove comment string and add normal input for coding.
keymap("i", "<F3>", "<ESC>xa", opts_remap_echo)

local status_ok, harpoon = pcall(require, "harpoon")
if status_ok then
	require("user.harpoon").config()
end
