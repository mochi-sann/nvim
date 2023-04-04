vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#a05059 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#a48a5d gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#6e8c5c gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#41838d gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#487eac gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#8e58a0 gui=nocombine]])

require("indent_blankline").setup({
	-- space_char_blankline = "",
	-- show_current_context = true,
	-- show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	filetype_exclude = {
		"startify",
		"dashboard",
		"dotooagenda",
		"fugitive",
		"gitcommit",
		"packer",
		"vimwiki",
		"markdown",
		"txt",
		"vista",
		"help",
		"todoist",
		"NvimTree",
		"peekaboo",
		"git",
		"TelescopePrompt",
		"undotree",
		"flutterToolsOutline",
	},
})
