require("config.lazy")
require("config.colors")
require("config.fzf")

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Definir o idioma do corretor ortográfico para português (Brasil)
-- vim.opt.wackup = false
vim.opt.spell = false
-- vim.opt.spelllang = "pt_br"

vim.opt.undofile = true
vim.opt.cursorcolumn = true

vim.g.lazyvim_php_lsp = "phpactor"
--undotree
vim.opt.scrolloff = 8
vim.opt.winbar = "%=%m %f"
vim.g.snacks_dashboard_preset = false
vim.g.autochdir = true
