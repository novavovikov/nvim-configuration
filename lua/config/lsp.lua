local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local lsp_util = require('lspconfig/util')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

mason.setup()

mason_lspconfig.setup({
  automatic_installation = false,
  handlers = {
    ["gopls"] = function()
      capabilities = capabilities,
      lspconfig.gopls.setup {
        on_attach = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lsp_util.root_pattern("go.mod"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      }
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup {
        filetype = { "lua" },
        capabilities = capabilities,
        settings = {
          Lua = {
            format = { enable = true },
            diagnostics = { globals = { 'vim', 'use' } },
            telemetry = { enable = false },
          },
        },
      }
    end,
    ["rescriptls"] = function()
      lspconfig.rescriptls.setup {
        cmd = { 'rescript-language-server', '--stdio' },
      }
    end,
    ["buf_ls"] = function()
      lspconfig.buf_ls.setup {
        capabilities = capabilities,
      }
    end,
    ["clangd"] = function()
      lspconfig.clangd.setup {
        capabilities = capabilities,
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = lsp_util.root_pattern("compile_commands.json", ".git"),
        settings = {
          clangd = {
            fallbackFlags = { "-std=c++17" } -- Укажите стандарт, если необходимо
          },
        },
      }
    end,
  }
})


