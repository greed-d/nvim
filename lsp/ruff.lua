return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		".git",
	},
	settings = {
		ruff = {},
	},
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}
