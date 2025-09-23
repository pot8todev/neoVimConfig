return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "pint", "php_cs_fixer" },
    },
    stop_after_first = true, -- usa só o primeiro que estiver disponível
  },
}
