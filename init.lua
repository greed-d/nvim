require("core")
auto_init = require('auto_plugin_init')
auto_init.init()
vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim'},
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim'}

}

require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {'lua-language-server', 'basedpyright', 'ruff', 'stylua'}
})
-- require("greed.lazy")
