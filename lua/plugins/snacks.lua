return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.scroll = { enabled = false }
      opts.scratch = vim.tbl_deep_extend("force", opts.scratch or {}, {
        ft = "markdown", -- force scratch buffer to use markdown
        filename = "scratch.md", -- optional filename
      })

      return opts
    end,
  },
}
