return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Standard Prettier for these
      javascript = { "prettier" },
      json = { "prettier" },
      jsonl = { "prettier" },
      -- Ruff or Black for Python (this replaces Prettier)
      python = { "ruff_format" },
    },
  },
}
