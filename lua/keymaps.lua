vim.g.mapleader = " "

-- Window management
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Down>", ":resize +3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Up>", ":resize -3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Right>", ":vertical resize -3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Left>", ":vertical resize +3<CR>", { noremap = true, silent = true })

-- Split buffer
vim.keymap.set("n", "<Leader>\\", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>-", ":split<CR>", { noremap = true, silent = true })

-- Quick exit from insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

-- Move lines up and down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Copy lines up and down
vim.keymap.set("n", "<A-S-Up>", "yyP", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-Up>", "<Esc>yyPgi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-Up>", "y`<P", { noremap = true, silent = true })

vim.keymap.set("n", "<A-S-j>", "yyP", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-j>", "<Esc>yyPgi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-j>", "y`<P", { noremap = true, silent = true })

vim.keymap.set("n", "<A-S-Down>", "yyp", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-Down>", "<Esc>yypgi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-Down>", "y`>p", { noremap = true, silent = true })

vim.keymap.set("n", "<A-S-k>", "yyp", { noremap = true, silent = true })
vim.keymap.set("i", "<A-S-k>", "<Esc>yypgi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-k>", "y`>p", { noremap = true, silent = true })

-- Delete a line without saving it to the clipboard
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })

-- Select the entire file
vim.keymap.set("n", "<Leader>a", ":normal 0ggVG<CR>", { noremap = true, silent = true })

-- Indentation keymaps
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("i", "<Tab>", "<C-t>", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
