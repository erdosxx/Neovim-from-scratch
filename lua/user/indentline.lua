local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	enabled = true,
	filetypes = {
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"man",
		"gitcommit",
		"TelescopePrompt",
		"TelescopeResults",
		"startify",
		"dashboard",
		"neogitstatus",
		"NvimTree",
		"Trouble",
	},
	indent = { char = "▏" },
	show_start = false,
	show_end = false,
})
