local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local opts = {
	on_attach = require("nvira.lang.lsp.handlers").on_attach,
	capabilities = require("nvira.lang.lsp.handlers").capabilities,
}

local language_servers = {
	'sumneko_lua',
	'bashls',
	'denols',
	'jedi_language_server',
	'texlab',
}

for _, language_server in ipairs(language_servers) do

	local status, settings = pcall(require, "nvira.lang.lsp.settings." .. language_server)
	local ls_opts = status and settings or {}

	nvim_lsp[language_server].setup(
		vim.tbl_deep_extend(
			"force",
			ls_opts,
			opts))
end

-- Augment vim.g.markdown_fenced_languages to appropriately highlight codefences returned from denols 
vim.g.markdown_fenced_languages = { "ts=typescript" }

require("nvira.lang.lsp.handlers").setup()
