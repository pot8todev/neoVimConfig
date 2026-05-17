return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      -- Floating window size (relative to editor size)
      max_width = 0.8,
      max_height = 100,
      border = "rounded",
      get_win_title = function()
        local dir = require("oil").get_current_dir(0)
        if not dir then
          return ""
        end
        return vim.fn.fnamemodify(dir, ":t")
      end,
      win_options = {
        winblend = 0,
      },
    },
    columns = {
      "icon",
      -- { "mtime", format = "%d %b" },
    },

    view_options = {
      sort = {
        { "type", "asc" }, --separate files from folders
        -- { "size", "desc" }, --separate files from folders by size
        -- { "mtime", "desc" }, --most recent on top
      },
    },

    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
  },
  lazy = false,
  priority = 1000,

  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
}
