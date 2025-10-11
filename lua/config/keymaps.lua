-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--#region

--Code Runner
vim.keymap.set("n", "<leader>cC", ":terminal sudo gcc ", { desc = "compile in termanal" })
vim.keymap.set("n", "<leader>cc", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype

  local function waitNpress()
    --
    vim.api.nvim_feedkeys("i", "n", false)
  end

  if file_type == "lua" then
    vim.cmd(":terminal lua " .. file_name)
  elseif file_type == "c" then
    vim.cmd(":terminal gcc " .. file_name .. " && ./a.out")
  elseif file_type == "php" then
    vim.cmd(":terminal php " .. file_name)
  else
    print("No runner configured for filetype: " .. file_type)
    return
  end
  vim.defer_fn(waitNpress, 250)
end, { desc = "run code" })

--makefile
vim.keymap.set("n", "<leader>cMa", function()
  local cwd = "/Users/pedrojesus/Documents/pot8toDev/C_C++/prog2/allegro_turtle/allegro/allegro_game"
  local build_cmd = "cmake -B " .. cwd .. "/build -S " .. cwd
  local compile_cmd = "cmake --build " .. cwd .. "/build"
  local run_cmd = cwd .. "/bin/my_program1"

  -- Run CMake configuration, then build, then execute
  vim.cmd(":terminal bash -c '" .. build_cmd .. " && " .. compile_cmd .. " && " .. run_cmd .. "'")
end, { desc = "Build & Run CMake project" })

--Single key reamap
vim.keymap.set("n", "Q", "<nop>", { remap = true })
vim.keymap.set("n", "<Tab>", "a<Tab><C-c>", { remap = true, silent = true })
vim.keymap.set(
  { "n" },
  "<C-v>",
  "<CMD>echo 'visual block entered'<CR><C-v>",
  { remap = false, silent = true, desc = "enter visual block and warn" }
)
--vim diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = " Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = " Go to next [D]iagnostic message" })

--VSCode lineSwap
vim.keymap.set({ "n" }, "∆", ":m .+1<CR>==", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)
vim.keymap.set({ "n" }, "˚", ":m .-2<CR>==", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)

vim.keymap.set({ "v" }, "∆", ":m '>+1<CR>gv=gv", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)
vim.keymap.set({ "v" }, "˚", ":m '<-2<CR>gv=gv", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)

vim.keymap.set({ "i" }, "˚", "<C-C>:m .-2<CR>==li", { silent = true, desc = "<A-k> moves up a line" }) -- move line down(n)
vim.keymap.set({ "i" }, "∆", "<C-C>:m .+1<CR>==li", { silent = true, desc = "<A-j> alt* moves down a line" }) -- move line up(n)

--yank
vim.keymap.set("n", "<leader>Y", function()
  vim.cmd([[let @+ = expand('%:p:h')]])
  print("CWD yanked")
end, { silent = true, desc = "Yank file path cwd" })

vim.keymap.set({ "x", "v" }, "p", '"_dP', { silent = true, desc = "paste without changing register" }) --paste whithout forgetting

--indentation
vim.keymap.set("x", ">", ">gv", { desc = "idents right" }) -- move line down(v)
vim.keymap.set("x", "<", "<gv", { desc = "idents left" }) -- move line down(v)

--omnicomplition
vim.keymap.set("n", "<C-space>", "li<C-x><C-o>", { remap = true }) -- J but not moving cursor
vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { remap = true }) -- J but not moving cursor

----cursor
vim.keymap.set("n", "J", "mzJ`z") -- J but not moving cursor
vim.keymap.set({ "n", "x", "v", "i" }, "<C-c>", "<Esc>", { desc = "Remap Ctrl-C to Escape" }) -- stupid remap
vim.keymap.set({ "x" }, "g$", "$A", { remap = false, silent = true, desc = "add to the end of everyLine" })
vim.keymap.set({ "x" }, "g_", "_I", { remap = false, silent = true, desc = "add to the start of everyLine" })

--cursor moviment
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down focus" }) -- move line down(v)
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll upwards focus" }) --camera sync

----Buffer
vim.keymap.set("n", "<leader>bH", "<leader>bl", { silent = true, remap = true, desc = "Delete buffers to the LEFT" })
vim.keymap.set("n", "<leader>bL", "<leader>br", { silent = true, remap = true, desc = "Delete buffers to the RIGHT" })
vim.keymap.set("n", "gb", "<CMD>e #<CR>", { silent = true, remap = true, desc = "go back to previous file" }) -- going back in file navegation

--bufferline moviment
vim.keymap.set("n", "¡", "<Cmd>BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set("n", "™", "<Cmd>BufferLineMoveNext<CR>", { silent = true })

--window_Size
vim.keymap.set("n", "<A-right>", "<C-w>><C-w>><C-w>>", { desc = "increase width" })
vim.keymap.set("n", "<A-left>", "<C-w><<C-w><<C-w><", { desc = "decrease width" })
vim.keymap.set("n", "<A-up>", "<C-w>+<C-w>+<C-w>+", { desc = "increase height " })
vim.keymap.set("n", "<A-down>", "<C-w>-<C-w>-<C-w>-", { desc = "decrease height" })
vim.keymap.set(
  { "n" },
  "<C-s>",
  "<CMD>so<CR><CMD>echo 'file sourced'<CR>",
  { remap = true, silent = true, desc = "source file" }
)

--numbers 1 2 3 4 5..
local function insert_numbers(name, n)
  local buf = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] -- current line (1-based)

  for i = 1, n do
    vim.api.nvim_buf_set_lines(buf, row - 1 + i, row - 1 + i, false, { name .. tostring(i) })
  end
end

vim.api.nvim_create_user_command(
  "Numbers",
  function(opts)
    local args = vim.split(opts.args, " ")
    local name = args[1]
    local n = tonumber(args[2])

    if name and n and n > 0 then
      insert_numbers(name, n)
    else
      print("Usage: :Numbers <name> <count>")
    end
  end,
  { nargs = "+" } -- requires at least 1 arg, allows more
)

--Plug-ins Keymaps
require("config.keymapPlug.keymapPlug")
