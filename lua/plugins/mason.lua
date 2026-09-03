vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"basedpyright",
		"ruff",
		"stylua",
		"ty",
		"bash-language-server",
		"clangd",
		"gopls",
	},
})

map("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason open" })
