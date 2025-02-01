return {
  "olimorris/persisted.nvim",
  config = function()
    require("persisted").setup({
      autosave = true,
      autoload = true,
      use_git_branch = true,
    })
  end,
}

