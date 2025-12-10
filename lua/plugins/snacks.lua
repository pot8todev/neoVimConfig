return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.scratch = vim.tbl_deep_extend("force", opts.scratch or {}, {
        ft = "text", -- force scratch buffer to be text
        filename = "scratch.txt", -- optional
      })
    end,
  },
}
