require("toggleterm").setup({
	open_mapping = [[<C-t>]],
	size = 100,
	direction = "tab",
	hide_numbers = false,
	float_opts = { winblend = 7, border = "curved" },
})
-- vim.api.nvim_set_keymap("n", "<A-t>", "ToggleTerm size=40 direction=horizontal", { noremap = true, silent = true })
-- vim.cmd([[
--
-- autocmd TermEnter term://*toggleterm#*
--       \ tnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>
--
-- nnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>
-- inoremap <silent><c-y> <Esc><Cmd>exe v:count1 . "ToggleTerm size=14 direction=horizontal"<CR>
-- ]])
