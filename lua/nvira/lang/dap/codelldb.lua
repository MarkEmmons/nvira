local extension_path = vim.env.HOME .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

local M = {}

M.codelldb_adapter = require("rust-tools.dap")
	.get_codelldb_adapter(codelldb_path, liblldb_path)

return M
