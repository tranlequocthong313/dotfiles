return {
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "custom.configs.refactoring"
    end,
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
  { "christoomey/vim-tmux-navigator", lazy = false, config = function() end },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.dashboard"
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "preservim/tagbar",
    event = "VeryLazy",
    config = function()
      require "custom.configs.tagbar"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- lazy = false,
    event = "VeryLazy",
    opts = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "mbbill/undotree",
    -- lazy = false,
    event = "VeryLazy",
    config = function()
      require "custom.configs.undotree"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      require "custom.configs.formatter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
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
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      require "custom.configs.null-ls"
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
    ft = { "python" },
    opts = function()
      require "custom.configs.null-ls"
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
        "lua-language-server",
        "stylua",

        "html-lsp",
        "css-lsp",
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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
