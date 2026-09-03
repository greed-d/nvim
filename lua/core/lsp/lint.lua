vim.pack.add({
	{ src = "gh:mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
	typescript = { "eslint_d" },
	python = { "ruff" },
	go = { "golangci-lint" },
}
