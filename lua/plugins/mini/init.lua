vim.pack.add {
  { src = "https://github.com/nvim-mini/mini.nvim" }
}

require('mini.comment').setup({})
require('mini.tabline').setup({})
require('mini.pairs').setup({})
require('mini.pick').setup({})
require('plugins.mini.pick')

require('mini.surround').setup(
  require('plugins.mini.surround')
)

require('mini.ai').setup(
  require('plugins.mini.mini_ai')
)

require('mini.trailspace').setup(
  require('plugins.mini.trailspace')
)
