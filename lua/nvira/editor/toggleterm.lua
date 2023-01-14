local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
	return
end

toggleterm.setup({
	size = 10,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 1,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()

	local opts = { noremap = true }

	vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Open a horizontal terminal with Ctrl-Space
vim.api.nvim_buf_set_keymap(0, 'n', '<C-Space>', "<Cmd>2ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

-- TODO: Open vertical terminal w/ Ctrl-|
---- Open a vertical terminal with Ctrl-|
--vim.api.nvim_buf_set_keymap(0, 'n', '<C-|>', "<Cmd>3ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

-- Create special screens
local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end
