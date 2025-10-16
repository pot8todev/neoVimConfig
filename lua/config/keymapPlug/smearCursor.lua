-- Define colors for use throughout
vim.keymap.set(
  { "n" },
  "<leader>uS",
  vim.cmd.SmearCursorToggle,
  { remap = true, silent = true, desc = "Toggle Cursor animation " }
)
