require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

vim.api.nvim_set_keymap("", "Fw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "Fa", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "Fl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
