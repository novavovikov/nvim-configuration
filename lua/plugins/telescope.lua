require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "%.git/" },
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
				["<c-d>"] = require("telescope.actions").delete_buffer,
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

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
