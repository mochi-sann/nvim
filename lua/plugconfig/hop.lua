require("hop").setup({ keys = "etovxqpdygfblzhkisuran" })
local vim = vim

vim.api.nvim_set_keymap("", "<Space>hw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>hp", "<cmd>HopPattern<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>ha", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>hl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Space>hc", "<cmd>HopWordCurrentLine<cr>", { noremap = true, silent = true })
