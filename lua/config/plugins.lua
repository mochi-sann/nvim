vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "nvim-lua/popup.nvim" })

	-- fizzy finder
	use({
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugconfig/telescope")
		end,
	})

	-- LSP settings
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugconfig/nvim_cmp")
		end,
	})

	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-emoji" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
	use({ "hrsh7th/cmp-vsnip" })

	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugconfig/mason-lsp")
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
	})
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	})

	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("plugconfig/cmp-tabnine")
		end,
	})

	use({
		"pwntester/octo.nvim",
		event = "VimEnter",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
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
		"onsails/lspkind.nvim",
		config = function()
			require("plugconfig/lspkind")
		end,
	})

	use({
		"hrsh7th/vim-vsnip",
		config = function()
			require("plugconfig/vsnip")
		end,
		requires = {
			{ "hrsh7th/vim-vsnip-integ" },
		},
	})
	-- format and linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/null_ls")
		end,
	})
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
		opt = true,
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
		as = "dracula",
	})
	use({ "NLKNguyen/papercolor-theme", as = "papercolor" })
	use({
		"f-person/auto-dark-mode.nvim",
		config = function()
			require("plugconfig/auto-dark-mode")
		end,
	})
	-- use({ "sainnhe/sonokai" })

	--use("rebelot/kanagawa.nvim")

	use({
		"alvarosevilla95/luatab.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugconfig/luatab")
		end,
	})

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
	use({ "tversteeg/registers.nvim", event = "VimEnter" })
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("plugconfig/whichi_key")
		end,
	})
	use("ryanoasis/vim-devicons")
	use({
		"relastle/vim-colorrange",
		event = "VimEnter",
	})
	-- use({ "lilydjwg/colorizer", opt = true, event = "VimEnter" })
	use({
		"norcalli/nvim-colorizer.lua",
		event = "VimEnter",
		config = function()
			require("plugconfig/nvim-colorizer")
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

	use({ "machakann/vim-highlightedyank", event = "VimEnter" })

	use({ "t9md/vim-choosewin", event = "VimEnter" })

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

	-- file tree
end)

-- vim.cmd([[autocmd BufWritePost lua/config/plugins.lua PackerCompile]])
