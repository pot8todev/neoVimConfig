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
vim.keymap.set("n", "<leader>ff", function()
  local cwd = vim.uv.cwd()
  local parent = vim.fs.dirname(cwd)
  local input = tonumber(vim.fn.input("number of above dirs (default 1)"))

  if not input or input < 1 then
    input = 1
  end
  for _ = 1, input do
    parent = vim.fs.dirname(parent)
  end
  require("fzf-lua").files({ cwd = parent })
end, { remap = true, desc = "fzf in the above dir" })

vim.keymap.set("n", "<leader>f~", "<CMD> FzfLua files cwd=/Users/pedrojesus <CR>", { desc = "find from Root" })
