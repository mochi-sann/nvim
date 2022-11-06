-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#3F0D11 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#664914 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#324921 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#215359 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#1060A1 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#67207D gui=nocombine]])
--
-- -- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
--
-- require("indent_blankline").setup({
-- 	space_char_blankline = " ",
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 		"IndentBlanklineIndent3",
-- 		"IndentBlanklineIndent4",
-- 		"IndentBlanklineIndent5",
-- 		"IndentBlanklineIndent6",
-- 	},
-- })
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt.termguicolors = true
-- 		if vim.o.background == "dark" then
-- 			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#3F0D11 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#664914 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#324921 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#215359 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#1060A1 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#67207D gui=nocombine]])
-- 		else
-- 			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- 			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
-- 		end
-- 		-- vim.opt.list = true
-- 		vim.opt.listchars:append("space:⋅")
--
-- 		require("indent_blankline").setup({
-- 			space_char_blankline = " ",
-- 			char_highlight_list = {
-- 				"IndentBlanklineIndent1",
-- 				"IndentBlanklineIndent2",
-- 				"IndentBlanklineIndent3",
-- 				"IndentBlanklineIndent4",
-- 				"IndentBlanklineIndent5",
-- 				"IndentBlanklineIndent6",
-- 			},
-- 		})
-- 	end,
-- })
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
