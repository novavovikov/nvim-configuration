local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = '|',
    section_separators = ''
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '' },
      {
        'diff',
        colored = true,
        diff_color = {
          added = 'green',
          modified = 'orange',
          removed = 'red'
        }
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      },
      function()
        local msg = 'No LSP'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}

