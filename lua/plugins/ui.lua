return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      event = "LazyFile",
      main = "rainbow-delimiters.setup",
    },
  },
}
