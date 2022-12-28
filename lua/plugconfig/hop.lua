require("hop").setup({ keys = "etovxqpdygfblzhkisuran" })
local vim = vim

vim.api.nvim_set_keymap("", "<Space>fw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fp", "<cmd>HopPattern<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fa", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>fc", "<cmd>HopWordCurrentLine<cr>", { noremap = true, silent = true })
