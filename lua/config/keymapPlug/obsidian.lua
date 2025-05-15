vim.keymap.set("n", "<leader>o", "", { desc = "Obsidian" }) --Obsidian
vim.keymap.set(
  { "n" },
  "<leader>og",
  "<CMD>ObsidianFollowLink<CR>",
  { remap = false, silent = true, desc = "go to/follow link" }
)
vim.keymap.set(
  { "n" },
  "<leader>ob",
  "<CMD>ObsidianBacklinks<CR>",
  { remap = false, silent = true, desc = "Search notes that reference this one" }
)

vim.keymap.set("n", "<leader>os", ":ObsidianQuickSwitch<CR>", { silent = true, desc = "Search Existing Note" })
vim.keymap.set("n", "<leader>or", ":ObsidianRename<CR>", { silent = true, desc = "Rename current file" })
vim.keymap.set("n", "<leader>ot", ":ObsidianTags<CR>", { silent = true, desc = "Search by Tags" })

--links
vim.keymap.set({ "n", "x" }, "<leader>oln", ":ObsidianLinkNew<CR>", { silent = true, desc = "Now link" })
vim.keymap.set({ "n", "x" }, "<leader>olb", ":ObsidianLink<CR>", { silent = true, desc = "link Back" })

vim.keymap.set("n", "<leader>on", "", { silent = true, desc = "Open New Note" })
vim.keymap.set("n", "<leader>onn", ":ObsidianNew<CR>", { silent = true, desc = "Open Here" })
vim.keymap.set("n", "<leader>onN", ":ObsidianNew ~/vaults/", { silent = false, desc = "Open PATH" })

--workspaces: { "work" , "personal" "studies", "laravel", "logic", "prog2"}
vim.keymap.set("n", "<leader>ow", ":ObsidianWorkspace ", { silent = false, desc = "Change Workspace 'name'" })
vim.keymap.set("n", "<leader>oWe", ":ObsidianWorkspace errors<CR>", { silent = true, desc = "Change Workspace quick " })
