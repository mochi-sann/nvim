local ccc = require("ccc")
local mapping = ccc.mapping
ccc.setup({
	-- Your favorite settings
	highlighter = {
		auto_enable = true,
	},
})

vim.api.nvim_set_keymap("n", "<Space>c", ":CccPick<cr>", { silent = true, noremap = true })
