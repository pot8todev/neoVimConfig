-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
--
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Define colors for use throughout

-- Setup bufferline highlights using the colors

-- Function to set the colorscheme
_G.Colors = {
  white = "#DCD7BA",
  Yellow = "#ffcc00",
  pYellow = "#c4b28a",
  sakura = "#D27E99",
  waveRed = "#E46876",
  green = "#98BB6C",
  gray = "#888888",
  dark_gray = "#555555",
}
_G.Scheme = "kanagawa"

function ColorMyPencils(Scheme)
  local colors = _G.Colors or {}

  vim.cmd.colorscheme(Scheme)

  -- Setup bufferline with Colors
  local bufferline_ok, bufferline = pcall(require, "bufferline")
  if bufferline_ok then
    bufferline.setup({
      highlights = {
        buffer_selected = {
          fg = colors.green,
          bold = true,
          italic = false,
        },
        buffer_visible = {
          fg = colors.gray,
        },
        buffer = {
          fg = colors.dark_gray,
        },
        tab_selected = {
          fg = colors.Yellow,
          bold = true,
          italic = false,
        },
      },
    })
  end
end
-- Automatically run ColorMyPencils
ColorMyPencils()
vim.opt.cursorline = true

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "Startified",
--   callback = function()
--     vim.opt_local.cursorline = false
--   end,
-- })
