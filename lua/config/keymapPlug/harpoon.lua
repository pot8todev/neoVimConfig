--harpoon

require("harpoon")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", "", { desc = "harpoon" })

vim.keymap.set("n", "<leader>hm", mark.add_file, { desc = "mark file to harpoon" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "show harpoon" })

vim.keymap.set("n", "¡", function()
  ui.nav_file(1)
end, { desc = "harpoon buffer(1)" })
vim.keymap.set("n", "™", function()
  ui.nav_file(2)
end, { desc = "harpoon buffer(2)" })
vim.keymap.set("n", "£", function()
  ui.nav_file(3)
end, { desc = "harpoon buffer(3)" })
vim.keymap.set("n", "¢", function()
  ui.nav_file(4)
end, { desc = "harpoon buffer(4)" })
