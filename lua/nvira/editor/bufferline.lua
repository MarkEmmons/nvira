local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local function run_custom_filter(buf_number, _)
	-- filter out by buffer name
	if vim.fn.bufname(buf_number) ~= "[dap-repl]" and vim.fn.bufname(buf_number) ~= "[No Name]" then
		return true
	end
end

-- TODO: Map <dir>/init.lua to <dir>
--local function run_name_formatter(path) end

local opts = {

	-- Use vimbbye for close commands
	close_command = "Bdelete! %d",
	right_mouse_command = "Bdelete! %d",

	-- Icons
	indicator = {
		style = "icon",
		icon = "▎",
	},
	buffer_close_icon = "",
	modified_icon = "●",
	close_icon = "",
	left_trunc_marker = "",
	right_trunc_marker = "",

	-- Naming
	--max_name_length = 30,
	--max_prefix_length = 30,

	-- Diagnostics
	diagnostics = false, -- set to "nvim_lsp" for lsp
	diagnostics_update_in_insert = false,

	-- Filter out buffers created by other plugins
	custom_filter = run_custom_filter,
	--name_formatter = run_name_formatter,

	-- Offsets: TODO: dap-ui
	offsets = {
		{ filetype = "NvimTree", text = "", padding = 1 },
		{ filetype = "dapui_breakpoints", text = "", padding = 1 },
	},

	-- TODO: This doesn't work, see :help bufferline-hover-events
	--hover = {
	--	enabled = true,
	--	delay = 200,
	--	reveal = {'close'}
	--},
}

local function bl_expand_highlight(highlight)
	return {
		fg = { attribute = "fg", highlight = highlight.fg },
		bg = { attribute = "bg", highlight = highlight.bg },
		italic = highlight.italic,
	}
end

-- Highlight keys
-- - Selected - Applies to buffer in active window
-- - Visible - Applies to buffers visible in inactive windows
local hl = {

	background = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }), -- ?

	buffer_selected = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	buffer_visible = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),

	close_button = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	close_button_selected = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	close_button_visible = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),

	duplicate = bl_expand_highlight({ fg = "TabLine", bg = "Normal", italic = true }),
	duplicate_selected = bl_expand_highlight({ fg = "TabLine", bg = "Normal", italic = true }),
	duplicate_visible = bl_expand_highlight({ fg = "TabLine", bg = "Normal", italic = true }),

	fill = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),

	indicator_selected = bl_expand_highlight({ fg = "LspDiagnosticsDefaultHint", bg = "Normal" }),

	modified = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	modified_selected = bl_expand_highlight({ fg = "Normal", bg = "Normal" }),
	modified_visible = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),

	separator = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	separator_selected = bl_expand_highlight({ fg = "Normal", bg = "Normal" }),
	separator_visible = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),

	tab = bl_expand_highlight({ fg = "TabLine", bg = "Normal" }),
	tab_selected = bl_expand_highlight({ fg = "Normal", bg = "Normal" }),
	tab_close = bl_expand_highlight({ fg = "TabLineSel", bg = "Normal" }),
}

bufferline.setup({ options = opts, highlights = hl })
