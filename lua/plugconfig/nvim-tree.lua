local config = {
	filters = {
		dotfiles = false,
		exclude = { vim.fn.stdpath("config") .. "/lua/custom", ".git" },
	},

	renderer = {

		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	hijack_cursor = true,
	view = {
		side = "right",

		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit" },
				{ key = "L", action = "vsplit_preview" },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all" },
				{ key = "?", action = "toggle_help" },
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	git = {
		ignore = false,
	},
}

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Space>n", ":NvimTreeOpen<cr>", { silent = true, noremap = true })
require("nvim-tree").setup(config)
