local blink = require("blink.cmp")
return {
	cmd = { "qmlls" },
	filetypes = { "qml" },
	root_markers = {
		"pyproject.toml",
		".git",
	},
	settings = {},
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
