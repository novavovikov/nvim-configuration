local dap = require('dap')
local dapui = require('dapui')
local formatter = require('formatter')
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local nvim_tree = require('nvim-tree')
local lualine = require('lualine')

-- Configuration for dap and dap-ui
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Configuration for nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP settings
-- Go
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true
        })
      end
    })
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true
    }
  },
}

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
      telemetry = {
        enable = false,
      },
    }
  },
}
-- Rescript
lspconfig.rescriptls.setup {
  cmd = { 'rescript-language-server', '--stdio' },
}

-- Protocol Buffers
lspconfig.bufls.setup {
  capabilities = capabilities,
}

-- formatter
formatter.setup({
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--search-parent-directories", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--" },
          stdin = true
        }
      end
    }
  }
})

-- Nvim Tree
nvim_tree.setup {
  update_cwd = true,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    enable = true,
    timeout = 500,
  },
  view = {
    width = 40,
    side = 'left',
    preserve_window_proportions = true
  }
}

-- Lualine
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

-- Coc extensions
vim.g.coc_global_extensions = { 'coc-clangd' }
