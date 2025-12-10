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
-------------------Code Runner------------------//

vim.keymap.set("n", "<leader>c.", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype
  local filepath = _G.filePath

  local function waitNpress()
    vim.api.nvim_feedkeys("i", "n", false)
  end

  if file_type == "lua" then
    openFloatTerminal()
    -- vim.cmd(":terminal lua " .. file_name .. " ;pokemon-colorscripts -r 1-6 --no-title")
    vim.cmd(":terminal lua " .. file_name .. "")
  elseif file_type == "c" then
    local target = filepath or file_name -- if _G.filepath was defined
    local cmd = string.format("terminal gcc %s && ./a.out ; pokemon-colorscripts -r 1-6 --no-title", target)
    openFloatTerminal()
    vim.cmd(cmd)
  elseif file_type == "haskell" then
    local file_path = vim.fn.fnamemodify(file_name, ":t") -- só o nome
    local binary = file_path:gsub("%.hs$", "")
    local cmd = string.format("terminal ghc %s && ./%s", file_path, binary)
    openFloatTerminal()
    vim.cmd(cmd)
  end
  vim.defer_fn(waitNpress, 250)
end, { silent = false, desc = "run code" })

vim.keymap.set("n", "<leader>c>", function()
  _G.filePath = vim.fn.input("set filePath: ")
end, { desc = "set global filePath" })

-------------------makefile------------------//
vim.keymap.set("n", "<leader>cMa", function()
  local cwd = vim.uv.cwd()
  local build_cmd = "cmake -B " .. cwd .. "/build -S " .. cwd
  local compile_cmd = "cmake --build " .. cwd .. "/build"
  local run_cmd = cwd .. "/bin/my_program1"

  -- Run CMake configuration, then build, then execute
  vim.cmd(":terminal bash -c '" .. build_cmd .. " && " .. compile_cmd .. " && " .. run_cmd .. "'")
end, { desc = "Build & Run CMake project" })
