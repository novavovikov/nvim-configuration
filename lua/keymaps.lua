vim.g.mapleader = " "

-- Window management
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Down>", ":resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Up>", ":resize -3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Right>", ":vertical resize -3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader><Left>", ":vertical resize +3<CR>", { noremap = true, silent = true })

-- Quick exit from insert mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Move lines up and down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Delete a line without saving it to the clipboard
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })

-- Select the entire file
vim.api.nvim_set_keymap("n", "<Leader>a", ":normal 0ggVG<CR>", { noremap = true, silent = true })

-- Indentation keymaps
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("i", "<Tab>", "<C-t>", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ">>_", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<_", { noremap = true, silent = true })
