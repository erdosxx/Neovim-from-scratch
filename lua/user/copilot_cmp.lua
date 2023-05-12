local copilot_cmp_format = require("copilot_cmp.format")

require("copilot_cmp").setup({
	formatters = {
		label = copilot_cmp_format.format_label_text,
		--[[ label = copilot_cmp.format.format_label_text, ]]
		-- insert_text = copilot_cmp.format.format_insert_text,
		insert_text = copilot_cmp_format.remove_existing,
		preview = copilot_cmp_format.deindent,
		--[[ preview = copilot_cmp.format.deindent, ]]
	},
})
