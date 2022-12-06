require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

vim.api.nvim_set_keymap("", "<Space>fw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fa", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fc", "<cmd>HopWordCurrentLine<cr>", { noremap = true, silent = true })
