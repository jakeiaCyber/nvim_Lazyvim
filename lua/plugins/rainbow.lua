return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    specs = {
      {
        "catppuccin",
        optional = true,
        ---@type CatppuccinOptions
        opts = { integrations = { rainbow_delimiters = true } },
      },
    },
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
    opts = {},
  },
}
