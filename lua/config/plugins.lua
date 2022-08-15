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
  use({ "williamboman/mason-lspconfig.nvim", config = function()

    require("plugconfig/mason-lsp")
  end,
  })
  -- use({
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --     require("plugconfig/lspsaga")
  --   end,
  -- })


  -- use({
  -- 	"zbirenbaum/copilot-cmp",
  -- 	after = { "copilot.lua", "nvim-cmp" },
  -- })
  -- use({
  -- 	"zbirenbaum/copilot.lua",
  -- 	config = function()
  -- 		vim.defer_fn(function()
  -- 			require("copilot").setup()
  -- 		end, 100)
  -- 	end,
  -- })
  -- use({ "github/copilot.vim" })
  -- use({ "vim-skk/skkeleton", requires = { "vim-denops/denops.vim" } })
  -- use({ "rinx/cmp-skkeleton", after = { "nvim-cmp", "skkeleton" } })

  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    config = function()
      require("plugconfig/cmp-tabnine")
    end,
  })

  -- use({
  -- 	"TimUntersberger/neogit",
  -- 	requires = {
  -- 		"nvim-lua/plenary.nvim",
  -- 		"sindrets/diffview.nvim",
  -- 	},
  -- 	config = function()
  -- 		require("plugconfig/neogit")
  -- 	end,
  -- 	-- opt = true,
  -- 	-- event = "VimEnter",
  -- })
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
  -- use({
  -- 	"williamboman/nvim-lsp-installer",
  -- }),


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
    requires = {
      { "hrsh7th/vim-vsnip-integ" },
    },
  })
  --use({ "hrsh7th/cmp-vsnip", after = "nvim-cpm" })
  -- format and linter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    event = "VimEnter",
    config = function()
      require("plugconfig/null_ls")
    end,
  })
  --use({"lambdalisue/fern.vim" , opt = true, cmd = {'Fern'}})

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    event = "VimEnter",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugconfig/neo-tree")
    end,
  })
  -- use({
  -- 	"lambdalisue/fern.vim",
  -- 	opt = true,
  -- 	event = "VimEnter",
  --
  -- 	config = function()
  -- 		require("plugconfig/fern")
  -- 	end,
  -- })
  -- use({ "lambdalisue/fern-git-status.vim", after = "fern.vim" })
  -- -- use({ "lambdalisue/nerdfont.vim", after = "fern.vim" })
  -- use({ "lambdalisue/fern-renderer-nerdfont.vim", after = "fern.vim", requires = { "lambdalisue/nerdfont.vim" } })
  -- use({ "lambdalisue/glyph-palette.vim", after = "fern.vim" })
  -- use({ "lambdalisue/fern-bookmark.vim", after = "fern.vim" })
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
    as = "dracula"
  })
  -- use({ "sainnhe/sonokai" })

  --use("rebelot/kanagawa.nvim")


  -- use({
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("plugconfig/auto_save_nvim")
  --   end,
  --   event = "VimEnter",
  -- })
  -- use({
  -- 	"rmagatti/auto-session",
  -- 	config = function()
  -- 		require("plugconfig/auto_session")
  -- 	end,
  -- })
  -- use({
  -- 	"rmagatti/session-lens",
  -- 	requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  -- 	config = function()
  -- 		require("session-lens").setup({--[[your custom config--]]
  -- 		})
  -- 	end,
  -- })

  use({
    'alvarosevilla95/luatab.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
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

  -- use({ "vim-denops/denops.vim" })
  --use({ "lambdalisue/gina.vim"  })
  -- use({
  --   "alvan/vim-closetag",
  --   config = function()
  --     require("plugconfig/vim_closetag")
  --   end,
  -- })

  -- use({
  --   "rchaser53/insertclosetag",
  --   config = function()
  --     require("plugconfig/insertclosetag")
  --   end,
  -- })
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
    event = "VimEnter",
    run = ":TSUpdate",
    config = function()
      require("plugconfig/treesitter")
    end,
  })
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter", config = function()
    require("plugconfig/treesitter-context")
  end, })

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
  use({"tversteeg/registers.nvim" ,
  event = "VimEnter",})
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
  -- use({ "yamatsum/nvim-cursorline", event = "VimEnter",
  --   config = function()
  --     require("plugconfig/cursorline")
  --   end, })

  -- use({ 'ekickx/clipboard-image.nvim',
  --   event = "VimEnter",
  --   config = function()
  --     require("plugconfig/clipboard-image")
  --   end,
  -- })

  -- file tree
end)

-- vim.cmd([[autocmd BufWritePost lua/config/plugins.lua PackerCompile]])
