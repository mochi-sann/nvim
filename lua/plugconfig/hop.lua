require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

vim.api.nvim_set_keymap("n", "<C-f>w", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>a", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>l", "<cmd>HopLine<cr>", { noremap = true, silent = true })
