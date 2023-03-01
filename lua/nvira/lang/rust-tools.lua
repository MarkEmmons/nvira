local rust_ok, rt = pcall(require, "rust-tools")
if not rust_ok then
	return
end

local opts = {

	dap = {
		adapter = require("nvira.lang.dap.codelldb").codelldb_adapter,
	},
	server = {

		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = false,
					},
				},
			},
		},

		on_attach = function(client, bufnr)
			local keymap = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }

			require("nvim-navic").attach(client, bufnr)
			require("nvira.lang.lsp.handlers").LspKeymaps(bufnr)
			require("nvira.lang.lsp.handlers").LspHighlightDocument(client)

			keymap(bufnr, "n", "<Leader>1", "<cmd>RustEnableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>2", "<cmd>RustDisableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>3", "<cmd>RustSetInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>4", "<cmd>RustUnsetInlayHints<CR>", opts)
		end,

		settings = {
			["rust-analyzer"] = {
				inlayHints = { locationLinks = false },
			},
		},
	},
	tools = {

		inlay_hints = {
			auto = false,
		},
	},
}

rt.setup(opts)
