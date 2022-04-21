
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use {'junegunn/fzf', run = 'fzf#install()'}
  use {'yuki-yano/fzf-preview.vim', {branch = 'release/rpc'} }

  use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}

  --         nvim lsp
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/cmp-buffer'}
  use { 'hrsh7th/cmp-path'}
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp'}
  use { 'hrsh7th/cmp-nvim-lsp-signature-help'}
  use { 'hrsh7th/cmp-emoji'}
  use { 'hrsh7th/cmp-nvim-lsp-document-symbol'}
  use { 'tzachar/cmp-tabnine'}

--- snipet--------------
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
-- format and linter
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'nvim-lua/plenary.nvim'}
  -- Simple plugins can be specified as strings

end)
