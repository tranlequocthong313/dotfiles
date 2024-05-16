return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "jcdickinson/codeium.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "hrsh7th/nvim-cmp",
                },
                config = function()
                    require("codeium").setup {}
                end,
            },
        },
        opts = function(_, opts)
            local cmp = require "cmp"
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium", group_index = 1 } }))
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {}
        end,
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require "custom.configs.silicon"
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependenciee = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        event = "VimEnter", -- TODO: load when press special keys
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "preservim/tagbar",
        config = function()
            require "custom.configs.tagbar"
        end,
        keys = {
            { "<leader>tt", "<CMD>TagbarToggle<CR>", desc = "Tagbar Toggle" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            require "custom.configs.todo-comments"
        end,
        event = "VimEnter",
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "Undotree Toggle" },
        },
    },
    {
        "mhartington/formatter.nvim",
        opts = function()
            require "custom.configs.formatter"
        end,
        ft = { "python", "javascript", "typescript", "html", "css", "lua" },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require "custom.configs.lint"
        end,
        event = "VeryLazy",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require "custom.configs.dap.ui"
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require "custom.configs.dap.node"
            require "custom.configs.dap.mappings"
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function(_, _)
            require "custom.configs.dap.python"
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require "configs.conform"
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VimEnter", -- TODO: load when press special keys
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "custom.configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",

                "lua-language-server",
                "stylua",

                "html-lsp",
                "css-lsp",
                "emmet-ls",
                "prettier",
                "js-debug-adapter",
                "eslint-lsp",
                "typescript-language-server",

                "sourcery",
                "debugpy",
                "ruff-lsp",
                "black",
                "pyright",
                "ruff",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VimEnter",
        config = function()
            vim.keymap.set("n", "cx", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true, desc = "Jump to treesitter context" })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "python",
            },
        },
        config = {
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = { "html", "javascript", "jsx", "tsx", "typescript", "vue" },
            },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require "custom.configs.telescope"
        end,
    },
}
