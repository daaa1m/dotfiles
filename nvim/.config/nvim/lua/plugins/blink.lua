return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.enabled = function()
      -- Disable if filetype is markdown
      if vim.bo.filetype == "markdown" then
        return false
      end
      -- Keep default logic for other filetypes
      return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end
    return opts
  end,
}
