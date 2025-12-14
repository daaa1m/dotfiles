return {
  "michaelb/sniprun",
  branch = "master",
  build = "./install.sh",
  config = function()
    require("sniprun").setup({
      display = {
        "Classic", -- distinct highlight of the result
        "VirtualTextOk", -- show result as virtual text (if short)
      },
    })
  end,
}
