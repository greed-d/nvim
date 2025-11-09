require("greed.core")
vim.pack.add {
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/mason-org/mason.nvim'},
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim'}

}

vim.cmd('colorscheme catppuccin-mocha')
require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {'lua-language-server', 'basedpyright', 'ruff', 'stylua'}
})
-- require("greed.lazy")
