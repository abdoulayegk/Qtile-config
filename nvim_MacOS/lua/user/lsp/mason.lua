local servers = {
	"lua_ls",
	"cssls",
	"html",
	"ts_ls",
	"pyright",
	"jsonls",
	"clangd",
	-- "stylua",
	-- "prettier",
	-- "markdownlint",
	-- "clangd-format",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_enable = false,
})

local handlers = require("user.lsp.handlers")
local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	vim.notify("nvim-lspconfig not available", vim.log.levels.ERROR)
	return
end

local function setup_server(server_name)
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	local ok, conf_opts = pcall(require, "user.lsp.settings." .. server_name)
	if ok then
		opts = vim.tbl_deep_extend("force", opts, conf_opts)
	end

	lspconfig[server_name].setup(opts)
end

for _, server in ipairs(servers) do
	setup_server(vim.split(server, "@")[1])
end

-- Added code for clangd
-- lspconfig.clangd.setup({
-- 	on_attach = function(client, bufnr)
-- 		format_doc(client, bufnr, "clang_lsp")
-- 	end,
-- })

-- Note: clangd formatting is disabled in handlers.lua if needed
