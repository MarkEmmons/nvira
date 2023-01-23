local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local opts = {
	on_attach = require("nvira.lang.lsp.handlers").on_attach,
	capabilities = require("nvira.lang.lsp.handlers").capabilities,
}

local sumneko_opts = require("nvira.lang.lsp.settings.sumneko_lua")
local bashls_opts = require("nvira.lang.lsp.settings.bashls")
local denols_opts = require("nvira.lang.lsp.settings.denols")
local jedils_opts = require("nvira.lang.lsp.settings.jedils")
local texlab_opts = require("nvira.lang.lsp.settings.texlab")

nvim_lsp['sumneko_lua'].setup(vim.tbl_deep_extend("force", sumneko_opts, opts))
nvim_lsp['bashls'].setup(vim.tbl_deep_extend("force", bashls_opts, opts))
nvim_lsp['denols'].setup(vim.tbl_deep_extend("force", denols_opts, opts))
nvim_lsp['jedi_language_server'].setup(vim.tbl_deep_extend("force", jedils_opts, opts))
nvim_lsp['texlab'].setup(vim.tbl_deep_extend("force", texlab_opts, opts))

-- Augment vim.g.markdown_fenced_languages to appropriately highlight codefences returned from denols 
vim.g.markdown_fenced_languages = { "ts=typescript" }

require("nvira.lang.lsp.handlers").setup()
