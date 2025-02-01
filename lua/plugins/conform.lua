return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				graphql = { "prettier" },
				vue = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = function(bufnr)
				local ignore_filetypes = { "markdown", "txt" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end

				return { timeout_ms = 500, lsp_fallback = true }
			end,
		})
	end,
}
