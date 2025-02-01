vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

local function check_prettier()
	local local_prettier = vim.fn.filereadable("./node_modules/.bin/prettier")
	local global_prettier = vim.fn.executable("prettier")

	return local_prettier == 1 or global_prettier == 1
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = "FormatOnSave",
	pattern = {
		"*.js",
		"*.jsx",
		"*.mjs",
		"*.ts",
		"*.tsx",
		"*.css",
		"*.less",
		"*.scss",
		"*.json",
		"*.graphql",
		"*.vue",
		"*.yaml",
		"*.html",
	},

	callback = function()
		if check_prettier() then
			vim.cmd("Prettier")
		else
			vim.lsp.buf.format({ async = false })
		end
	end,
})
