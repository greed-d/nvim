vim.pack.add({
	{ src = "gh:mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
	typescript = { "eslint_d" },
	python = { "ruff" },
	go = { "golangci-lint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("LintOnSave", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})
