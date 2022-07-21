require("toggleterm").setup({
	open_mapping = [[<C-t>]],
	-- size = 20,
	direction = "tab",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-l>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
