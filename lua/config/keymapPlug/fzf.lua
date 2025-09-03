vim.keymap.set(
  "n",
  "<leader>fp",
  "<CMD> FzfLua files cwd=/Users/pedrojesus/Documents/pot8toDev <CR>",
  { desc = "telescope from Pot8to" }
)
vim.keymap.set(
  "n",
  "<leader>fh",
  "<CMD> FzfLua files cwd=/Applications/XAMPP/xamppfiles/htdocs/modulo5 <CR>",
  { desc = "telescope from htdocs" }
)
-- vim.keymap.set(
--   "n",
--   "<leader>fP",
--   "<CMD> FzfLua files cwd=/Users/pedrojesus/Documents/pot8toDev/C_C++<CR>",
--   { desc = "telescope from Pot8to" }
-- )

vim.keymap.set("n", "<leader>f~", "<CMD> FzfLua files cwd=/Users/pedrojesus <CR>", { desc = "find from Root" })
-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("fzf-lua").resume,
--   { noremap = true, silent = true, desc = "last telescope location" }
-- )
