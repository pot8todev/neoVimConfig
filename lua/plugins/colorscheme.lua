return {
  -- Kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    opts = {
      colors = {
        palette = {
          -- override some colors
          sumiInk0 = "#000000",
          fujiWhite = "#FFFFFF",
        },
        theme = {
          wave = {
            ui = {
              float = {
                bg = "none", -- transparent floating windows
              },
            },
          },
        },
      },
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
