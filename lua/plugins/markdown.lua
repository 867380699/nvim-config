return {
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- need to install treesitter-latex
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "norg" },
        headings = { " ", " ", " ", " ", " ", " " },
        highlights = {
          heading = {
            backgrounds = {},
          },
        },
      })
    end,
  },
}
