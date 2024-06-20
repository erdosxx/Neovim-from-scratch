local servers = {
	"bashls",
	"cssls",
	"html",
	"jsonls",
	"ltex",
	"pyright",
	"lua_ls",
	"tsserver",
	"yamlls",
	"julials",
	"clojure_lsp",
	"clangd",
	"java_language_server",
	"marksman",
	"rust_analyzer",
	"rnix",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
	if server == "clangd" then
		opts.cmd = { "clangd", "--offset-encoding=utf-16" }
	end

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		--[[ vim.notify(server .. " loaded.") ]]
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
