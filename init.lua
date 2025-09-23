-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.lazyvim_picker = "fzf"

--indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2 --tabsize
vim.opt.expandtab = true
vim.opt.cindent = true --indentation for c

--cursorLine Highlight
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- vim.opt.wackup = false
vim.opt.spell = false
vim.opt.autochdir = true -- auto change dir
-- vim.opt.spelllang = "pt_br"

vim.opt.undofile = true

--search
vim.opt.gdefault = true --gdefault for substitite

--undotree
vim.opt.scrolloff = 8
vim.opt.winbar = "%=%m %f"
