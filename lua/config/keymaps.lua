-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--#region

-------------------Single key reamap------------------//
vim.api.nvim_create_user_command("Q", function()
  vim.cmd("q")
end, { desc = "quit" })
vim.api.nvim_create_user_command("Qa", function()
  vim.cmd("qa")
end, { desc = "quit all" })
vim.api.nvim_create_user_command("QA", function()
  vim.cmd("qa")
end, { desc = "quit all" })

vim.keymap.set("n", "<Tab>", "a<Tab><C-c>", { remap = true, silent = true })
vim.keymap.set(
  { "n" },
  "<C-v>",
  "<CMD>echo 'visual block entered'<CR><C-v>",
  { remap = false, silent = true, desc = "enter visual block and warn" }
)

-------------------VSCode lineSwap------------------//
vim.keymap.set({ "n" }, "∆", ":m .+1<CR>==", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)
vim.keymap.set({ "n" }, "˚", ":m .-2<CR>==", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)

vim.keymap.set({ "v" }, "∆", ":m '>+1<CR>gv=gv", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)
vim.keymap.set({ "v" }, "˚", ":m '<-2<CR>gv=gv", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)

vim.keymap.set({ "i" }, "˚", "<C-C>:m .-2<CR>==li", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)
vim.keymap.set({ "i" }, "∆", "<C-C>:m .+1<CR>==li", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)

-------------------yank------------------//
vim.keymap.set({ "n" }, "<leader>Y", function()
  local cwd = vim.uv.cwd()
  local parent = vim.fs.dirname(cwd)
  vim.fn.setreg("+", parent)
end, { silent = true, desc = "yank file PATH" }) -- move line down(n)
vim.keymap.set({ "x", "v" }, "p", '"_dP', { silent = true, desc = "paste without changing register" }) --paste whithout forgetting

-------------------indentation------------------//
vim.keymap.set("x", ">", ">gv", { desc = "idents right" }) -- move line down(v)
vim.keymap.set("x", "<", "<gv", { desc = "idents left" }) -- move line down(v)

-------------------cursor------------------//
vim.keymap.set("n", "J", "mzJ`z") -- J but not moving cursor
vim.keymap.set({ "n", "x", "v", "i" }, "<C-c>", "<Esc>", { desc = "Remap Ctrl-C to Escape" }) -- stupid remap
vim.keymap.set({ "x" }, "g$", "$A", { remap = false, silent = true, desc = "add to the end of everyLine" })
vim.keymap.set({ "x" }, "g_", "_I", { remap = false, silent = true, desc = "add to the start of everyLine" })

-------------------cursor moviment------------------//
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down focus" }) -- move line down(v)
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll upwards focus" }) --camera sync

---------------------Buffer------------------//
vim.keymap.set("n", "<leader>bH", "<leader>bl", { silent = true, remap = true, desc = "Delete buffers to the LEFT" })
vim.keymap.set("n", "<leader>bL", "<leader>br", { silent = true, remap = true, desc = "Delete buffers to the RIGHT" })
vim.keymap.set("n", "gb", "<CMD>e #<CR>", { silent = true, remap = true, desc = "go back to previous file" }) -- going back in file navegation
vim.keymap.set("x", "S", ":s/", { remap = true, desc = "substitute" }) -- going back in file navegation
vim.keymap.set("n", "S", ":%s/", { remap = true, desc = "substitute" }) -- going back in file navegation

-------------------bufferline moviment------------------//
vim.keymap.set("n", "¡", "<Cmd>BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set("n", "™", "<Cmd>BufferLineMoveNext<CR>", { silent = true })

-------------------window_Size------------------//
vim.keymap.set("n", "<A-right>", "<C-w>><C-w>><C-w>>", { desc = "increase width" })
vim.keymap.set("n", "<A-left>", "<C-w><<C-w><<C-w><", { desc = "decrease width" })
vim.keymap.set("n", "<A-up>", "<C-w>+<C-w>+<C-w>+", { desc = "increase height " })
vim.keymap.set("n", "<A-down>", "<C-w>-<C-w>-<C-w>-", { desc = "decrease height" })
vim.keymap.set({ "n" }, "<C-s>", function()
  vim.cmd("so")
  print("file Sourced *")
end, { remap = true, silent = true, desc = "source file" })
-------------------Plug-ins Keymaps------------------//
require("config.plugMapping.keymapPlugAux")
