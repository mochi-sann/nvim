require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	ensure_installed = {
		"c",
		"lua",
		"astro",
		"bash",
		"cmake",
		"dockerfile",
		"go",
		"html",
		"javascript",
		"json",
		"json5",
		"latex",
		"markdown",
		"php",
		"prisma",
		"python",
		"ruby",
		"rust",
		"svelte",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
		"cpp",
	},

	context_commentstring = { enable = true, enable_autocmd = false },

	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 300, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autotag = { enable = true },
})
