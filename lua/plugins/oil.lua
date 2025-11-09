vim.pack.add({'https://github.com/stevearc/oil.nvim'})

require('oil').setup()

map("n", "-", "<cmd>Oil<CR>", {desc = "Open Oil"})
