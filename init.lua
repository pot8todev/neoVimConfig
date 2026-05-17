require("config.lazy")
require("config.colors")
require("config.fzf")
vim.notify = function() end
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls" },
})
require("lspconfig").lua_ls.setup({ settings = { diagnostics = { globals = { "vim" } } } }) --makes lsp recognize the "vim" keyword

vim.b.Autocompile = false -- toggle autocampile locally on buffer

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
