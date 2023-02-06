-- vim.cmd([[
--[[ " Use Tab to expand and jump through snippets ]]
--[[ imap <silent><expr> <C-f> luasnip#expand_or_jumpable() ? ]]
--[[   \ '<Plug>luasnip-expand-or-jump' : '<C-f>'  ]]
--[[ smap <silent><expr> <C-f> luasnip#jumpable(1) ? ]]
--[[   \ '<Plug>luasnip-jump-next' : '<C-f>' ]]
--[[]]
--[[ " Use Shift-Tab to jump backwards through snippets ]]
--[[ imap <silent><expr> <A-Tab> luasnip#jumpable(-1) ? ]]
--[[   \ '<Plug>luasnip-jump-prev' : '<A-Tab>' ]]
--[[ smap <silent><expr> <A-Tab> luasnip#jumpable(-1) ? ]]
--[[   \ '<Plug>luasnip-jump-prev' : '<A-Tab>' ]]
--[[]]
--[[ " Cycle forward through choice nodes with Control-f (for example) ]]
--[[ imap <silent><expr> <C-k> luasnip#choice_active() ? ]]
--[[   \ '<Plug>luasnip-next-choice' : '<C-k>' ]]
--[[ smap <silent><expr> <C-k> luasnip#choice_active() ? ]]
--[[   \ '<Plug>luasnip-next-choice' : '<C-k>' ]]
-- ]])

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-f>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

vim.keymap.set(
	"n",
	"<Leader>o",
	'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/user/LuaSnip/"})<CR>'
)

-- Place this in your init.lua
require("luasnip.loaders.from_lua").load({
	paths = "~/.config/nvim/lua/user/LuaSnip",
})

require("luasnip").config.set_config({ -- Setting LuaSnip config
	history = true,

	-- Enable autotriggered snippets
	enable_autosnippets = true,

	--[[ -- Use Tab (or some other key if you prefer) to trigger visual selection ]]
	store_selection_keys = "<C-f>",

	-- Update text as you type for repeat node
	update_events = "TextChanged,TextChangedI",

	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { "➜", "GruvboxOrange" } },
			},
		},
	},
})
