-- :help options

-- allow backspacing over everything in insert mode
-- Ref: https://til.hashrocket.com/posts/f5531b6da0-backspace-options
vim.opt.backspace = { "indent", "eol", "start" }
-- do not keep a backup file, use versions instead (default = false)
vim.opt.backup = false
-- allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"
-- display incomplete commands (default = ture)
vim.opt.showcmd = true
-- keep 10000 lines of command line history (default = 10000)
vim.opt.history = 10000
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 2
-- do incremental searching (default = true)
vim.opt.incsearch = true
-- Enable folding: Lines with equal indent form a fold.
vim.opt.foldmethod = "indent"
-- When open a file, open all folds, regardless of method used for folding.
-- With foldlevel=0 all folded, foldlevel=1 only somes, ... higher numbers will
-- close fewer folds.
vim.opt.foldlevel = 99
-- to ensuring aligned indentation
-- For more detail, see following.
-- https://vimtricks.com/p/ensuring-aligned-indentation/
vim.opt.shiftround = true
-- show matching brace
-- See: https://vimtricks.com/p/vimtrick-highlight-matching-bracket/
vim.opt.showmatch = true
vim.opt.matchtime = 3
-- mostly just for cmp
vim.opt.completeopt = { "menuone", "noselect" }
-- Determine how text with the "conceal" syntax attribute
-- 0:Text is shown normally (Default)
-- so that `` is visible in markdown files
vim.opt.conceallevel = 0
-- the encoding written to a file
vim.opt.fileencoding = "utf-8"
-- highlight all matches on previous search pattern
vim.opt.hlsearch = true
-- ignore case in search patterns
vim.opt.ignorecase = true
-- allow the mouse to be used in neovim
vim.opt.mouse = "a"
-- pop up menu height
vim.opt.pumheight = 10
-- we don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false
-- always show tabs
vim.opt.showtabline = 2
-- Override the 'ignorecase' option if the search pattern contains
-- upper case characters.
vim.opt.smartcase = true
-- make indenting smarter again
vim.opt.smartindent = true
-- force all horizontal splits to go below current window
vim.opt.splitbelow = true
-- force all vertical splits to go to the right of current window
vim.opt.splitright = true
-- creates a swapfile
vim.opt.swapfile = false
-- Enable 24-bit RGB color for TUI.
vim.opt.termguicolors = true
-- time to wait for a mapped sequence to complete (in milliseconds)
-- Default = 1000
vim.opt.timeoutlen = 1000
-- enable persistent undo even after saving
vim.opt.undofile = true
-- faster completion (4000ms default)
vim.opt.updatetime = 300
-- if a file is being edited by another program
-- (or was written to file while editing with another program),
-- it is not allowed to be edited
vim.opt.writebackup = false
-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true
-- Number of spaces to use for each step of (auto)indent.
-- Used for 'cindent', >>, <<, etc.
vim.opt.shiftwidth = 2
-- insert 4 spaces for a tab
vim.opt.tabstop = 4
-- highlight the current line
vim.opt.cursorline = false
-- set numbered lines
vim.opt.number = true
-- set relative numbered lines
vim.opt.relativenumber = true
-- set number column width to 2 {default 4}
vim.opt.numberwidth = 4
-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"
-- display lines as one long line
vim.opt.wrap = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- The minimal number of screen columns to keep to the left and to the
vim.opt.sidescrolloff = 8
-- the font used in graphical neovim applications
-- vim.opt.guifont = "monospace:h17"

-- Use short message
-- c: don't give |ins-completion-menu| messages.
vim.opt.shortmess:append("c")
-- keys allowed to move to the previous/next line
-- when the beginning/end of line is reached
vim.opt.whichwrap:append("<,>,[,],h,l")
-- treats words with `-` as single words
vim.opt.iskeyword:append("-")
-- c: Auto-wrap comments using 'textwidth', inserting the current comment
-- leader automatically.
-- r: Automatically insert the current comment leader after hitting
-- <Enter> in Insert mode.
-- o: Automatically insert the current comment leader after hitting
-- 'o' or 'O' in Normal mode.
vim.opt.formatoptions:remove({ "c", "r", "o" })
-- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.fillchars.eob = " "
