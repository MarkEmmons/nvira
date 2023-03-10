local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]])

-- Use protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

---- Use a popup window
--packer .init {
--	display = {
--		open_fn = function()
--			return require("packer.util").float { border = "rounded" }
--		end,
--	},
--}

-- Install plugins
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- Popup API for Neovim
	use("nvim-lua/plenary.nvim") -- Lua functions used by many plugins

	-- Nvim-Dap
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"jbyuki/one-small-step-for-vimkind",
			"mxsdev/nvim-dap-vscode-js",
		},
	})
	--use {
	--	"microsoft/vscode-js-debug",
	--	opt = true,
	--	run = "npm install --legacy-peer-deps && npm run compile",
	--}

	-- Nvim-Tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"moll/vim-bbye",
		},
	})

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine

	-- LSP
	use({
		"neovim/nvim-lspconfig",
	})

	-- rust-tools
	use({
		"simrat39/rust-tools.nvim",
	})
	use("simrat39/symbols-outline.nvim")
	--use 'vadimcn/vscode-lldb'

	-- Neotest
	use({
		"nvim-neotest/neotest",
		requires = {

			-- Requirements
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",

			-- Adapters
			--"rouge8/neotest-rust",
			"nvim-neotest/neotest-plenary",
		},
	})
	use("~/workspace/Lua/neotest-rust")
	use("~/workspace/Lua/neotest-deno")

	-- Autopairs
	use("windwp/nvim-autopairs")
	use("yamatsum/nvim-cursorline")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Winbar and Statusline
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		requires = {
			"nvim-treesitter/playground",
		},
	})

	-- Git
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
	})
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Diagnostics
	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	})

	-- THEMES
	use("rktjmp/lush.nvim")
	--use "noahfrederick/vim-noctu" -- Inherit color scheme from the terminal
	--use "~/workspace/Lua/noc2.nvim" -- Inherit color scheme from the terminal
	use("sainnhe/gruvbox-material")
	use("rebelot/kanagawa.nvim")
	use("sindrets/oxocarbon-lua.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
