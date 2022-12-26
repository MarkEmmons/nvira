local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvira.lang.lsp.lsp-installer")
require("nvira.lang.lsp.handlers").setup()
