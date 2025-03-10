return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local pokemon = require("pokemon")

      -- Garante que os números sejam bem aleatórios
      math.randomseed(os.time())

      -- Função para gerar um número formatado com 4 dígitos
      local function pkm()
        local numero_aleatorio = math.random(1, 700)
        return string.format("%04d", numero_aleatorio) -- Garante formato "0025"
      end

      -- Configuração do pokemon.nvim
      pokemon.setup({
        number = pkm(), -- Passa o valor gerado ao invés da função
        size = "auto",
      })

      -- Verifica se a função header existe antes de usá-la
      if type(pokemon.header) == "function" then
        dashboard.section.header.val = pokemon.header()
      end

      -- Configuração do alpha.nvim
      alpha.setup(dashboard.config)
    end,
    dependencies = {

      { "nvim-tree/nvim-web-devicons" },
      { "ColaMint/pokemon.nvim" },
    },
  },
}
