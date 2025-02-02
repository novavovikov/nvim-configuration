return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			update_cwd = true,
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = true,
			update_focused_file = {
				enable = true,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = false,
			},
			renderer = {
				highlight_git = true,
				root_folder_label = false,
				icons = {
					show = {
						git = true,
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
		})

		vim.keymap.set("n", "<Leader><S-f>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
	end,
}
