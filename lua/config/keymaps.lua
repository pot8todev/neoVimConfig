-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--#
--#region
--
--
--Code Runner
vim.keymap.set("n", "<leader>ci", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype

  if file_type == "lua" then
    vim.cmd(":terminal lua" .. file_name)
  elseif file_type == "c" then
    vim.cmd(":terminal gcc " .. file_name .. "; ./a.out")
  end
end, { desc = "run code" })

--vim diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = " Go to previous [D]iagnostic message" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = " Go to next [D]iagnostic message" })

--VSCode lineSwap
vim.keymap.set({ "n", "v" }, "∆", ":m .+1<CR>==", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)
vim.keymap.set({ "n", "v" }, "˚", ":m .-2<CR>==", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)
vim.keymap.set({ "i" }, "˚", "<C-C>:m .-2<CR>==li", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)
vim.keymap.set({ "i" }, "∆", "<C-C>:m .+1<CR>==li", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)

--indentation
vim.keymap.set("x", ">", ">gv", { desc = "idents right" }) -- move line down(v)
vim.keymap.set("x", "<", "<gv", { desc = "idents left" }) -- move line down(v)
vim.keymap.set({ "x", "v" }, "p", '"_dP', { desc = "paste without changing register" }) -- move line down(v)

--moviment
vim.keymap.set("n", "<C-d>", "zz<C-d>zz", { desc = "scroll down focus" }) -- move line down(v)
vim.keymap.set("n", "<C-u>", "zz<C-u>zz", { desc = "scroll upwards focus" }) -- move line down(v)

--Buffer
vim.keymap.set("n", "<leader>bH", "<leader>bl", { silent = true, remap = true, desc = "Delete buffers to the LEFT" })

vim.keymap.set("n", "<leader>bL", "<leader>br", { silent = true, remap = true, desc = "Delete buffers to the RIGHT" })

--window_Size
vim.keymap.set("n", "<A-right>", "<C-w>><C-w>><C-w>>", { desc = "increase width" })
vim.keymap.set("n", "<A-left>", "<C-w><<C-w><<C-w><", { desc = "decrease width" })
vim.keymap.set("n", "<A-up>", "<C-w>+<C-w>+<C-w>+", { desc = "increase height " })
vim.keymap.set("n", "<A-down>", "<C-w>-<C-w>-<C-w>-", { desc = "decrease height" })

---- setup code Enviroment (stp)
vim.keymap.set("n", "<leader>cs", "", { desc = " setup files path" })
--C setup
vim.keymap.set(
  "n",
  "<leader>csc",
  ":! cat /Users/pedrojesus/Documents/pot8toDev/.setup/setup.c | pbcopy /Users/pedrojesus/Documents/pot8toDev/.setup/setup.c<CR>p",
  { desc = " setup C code" }
)
----Quit
vim.keymap.set("n", "QQ", "<CMD>qall<CR>", { desc = " setup files path" })

--Plug-ins Keymaps
require("config.keymapPlug.oil")
require("config.keymapPlug.fzf")
require("config.keymapPlug.obsidian")
require("config.keymapPlug.undotree")
require("config.keymapPlug.harpoon")
require("config.keymapPlug.pokemon")
