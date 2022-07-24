require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

vim.api.nvim_set_keymap("n", "Fw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Fa", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Fl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
