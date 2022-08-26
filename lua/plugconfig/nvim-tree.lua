local config = {
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

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeOpen<cr>", { silent = true, noremap = true })
require("nvim-tree").setup(config)
