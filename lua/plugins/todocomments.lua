vim.pack.add({
	{
		src = "gh:folke/todo-comments.nvim",
	},
	"gh:nvim-lua/plenary.nvim",
})

require("todo-comments").setup({})
