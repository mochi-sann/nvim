local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({ -- Packer can manage itself
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
			require("impatient").enable_profile()
		end,
	},

	--	{
	--		"rcarriga/nvim-notify",
	--		config = function()
	--			require("plugconfig/nvim-notify")
	--		end,
	--	},

	{
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						-- Set the filetype of *.pn files to potion
						pn = "potion",
					},
					literal = {
						-- Set the filetype of files named "MyBackupFile" to lua
						MyBackupFile = "lua",
					},
					complex = {
						-- Set the filetype of any full filename matching the regex to gitconfig
						[".*git/config"] = "gitconfig", -- Included in the plugin
					},

					-- The same as the ones above except the keys map to functions
					function_extensions = {
						["cpp"] = function()
							vim.bo.filetype = "cpp"
							-- Remove annoying indent jumping
							vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
						end,
						["pdf"] = function()
							vim.bo.filetype = "pdf"
							-- Open in PDF viewer (Skim.app) automatically
							vim.fn.jobstart("open -a skim " .. '"' .. vim.fn.expand("%") .. '"')
						end,
					},
					function_literal = {
						Brewfile = function()
							vim.cmd("syntax off")
						end,
					},
					function_complex = {
						["*.math_notes/%w+"] = function()
							vim.cmd("iabbrev $ $$")
						end,
					},

					shebang = {
						-- Set the filetype of files with a dash shebang to sh
						dash = "sh",
					},
				},
			})
		end,
	},
	{ "junegunn/fzf", run = ":call fzf#install()" },
	{ "nvim-lua/popup.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		module = { "telescope" },
		event = "VimEnter",
		dependencies = {
			{ "nvim-telescope/telescope-ghq.nvim" },
			{ "nvim-telescope/telescope-z.nvim" },
			{
				"nvim-telescope/telescope-frecency.nvim",
				dependencies = { "kkharji/sqlite.lua" },
			},
			"telescope-ghq.nvim",
			"telescope-z.nvim",
			"telescope-frecency.nvim",

			-- その他の拡張プラグイン……
		},
		setup = function() end,
		config = function()
			require("plugconfig/telescope")
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("plugconfig/lspkind")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer", event = "VimEnter" },
			{ "hrsh7th/cmp-emoji", event = "VimEnter" },
			{ "hrsh7th/cmp-nvim-lsp", event = "VimEnter" },
			{ "hrsh7th/cmp-path", event = "VimEnter" },
			{ "hrsh7th/cmp-cmdline", event = "VimEnter" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", event = "VimEnter" },
			{ "hrsh7th/cmp-nvim-lua", event = "VimEnter" },
			{ "hrsh7th/cmp-emoji", event = "VimEnter" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", event = "VimEnter" },
			{
				"hrsh7th/cmp-vsnip",
				event = "VimEnter",
				requires = { "vim-vsnip", "cmp-nvim-lsp-document-symbol" },
			},
			{
				"tzachar/cmp-tabnine",
				event = "VimEnter",
				config = function()
					require("plugconfig/cmp-tabnine")
				end,
				run = "./install.sh",
			},
		},
		event = "VimEnter",
		config = function()
			require("plugconfig/nvim_cmp")
		end,
	},

	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugconfig/mason-lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
	},

	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		event = "VimEnter",
		config = function()
			require("plugconfig/hop")
		end,
	},

	--

	{
		"hrsh7th/vim-vsnip",
		event = "VimEnter",
		config = function()
			require("plugconfig/vsnip")
		end,
		requires = {
			{ "hrsh7th/vim-vsnip-integ" },
		},
	},
	-- format and linter

	--{"lambdalisue/fern.vim" , opt = true, cmd = {'Fern'}},

	-- {
	--   "nvim-neo-tree/neo-tree.nvim",
	--   branch = "v2.x",
	--   event = "VimEnter",
	--   requires = {
	--     "nvim-lua/plenary.nvim",
	--     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	--     "MunifTanjim/nui.nvim",
	--   },
	--   config = function()
	--     require("plugconfig/neo-tree")
	--   end,
	-- },
	{
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugconfig/nvim-tree")
		end,
	},

	{
		"t9md/vim-quickhl",
		event = "VimEnter",
		opt = true,
		config = function()
			require("plugconfig/vim_quichl")
		end,
	},
	{
		"terryma/vim-expand-region",
		event = "VimEnter",
		opt = true,
		config = function()
			require("plugconfig/vim_expand_region")
		end,
	},
	{ "segeljakt/vim-silicon", opt = true, event = "VimEnter" },
	-- colorschem
	-- {
	-- 	"dracula/vim",
	-- 	opt = false,
	-- 	as = "dracula",
	-- },
	{
		"folke/tokyonight.nvim",
		opt = false,
		as = "tokyonight",
	},
	-- { "NLKNguyen/papercolor-theme", as = "papercolor" },
	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	config = function()
	-- 		require("plugconfig/auto-dark-mode")
	-- 	end,
	-- },
	-- { "sainnhe/sonokai" },

	--	{
	--		"rmagatti/auto-session",
	--		config = function()
	--			require("auto-session").setup({
	--				log_level = "error",
	--				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
	--			}),
	--		end,
	--	},

	--"rebelot/kanagawa.nvim")
	{ "kyazdani42/nvim-web-devicons" },
	{
		"akinsho/bufferline.nvim",
		version = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
		end,
	},

	{
		"alvarosevilla95/luatab.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugconfig/luatab")
		end,
	},
	--
	{
		"vim-jp/vimdoc-ja",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/vimdoc_ja")
		end,
	},
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "v2.*",
		event = "VimEnter",
		config = function()
			require("plugconfig/toggleterm")
		end,
	},
	-- git
	{
		"kdheepak/lazygit.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/lazygit")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		event = "VimEnter",
		opt = false,
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},

	{ "alaviss/nim.nvim", event = "VimEnter" },

	{
		"heavenshell/vim-jsdoc",
		event = "VimEnter",
		opt = false,
		cmd = { "JsDoc" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	},

	{
		"steelsojka/pears.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/pears")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/indent_blankline")
		end,
	},
	-- treesitter settins
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VimEnter",
		dependencies = {
			{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				after = "nvim-treesitter",
				config = function()
					require("plugconfig/treesitter-context")
				end,
			},
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter", "mini.nvim" } },
		},
		config = function()
			require("plugconfig/treesitter")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "MunifTanjim/nui.nvim" },

	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugconfig/lualine")
		end,
	},
	{
		"echasnovski/mini.nvim",
		branch = "stable",
		event = "VimEnter",
		config = function()
			require("plugconfig/mini")
		end,
	},
	-- {
	-- 	"tversteeg/registers.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("registers").setup()
	-- 	end,
	-- },
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup()
		end,
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugconfig/whichi_key")
	-- 	end,
	-- },
	{ "ryanoasis/vim-devicons" },
	-- {
	-- 	"relastle/vim-colorrange",
	-- 	event = "VimEnter",
	-- },
	{
		"uga-rosa/ccc.nvim",
		after = {
			"telescope.nvim",
		},
		keys = { ":CccPick<cr>" },
		config = function()
			require("plugconfig/ccc-nvim")
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/todo-comments")
		end,
	},

	{
		"machakann/vim-highlightedyank",
		event = "VimEnter",
		config = function()
			vim.keymap.set("n", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.keymap.set("x", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.keymap.set("o", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.g.highlightedyank_highlight_duration = 500
		end,
	},

	{ "t9md/vim-choosewin", event = "VimEnter", opt = true },

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/null_ls")
		end,
	},
	-- { "davidgranstrom/nvim-markdown-preview", opt = true, event = "VimEnter" },
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		event = "VimEnter",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"rust-lang/rust.vim",
		ft = { "rust" },
	},
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	config = function()
	-- 		require("plugconfig/nvim_navic")
	-- 	end,
	--
	-- 	requires = "neovim/nvim-lspconfig",
	-- },

	{ "wakatime/vim-wakatime", event = "InsertEnter", opt = true },

	{
		"andweeb/presence.nvim",
		event = "VimEnter",
		config = function()
			require("presence"):setup({ auto_update = false })
		end,
	},

	-- file tree
})
