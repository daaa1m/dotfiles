-- README
-- Explicit config only for major languages (Python, JS/TS and Svelte), other languages added via LazyExtras
return {
  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "rst",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "html",
        "css",
      },
    },
  },

  -- LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = { -- pyright always has issues with imports so use basedpyright
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
        },
        ts_ls = {},
        svelte = {},
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        ["_"] = { "prettier" }, -- Fallback for other languages
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
        markdown = {}, -- Explicitly use no linter for markdown
      },
    },
  },
}
