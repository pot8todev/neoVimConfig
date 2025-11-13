return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.blade.php",
      command = "set filetype=blade",
    })
  end,
}
