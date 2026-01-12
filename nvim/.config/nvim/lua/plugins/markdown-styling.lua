return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      backgrounds = {}, -- no background highlight
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
    dash = {
      width = "full",
      highlight = "Comment", -- faint line using Comment color
    },
  },
}
