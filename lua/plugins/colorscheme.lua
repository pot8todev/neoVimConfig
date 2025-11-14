return {
  -- Kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    opts = {
      colors = {
        palette = {
          -- override some colors
          sumiInk0 = "#000000",
          fujiWhite = "#e5ddb0",
        },
        theme = {
          wave = {
            ui = {
              float = {
                -- bg = "none", -- transparent floating windows
              },
            },
          },
        },
      },
    },
  },

  {
    "thesimonho/kanagawa-paper.nvim",
    opts = {

      overrides = function(colors)
        return {
          ["@field"] = { italic = true, sp = colors.palette.autumnRed },
          ["@property"] = { italic = true, sp = colors.palette.autumnRed },
          ["@field.lua"] = { italic = true, undercurl = true, sp = colors.palette.autumnRed },
          -- ["@variable"] = { fg = Colors.pYellow, italic = true },
          -- ["@variable.member"] = { fg = Colors.pYellow, italic = true },
          -- ["@variable.parameter"] = { fg = "Colors.pYellow", italic = true },
        }
      end,
    },
  },
  -- LazyVim configuration
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
