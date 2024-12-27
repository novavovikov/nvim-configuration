local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  }

  -- Debugging
  use 'rcarriga/nvim-dap-ui'
  use { 'mfussenegger/nvim-dap', dependencies = { 'rcarriga/nvim-dap-ui' } }
  use 'jbyuki/one-small-step-for-vimkind'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'

  -- Utility
  use 'bkad/CamelCaseMotion'
  use 'mg979/vim-visual-multi'
  use 'sainnhe/everforest'
  use 'nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'mhartington/formatter.nvim'

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Themes
  use 'joshdick/onedark.vim'

  -- Rescript
  use 'rescript-lang/vim-rescript'
  use 'prettier/vim-prettier'

  -- Coc
  use 'neoclide/coc.nvim'

  -- Asynchronous IO
  use 'nvim-neotest/nvim-nio'

  -- Syntax
  use 'uarun/vim-protobuf'
end)
