return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Automatically updates parsers after installation
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "go", "rescript", "javascript", "typescript", "html" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}

