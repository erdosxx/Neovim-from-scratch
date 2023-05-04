local ok, copilot_cmp = pcall(require, "copilot_cmp")
if not ok then
	return
end

copilot_cmp.setup({
	formatters = {
		label = copilot_cmp.format.format_label_text,
		-- insert_text = copilot_cmp.format.format_insert_text,
		insert_text = require("copilot_cmp.format").remove_existing,
		preview = copilot_cmp.format.deindent,
	},
})
