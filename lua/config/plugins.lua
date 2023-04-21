local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local vim = vim
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
	-- { "junegunn/fzf", build = ":call fzf#install()", event = "VimEnter" },
	{ "nvim-lua/popup.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		module = { "telescope" },
		event = "UIEnter",
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
		init = function() end,
		config = function()
			require("plugconfig/telescope")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-emoji" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-emoji" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{
				"hrsh7th/cmp-vsnip",
				dependencies = { "vim-vsnip", "cmp-nvim-lsp-document-symbol" },
			},
			{ "SmiteshP/nvim-navic" },
			{
				"onsails/lspkind.nvim",
				config = function()
					require("plugconfig/lspkind")
				end,
			}, -- {
			-- 	"tzachar/cmp-tabnine",
			-- 	config = function()
			-- 		require("plugconfig/cmp-tabnine")
			-- 	end,
			-- 	build = "./install.sh",
			-- },
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup({})
				end,
			},
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("plugconfig/mason-lsp")
				end,
			},
			{ "williamboman/mason.nvim" },
			{
				"hrsh7th/vim-vsnip",
				config = function()
					require("plugconfig/vsnip")
				end,
				dependencies = { { "hrsh7th/vim-vsnip-integ" } },
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{
				"zbirenbaum/copilot.lua",
				config = function()
					require("copilot").setup({})
				end,
			},
		},
		event = { "UIEnter" },
		config = function()
			require("plugconfig/nvim_cmp")
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		event = "VimEnter",
		config = function()
			require("plugconfig/hop")
		end,
	},
	{
		"t9md/vim-quickhl",
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_quichl")
		end,
	},
	{
		"terryma/vim-expand-region",
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_expand_region")
		end,
	},
	{ "segeljakt/vim-silicon", event = "VimEnter" }, -- colorschem

	{ "folke/tokyonight.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },

	---------------------------------------------------------------------------
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

	-- "rebelot/kanagawa.nvim")
	{ "kyazdani42/nvim-web-devicons" },
	{
		"akinsho/bufferline.nvim",
		version = "v2.*",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"alvarosevilla95/luatab.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugconfig/luatab")
		end,
	}, --
	-- {
	--   "vim-jp/vimdoc-ja",
	--   event = "VimEnter",
	--   config = function()
	--     require("plugconfig/vimdoc_ja")
	--   end,
	-- },
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VimEnter",
		config = function()
			require("plugconfig/toggleterm")
		end,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},

	{
		"chomosuke/term-edit.nvim",
		version = "1.*",
		event = "UIEnter",
		-- Enter insert as if this plugin doesn't exist: <C-i>
		-- Enter insert: i, a, A, I.
		-- Delete: d<motion>, dd, D, x.
		-- Change: c<motion>, cc, C, s, S.
		-- Visual change: c in visual mode.
		-- Visual delete: d, x in visual mode.
		-- Paste: p P "<register>p "<register>P
		-- Replace: r in normal mode
	},
	{
		"willothy/flatten.nvim",
		config = true,
		event = "UIEnter",
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
	}, -- git
	{
		"kdheepak/lazygit.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/lazygit")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		event = "VimEnter",
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{ "alaviss/nim.nvim", event = "VimEnter" },
	{
		"heavenshell/vim-jsdoc",
		event = "VimEnter",
		cmd = { "JsDoc" },
		ft = {
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
			"vue",
		},
	}, -- {
	--   "steelsojka/pears.nvim",
	--   event = "VimEnter",
	--   config = function()
	--     require("plugconfig/pears")
	--   end,
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/indent_blankline")
		end,
	}, -- treesitter settins
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VimEnter",
		dependencies = {
			{ "mrjones2014/nvim-ts-rainbow" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("plugconfig/treesitter-context")
				end,
			},
			{ "windwp/nvim-ts-autotag" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
		config = function()
			require("plugconfig/treesitter")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "MunifTanjim/nui.nvim", event = "VimEnter" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"justinhj/battery.nvim",
			"nvim-lua/plenary.nvim",
		},
		event = "VimEnter",
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
	}, -- {
	-- 	"tversteeg/registers.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("registers").setup()
	-- 	end,
	-- },
	{
		"tversteeg/registers.nvim",
		event = "VimEnter",
		config = function()
			require("registers").setup()
		end,
	}, -- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugconfig/whichi_key")
	-- 	end,
	-- },
	{ "ryanoasis/vim-devicons" }, -- {
	-- 	"relastle/vim-colorrange",
	-- 	event = "VimEnter",
	-- },
	{
		"uga-rosa/ccc.nvim",
		event = { "VimEnter" },
		dependenciek = { "nvim-telescope/telescope.nvim" },
		-- keys = { ":CccPick<cr>" },
		config = function()
			require("plugconfig/ccc-nvim")
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/todo-comments")
		end,
	},
	{
		"ibhagwan/smartyank.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/smartyank")
		end,
	},
	{ "t9md/vim-choosewin", event = "VimEnter" }, -- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	onfig = function()
	-- 		require("plugconfig/null_ls")
	-- 	end,
	-- },
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VimEnter",
		dependencies = { "jayp0521/mason-null-ls.nvim", "williamboman/mason.nvim" },
		onfig = function()
			require("plugconfig/null_ls")
		end,
	},
	-- { "davidgranstrom/nvim-markdown-preview", opt = true, event = "VimEnter" },
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "rust-lang/rust.vim", ft = { "rust", "toml" } }, -- {
	-- 	"SmiteshP/nvim-navic",
	-- 	config = function()
	-- 		require("plugconfig/nvim_navic")
	-- 	end,
	--
	-- 	requires = "neovim/nvim-lspconfig",
	-- },
	{ "wakatime/vim-wakatime", event = "VimEnter" },
	{
		"andweeb/presence.nvim",
		event = "InsertEnter",
		config = function()
			require("presence"):setup({ auto_update = false })
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("plugconfig/noice")
		end,
		event = "VimEnter",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("plugconfig/nvim-notify")
				end,
			},
		},
	},
	{
		"mochi-sann/Select2Browser.nvim",
		event = "VimEnter",
		config = function()
			require("Select2Browser").setup()
			vim.api.nvim_set_keymap("", "<Leader>gg", "<Cmd>Select2Browser<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/chat-gpt-nvim")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"folke/zen-mode.nvim",
		event = "VimEnter",
		config = function()
			require("zen-mode").setup({
				window = {
					width = 150,
				},
				plugins = {
					kitty = {
						enabled = false,
						font = "+4", -- font size increment
					},
					-- this will change the font size on alacritty when in zen mode
					-- requires  Alacritty Version 0.10.0 or higher
					-- uses `alacritty msg` subcommand to change font size
					alacritty = {
						enabled = false,
						font = "14", -- font size
					},
					-- this will change the font size on wezterm when in zen mode
					-- See alse also the Plugins/Wezterm section in this projects README
					wezterm = {
						enabled = true,
						font = "+0", -- (10% increase per step)
					},
				},
			})
			vim.api.nvim_set_keymap("", "<Leader>z", "<Cmd>ZenMode<CR>", { noremap = true, silent = true })
		end,
	},
	{ "tpope/vim-dadbod" },
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
			vim.api.nvim_set_keymap("", "<Leader>ss", "<Cmd>SaveSession<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("", "<Leader>sd", "<Cmd>DeleteSession<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("", "<Leader>sr", "<Cmd>RestoreSession<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			{ "kyazdani42/nvim-web-devicons" }, -- optional, for file icons
		},
		-- event = "VimEnter",
		config = function()
			require("plugconfig/nvim-tree")
		end,
	},

	-- {
	--   dir = "~/codespace/github.com/mochi-sann/Selected2Browser.nvim",
	--   dev = true,
	--   config = function()
	--     require("Select2Browser").setup()
	--     vim.api.nvim_set_keymap("", "<Leader>g", "<Cmd>Select2Browser<CR>", { noremap = true, silent = true })
	--   end,
	-- },

	-- file tree
})
