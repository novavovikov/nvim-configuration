return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-frecency.nvim",
		"kkharji/sqlite.lua",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "%.git/" },
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<c-d>"] = actions.delete_buffer,
					},
				},
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					ignore_current_buffer = true,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
				oldfiles = {
					only_cwd = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				frecency = {
					show_scores = true,
					show_unindexed = false,
					ignore_patterns = { "*.git/*", "*/tmp/*" },
					workspaces = {
						["config"] = "~/.config/nvim",
						["project"] = "~/projects",
						["docs"] = "~/documents",
						["work"] = "~/work",
					},
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "frecency")

		vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>fo", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>fr", ":Telescope frecency<CR>", { noremap = true, silent = true })
	end,
}
