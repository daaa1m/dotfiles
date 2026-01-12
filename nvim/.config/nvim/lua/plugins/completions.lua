return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt" and vim.bo.filetype ~= "markdown"
      end,
    },
  },
}
