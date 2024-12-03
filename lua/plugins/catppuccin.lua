return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = {}, -- Change the style of comments
      conditionals = { "italic" },
      loops = { "italic" },

      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      grug_far = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      snacks = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
        end
      end,
    },
  },
}
