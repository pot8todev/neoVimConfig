require("lazy").setup({
  -- Lazy.nvim manages itself
  { "wbthomason/packer.nvim" },

  -- lrexlib-PCRE2 setup
  {
    "luarocks.nvim",
    config = function()
      require("luarocks").setup({
        rocks = {
          "lrexlib-PCRE2",
        },
        env = {
          PCRE2_DIR = "/home/linuxbrew/.linuxbrew/Cellar/pcre2/10.37_1",
        },
      })
    end,
  },
})

-- Load the lrexlib-PCRE2 module
local exists, rex = pcall(require, "rex_pcre2")
if exists then
  print(vim.inspect(rex))
else
  print("Cannot find rex_pcre2")
end
