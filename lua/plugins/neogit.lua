vim.pack.add({
	{
		src = "https://github.com/NeogitOrg/neogit",
	},
	"https://github.com/esmuellert/codediff.nvim",
})

require("neogit").setup({
	floating = {
		relative = "editor",
		width = 0.9,
		height = 0.8,
		style = "minimal",
		border = "rounded",
	},
})
map("n", "<leader>gg", "<cmd>Neogit kind=floating<cr>")
map("n", "<leader>gP", "<cmd>Neogit push<cr>")
map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
