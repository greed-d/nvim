local blink = require("blink.cmp")
return {
	cmd = { "basedpyright" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		".git",
	},
	settings = {
		basedpyright = {
			typeCheckingMode = "basic",
		},
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
