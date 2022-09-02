require("toggleterm").setup({
	open_mapping = [[<C-t>]],
	-- size = 20,
	direction = "float",
	float_opts = {
		winblend = 8,
		border = "single",
	},
})
-- vim.api.nvim_set_keymap("n", "<A-t>", "ToggleTerm size=40 direction=horizontal", { noremap = true, silent = true })
vim.cmd([[

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>

nnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>
inoremap <silent><c-y> <Esc><Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>
]])
