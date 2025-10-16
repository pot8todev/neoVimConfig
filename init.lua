-- Automatically use vimdoc for help buffers so Tree-sitter works
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- doctype()  for Tree-sitter help
function _G.doctype()
  local ft = vim.bo.filetype
  local lang = vim.treesitter.language.get_lang(ft)

  if lang == nil then
    vim.notify("No Treesitter parser for filetype '" .. ft .. "'. Setting filetype=vimdoc", vim.log.levels.INFO)
    vim.bo.filetype = "vimdoc"
  end
end
vim.api.nvim_create_autocmd("User", {
  pattern = "BufferLineColorsLoaded",
  callback = function()
    require("nvim-web-devicons").set_up_highlights()
  end,
})

vim.g.lazyvim_picker = "fzf"

--indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 --tabsize
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
