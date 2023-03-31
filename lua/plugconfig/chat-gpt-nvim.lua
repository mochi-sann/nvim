require("chatgpt").setup({
	-- optional configuration
	keymaps = {
		close = { "<C-c>", "<Esc>" },
		yank_last = "<C-y>",
		scroll_up = "<C-u>",
		scroll_down = "<C-d>",
		toggle_settings = "<C-o>",
		new_session = "<C-n>",
		cycle_windows = "<Tab>",
		-- in the Sessions pane
		select_session = "<Space>",
		rename_session = "r",
		delete_session = "d",
	},
	answer_sign = "ﮧ", -- 🤖
})

-- tk: talk to chatgpt
-- tj: talk to chatgpt as
-- tt: talk to chatgpt edit with instructions
vim.keymap.set("n", "<Space>tk", "<cmd>:ChatGPT<cr>")
vim.keymap.set("n", "<Space>tj", "<cmd>:ChatGPTActAs<cr>")
vim.keymap.set("n", "<Space>tt", "<cmd>:ChatGPTEditWithInstructions<cr>")
vim.keymap.set("v", "<Space>tt", "<cmd>:ChatGPTEditWithInstructions<cr>")
