return {
  {
    "mhinz/vim-startify",
    event = "VimEnter",
    dependencies = { "ColaMint/pokemon.nvim" },
    config = function()
      local pokemon = require("pokemon")

      -- Random Pokémon each startup
      math.randomseed(os.time())
      local random_num = math.random(1, 700)
      local formatted = string.format("%04d", random_num)

      -- Setup Pokémon
      pokemon.setup({
        number = formatted,
        size = "small",
      })

      -- Get Pokémon header (a list of strings)
      local header = pokemon.header()

      -- Center the header using Startify's built-in function
      local centered = vim.fn["startify#center"](header)

      -- Assign the centered header to Startify
      vim.g.startify_custom_header = centered
      vim.g.startify_lists = {
        { type = "commands", header = { "    Commands" } },
        { type = "files", header = { "   Recent Files" } },
        { type = "bookmarks", header = { "  bookmarks" } },
      }

      vim.g.startify_commands = {
        { "  Restore Session", "lua require('persistence').load()" },
        { "  Restore Session Log", "lua require('persistence').select()" },
        { "  Lazy Extras", "LazyExtras" },
      }
      -- Unmap certain keys in Startify buffer
      vim.api.nvim_create_autocmd("User", {
        pattern = "Startified",
        callback = function()
          for _, key in ipairs({ "e" }) do
            vim.api.nvim_buf_del_keymap(0, "n", key)
          end
        end,
      })
      vim.g.startify_files_number = 8
      vim.g.startify_custom_indices = { "s", "S", "l" }
      vim.g.startify_relative_path = 1
      vim.g.startify_abbreviate_path = 1
    end,
  },
}
