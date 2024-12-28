local treesitter_config = require('nvim-treesitter.configs')

treesitter_config.setup {
    ensure_installed = { "lua", "go", "rescript", "javascript", "typescript", "html" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
