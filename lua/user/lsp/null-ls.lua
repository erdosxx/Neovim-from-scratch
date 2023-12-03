local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					local ft = vim.api.nvim_get_option_value("filetype", {})
					if ft ~= "markdown" then
						vim.lsp.buf.format({ bufnr = bufnr })
					end
				end,
			})
		end
	end,
	sources = {
		formatting.prettier.with({
			extra_args = {
				"--no-semi",
				"--single-quote",
				"--jsx-single-quote",
			},
		}),
		--[[ formatting.black.with({ extra_args = { "-l 79", "--fast" } }), ]]
		formatting.black.with({
			timeout = 2000,
			extra_args = { "--line-length", "79", "--fast" },
		}),
		-- formatting.yapf,
		formatting.stylua.with({ extra_args = { "--column-width", "79" } }),
		diagnostics.flake8,
		--[[ diagnostics.cspell, ]]
		diagnostics.mypy,
		-- error messages occurred for json parsing.
		--[[ diagnostics.proselint, ]]
		diagnostics.yamllint,
		diagnostics.zsh,
		formatting.bibclean,
		formatting.cljstyle,
		-- error occurred when apply formating with VimTeX.
		--[[ formatting.latexindent, ]]
	},
})
