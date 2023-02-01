require("hop").setup({ keys = "etovqpdygfblzhkisuran" })
local vim = vim

vim.api.nvim_set_keymap("", "<Space>ww", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>wp", "<cmd>HopPattern<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>wa", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>wl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>wc", "<cmd>HopWordCurrentLine<cr>", { noremap = true, silent = true })
