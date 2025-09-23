require("oil").setup({
  float = {

    -- Floating window size (relative to editor size)
    --
    max_width = 0.8,
    max_height = 40,
    border = "rounded",
  },
})
-- Initialize the counter variable
local function toggle_oil_with_preview(dir)
  require("oil").toggle_float(dir)

  vim.wait(250, function()
    return require("oil").get_cursor_entry() ~= nil
  end)

  local oil = require("oil")
  if oil.get_cursor_entry() then
    oil.open_preview()
  end
end

vim.keymap.set("n", "<leader>e", function()
  toggle_oil_with_preview()
end, { remap = true, silent = true, desc = "Floating Explorer Oil" })

vim.keymap.set("n", "<leader>E", function()
  toggle_oil_with_preview(vim.loop.cwd())
end, { remap = true, silent = true, desc = "Floating Explorer Oil in Terminal CWD" })
