vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
			require("impatient").enable_profile()
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugconfig/nvim-notify")
		end,
	})

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
		requires = {
			{ "nvim-telescope/telescope-ghq.nvim", opt = true },
			{ "nvim-telescope/telescope-z.nvim", opt = true },
			-- その他の拡張プラグイン……
		},
		wants = {
			"telescope-ghq.nvim",
			"telescope-z.nvim",
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
			vim.keymap.set("n", "<Leader>pp", builtin("find_files")({ hidden = true }))
			vim.keymap.set("n", "<Leader>pgr", builtin("live_grep")({}))
			vim.keymap.set("n", "<Leader>ph", builtin("help_tags")({}))
			vim.keymap.set("n", "<Leader>pb", builtin("buffers")({}))
			vim.keymap.set("n", "<Leader>pba", builtin("buffers")({}))
			vim.keymap.set("n", "<Leader>pc", builtin("command_history")({}))
			vim.keymap.set("n", "<Leader>pg", extensions("ghq", "list")({}))
			vim.keymap.set("n", "<Leader>pz", extensions("z", "list")({}))
			-- vim.keymap.set("n", "<Leader>f:", builtin("command_history")({}))
			-- vim.keymap.set("n", "<Leader>fG", builtin("grep_string")({}))
			-- vim.keymap.set("n", "<Leader>fH", builtin("help_tags")({ lang = "en" }))
			-- vim.keymap.set("n", "<Leader>fm", builtin("man_pages")({ sections = { "ALL" } }))
			-- vim.keymap.set("n", "<Leader>fq", extensions("ghq", "list")({}))
			-- vim.keymap.set("n", "<Leader>fz", extensions("z", "list")({}))
			-- ……以降設定が続く
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
				event = { "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
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
		event = "VimEnter",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugconfig/nvim-tree")
		end,
	})

	use({
		"t9md/vim-quickhl",
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_quichl")
		end,
	})
	use({
		"terryma/vim-expand-region",
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_expand_region")
		end,
	})
	use({ "segeljakt/vim-silicon", event = "VimEnter" })
	-- colorschem
	use({
		"dracula/vim",
		opt = false,
		as = "dracula",
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
		config = function()
			require("plugconfig/lazygit")
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		event = "VimEnter",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use({ "alaviss/nim.nvim", event = "VimEnter" })

	use({
		"heavenshell/vim-jsdoc",
		event = "VimEnter",
		cmd = { "JsDoc" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	})

	use({
		"steelsojka/pears.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/pears")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/indent_blankline")
		end,
	})
	-- treesitter settins
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VimEnter",
		config = function()
			require("plugconfig/treesitter")
		end,
	})
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
	use({
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("plugconfig/treesitter-context")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter", "mini.nvim" } })

	use({
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "MunifTanjim/nui.nvim" })

	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
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
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/whichi_key")
		end,
	})
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
	-- use({
	-- 	"max397574/colortils.nvim",
	-- 	-- cmd = "Colortils",
	-- 	after = {
	-- 		"telescope.nvim",
	-- 	},
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugconfig/colortils")
	-- 	end,
	-- })

	-- use({ "lilydjwg/colorizer", opt = true, event = "VimEnter" })
	-- use({
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	after = { "telescope.nvim" },
	-- 	config = function()
	-- 		require("plugconfig/nvim-colorizer")
	-- 	end,
	-- })
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
			vim.keymap.set("n", "y", "<Plug>(highlightedyank)", { buffer = true })
			vim.keymap.set("x", "y", "<Plug>(highlightedyank)", { buffer = true })
			vim.keymap.set("o", "y", "<Plug>(highlightedyank)", { buffer = true })
			vim.g.highlightedyank_highlight_duration = 500
		end,
	})

	use({ "t9md/vim-choosewin", event = "VimEnter" })

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

	use({ "wakatime/vim-wakatime", event = "VimEnter" })
	-- file tree
end)
