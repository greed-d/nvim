local blink = require("blink.cmp")
return {
	cmd = { "vale-ls" },
	filetypes = { "markdown" },
	root_markers = {
		".git",
	},
	settings = {
		vale_ls = {},
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
