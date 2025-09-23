-- Define colors for use throughout
local colors = {
  white = "#DCD7BA",
  Yellow = "#ffcc00",
  sakura = "#D27E99",
  waveRed = "#E46876",
  green = "#98BB6C",
  gray = "#888888",
  dark_gray = "#555555",
}

-- Setup bufferline highlights using the colors

-- Function to set the colorscheme
function ColorMyPencils(color)
  -- color = color or "kanagawa-wave" -- Default to "kanagawa-wave" if no color is specified
  -- vim.cmd.colorscheme(color)

  require("bufferline").setup({
    highlights = {
      buffer_selected = {
        fg = colors.Yellow, -- Green text for the active tab
        bold = true,
        italic = false,
      },
      buffer_visible = {
        fg = colors.gray, -- Gray text for visible but inactive tabs
      },
      buffer = {
        fg = colors.dark_gray, -- Darker gray for fully inactive tabs
      },
      tab_selected = {
        fg = colors.Yellow, -- Yellow text for the selected tab
        bold = true,
        italic = false,
      },
    },
  })
  -- Optional: Set transparent background (commented out)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Automatically run ColorMyPencils
ColorMyPencils()
