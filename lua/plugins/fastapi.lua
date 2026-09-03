vim.pack.add({
	{
		src = "gh:lucasdetoledo4/fastapi-nvim",
	},
	"gh:nvim-telescope/telescope.nvim",
})

require("fastapi-nvim").setup()

map("n", "<leader>fr", function()
	require("fastapi-nvim").routes()
end)
map("n", "<leader>fR", function()
	require("fastapi-nvim").refresh()
end)
