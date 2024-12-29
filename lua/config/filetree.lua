local nvim_tree = require('nvim-tree')

nvim_tree.setup {
  update_cwd = true,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    timeout = 500,
  },
  view = {
    width = 40,
    side = 'left',
    preserve_window_proportions = false
  },
  renderer = {
    root_folder_label = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
}
