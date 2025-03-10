vim.keymap.set("n", "<leader>o", "", { desc = "Obsidian" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { silent = true, desc = "Open New Note" })
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { silent = true, desc = "Search Existing Note" })
vim.keymap.set("n", "<leader>or", ":ObsidianRename<CR>", { silent = true, desc = "Rename current file" })
