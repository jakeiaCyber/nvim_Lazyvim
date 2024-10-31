return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  {
    {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      event = "LazyFile",
      main = "rainbow-delimiters.setup",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      dependencies = { "HiPhish/rainbow-delimiters.nvim" },
      opts = function(_, opts)
        if not opts.scope then
          opts.scope = {}
        end
        opts.scope.show_start = false
        opts.scope.show_end = false
        opts.scope.highlight = vim.tbl_get(vim.g, "rainbow_delimiters", "highlight")
          or {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          }
      end,

      config = function(plugin, opts)
        require(plugin.main).setup(opts)

        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      end,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- vim.api.nvim_set_hl(0, "PopMenu", { bg = "#1F2335", blend = 0 })
      local cmp = require("cmp")
      local win_opt = {
        col_offset = 0,
        side_padding = 1,
        winhighlight = "Normal:PopMenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }
      opts.window = {
        completion = cmp.config.window.bordered(win_opt),
        documentation = cmp.config.window.bordered(win_opt),
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000,
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon
                and { " ", ft_icon, " ", guibg = ft_color, guifg = require("incline.helpers").contrast_color(ft_color) }
              or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#04a5e5",
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "BufReadPre",
  },
}
