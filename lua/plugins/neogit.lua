vim.pack.add({
	{
		src = "https://github.com/NeogitOrg/neogit",
	},
	"https://github.com/esmuellert/codediff.nvim",
})

map("n", "<leader>gg", "<cmd>Neogit<cr>")
