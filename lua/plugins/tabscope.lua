vim.pack.add({ "gh:backdround/tabscope.nvim" })

require("tabscope").setup({})

map("n", "<leader>bd", require("tabscope").remove_tab_buffer, { desc = "Remove buffer from tab" })
