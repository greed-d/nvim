vim.pack.add({
	{
		src = "gh:lucasdetoledo4/fastapi-nvim",
	},
	"gh:nvim-telescope/telescope.nvim",
})

require("fastapi-nvim").setup()

map("n", "<leader>fr", function()
	require("fastapi-nvim").routes()
end, { desc = "FastAPI routes" })
map("n", "<leader>fR", function()
	require("fastapi-nvim").refresh()
end, { desc = "FastAPI refresh routes" })
