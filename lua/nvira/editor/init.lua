require "nvira.editor.autopairs"
require "nvira.editor.bufferline"
require "nvira.editor.colorscheme"
require "nvira.editor.cmp"
require "nvira.editor.nvim-tree"
require "nvira.editor.telescope"
require "nvira.editor.toggleterm"
require "nvira.editor.winbar"

require('nvim-cursorline').setup {
	cursorline = {
		enable = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
}
