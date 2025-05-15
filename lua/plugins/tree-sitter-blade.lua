return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Define the Treesitter parser for Blade
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- Register Blade as a PHP language
    vim.treesitter.language.register("blade", "php")

    -- Ensure Blade is installed
    opts.ensure_installed = opts.ensure_installed or {}
    table.insert(opts.ensure_installed, "blade")

    -- Enable Treesitter highlighting
    opts.highlight = opts.highlight or { enable = true }
    opts.highlight.additional_vim_regex_highlighting = false
  end,
  -- Make sure the nvim-treesitter plugin is loaded before this config
  dependencies = { "nvim-treesitter/nvim-treesitter" },
}
