vim.keymap.set(
  "n",
  "<leader>fp",
  "<CMD> FzfLua files cwd=/Users/pedrojesus/Documents/pot8toDev <CR>",
  { desc = "find from Pot8to" }
)
vim.keymap.set(
  "n",
  "<leader>sx",
  require("fzf-lua").resume,
  { noremap = true, silent = true, desc = "last telescope location" }
)
