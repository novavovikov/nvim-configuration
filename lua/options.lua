vim.g.copilot_enabled = false

vim.g.nvim_tree_auto_close = 0

-- Text encoding and interface performance settings
vim.o.encoding = "utf-8"
vim.o.ttyfast = true
vim.o.lazyredraw = true

-- Path and clipboard enhancements
vim.o.path = vim.o.path .. ",/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

-- UI display settings
vim.wo.number = true
vim.wo.list = true
vim.wo.signcolumn = "yes"
vim.wo.cursorline = true
vim.opt.mouse = "a"

-- Visual features
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.foldenable = false

-- Programming tools setup
vim.o.makeprg = "clang %"

-- Auto-indentation and tab settings for code formatting
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Search, match, and mode display settings
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.showmode = true
vim.o.wildmenu = true

-- Autocompletion options
vim.o.completeopt = "menu,menuone,noselect"

-- Backup and file handling settings
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.hidden = true

-- Additional visual and command enhancements
vim.o.splitbelow = true
vim.o.autowrite = true

-- Appearance settings and syntax enabling
vim.opt.cmdheight = 1
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme catppuccin")

-- Support for Russian keyboard layout for commands
vim.cmd(
	[[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]]
)
