-- Initialize the counter variable
local oil = require("oil")

local function toggle_oil_with_preview(dir)
  oil.toggle_float(dir)

  vim.wait(250, function()
    return oil.get_cursor_entry() ~= nil
  end)

  if oil.get_cursor_entry() then
    oil.open_preview()
  end
end

vim.keymap.set("n", "<leader>e", function()
  toggle_oil_with_preview()
end, { remap = true, silent = true, desc = "Floating Explorer Oil" })

-- vim.keymap.set("n", "<leader>E", function()
--   toggle_oil_with_preview(vim.loop.cwd())
-- end, { remap = true, silent = true, desc = "Floating Explorer Oil in Terminal CWD" })
