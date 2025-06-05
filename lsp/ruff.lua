local blink = require("blink.cmp")
return {
	cmd = { "ruff" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		".git",
	},
	settings = {
		ruff = {},
	},
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		blink.get_lsp_capabilities(),
		{
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		}
	),
}
