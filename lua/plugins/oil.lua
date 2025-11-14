return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      -- Floating window size (relative to editor size)
      max_width = 0.8,
      max_height = 100,
      border = "rounded",
    },
    columns = {
      "icon",
      -- { "mtime", format = "%d %b" },
    },

    view_options = {
      sort = {
        { "type", "asc" },
        { "mtime", "desc" },
      },
    },
    delete_to_trash = true,
  },
  lazy = false,

  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
}
