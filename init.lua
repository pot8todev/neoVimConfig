require("config.lazy")
require("config.colors")
require("config.fzf")

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.spell = false

vim.opt.undofile = true
vim.opt.cursorcolumn = true

--undotree
vim.opt.scrolloff = 8
vim.opt.winbar = "%=%m %f"

vim.opt.gdefault = true -- gdefault for substitutue
vim.opt.autochdir = true
vim.g.lazyvim_php_lsp = "phpactor"
