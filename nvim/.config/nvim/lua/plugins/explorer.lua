return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            preview = "main",
          },
          win = {
            preview = {
              wo = {
                winbar = "%=👁 PREVIEW%=",
              },
            },
          },
        },
      },
    },
  },
}
