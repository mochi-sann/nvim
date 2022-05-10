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
		opt = true,
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

	--use({ "lambdalisue/gina.vim"  })

	-- file tree
end)
--vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])

-- 設定ファイルがアップデートしたら自動でコンパイルする
