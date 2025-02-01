return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function get_project_root()
			local cwd = vim.fn.getcwd()
			return vim.fn.fnamemodify(cwd, ":t")
		end

		require("bufferline").setup({
			options = {
				separator_style = "slope",
				always_show_bufferline = false,
				diagnostics = "nvim_lsp",
				numbers = "ordinal",
				offsets = {
					{
						filetype = "NvimTree",
						text = get_project_root(),
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		-- Tab navigation using numbers
		for i = 1, 9 do
			vim.keymap.set(
				"n",
				"<Leader>" .. i,
				":BufferLineGoToBuffer " .. i .. "<CR>",
				{ noremap = true, silent = true }
			)
		end

		-- Next/previous tab
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

		-- Close buffer and switch to next one, or create a new buffer if it's the last one

		local function close_tab_or_buffer()
			local tab_count = vim.fn.tabpagenr("$")
			local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })

			if tab_count > 1 then
				vim.cmd("tabclose")
			elseif buf_count > 1 then
				vim.cmd("BufferLineCycleNext")
				vim.cmd("bdelete #")
			else
				vim.cmd("enew")
			end
		end

		vim.keymap.set("n", "<Leader>q", close_tab_or_buffer, { noremap = true, silent = true })
	end,
}
