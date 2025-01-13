vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>w', '<C-w>', { noremap = true, silent = true })

-- Quickly exit insert mode using 'jk'
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

vim.keymap.set('v', '<A-d>', [[:<C-u>let @/ = '\V' . escape(getreg('"'), '/\')<CR>cgn]],
  { noremap = true, silent = true })

-- Move the current line or selected lines down
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Move the current line or selected lines up
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Copy the current line and paste it below (Option+Shift+Down)
vim.keymap.set('n', '<A-S-Down>', 'yyp', { noremap = true, silent = true })
vim.keymap.set('i', '<A-S-Down>', '<Esc>yyPi', { noremap = true, silent = true })
vim.keymap.set('v', '<A-S-Down>', 'y`>p', { noremap = true, silent = true })

-- Copy the current line and paste it above (Option+Shift+Up)
vim.keymap.set('n', '<A-S-Up>', 'yyP', { noremap = true, silent = true })
vim.keymap.set('i', '<A-S-Up>', '<Esc>yyPli', { noremap = true, silent = true })
vim.keymap.set('v', '<A-S-Up>', 'y`<P', { noremap = true, silent = true })

-- Delete a line without saving it to the clipboard
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })

-- Select the entire file
vim.api.nvim_set_keymap('n', '<Leader>a', ':normal 0ggVG<CR>', { noremap = true, silent = true })

-- Open the file explorer and highlight the current file
vim.api.nvim_set_keymap('n', '<Leader><S-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope keybindings for file search and live grep
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fo', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fr', ':Telescope frecency<CR>', { noremap = true, silent = true })

-- Resize windows vertically
vim.api.nvim_set_keymap('n', '<Leader><Down>', ':resize +3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Up>', ':resize -3<CR>', { noremap = true, silent = true })

-- Resize windows horizontally
vim.api.nvim_set_keymap('n', '<Leader><Right>', ':vertical resize -3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Left>', ':vertical resize +3<CR>', { noremap = true, silent = true })

-- Shift code block right with Tab and left with Shift+Tab
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

vim.keymap.set('i', '<Tab>', '<C-t>', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })

vim.keymap.set('n', '<Tab>', '>>_', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<_', { noremap = true, silent = true })

-- Debug Adapter Protocol (DAP) keybindings
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>n', function() require('dap').continue() end)

-- LSP-related keybindings
vim.api.nvim_set_keymap('n', '<Leader>.', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>,', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>;', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
