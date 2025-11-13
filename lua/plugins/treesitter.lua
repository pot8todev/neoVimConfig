return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      --skip jsonc
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "jsonc"
      end, opts.ensure_installed)
      -- safely extend existing opts
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "python",
        "javascript",
        "vimdoc",
        "php",
        "c",
        "html",
        -- add more here
      })

      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.additional_vim_regex_highlighting = false

      return opts
    end,
  },
}
