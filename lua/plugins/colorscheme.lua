return {
  -- Theme plugins
  { "rebelot/kanagawa.nvim" },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      all_plugins = true,
      auto_plugins = true,

      _theme = "ink", -- dark variant
      transparent = false,

      overrides = function(colors)
        return {
          ["@field"] = { italic = true, sp = colors.palette.autumnRed },
          ["@property"] = { italic = true, sp = colors.palette.autumnRed },
          ["@field.lua"] = { italic = true, undercurl = true, sp = colors.palette.autumnRed },

          -- restore icon colors
          DevIconLua = { fg = colors.palette.sakuraPink },
          DevIconJs = { fg = colors.palette.boatYellow2 },
          DevIconTs = { fg = colors.palette.springBlue },
          DevIconHtml = { fg = colors.palette.carpYellow },
          DevIconCss = { fg = colors.palette.springViolet1 },
          DevIconFolder = { fg = colors.palette.dragonBlue },
        }
      end,
    },
  },

  -- 🔧 initialize web-devicons here
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      default = true,
    },
  },

  -- Other plugins
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-paper",
    },
  },
}
