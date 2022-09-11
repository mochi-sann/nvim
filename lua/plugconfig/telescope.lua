local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},

		winblend = 8,
		prompt_title = "",
		results_title = "",
		preview_title = "",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				width = 0.8,
				prompt_position = "top",
				show_line = true,
				sorting_strategy = "ascending",
			},
			-- other layout configuration here
		},

		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-q>"] = actions.close,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		layout_config = {
			prompt_position = "top",
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
local full_theme = {
	width = 0.8,
	show_line = true,
}

-- then use it on whatever picker you want
-- ex:
-- require("telescope.builtin").layout_strategies.cursor(full_theme)

vim.cmd([[
nnoremap [tel-p] <Nop>
xmap [tel-p] <Nop>

nmap <C-p> [tel-p]
xmap <C-p> [tel-p]

nnoremap [tel-p]p <cmd>lua require('telescope.builtin').find_files({hidden=true ,})<cr>
nnoremap [tel-p]gr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap [tel-p]b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap [tel-p]h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap [tel-p]ba <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap [tel-p]c <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap [tel-p]gb <cmd>lua require('telescope.builtin').git_branches() <cr>
nnoremap [tel-p]gs <cmd>lua require('telescope.builtin').git_status() <cr>

]])
