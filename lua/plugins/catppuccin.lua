return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    no_italic = false,
    term_colors = true,
    transparent_background = true,
    styles = {
      comments = {},
      conditionals = { "italic" },
      loops = { "italic", "bold" },
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = {},
      types = {},
    },
    integrations = {
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      dropbar = {
        enabled = true,
        color_mode = true,
      },
    },
  },
}
