vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

require("mini.comment").setup({})
require("mini.tabline").setup({})
require("mini.pairs").setup({})
require("mini.git").setup({})
require("mini.diff").setup({})
require("mini.cmdline").setup({})
require("mini.starter").setup({})
require("mini.misc").setup_auto_root()
-- require('mini.indentscope').setup({})

require("plugins.mini.key_clue")
require("plugins.mini.pick")
require("plugins.mini.surround")
require("plugins.mini.mini_ai")
require("plugins.mini.trailspace")
