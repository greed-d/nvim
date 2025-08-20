local blink = require("blink.cmp")
return {
	cmd = { "emmet_ls" },
	filetypes = { "html" },
	root_markers = {
		".git",
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
