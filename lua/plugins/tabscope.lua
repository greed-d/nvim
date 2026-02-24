vim.pack.add({ "https://github.com/backdround/tabscope.nvim" })

require("tabscope").setup({})

map("n", "<leader>tb", require("tabscope").remove_tab_buffer)
