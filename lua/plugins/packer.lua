local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Sessions
	use({ "olimorris/persisted.nvim" })

	-- Syntax highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"ray-x/cmp-treesitter",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	})

	use("github/copilot.vim")

	-- Debugging
	use("rcarriga/nvim-dap-ui")
	use({ "mfussenegger/nvim-dap", dependencies = { "rcarriga/nvim-dap-ui" } })
	use("jbyuki/one-small-step-for-vimkind")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("mhinz/vim-signify")

	-- Utility
	use("bkad/CamelCaseMotion")
	use("mg979/vim-visual-multi")
	use("sainnhe/everforest")
	use("numToStr/Comment.nvim")
	use("mhartington/formatter.nvim")
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Themes
	use("sainnhe/sonokai")
	use({
		"sphamba/smear-cursor.nvim",
		config = function()
			require("smear-cursor").setup({
				enabled = true,
				smear_length = 5,
				smear_duration = 150,
			})
		end,
	})

	-- File explorer
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

	-- Status line
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })

	-- Files finder
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "kkharji/sqlite.lua" },
	})
	-- Asynchronous IO
	use("nvim-neotest/nvim-nio")
end)
