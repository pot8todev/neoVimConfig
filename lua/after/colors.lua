-- tab Highlight
local colors = {
  white = "#DCD7BA",
  Yellow = "#ffcc00",
  sakura = "#D27E99",
  waveRed = "#E46876",
  green = "#98BB6C",
  gray = "#888888",
  dark_gray = "#555555",
}
require("bufferline").setup({
  highlights = {
    buffer_selected = {
      fg = colors.green, -- Yellow text for the active tab
      bold = true,
      italic = false,
    },
    buffer_visible = {
      fg = colors.gray, -- Gray text for visible but inactive tabs
    },
    buffer = {
      fg = colors.dark_gray, -- Even darker gray for fully inactive tabs
    },
    tab_selected = {
      fg = colors.Yellow,
      bold = true,
      italic = false,
    },
  },
})
function ColorMyPencils(color)
  color = color or "kanagawa-wave"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
