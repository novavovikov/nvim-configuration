vim.g.mapleader = " "

-- Quickly exit insert mode using 'jk'
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- Delete a line without saving it to the clipboard
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })

-- Select the entire file
vim.api.nvim_set_keymap('n', '<Leader>a', ':normal 0ggVG<CR>', { noremap = true, silent = true })

-- Open the file explorer and highlight the current file
vim.api.nvim_set_keymap('n', '<Leader><S-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope keybindings for file search and live grep
vim.cmd [[
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
]]

-- Resize the current window vertically
vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- Indent and outdent text in visual mode while keeping the selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Debug Adapter Protocol (DAP) keybindings
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>c', function() require('dap').continue() end)

-- LSP-related keybindings
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true }) 
