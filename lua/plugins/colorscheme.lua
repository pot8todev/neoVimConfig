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
    "murtaza-u/gruvqueen",
  },
  {
    "sainnhe/gruvbox-material",
  },
}
