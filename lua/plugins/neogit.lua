vim.pack.add({
	{
		src = "gh:NeogitOrg/neogit",
	},
	"gh:esmuellert/codediff.nvim",
	"gh:nvim-lua/plenary.nvim",
})

require("neogit").setup({
	kind = "tab",
	floating = {
		relative = "editor",
		width = 0.95,
		height = 0.9,
		style = "minimal",
		border = "single",
	},
})
-- map("n", "<leader>gg", "<cmd>Neogit kind=floating<cr>")
map("n", "<leader>gg", "<cmd>Neogit<cr>")
map("n", "<leader>gP", "<cmd>Neogit push<cr>")
map("n", "<leader>gp", "<cmd>Neogit pull<cr>")
map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
