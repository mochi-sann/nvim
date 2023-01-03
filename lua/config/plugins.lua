vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
			require("impatient").enable_profile()
		end,
	})

	-- use({
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("plugconfig/nvim-notify")
	--
	-- 	end,
	-- })

	use({
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
	})
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "nvim-lua/popup.nvim" })

	use({
		"nvim-telescope/telescope.nvim",
		module = { "telescope" },
		event = "VimEnter",
		requires = {
			{ "nvim-telescope/telescope-ghq.nvim", opt = true },
			{ "nvim-telescope/telescope-z.nvim", opt = true },
			use({
				"nvim-telescope/telescope-frecency.nvim",
				config = function() end,
				requires = { "kkharji/sqlite.lua" },
			}),

			-- その他の拡張プラグイン……
		},
		wants = {
			"telescope-ghq.nvim",
			"telescope-z.nvim",
			"telescope-frecency.nvim",
			-- ……
		},
		setup = function()
			local function builtin(name)
				return function(opt)
					return function()
						return require("telescope.builtin")[name](opt or {})
					end
				end
			end

			local function extensions(name, prop)
				return function(opt)
					return function()
						local telescope = require("telescope")
						telescope.load_extension(name)
						return telescope.extensions[name][prop](opt or {})
					end
				end
			end

			vim.keymap.set("n", "<Leader>pp", builtin("find_files")({ hidden = true }))
			vim.keymap.set("n", "<Leader>pgr", builtin("live_grep")({}))
			vim.keymap.set("n", "<Leader>ph", builtin("help_tags")({}))
			vim.keymap.set("n", "<Leader>pb", builtin("buffers")({}))
			vim.keymap.set("n", "<Leader>pba", builtin("buffers")({}))
			vim.keymap.set("n", "<Leader>pc", builtin("command_history")({}))
			vim.keymap.set("n", "<Leader>pg", extensions("ghq", "list")({}))
			vim.keymap.set("n", "<Leader>pz", extensions("z", "list")({}))
		end,
		config = function()
			require("plugconfig/telescope")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
		requires = {
			{ "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-emoji", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-nvim-lua", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-emoji", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" } },
			{
				"hrsh7th/cmp-vsnip",
				requires = { "vim-vsnip", "cmp-nvim-lsp-document-symbol" },
				event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
			},
			{
				"onsails/lspkind.nvim",
				require = function()
					require("plugconfig/lspkind")
				end,
			},
			{
				"tzachar/cmp-tabnine",
				config = function()
					require("plugconfig/cmp-tabnine")
				end,
				run = "./install.sh",

				event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
			},
		},
		config = function()
			require("plugconfig/nvim_cmp")
		end,
	})

	use({ "neovim/nvim-lspconfig" })
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugconfig/mason-lsp")
		end,
	})
	use({
		"williamboman/mason.nvim",
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		event = "VimEnter",
		config = function()
			require("plugconfig/hop")
		end,
	})

	--

	use({
		"hrsh7th/vim-vsnip",
		event = "VimEnter",
		config = function()
			require("plugconfig/vsnip")
		end,
		requires = {
			{ "hrsh7th/vim-vsnip-integ" },
		},
	})
	-- format and linter

	--use({"lambdalisue/fern.vim" , opt = true, cmd = {'Fern'}})

	-- use({
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
	-- })
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugconfig/nvim-tree")
		end,
	})

	use({
		"t9md/vim-quickhl",
		event = "VimEnter",
		opt = true,
		config = function()
			require("plugconfig/vim_quichl")
		end,
	})
	use({
		"terryma/vim-expand-region",
		event = "VimEnter",
		opt = true,
		config = function()
			require("plugconfig/vim_expand_region")
		end,
	})
	use({ "segeljakt/vim-silicon", opt = true, event = "VimEnter" })
	-- colorschem
	-- use({
	-- 	"dracula/vim",
	-- 	opt = false,
	-- 	as = "dracula",
	-- })
	use({
		"folke/tokyonight.nvim",
		opt = false,
		as = "tokyonight",
	})
	-- use({ "NLKNguyen/papercolor-theme", as = "papercolor" })
	-- use({
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	config = function()
	-- 		require("plugconfig/auto-dark-mode")
	-- 	end,
	-- })
	-- use({ "sainnhe/sonokai" })

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			})
		end,
	})

	--use("rebelot/kanagawa.nvim")
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugconfig/bufferline")
		end,
	})

	use({
		"alvarosevilla95/luatab.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugconfig/luatab")
		end,
	})
	--
	use({
		"vim-jp/vimdoc-ja",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/vimdoc_ja")
		end,
	})
	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		event = "VimEnter",
		config = function()
			require("plugconfig/toggleterm")
		end,
	})
	-- git
	use({
		"kdheepak/lazygit.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/lazygit")
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		event = "VimEnter",
		opt = false,
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use({ "alaviss/nim.nvim", event = "VimEnter" })

	use({
		"heavenshell/vim-jsdoc",
		event = "VimEnter",
		opt = false,
		cmd = { "JsDoc" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	})

	use({
		"steelsojka/pears.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/pears")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		opt = false,
		config = function()
			require("plugconfig/indent_blankline")
		end,
	})
	-- treesitter settins
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VimEnter",
		requires = {
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
	})

	use({
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "MunifTanjim/nui.nvim" })

	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugconfig/lualine")
		end,
	})
	use({
		"echasnovski/mini.nvim",
		branch = "stable",
		event = "VimEnter",
		config = function()
			require("plugconfig/mini")
		end,
	})
	-- use({
	-- 	"tversteeg/registers.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("registers").setup()
	-- 	end,
	-- })
	use({
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup()
		end,
	})
	-- use({
	-- 	"folke/which-key.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugconfig/whichi_key")
	-- 	end,
	-- })
	use("ryanoasis/vim-devicons")
	-- use({
	-- 	"relastle/vim-colorrange",
	-- 	event = "VimEnter",
	-- })
	use({
		"uga-rosa/ccc.nvim",
		after = {
			"telescope.nvim",
		},
		keys = { ":CccPick<cr>" },
		config = function()
			require("plugconfig/ccc-nvim")
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/todo-comments")
		end,
	})

	use({
		"machakann/vim-highlightedyank",
		event = "VimEnter",
		config = function()
			vim.keymap.set("n", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.keymap.set("x", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.keymap.set("o", "y", "<Plug>(highlightedyank)", { buffer = true, silent = true })
			vim.g.highlightedyank_highlight_duration = 500
		end,
	})

	use({ "t9md/vim-choosewin", event = "VimEnter", opt = true })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/null_ls")
		end,
	})
	-- use({ "davidgranstrom/nvim-markdown-preview", opt = true, event = "VimEnter" })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		event = "VimEnter",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({
		"rust-lang/rust.vim",
		ft = { "rust" },
	})
	-- use({
	-- 	"SmiteshP/nvim-navic",
	-- 	config = function()
	-- 		require("plugconfig/nvim_navic")
	-- 	end,
	--
	-- 	requires = "neovim/nvim-lspconfig",
	-- })

	use({ "wakatime/vim-wakatime", event = "InsertEnter", opt = true })

	use({
		"andweeb/presence.nvim",
		event = "VimEnter",
		config = function()
			require("presence"):setup({ auto_update = false })
		end,
	})

	-- file tree
end)
