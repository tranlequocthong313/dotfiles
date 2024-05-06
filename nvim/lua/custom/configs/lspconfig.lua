local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = { typeCheckingMode = "off" },
    },
  },
}

lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html" },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "css", "scss", "sass" },
}

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.sourcery.setup {
  init_options = {
    token = "user_Mx0ZPSdGLQF0tvOea8_5zWqHkFt6Bg4vgh2MQmfSQ7O9XeHpQDXxmJWj9kM",
    extension_version = "vim.lsp",
    editor_version = "vim",
  },
}
