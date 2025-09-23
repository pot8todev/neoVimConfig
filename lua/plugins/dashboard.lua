return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ColaMint/pokemon.nvim",
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local pokemon = require("pokemon")

      -- random number each startup
      math.randomseed(os.time())
      local random_num = math.random(1, 700) -- valid Pokémon range
      local formatted = string.format("%04d", random_num)

      -- setup pokemon.nvim
      pokemon.setup({
        number = formatted,
        size = "small",
      })

      local function spacer()
        return { type = "text", val = "", opts = { hl = "AlphaHeader" } }
      end
      -- integrate with alpha
      if type(pokemon.header) == "function" then
        dashboard.section.header.val = pokemon.header()
      end

      dashboard.section.buttons.val = {
        dashboard.button("f", "󰍉  Find file", ":Fzf files<CR>"),
        dashboard.button("r", "  Recent", ":Fzf oldfiles<CR>"),
        dashboard.button("s", "  Restore Session", ":lua require('persistence').load()<CR>"),
        dashboard.button("S", "  Restore Session Log", ":lua require('persistence').select()<CR>"),
        dashboard.button("x", "  Lazy Extras", ":LazyExtras<CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  },
}
