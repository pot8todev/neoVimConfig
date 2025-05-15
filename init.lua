require("config.lazy")
require("config.autocmd")
-- require("plugins.obsidian")
require("config.colors")

--indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Definir o idioma do corretor ortográfico para português (Brasil)
-- vim.opt.wackup = false
vim.opt.spell = false
-- vim.opt.spelllang = "pt_br"

vim.opt.undofile = true

--undotree
vim.opt.scrolloff = 8
vim.opt.winbar = "%=%m %f"
