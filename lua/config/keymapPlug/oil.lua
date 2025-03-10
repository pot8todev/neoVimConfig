require("oil").setup({
  float = {

    -- Floating window size (relative to editor size)
    --
    max_width = 0.8,
    max_height = 100,
    border = "rounded",
  },
})
-- Initialize the counter variable

vim.keymap.set("n", "<leader>e", function()
  -- Toggle the floating Oil file explorer
  require("oil").toggle_float()

  vim.wait(250, function()
    return require("oil").get_cursor_entry() ~= nil
  end)

  if require("oil").get_cursor_entry() then
    require("oil").open_preview()
  end
  -- Simulate pressing Ctrl + P after the floating window opens
end, { remap = true, silent = true, desc = "Floating Explorer Oil with Preview" })
vim.keymap.set("n", "<leader>E", "<CMD>Oil<CR>", { silent = true, desc = " Explorer Oil" })
