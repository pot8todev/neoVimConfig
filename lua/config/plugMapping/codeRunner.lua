-------------------Code Runner------------------//
vim.keymap.set("n", "<leader>c>", function()
  _G.fileGroup = vim.fn.input("set fileGroup: ")
end, { desc = "set global filePath" })

-------------------Creating buffer------------------//
_G.runner_win = _G.runner_win or nil
vim.keymap.set("n", "<leader>t", function()
  local buf = _G.runner_buf --buffernbr witch the terminal output is being written

  -- toggle off if already open
  if _G.runner_win and vim.api.nvim_win_is_valid(_G.runner_win) then
    vim.api.nvim_win_close(_G.runner_win, true)
    _G.runner_win = nil
    return
  end

  -- open window
  _G.runner_win = vim.api.nvim_open_win(buf, true, {
    split = "right",
    width = math.floor(vim.o.columns * 0.4),
  })
end, { silent = true, desc = "Toggle runner" })
-------------------makefile------------------//
vim.keymap.set("n", "<leader>cMa", function()
  local cwd = vim.uv.cwd()
  local build_cmd = "cmake -B " .. cwd .. "/build -S " .. cwd
  local compile_cmd = "cmake --build " .. cwd .. "/build"
  local run_cmd = cwd .. "/bin/my_program1"

  -- Run CMake configuration, then build, then execute
  vim.cmd(":terminal bash -c '" .. build_cmd .. " && " .. compile_cmd .. " && " .. run_cmd .. "'")
end, { desc = "Build & Run CMake project" })

-- vim.keymap.set("n", "<leader>c.", function()
--   local file_name = vim.api.nvim_buf_get_name(0)
--   local file_type = vim.bo.filetype
--   local fileGroup = _G.fileGroup
--
--   local cmd = function(file_name, file_type, fileGroup)
--     local cmd
--     if file_type == "lua" then
--       -- vim.cmd(":terminal lua " .. file_name .. " ;pokemon-colorscripts -r 1-6 --no-title")
--       vim.cmd(":terminal lua " .. file_name .. "")
--     elseif file_type == "c" then
--       local target = fileGroup or file_name -- if _G.fileGroup was defined
--       cmd = string.format("terminal gcc %s && ./a.out", target)
--     elseif file_type == "python" then
--       local target = fileGroup or file_name -- if _G.fileGroup was defined
--     elseif file_type == "haskell" then
--       local file_path = vim.fn.fnamemodify(file_name, ":t") -- só o nome
--       local binary = file_path:gsub("%.hs$", "")
--       cmd = string.format("terminal ghc %s && ./%s", file_path, binary)
--     end
--     return cmd
--   end
--
--   vim.cmd(cmd)
-- end, { silent = false, desc = "run code" })

local function openFloatTerminal()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.7)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })
end
