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

local servers = {
    html = {
        filetypes = { "html" },
    },
    emmet_ls = {},
    cssls = {
        filetypes = { "css", "scss", "sass" },
    },
    tsserver = {
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
        root_dir = function(...)
            return require("lspconfig.util").root_pattern ".git" (...)
        end,
        single_file_support = false,
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "literal",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },

    clangd = {
        on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            on_attach(client, bufnr)
        end,
        filetypes = { "c", "cpp" },
    },

    sourcery = {
        init_options = {
            token = "user_Mx0ZPSdGLQF0tvOea8_5zWqHkFt6Bg4vgh2MQmfSQ7O9XeHpQDXxmJWj9kM",
            extension_version = "vim.lsp",
            editor_version = "vim",
        },
    },
    ruff_lsp = {
        filetypes = { "python" },
    },
    pyright = {
        filetypes = { "python" },
        settings = {
            python = {
                analysis = { typeCheckingMode = "off", autoSearchPaths = true },
            },
        },
    },
}

for name, opts in pairs(servers) do
    opts.on_init = on_init
    opts.on_attach = on_attach
    opts.capabilities = capabilities

    lspconfig[name].setup(opts)
end
