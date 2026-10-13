vim.pack.add({
	{ src = "gh:mason-org/mason.nvim" },
	{ src = "gh:WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		-- language servers (see lsp/*.lua)
		"lua-language-server",
		"bash-language-server",
		"clangd",
		"gopls",
		"ty",
		"ruff",
		"emmet-ls",
		"json-lsp",
		"vale-ls",
		"vtsls",
		"taplo",
		-- formatters (see core/lsp/conform.lua)
		"stylua",
		"prettierd",
		"jq",
		"djlint",
		"clang-format",
		"shellharden",
		"kdlfmt",
		"goimports-reviser",
		"kulala-fmt",
		-- linters (see core/lsp/lint.lua)
		"eslint_d",
		"golangci-lint",
	},
})

map("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason open" })
