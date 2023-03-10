local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.man_pages, {})
vim.keymap.set("n", "<leader>fm", builtin.keymaps, {})

vim.keymap.set("n", "<leader>fc", ':lua require("telescope.builtin").colorscheme({ enable_preview = true })<CR>', {})
