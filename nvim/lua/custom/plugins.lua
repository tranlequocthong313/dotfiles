return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependenciee = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "python", "javascript", "typescript" },
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
    "nvimdev/dashboard-nvim",
    config = function()
      require "custom.configs.dashboard"
    end,
    event = "VimEnter",
    requires = { "nvim-tree/nvim-web-devicons" },
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
    ft = { "python", "javascript", "typescript", "html", "css", "lua" },
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
    "nvimtools/none-ls.nvim",
    ft = { "python", "javascript", "typescript", "html", "css", "lua" },
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
    ft = { "python", "javascript", "typescript", "html", "css", "lua" },
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
}
