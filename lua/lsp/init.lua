local ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not ok then
	return
end

local null_ls = require("lsp.servers.null-ls")
local utils = require("utils")

local servers = {
	"sumneko_lua",
	"jsonls",
	"tsserver",
	--	"bashls",
	--	"cssls",
	--	"html",
	--	"emmet_ls",
	--	"yamlls",
	--	"dockerls",
	--	"gopls",
}

-- Floating border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or { { " ", "FloatBorder" } }
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(client)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	-- format on save
	vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
	},
})

for _, server in ipairs(servers) do
	require("lsp.servers." .. server).setup(on_attach, capabilities)
end

null_ls.setup(on_attach)

-- Gutter sign icons
for type, icon in pairs(utils.signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Prefix diagnostic virtual text
vim.diagnostic.config({
	virtual_text = false,
	float = {
		header = false,
		source = "always",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})
