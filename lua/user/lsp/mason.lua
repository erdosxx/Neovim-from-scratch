local servers = {
	"bashls",
	"cssls",
	"html",
	"jsonls",
	"texlab",
	"pyright",
	"sumneko_lua", -- will be replaced by "lua_ls"
	"tsserver",
	"yamlls",
	"julials",
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
	-- Ref: https://www.reddit.com/r/neovim/comments/1107xiz/how_to_fix_sumneko_lua_is_deprecated_use_lua_ls/
	if server == "sumneko_lua" then
		server = "lua_ls"
	end

	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts =
		pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
