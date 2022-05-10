vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "junegunn/fzf", run = ":call fzf#install()" })

	-- fizzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
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
		event = "VimEnter",
	})
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
	use({
		"tzachar/cmp-tabnine",
		after = "nvim-cmp",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("plugconfig/cmp-tabnine")
		end,
	})

	-- use({
	-- 	"onsails/lspkind.nvim",
	-- 	after = "nvim-cmp",
	-- 	requires = "hrsh7th/nvim-cmp",
	-- 	config = function()
	-- 		require("plugconfig/lspkind")
	-- 	end,
	-- })
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		after = "nvim-cpm",
		requires = "hrsh7th/nvim-cmp",
	})
	-- use({
	-- 	"hrsh7th/cmp-vsnip",
	-- 	"hrsh7th/vim-vsnip",
	-- 	after = "nvim-cpm",
	-- 	config = function()
	-- 		require("plugconfig/vsnip")
	-- 	end,
	-- })
	use({
		"hrsh7th/vim-vsnip",
		config = function()
			require("plugconfig/vsnip")
		end,
	})
	--use({ "hrsh7th/cmp-vsnip", after = "nvim-cpm" })
	-- format and linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugconfig/null_ls")
		end,
	})
	--use({"lambdalisue/fern.vim" , opt = true, cmd = {'Fern'}})
	use({
		"lambdalisue/fern.vim",
		opt = true,
		event = "VimEnter",

		config = function()
			require("plugconfig/fern")
		end,
	})
	use({ "lambdalisue/fern-git-status.vim", after = "fern.vim" })
	-- use({ "lambdalisue/nerdfont.vim", after = "fern.vim" })
	use({ "lambdalisue/fern-renderer-nerdfont.vim", after = "fern.vim", requires = { "lambdalisue/nerdfont.vim" } })
	use({ "lambdalisue/glyph-palette.vim", after = "fern.vim" })
	use({ "lambdalisue/fern-bookmark.vim", after = "fern.vim" })
	use({
		"t9md/vim-quickhl",
		opt = true,
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_quichl")
		end,
	})
	use({
		"terryma/vim-expand-region",
		opt = true,
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_expand_region")
		end,
	})
	use({ "segeljakt/vim-silicon", opt = true, event = "VimEnter" })
	use({ "dracula/vim", as = "dracula" })
	use({
		"vim-scripts/vim-auto-save",
		opt = true,
		event = "VimEnter",
		config = function()
			require("plugconfig/vim_auto_save")
		end,
	})

	use({
		"vim-jp/vimdoc-ja",
		config = function()
			require("plugconfig/vimdoc_ja")
		end,
	})
	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v1.*",
		config = function()
			require("plugconfig/toggleterm")
		end,
	})

	use({ "vim-denops/denops.vim" })
	--use({ "lambdalisue/gina.vim"  })
	use({
		"alvan/vim-closetag",
		ft = { "html", "vue", "javascript", "javascriptreact", "typescriptreact", "typescript" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugconfig/indent_blankline")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		event = "VimEnter",
		config = function()
			require("plugconfig/treesitter")
		end,
	})
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
	use({
		"lewis6991/gitsigns.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "MunifTanjim/nui.nvim" })

	use({
		"nvim-lualine/lualine.nvim",
		opt = true,
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugconfig/lualine")
		end,
	})
	use({
		"echasnovski/mini.nvim",
		branch = "stable",
		config = function()
			require("plugconfig/mini")
		end,
	})
	use("tversteeg/registers.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugconfig/whichi_key")
		end,
	})
	use("ryanoasis/vim-devicons")
	use({
		"relastle/vim-colorrange",
		opt = true,
		event = "VimEnter",
	})
	use({ "lilydjwg/colorizer", opt = true, event = "VimEnter" })
	use({ "machakann/vim-highlightedyank" })

	use({ "t9md/vim-choosewin", opt = true, event = "VimEnter" })
	-- file tree
end)
--vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])

-- 設定ファイルがアップデートしたら自動でコンパイルする
