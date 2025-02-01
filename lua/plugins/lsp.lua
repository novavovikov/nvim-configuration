return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- LSP package manager
		"williamboman/mason-lspconfig.nvim", -- Bridge between Mason and LSPConfig
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Auto-installs tools
		"hrsh7th/cmp-nvim-lsp", -- LSP autocomplete
		"onsails/lspkind-nvim", -- Icons for autocompletion
		"nvim-lua/plenary.nvim", -- Utility functions (used by many plugins)
		"nvim-lua/popup.nvim", -- Popup API (sometimes needed)
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_util = require("lspconfig/util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- Mason setup
		require("mason").setup()

		-- Auto-install tools
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",

				"clangd",
				"lua_ls",
				"gopls",
				"rescriptls",
				"html",
				"cssls",
				"eslint",
				"jsonls",
				"yamlls",
			},
			auto_update = true,
			run_on_start = true,
		})

		-- Mason LSP configuration
		require("mason-lspconfig").setup({
			automatic_installation = true,
			handlers = {
				["gopls"] = function()
					lspconfig.gopls.setup({
						cmd = { "gopls" },
						filetypes = { "go", "gomod", "gowork", "gotmpl" },
						root_dir = lsp_util.root_pattern("go.mod"),
						settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
								analyses = { unusedparams = true },
								staticcheck = true,
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						filetypes = { "lua" },
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim", "use" } },
								telemetry = { enable = false },
							},
						},
					})
				end,
				["rescriptls"] = function()
					lspconfig.rescriptls.setup({
						cmd = { "rescript-language-server", "--stdio" },
					})
				end,
				["buf_ls"] = function()
					lspconfig.buf_ls.setup({
						capabilities = capabilities,
					})
				end,
				["clangd"] = function()
					lspconfig.clangd.setup({
						capabilities = capabilities,
						cmd = { "clangd" },
						filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
						root_dir = lsp_util.root_pattern("compile_commands.json", ".git"),
						settings = {
							clangd = {
								fallbackFlags = { "-std=c++17" },
							},
						},
					})
				end,
			},
		})

		-- LSP keymaps
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>.",
			"<Cmd>lua vim.lsp.buf.definition()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>,",
			"<Cmd>lua vim.lsp.buf.declaration()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>;",
			"<Cmd>lua vim.lsp.buf.implementation()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>r",
			"<Cmd>lua vim.lsp.buf.rename()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>c",
			"<Cmd>lua vim.lsp.buf.code_action()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
	end,
}
