vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
	typescript = { "eslint_d" },
	python = { "ruff" },
}
