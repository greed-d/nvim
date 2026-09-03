vim.pack.add({ "gh:backdround/tabscope.nvim" })

require("tabscope").setup({})

map("n", "<leader>tb", require("tabscope").remove_tab_buffer)
